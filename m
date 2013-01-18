From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Jan 2013 23:21:47 +0100
Subject: [Buildroot] [PATCH] Use the libpng-config from staging instead
	of the one from the host.
In-Reply-To: <1358473419-13477-1-git-send-email-jc@eclis.ch> (Jean-Christian
 de Rivaz's message of "Fri, 18 Jan 2013 02:43:39 +0100")
References: <1358473419-13477-1-git-send-email-jc@eclis.ch>
Message-ID: <87mww6gmis.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "JC" == Jean-Christian de Rivaz <jc@eclis.ch> writes:

 JC> The gd package configure call 'libpng-config' to get the compiler
 JC> flags required to use the libpng. The configure correctly allow to
 JC> specify the path of the staging libpng-config by using the
 JC> ac_cv_path_LIBPNG_CONFIG but the configure.ac call simply
 JC> 'libpng-config' instead of the specified one. The configure.ac is now
 JC> modified to call the specified libpng_config.

 JC> In buildroot gd.mk, specify the staging libpng-config and to a empty
 JC> string the libpng12-config to prevent to use the -lpng12 flag or the
 JC> host setting.

 JC> Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
 JC> ---
 JC>  package/gd/gd-libpng-config.patch |   22 ++++++++++++++++++++++
 JC>  package/gd/gd.mk                  |    2 ++
 JC>  2 files changed, 24 insertions(+), 0 deletions(-)
 JC>  create mode 100644 package/gd/gd-libpng-config.patch

 JC> diff --git a/package/gd/gd-libpng-config.patch b/package/gd/gd-libpng-config.patch
 JC> new file mode 100644
 JC> index 0000000..655da78
 JC> --- /dev/null
 JC> +++ b/package/gd/gd-libpng-config.patch
 JC> @@ -0,0 +1,22 @@
 JC> +diff -ruN a/configure.ac b/configure.ac
 JC> +--- a/configure.ac	2013-01-18 02:00:59.000000000 +0100
 JC> ++++ b/configure.ac	2013-01-18 02:01:44.000000000 +0100
 JC> +@@ -353,14 +353,14 @@
 JC> +   AC_PATH_PROG([LIBPNG12_CONFIG], [libpng12-config])
 JC> +   AC_PATH_PROG([LIBPNG_CONFIG], [libpng-config])
 JC> +   if test -n "$LIBPNG12_CONFIG"; then
 JC> +-    libpng_CPPFLAGS=`libpng12-config --cflags`
 JC> ++    libpng_CPPFLAGS=`$LIBPNG12_CONFIG --cflags`
 JC> +     # should be --ldopts, but it's currently broken
 JC> +-    libpng_LDFLAGS=`libpng12-config --ldflags`
 JC> ++    libpng_LDFLAGS=`$LIBPNG12_CONFIG --ldflags`
 JC> +     libpng_LDFLAGS=`echo " $libpng_LDFLAGS" | sed 's/ -l[[^ ]][[^ ]]*//g'`
 JC> +   elif test -n "$LIBPNG_CONFIG"; then
 JC> +-    libpng_CPPFLAGS=`libpng-config --cflags`
 JC> ++    libpng_CPPFLAGS=`$LIBPNG_CONFIG --cflags`
 JC> +     # should be --ldopts, but it's currently broken
 JC> +-    libpng_LDFLAGS=`libpng-config --ldflags`
 JC> ++    libpng_LDFLAGS=`$LIBPNG_CONFIG --ldflags`
 JC> +     libpng_LDFLAGS=`echo " $libpng_LDFLAGS" | sed 's/ -l[[^ ]][[^ ]]*//g'`
 JC> +   elif test -d "$withval"; then
 JC> +     libpng_CPPFLAGS="-I$withval/include"
 JC> diff --git a/package/gd/gd.mk b/package/gd/gd.mk
 JC> index 972d8dd..96abf9e 100644
 JC> --- a/package/gd/gd.mk
 JC> +++ b/package/gd/gd.mk
 JC> @@ -33,6 +33,8 @@ endif
 JC>  ifeq ($(BR2_PACKAGE_LIBPNG),y)
 JC>  GD_DEPENDENCIES += libpng
 JC>  GD_CONF_OPT += --with-png
 JC> +GD_CONF_ENV += ac_cv_path_LIBPNG12_CONFIG=""
 JC> +GD_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
 JC>  endif

We should also explictly pass --without-png when not enabled so it
doesn't try to use host libpng-config then.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
