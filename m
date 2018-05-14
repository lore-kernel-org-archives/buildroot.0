From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 14 May 2018 01:04:25 -0300
Subject: [Buildroot] [PATCH 8/8] utils/check-package: verify the prefix
 of package Config.in options
References: <20180513190737.26079-9-thomas.petazzoni@bootlin.com>
Message-ID: <5af90ac946c08_3efa3fd79e10c628750eb@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, May 13, 2018 at 04:07 PM, Thomas Petazzoni wrote:

> This commit adds a new check in the check-package tool to verify that
> the prefix used to name Config.in options are matching the name of the
> package.
> 
> For now, only Config.in files in package/ are checked, because
> Config.in files in fs/, linux/ and boot/ obey to different rules. The
> check might be extended later to cover other files.
> 
> A series of expections is added, mainly to cope with virtual packages

s/expections/exceptions/

> such as zlib, cryptodev, openssl, jpeg and mysql.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  utils/checkpackagelib/lib_config.py | 75 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
> index 1d273f1c5f..3ffd725351 100644
> --- a/utils/checkpackagelib/lib_config.py
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -60,6 +60,81 @@ class AttributesOrder(_CheckFunction):
>                      text]
>  
>  
> +class ConfigVariableName(_CheckFunction):
> +    PACKAGE_NAME = re.compile(".*/([^/]+)/(Config.*)")
> +    OPTION_ONLY = re.compile("^config (BR2_PACKAGE_.*)")

This will catch:
config BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH
but not:
 config BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH
config  BR2_PACKAGE_JANUS_STREAMING

If you do instead:
    OPTION_ONLY = re.compile("^\s*config\s+(BR2_PACKAGE_.*)")
the first example above (that I created locally) will nicely show both warnings:
package/bluez5_utils/Config.in:59: option 'BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH' doesn't start with 'BR2_PACKAGE_BLUEZ5_UTILS' prefix
package/bluez5_utils/Config.in:59: should not be indented
and the second example above (real example) would be caught.


Also... should we care about 'menuconfig' symbols? If yes, something like this
could be used:
OPTION_ONLY = re.compile("^\s*(menuconfig|config)\s+(BR2_PACKAGE_.*)")
...
option = m.group(2)

In the tree I see only one. It's a candidate to be ignored, I guess.
package/x11r7/Config.in
menuconfig BR2_PACKAGE_XORG7

> +    EXCLUDES = ["package/Config.in",
> +                "package/Config.in.host"]
> +    EXCEPTIONS = {
> +        "package/zlib/Config.in": ["BR2_PACKAGE_LIBZLIB"],

Another way to write this is:
        "package/zlib/Config.in": [
            "BR2_PACKAGE_LIBZLIB"],
This way all config symbols will be aligned, but more lines are used.
I don't have a preference.

> +        "package/cryptodev/Config.in": ["BR2_PACKAGE_OCF_LINUX"],
> +        "package/libcurl/Config.in": ["BR2_PACKAGE_CURL"],
> +        "package/luajit/Config.in": ["BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION"],
> +        "package/mono/Config.in": ["BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS"],
> +        "package/rustc/Config.in.host": ["BR2_PACKAGE_HOST_RUST",
> +                                         "BR2_PACKAGE_HOST_RUST_BIN"],
> +        "package/openssl/Config.in": ["BR2_PACKAGE_LIBOPENSSL",
> +                                      "BR2_PACKAGE_LIBOPENSSL_BIN",
> +                                      "BR2_PACKAGE_LIBOPENSSL_ENGINES",
> +                                      "BR2_PACKAGE_LIBRESSL",
> +                                      "BR2_PACKAGE_LIBRESSL_BIN"],
> +        "package/erlang/Config.in": ["BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS"],
> +        "package/jpeg/Config.in": ["BR2_PACKAGE_LIBJPEG"],
> +        "package/mysql/Config.in": ["BR2_PACKAGE_MARIADB",
> +                                    "BR2_PACKAGE_ORACLE_MYSQL",
> +                                    "BR2_PACKAGE_MARIADB_SERVER",
> +                                    "BR2_PACKAGE_ORACLE_MYSQL_SERVER"],

As I understand from time to time we will have changes to this list, when
someone adds a new virtual package.

Alphabetically ordering the files would be nice, as we don't have any reason
against.
Alphabetically ordering in both levels (I mean also ordering the list of symbols
for each file) will make maintenance easier as one doesn't need to think much
to know where to add new files or symbols.

> +    }
> +
> +    def _check_file(self):
> +        if not self.filename.startswith("package/"):
> +            return False
> +        if self.filename in self.EXCLUDES:
> +            return False
> +        return True

Instead of having this called for every single line of Config.* files you could
do similar to what is done in PackageHeader ...

> +
> +    def _check_symbol(self, symbol):
> +        if self.filename in self.EXCEPTIONS and \
> +           symbol in self.EXCEPTIONS[self.filename]:
> +            return False
> +        else:
> +            return True
> +
> +    def before(self):
> +        if not self._check_file():
> +            return

... by creating a boolean that is filled once for each file:
----------
     def before(self):
         self.skip = False
         if not self.filename.startswith("package/"):
             self.skip = True
             return
         if self.filename in self.EXCLUDES:
             self.skip = True
             return

        m = self.PACKAGE_NAME.search(self.filename)
----------

and later using that flag to quickly skip processing lines for excluded files:
----------
    def check_line(self, lineno, text):
        if self.skip:
            return
----------

> +        m = self.PACKAGE_NAME.search(self.filename)
> +        if not m:
> +            print "NOT FOUND: %s" % self.filename

This seems a debug code used before you excluded package/Config*, right?
Because when this 'print' is executed ...

> +        package = m.group(1)

... this line throws:
AttributeError: 'NoneType' object has no attribute 'group'
Should we keep this code (if ... print)?

If you think keeping this code still makes sense, please use:
            print("NOT FOUND: %s" % self.filename)
so we have one less line to change when supporting Python 3.

> +        config_file_name = m.group(2)
> +        if config_file_name == "Config.in.host":
> +            self.config_prefix = "BR2_PACKAGE_HOST_" + package.replace("-", "_").upper()
> +        else:
> +            self.config_prefix = "BR2_PACKAGE_" + package.replace("-", "_").upper()

I was about to suggest to change the regex to BR2_PACKAGE_(HOST_|) ...
But the code you used also detects when a host symbol is used for a target
package or a target symbol is used for a host package.
Nice!

[snip]
> +            if not option.startswith(self.config_prefix):
> +                return ["{}:{}: option '{}' doesn't start with '{}' prefix"
> +                        .format(self.filename, lineno, option, self.config_prefix)]

It's OK as-is. But if you think it could be useful, more values can be
returned, for example:
                         .format(self.filename, lineno, option, self.config_prefix),
                         text, "config " + self.config_prefix + "..."]

This would make check-package to display when called with -vv:

package/bluez5_utils/Config.in:59: option 'BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH' doesn't start with 'BR2_PACKAGE_BLUEZ5_UTILS' prefix
config BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH
config BR2_PACKAGE_BLUEZ5_UTILS...

Just pointing out that it can be done. I don't think it must be done.


Regards,
Ricardo
