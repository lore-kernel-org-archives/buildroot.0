From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Jun 2014 16:04:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/tvheadend: Properly disable
 internal fetch of dvb-data
In-Reply-To: <1402311383-31619-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402311383-31619-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140609140406.GE3512@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-09 12:56 +0200, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/a8a/a8a8e39d57b14f1a59c8e6322b511c761442ee3c/
> http://autobuild.buildroot.net/results/227/2278a078af5cc2e9f36661ad11e70b7692481266/
> 
> Instead of patching the buildsystem just use the included option --disable-
> dvbscan, therefore remove tvheadend-001-no-auto-download-dvbscans.patch
> 
> This should also point tvheadend to the right place for the dvb data according
> to src/input/mpegts/scanfile.c:
> 
>   #if ENABLE_DVBSCAN
>     path = "data/dvb-scan";
>   #else
>     path = "/usr/share/dvb";
>   #endif
> 
> and the resulting binary:
> 
> strings tvheadend | grep "dvb-scan\|share\/dvb"
> /usr/share/dvb
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  .../tvheadend-001-no-auto-download-dvbscans.patch  |   65 --------------------
>  package/tvheadend/tvheadend.mk                     |    7 +--
>  2 files changed, 1 insertion(+), 71 deletions(-)
>  delete mode 100644 package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
> 
> diff --git a/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch b/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
> deleted file mode 100644
> index 18bff39..0000000
> --- a/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -Do not download transponder data as part of the build
> -
> -If dvb-scan is enabled, tvheadend will download the transponders data
> -from the dvb-apps package. This does not play well with buildroot.
> -
> -Instead, we rely on the dvb-apps package to install those files, so
> -it is no longer needed to install those as part of tvheadend.
> -
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -
> -diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/configure tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/configure
> ---- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/configure	2014-03-07 21:44:39.000000000 +0100
> -+++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/configure	2014-03-09 14:44:09.350095543 +0100
> -@@ -272,15 +272,16 @@
> - #
> - # DVB scan
> - #
> --if enabled dvbscan; then
> --  printf "${TAB}" "fetching dvb-scan files ..."
> --  "${ROOTDIR}/support/getmuxlist"
> --  if [ $? -ne 0 ]; then
> --    echo "fail"
> --    die "Failed to fetch dvb-scan data (use --disable-dvbscan)"
> --  fi
> --  echo "ok"
> --fi
> -+# For buildroot, we already installed those files via the dvb-apps package
> -+#if enabled dvbscan; then
> -+#  printf "${TAB}" "fetching dvb-scan files ..."
> -+#  "${ROOTDIR}/support/getmuxlist"
> -+#  if [ $? -ne 0 ]; then
> -+#    echo "fail"
> -+#    die "Failed to fetch dvb-scan data (use --disable-dvbscan)"
> -+#  fi
> -+#  echo "ok"
> -+#fi
> - 
> - #
> - # epoll
> -diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
> ---- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-07 21:44:39.000000000 +0100
> -+++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:44:09.350095543 +0100
> -@@ -255,7 +255,7 @@
> - SRCS-${CONFIG_BUNDLE}     += bundle.c
> - BUNDLES-yes               += docs/html docs/docresources src/webui/static
> - BUNDLES-yes               += data/conf
> --BUNDLES-${CONFIG_DVBSCAN} += data/dvb-scan
> -+#BUNDLES-${CONFIG_DVBSCAN} += data/dvb-scan
> - BUNDLES                    = $(BUNDLES-yes)
> - 
> - #
> -diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/support/posix.mk tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/support/posix.mk
> ---- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/support/posix.mk	2014-03-07 21:44:39.000000000 +0100
> -+++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/support/posix.mk	2014-03-09 14:44:09.350095543 +0100
> -@@ -17,6 +17,10 @@
> - 
> - 	find ${DESTDIR}${datadir}/tvheadend -name .git -exec rm -rf {} \; &>/dev/null || /bin/true
> - 
> -+	mkdir -p ${DESTDIR}${datadir}/tvheadend/data
> -+	rm -f ${DESTDIR}${datadir}/tvheadend/data/dvb-scan
> -+	ln -sf /usr/share/dvb ${DESTDIR}${datadir}/tvheadend/data/dvb-scan
> -+
> - uninstall:
> - 	rm -f ${DESTDIR}${bindir}/tvheadend
> - 	rm -f ${DESTDIR}${mandir}/man1/tvheadend.1
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index f0bb834..86166cd 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -14,12 +14,6 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
>  TVHEADEND_DEPENDENCIES += avahi
>  endif
>  
> -#----------------------------------------------------------------------------
> -# tvheadend is a little smuggler and thief! ;-)
> -# During the ./configure, it downloads some files from the dtv-scan-tables
> -# package, so it has a list of pre-scanned tunner configurations.
> -# For buildroot, we add a patch that avoids doing that, but uses the
> -# scan files installed by the dtv-scan-tables package
>  TVHEADEND_DEPENDENCIES += dtv-scan-tables
>  
>  define TVHEADEND_CONFIGURE_CMDS
> @@ -31,6 +25,7 @@ define TVHEADEND_CONFIGURE_CMDS
>  	 --arch="$(ARCH)"			\
>  	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
>  	 --python="$(HOST_DIR)/usr/bin/python"	\
> +	 --disable-dvbscan			\
>  	)
>  endef
>  
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
