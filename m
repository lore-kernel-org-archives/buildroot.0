From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jan 2016 23:10:13 +0100
Subject: [Buildroot] [PATCH 1/1 v3] ypbind-mt: new package
In-Reply-To: <1452516304-6029-1-git-send-email-yba@tkos.co.il>
References: <1452516304-6029-1-git-send-email-yba@tkos.co.il>
Message-ID: <569579C5.1010409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jonathan,

On 11-01-16 13:45, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> This patch adds the ypbind-mt package that contains a multithreaded
> ypbind daemon for Linux. It uses threads for better response and
> supports the ypbind protocols version 1, 2 and 3. ypbind finds the
> server for a given NIS domain and stores information about it in a
> binding file on the local host.
> 

 You Sob should go here, before the ---

> ---
> This patch is a complete rework of the previous patches submitted by
> the author for the ypbind-mt package in December 2015. The main
> difference between this version and the previous version is the
> dependency on a glibc toolchain and the Kconfig comment to this effect.
> 
> Performed menuconfig UI testing and build testing for absolute minimal
> configurations using the following toolchains:
> 
>       - br-arm-basic-2015.11-rc1
>       - br-arm-full-2015.11-rc1
>       - br-arm-cortex-a9-musl-2015.11-rc1
>       - br-arm11-full-nothread-2015.11-rc1
>       - br-arm-full-static-2015.11-rc1
>       - ia32-2012.09-62-i686-pc-linux-gnu-i386-linux
>       - crosstool-ng GCC 5.1 arm-mxs-linux-gnueabihf
> ---
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  package/Config.in                                  |    2 +-
>  .../ypbind-mt/0001-Remove_man_dir_from_build.patch |   16 ++++
>  package/ypbind-mt/Config.in                        |   17 ++++
>  package/ypbind-mt/S70ypbind                        |   99 ++++++++++++++++++++
>  package/ypbind-mt/ypbind-mt.mk                     |   21 +++++
>  5 files changed, 154 insertions(+), 1 deletion(-)
>  create mode 100644 package/ypbind-mt/0001-Remove_man_dir_from_build.patch
>  create mode 100644 package/ypbind-mt/Config.in
>  create mode 100755 package/ypbind-mt/S70ypbind
>  create mode 100644 package/ypbind-mt/ypbind-mt.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f3b4812..b226518 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1476,7 +1476,7 @@ endif

 There's something funky about this patch fragment (i.e. it's wrong). Did you
manually edit it?

>  	source "package/xinetd/Config.in"
>  	source "package/xl2tp/Config.in"
>  	source "package/xtables-addons/Config.in"
> +	source "package/ypbind-mt/Config.in"

 This conflicts with your own yp-tools submission from a few hours before. You
should put these patches in a single series to avoid that kind of problem.

>  	source "package/znc/Config.in"
>  
>  endmenu
> 
> diff --git a/package/ypbind-mt/0001-Remove_man_dir_from_build.patch b/package/ypbind-mt/0001-Remove_man_dir_from_build.patch
> new file mode 100644
> index 0000000..10ebed7
> --- /dev/null
> +++ b/package/ypbind-mt/0001-Remove_man_dir_from_build.patch
> @@ -0,0 +1,16 @@
> +Remove the man directory from the build in order to avoid trying to build the
> +commented targets ypbind.8 and ypconf.5
> +
> +Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> +
> +--- a/Makefile.am	2014-12-04 16:27:18.000000000 +0200
> ++++ b/Makefile.am	2015-12-16 15:00:21.950050679 +0200
> +@@ -5,7 +5,7 @@
> + #
> + AUTOMAKE_OPTIONS = 1.6 gnits dist-bzip2
> + #
> +-SUBDIRS = lib src man po
> ++SUBDIRS = lib src po
> + 
> + CLEANFILES = *~
> + 
> diff --git a/package/ypbind-mt/Config.in b/package/ypbind-mt/Config.in
> new file mode 100644
> index 0000000..812134d
> --- /dev/null
> +++ b/package/ypbind-mt/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_YPBIND_MT
> +	bool "ypbind-mt"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # rpcsvc/nis.h
> +	select BR2_PACKAGE_YP_TOOLS

 In this case it should _definitely_ be in a single series with yp-tools.

> +	select BR2_PACKAGE_RPCBIND # runtime
> +	help
> +	  The ypbind-mt package contains a multithreaded ypbind daemon
> +	  for Linux. It uses threads for better response and supports
> +	  the ypbind protocols version 1, 2 and 3.
> +
> +	  Note: You need to select package "linux-pam" for NIS
> +	  authentication.
> +
> +	  https://github.com/thkukuk/ypbind-mt

 Isn't this a better URL?

http://www.linux-nis.org/nis/ypbind-mt/

> +
> +comment "ypbind-mt needs an (e)glibc toolchain with rpcsvc/nis.h"
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL

 This should be exactly the same condition as the one in the main package
symbol, i.e. !BR2_TOOLCHAIN_USES_GLIBC. That's needed to avoid problems when/if
we add another libc implementation in the future.

> diff --git a/package/ypbind-mt/S70ypbind b/package/ypbind-mt/S70ypbind
> new file mode 100755
> index 0000000..08df322
> --- /dev/null
> +++ b/package/ypbind-mt/S70ypbind
> @@ -0,0 +1,99 @@
> +#! /bin/sh
> +# Copyright (c) 2004 Author: Thorsten Kukuk <kukuk@suse.de>
> +#
> +# /etc/init.d/ypbind
> +#
> +#   and symbolic its link
> +#
> +# /usr/sbin/rcypbind
> +#
> +# System startup script for the ypbind daemon

 We tend to prefer either an init script that is distributed with the package,
or a buildroot-specific init script. The latter should be a lot simpler, see for
instance package/inadyn/S70inadyn.

> +#
> +### BEGIN INIT INFO
> +# Provides: ypbind
> +# Required-Start: $remote_fs $portmap
> +# Should-Start: ypserv slpd
> +# Required-Stop: portmap
> +# Default-Start: 3 5
> +# Default-Stop: 0 1 2 6
> +# Short-Description: Start ypbind (necessary for a NIS client)
> +# Description: ypbind finds the server for NIS domains and maintains
> +#	the NIS binding information.
> +### END INIT INFO
> +
> +YPBIND_BIN=/usr/sbin/ypbind
> +pidfile=/var/run/ypbind.pid
> +
> +[ -f /etc/default/ypbind ] && . /etc/default/ypbind
> +
> +case "$1" in
> +    start)
> +	echo -n "Starting ypbind"
> +	## If the domainname is not set, skip starting of ypbind
> +	## and return with "program not configured"
> +        /usr/bin/ypdomainname &> /dev/null
> +        if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then

 I guess ypdomainname is part of this package? Then it is either installed in
/bin or in /usr/bin, so the script should use just that.

> +           if [ -f /etc/defaultdomain ]; then
> +             XDOMAINNAME=`cat /etc/defaultdomain`

 How standard is /etc/defaultdomain? Otherwise the default domain should just be
set in the /etc/default file.

> +             /usr/bin/ypdomainname "$XDOMAINNAME"
> +	   fi
> +           /usr/bin/ypdomainname &> /dev/null
> +           if [ $? -ne 0 -o -z "`/usr/bin/ypdomainname 2>/dev/null`" ]; then
> +	     # Tell the user this has skipped
> +	     echo -n " . . . . . . . . . . No domainname set"
> +             # service is not configured
> +	     exit 1
> +           fi
> +        fi

 This entire logic (and the indentation) is too convoluted. Can't it be done
simpler?

> +
> +	## If we don't have a /etc/yp.conf file, skip starting of
> +        ## ypbind and return with "program not configured"
> +        ## if you add the -broadcast Option later, comment this out.
> +	if [ ! -f /etc/yp.conf -a "$YPBIND_BROADCAST" != "yes" ] ; then
> +	  # Tell the user this has skipped
> +	  echo -n " . . . . . . . . . . ${attn}/etc/yp.conf not found${norm}"

 We don't have ${attn} and ${norm}.

> +          # service is not configured
> +	  exit 1
> +        fi
> +
> +	# evaluate the OPTIONS for ypbind-mt
> +	OPTIONS=""
> +	test "$YPBIND_LOCAL_ONLY" = "yes" && OPTIONS="-local-only $OPTIONS"
> +	test "$YPBIND_BROADCAST" = "yes" && OPTIONS="-broadcast $OPTIONS"
> +	test "$YPBIND_BROKEN_SERVER" = "yes" && OPTIONS="-broken-server $OPTIONS"

 The /etc/default file should just contain the _YPBIND_OPTIONS variable.

> +
> +	start-stop-daemon --start --quiet --pidfile $pidfile --exec $YPBIND_BIN -- $YPBIND_OPTIONS $OPTIONS
> +        if [ $? -eq 0 ]; then
> +            notfound=1
> +            for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
> +                ypwhich &>/dev/null && { notfound=0 ; break; };
> +                echo -n " ."
> +                sleep 1;
> +            done
> +            if [ $notfound -eq 1 ]; then
> +                echo -n " ${warn}No NIS server found${norm}";
> +	    fi
> +        else
> +            exit 1
> +        fi
> +	;;
> +    stop)
> +	echo -n "Shutting down ypbind"
> +	start-stop-daemon --stop --quiet --pidfile $pidfile
> +	# Remove static data, else glibc will continue to use NIS
> +        rm -f /var/yp/binding/* /var/run/ypbind.pid
> +	;;
> +    restart)
> +	$0 stop
> +	sleep 1
> +	$0 start

 To handle this, we generally define start() and stop() functions and call them
here.

> +	;;
> +    reload | force-reload)
> +	echo -n "Reload service ypbind"
> +	start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile
> +	;;
> +    *)
> +	echo "Usage: $0 {start|stop|status|try-restart|restart|force-reload|reload|probe}"

 try-restart and probe are not defined.

> +	exit 1
> +	;;
> +esac
> diff --git a/package/ypbind-mt/ypbind-mt.mk b/package/ypbind-mt/ypbind-mt.mk
> new file mode 100644
> index 0000000..e817a9f
> --- /dev/null
> +++ b/package/ypbind-mt/ypbind-mt.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# ypbind-mt
> +#
> +################################################################################
> +
> +YPBIND_MT_VERSION = ypbind-mt-2_2
> +YPBIND_MT_SITE = $(call github,thkukuk,ypbind-mt,$(YPBIND_MT_VERSION))

 Anything wrong with the following URL?

http://www.linux-nis.org/download/ypbind/ypbind-mt-2.2.tar.bz2

> +YPBIND_MT_LICENSE = GPLv2

 Verified that most files are indeed v2 only.

> +YPBIND_MT_LICENSE_FILES = COPYING
> +YPBIND_MT_AUTORECONF = YES
> +YPBIND_MT_DEPENDENCIES = host-pkgconf libtirpc yp-tools

 libtirpc is not selected in Config.in. However, you typically only need it if
!BR2_TOOLCHAIN_HAS_NATIVE_RPC - cfr. libnfs for example.

> +YPBIND_MT_CONF_ENV = \
> +	PKG_CONFIG_SYSROOT_DIR="$(TARGET_DIR)" \
> +	PKG_CONFIG_PATH="$(TARGET_DIR)/usr/lib/pkgconfig"

 This shouldn't be needed and is wrong. The .pc files are in $(STAGING_DIR), the
pkg-config wrapper scripts sets the paths correctly, and everything is passed
through TARGET_CONFIGURE_OPTS.

> +
> +define YPBIND_MT_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 package/ypbind-mt/S70ypbind $(TARGET_DIR)/etc/init.d/S70ypbind

 Instead of package/ypbind-mt, use $(YPBIND_MT_PKGDIR).


 Regards,
 Arnout

> +endef
> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
