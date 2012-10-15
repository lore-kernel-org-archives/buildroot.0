From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Oct 2012 19:39:17 +0200
Subject: [Buildroot] Buildroot patch for adding Tokyo Cabinet
In-Reply-To: <0B3FAF466948654CB218059DFE15DF23BBC000@CINMLVEM24.e2k.ad.ge.com>
References: <0B3FAF466948654CB218059DFE15DF23BBC000@CINMLVEM24.e2k.ad.ge.com>
Message-ID: <20121015193917.2f913c12@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jon,

Thanks a lot for your patch. First a few general comments:

 * Your patch is word-wrapped, quite certainly due to your e-mail
   client. I'd recommend to use git send-email to send your patch.

 * The title of your patch (i.e the first line of the commit log)
   should be something like "tokyocabinet: new package" or something
   like that.

Other comments below.

On Mon, 15 Oct 2012 09:59:33 -0400, Diekema, Jon (GE Aviation, US)
wrote:
> Signed-off-by: Jon Diekema <jon.diekema@ge.com>	
> 
> diff --git a/package/Config.in b/package/Config.in index
> e129522..8f519b5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -331,6 +331,7 @@ source "package/berkeleydb/Config.in"
>  source "package/mysql_client/Config.in"
>  source "package/sqlcipher/Config.in"
>  source "package/sqlite/Config.in"
> +source "package/tokyocabinet/Config.in"
>  endmenu
>  
>  menu "Filesystem"
> diff --git a/package/tokyocabinet/Config.in
> b/package/tokyocabinet/Config.in new file mode 100644 index
> 0000000..66ff02e
> --- /dev/null
> +++ b/package/tokyocabinet/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_TOKYOCABINET
> +        bool "Tokyo Cabinet"
> +        help
> +	  A modern reimplementation of QDBM, also released under the
> LGPL
> +	  by Mikio Hirabayashi in 2007.
> +
> +
> http://www.igvita.com/2009/02/13/tokyo-cabinet-beyond-key-value-store/

The indentation of the help text should be one tab + two spaces.

> diff --git a/package/tokyocabinet/tokyocabinet-1.4.47-include.patch
> b/package/tokyocabinet/tokyocabinet-1.4.47-include.patch
> new file mode 100644
> index 0000000..340008c
> --- /dev/null
> +++ b/package/tokyocabinet/tokyocabinet-1.4.47-include.patch
> @@ -0,0 +1,19 @@
> +Signed-off-by: Jon Diekema <jon.diekema@ge.com>
> +
> +Removing /usr/include, ~/include, and /usr/local/include from the 
> +include search path.  Other than the current directory, use the 
> +defaults from the toolchain.

The patch description should come before the Signed-off-by line.

> +diff --git a/configure.in b/configure.in index 8db195e..60cad20 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -32,7 +32,7 @@ MYPCFILES="tokyocabinet.pc"
> +
> + # Building flags
> + MYCFLAGS="-std=c99 -Wall -fPIC -fsigned-char -O2"
> +-MYCPPFLAGS="-I. -I\$(INCLUDEDIR) -I$HOME/include -I/usr/local/include"
> ++MYCPPFLAGS="-I."
> + MYCPPFLAGS="$MYCPPFLAGS -DNDEBUG -D_GNU_SOURCE=1 -D_REENTRANT
> -D__EXTENSIONS__"
> + MYLDFLAGS="-L. -L\$(LIBDIR) -L$HOME/lib -L/usr/local/lib"
> + MYCMDLDFLAGS=""
> diff --git a/package/tokyocabinet/tokyocabinet.mk
> b/package/tokyocabinet/tokyocabinet.mk
> new file mode 100644
> index 0000000..df3762c
> --- /dev/null
> +++ b/package/tokyocabinet/tokyocabinet.mk
> @@ -0,0 +1,40 @@
> +#############################################################
> +#
> +# Tokyo Cabinet
> +#
> +#############################################################
> +
> +#
> +# Generic Infrastructure
> +#

Unneeded comment.

> +TOKYOCABINET_VERSION = 1.4.47
> +TOKYOCABINET_SOURCE = tokyocabinet-$(TOKYOCABINET_VERSION).tar.gz
> +TOKYOCABINET_SITE = http://httpsqs.googlecode.com/files
> +# TOKYOCABINET_PATCH =
> +# TOKYOCABINET_SUBDIR =

Please remove those two useless lines.

> +TOKYOCABINET_DEPENDENCIES =

Useless line.

> +TOKYOCABINET_INSTALL_STAGING = YES
> +TOKYOCABINET_INSTALL_TARGET = YES

This last line is useless.

> +TOKYOCABINET_LICENSE = LGPLv2.1
> +TOKYOCABINET_LICENSE_FILES = COPYING
> +
> +#
> +# Autotools Infrastructure
> +#

Comment not needed.

> +TOKYOCABINET_CONF_ENV =

Not needed.

> +TOKYOCABINET_CONF_OPT = --disable-zlib --disable-bzip --enable-pthread 

Hum, this should probably be something like:

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
TOKYOCABINET_CONF_OPT += --enable-pthread
else
TOKYOCABINET_CONF_OPT += --disable-pthread
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
TOKYOCABINET_DEPENDENCIES += zlib
TOKYOCABINET_CONF_OPT += --enable-zlib
else
TOKYOCABINET_CONF_OPT += --disable-zlib
endif

ifeq ($(BR2_PACKAGE_BZIP2),y)
TOKYOCABINET_DEPENDENCIES += bzip2
TOKYOCABINET_CONF_OPT += --enable-bzip
else
TOKYOCABINET_CONF_OPT += --disable-bzip
endif


> +TOKYOCABINET_MAKE = $(MAKE)
>  TOKYOCABINET_MAKE_ENV = 
> +TOKYOCABINET_MAKE_OPT =

None of those lines are needed.

> TOKYOCABINET_AUTORECONF = YES

Ok. 

> +TOKYOCABINET_AUTORECONF_OPT =
> TOKYOCABINET_LIBTOOL_PATCH = YES 
> +TOKYOCABINET_CLEAN_OPT = clean

Those three lines are not needed.

> +define TOKYOCABINET_REMOVE_TARGET_FILES
> +	rm -rf $(TARGET_DIR)/usr/share/tokyocabinet
> +endef
> +
> +TOKYOCABINET_POST_INSTALL_TARGET_HOOKS +=
> TOKYOCABINET_REMOVE_TARGET_FILES
> +
> +$(eval $(autotools-package))

I would also recommend you to test your package with the most minimal
Buildroot toolchain (i.e, no locales, no wide-char support, no IPv6, no
RPC, no threads), just to make sure your package really does not need
any of those toolchain features.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
