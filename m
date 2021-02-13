From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 23:46:03 +0100
Subject: [Buildroot] PATCH package/nodejs: do not write in $HOME dir
In-Reply-To: <CABJxTWFfyu_KLnSCzTkhEO8N9wGb8EZtr6srw_Oj=Nab66Jo3g@mail.gmail.com>
References: <CABJxTWFfyu_KLnSCzTkhEO8N9wGb8EZtr6srw_Oj=Nab66Jo3g@mail.gmail.com>
Message-ID: <20210213234603.4816d655@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kiril,

On Wed, 10 Feb 2021 19:01:13 +0100
Kiril Maler <kiril.maler@gmail.com> wrote:

> host-nodejs will write a config file in $HOME/.config dir.
> When BR2_PACKAGE_NODEJS_NPM_HOSTCONFIG_IN_BASEDIR is
> selected, the config file will be written in $HOST_DIR/config

Thanks for your patch. However, it is not sent in the proper format: it
should be inline in the e-mail, and your commit log should have a
Signed-off-by: line. Also, I have a number of comments on the patch, so
I'm quoting it below.

> # The package nodejs provides tool $(HOST_DIR)/bin/npm
> # During host install, nodejs will write a json config file
> # to $XDG_CONFIG_HOME, which is normally $HOME/.config of $USER
> #
> # Add a default enabled option, that the json file is written
> # in $HOST_DIR/config

This should be part of the commit log. I'm not sure how you generated
your patch.

> 
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -52,6 +52,7 @@ menu "Host utilities"
>  	source "package/mtd/Config.in.host"
>  	source "package/mtools/Config.in.host"
>  	source "package/mxsldr/Config.in.host"
> +	source "package/nodejs/Config.in.host"

This is not needed.

>  	source "package/odb/Config.in.host"
>  	source "package/omap-u-boot-utils/Config.in.host"
>  	source "package/openocd/Config.in.host"
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -77,5 +77,15 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITI
>  	  specify 'libcurl' here, to ensure that buildroot builds the
>  	  libcurl package, and does so before building your node
>  	  modules.
> +endif
> +if BR2_PACKAGE_NODEJS || BR2_PACKAGE_HOST_NODEJS
> +config BR2_PACKAGE_NODEJS_NPM_HOSTCONFIG_IN_BASEDIR
> +	bool "npm host config in HOST_DIR"
> +	default y
> +	help
> +	  The host NPM config is stored in a JSON file located in
> +	  $XDG_CONFIG_HOME or $HOME/.config.
> +	  When selected, the XDG_CONFIG_HOME is set to
> HOST_DIR/config
> +	  in BASE_DIR

Why are you adding an option for this? Buildroot's nodejs should not
write to $HOME, so what you've proposed should be done unconditionally.

>  
>  endif
> --- /dev/null
> +++ b/package/nodejs/Config.in.host
> @@ -0,0 +1,3 @@
> +config BR2_PACKAGE_HOST_NODEJS
> +	bool

What is this option for ? It seems unrelated to this patch.

> +
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -44,6 +44,10 @@ ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
>  NODEJS_CONF_OPTS += --without-npm
>  endif
>  
> +ifeq ($(BR2_PACKAGE_NODEJS_NPM_HOSTCONFIG_IN_BASEDIR),y)
> +HOST_MAKE_ENV += XDG_CONFIG_HOME="$(HOST_DIR)/config"

Overriding HOST_MAKE_ENV is not a good idea: it is a global variable.
You rather want to pass this option specifically in the make
environment of the nodejs build process.

Unless we decide that XDG_CONFIG_HOME is a generic variable that we
should pass globally, in which case it should be done in
package/Makefile.in, where HOST_MAKE_ENV is defined. I'm not sure we
want to do that, though.

Could you rework your patch according to those suggestions ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
