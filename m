From: Martin Bark <martin@barkynet.com>
Date: Tue, 26 Apr 2016 09:34:31 +0100
Subject: [Buildroot] CC node modules with target using buildroot
	toolchain
In-Reply-To: <DUB127-W482A55DDA661B3445A2037B0610@phx.gbl>
References: <DUB127-W482A55DDA661B3445A2037B0610@phx.gbl>
Message-ID: <CAFGQKxdh7VW9VpDVXaA6noXL+itaSPJeK24TXxSmjsuqk77zDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Muhammet Ilendemli,

Instead of calling the command line npm directly you're better to get
buildroot to call it for you.  This is because npm needs to be called
correctly to so it can cross compile C/C++ code for the target.  To do
this i tend to use these two methods

1) Set BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL to a package you want
installed globally. For example if you set it to hap-nodejs it will
download, cross compile and install hap-nodejs to
$(TARGTE_DIR)/usr/lib/node_modules.  hap-nodejs seems to need the
avahi header files installed so you need to make sure you select
BR2_PACKAGE_AVAHI, BR2_PACKAGE_AVAHI_DAEMON and
BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY.  Also you need to set
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS to avahi so nodejs knows
hap-nodejs needs avahi to be built first.

I tried all this myself and it managed build and install hap-nodejs to
the target fine.  So you'll end up with the following in your
buildroot config.

BR2_PACKAGE_NODEJS=y
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="hap-nodejs"
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS="avahi"
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_DAEMON=y
BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY=y

2) The other option is to create a package to install your node
modules to the target.  A simple package.mk file might look like this:

    HAP_NODEJS_VERSION = v0.3.1
    HAP_NODEJS_SITE = $(call github,KhaosT,HAP-NodeJS,$(HAP_NODEJS_VERSION))
    HAP_NODEJS_DEPENDENCIES = nodejs avahi

    define HAP_NODEJS_INSTALL_TARGET_CMDS
        $(NPM) install -g $(@D)
    endef

    $(eval $(generic-package))

Once you have a package.mk you can then use all the normal features
like installing a systemd service to start you nodejs app.  You can
use the Config.in to select avahi as a dependency.

Note the $(NPM) is a convenience wrapper around the host version of
npm and will call npm in the correct way to cross compile any C/C++
code it has.  The -g option will cause npm to install the package
globally to the target i.e. to $(TARGET_DIR)/usr/lib/node_modules

Hope that helps

Thanks

Martin

On 24 April 2016 at 16:14, Muhammet Ilendemli <ilendemli@live.at> wrote:
> Hey!
>
> I am trying to cross compile some nodejs modules which are required by
> https://github.com/KhaosT/HAP-NodeJS using the buildroots compiled toolchain
> for raspberry pi. When i try to CC the modules on the host device by typing
> "npm install --target_arch=arm6" inside the cloned project, it fails with
> the following error:
> gyp: Undefined variable openssl_config_path in binding.gyp while trying to
> load binding.gyp
>
> could you take a look into this? i was told to email you about this.
>
> Sincerely
> Muhammet Ilendemli
