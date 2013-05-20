From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 20 May 2013 18:10:39 +0200
Subject: [Buildroot] [PATCH 10/12] luasec: New package
In-Reply-To: <1369054604-26139-10-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-10-git-send-email-shmuelzon@gmail.com>
Message-ID: <CAB0FRssYR7ZxFQ9naD5Yj7Y4k244G4kVY00i0p9mOt7z7132Zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/5/20 Assaf Inbal <shmuelzon@gmail.com>

> LuaSec is a Lua binding for OpenSSL library to provide TLS/SSL
> communication.
>
> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
> ---
>  package/Config.in        |  1 +
>  package/luasec/Config.in |  9 +++++++++
>  package/luasec/luasec.mk | 31 +++++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
>  create mode 100644 package/luasec/Config.in
>  create mode 100644 package/luasec/luasec.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 9c615b5..3a49e59 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -315,6 +315,7 @@ source "package/luaexpat/Config.in"
>  source "package/luaexpatutils/Config.in"
>  source "package/luafilesystem/Config.in"
>  source "package/luaposix/Config.in"
> +source "package/luasec/Config.in"
>  source "package/luasocket/Config.in"
>  source "package/lua-ev/Config.in"
>  source "package/lua-msgpack-native/Config.in"
> diff --git a/package/luasec/Config.in b/package/luasec/Config.in
> new file mode 100644
> index 0000000..2d303c1
> --- /dev/null
> +++ b/package/luasec/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LUASEC
> +       bool "luasec"
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_LUASOCKET
> +       help
> +         LuaSec is a binding for OpenSSL library to provide TLS/SSL
> +         communication.
> +
> +         http://www.inf.puc-rio.br/~brunoos/luasec/
> diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
> new file mode 100644
> index 0000000..0fc8144
> --- /dev/null
> +++ b/package/luasec/luasec.mk
> @@ -0,0 +1,31 @@
> +#############################################################
> +#
> +# luasec
> +#
> +#############################################################
> +
> +LUASEC_VERSION = 0.4.1
> +LUASEC_SITE = http://www.inf.puc-rio.br/~brunoos/luasec/download/
> +LUASEC_LICENSE = MIT
> +LUASEC_LICENSE_FILES = LICENSE
> +LUASEC_DEPENDENCIES = lua luasocket openssl
>

luasocket is not a built dependency.

Fran?ois


> +
> +define LUASEC_BUILD_CMDS
> +       $(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
> +               CFLAGS="$(TARGET_CFLAGS) -fPIC" \
> +               LDFLAGS="$(TARGET_LDFLAGS) -shared" linux
> +endef
> +
> +define LUASEC_INSTALL_TARGET_CMDS
> +       $(MAKE) -C $(@D) \
> +               LUAPATH="$(TARGET_DIR)/usr/share/lua" \
> +               LUACPATH="$(TARGET_DIR)/usr/lib/lua" install
> +endef
> +
> +define LUASEC_UNINSTALL_TARGET_CMDS
> +       rm -f "$(TARGET_DIR)/usr/lib/lua/ssl.so"
> +       rm -rf "$(TARGET_DIR)/usr/share/lua/ssl"
> +       rm -f "$(TARGET_DIR)/usr/share/lua/ssl.lua"
> +endef
> +
> +$(eval $(generic-package))
> --
> 1.8.1.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130520/6cb944a1/attachment.html>
