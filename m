From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Jun 2013 22:15:47 +0200
Subject: [Buildroot] [PATCH 1/6] package/tvheadend: update to a git snapshot
In-Reply-To: <cover.1370289131.git.yann.morin.1998@free.fr>
References: <cover.1370289131.git.yann.morin.1998@free.fr>
Message-ID: <b2d5d5a29d2759681834892af8e0c9e849885a1c.1370289131.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

There are a buncha fixes that are not available in a release yet.

Needs refreshing our patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../tvheadend/tvheadend-001-no-auto-download-dvbscans.patch | 13 ++++++-------
 package/tvheadend/tvheadend-002-no-check_config.patch       |  4 ++--
 package/tvheadend/tvheadend.mk                              |  4 ++--
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch b/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
index cc25c56..b64627e 100644
--- a/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
+++ b/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
@@ -11,13 +11,13 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 diff -durN tvheadend-v3.5.orig/configure tvheadend-v3.5/configure
 --- tvheadend-v3.5.orig/configure	2013-02-15 14:41:26.000000000 +0100
 +++ tvheadend-v3.5/configure	2013-02-16 15:41:16.675556099 +0100
-@@ -178,15 +178,16 @@
+@@ -179,15 +179,16 @@
  #
  # DVB scan
  #
 -if enabled linuxdvb && enabled dvbscan; then
 -  printf "${TAB}" "fetching dvb-scan files ..."
--  ${ROOTDIR}/support/getmuxlist
+-  "${ROOTDIR}/support/getmuxlist"
 -  if [ $? -ne 0 ]; then
 -    echo "fail"
 -    die "Failed to fetch dvb-scan data (use --disable-dvbscan)"
@@ -27,7 +27,7 @@ diff -durN tvheadend-v3.5.orig/configure tvheadend-v3.5/configure
 +# For buildroot, we already installed those files via the dvb-apps package
 +#if enabled linuxdvb && enabled dvbscan; then
 +#  printf "${TAB}" "fetching dvb-scan files ..."
-+#  ${ROOTDIR}/support/getmuxlist
++#  "${ROOTDIR}/support/getmuxlist"
 +#  if [ $? -ne 0 ]; then
 +#    echo "fail"
 +#    die "Failed to fetch dvb-scan data (use --disable-dvbscan)"
@@ -37,11 +37,10 @@ diff -durN tvheadend-v3.5.orig/configure tvheadend-v3.5/configure
  
  # ###########################################################################
  # Write config
-Binary files tvheadend-v3.5.orig/.configure.swp and tvheadend-v3.5/.configure.swp differ
 diff -durN tvheadend-v3.5.orig/Makefile tvheadend-v3.5/Makefile
 --- tvheadend-v3.5.orig/Makefile	2013-02-15 14:41:26.000000000 +0100
 +++ tvheadend-v3.5/Makefile	2013-02-16 15:41:38.218821287 +0100
-@@ -207,7 +207,7 @@
+@@ -211,7 +211,7 @@
  SRCS-${CONFIG_BUNDLE}     += bundle.c
  BUNDLES-yes               += docs/html docs/docresources src/webui/static
  BUNDLES-yes               += data/conf
@@ -62,5 +61,5 @@ diff -durN tvheadend-v3.5.orig/support/posix.mk tvheadend-v3.5/support/posix.mk
 +	ln -sf /usr/share/dvb ${DESTDIR}${datadir}/tvheadend/data/dvb-scan
 +
  uninstall:
- 	rm -f ${DESTDIR}${bindir)/tvheadend
- 	rm -f ${DESTDIR}${mandir)/tvheadend.1
+ 	rm -f ${DESTDIR}${bindir}/tvheadend
+ 	rm -f ${DESTDIR}${mandir}/tvheadend.1
diff --git a/package/tvheadend/tvheadend-002-no-check_config.patch b/package/tvheadend/tvheadend-002-no-check_config.patch
index a0edcdc..aad04e5 100644
--- a/package/tvheadend/tvheadend-002-no-check_config.patch
+++ b/package/tvheadend/tvheadend-002-no-check_config.patch
@@ -12,8 +12,8 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 diff -durN tvheadend-v3.5.orig/Makefile tvheadend-v3.5/Makefile
 --- tvheadend-v3.5.orig/Makefile	2013-02-17 15:15:03.228749505 +0100
 +++ tvheadend-v3.5/Makefile	2013-02-17 15:15:51.591923062 +0100
-@@ -246,7 +246,7 @@
- 	$(CURDIR)/configure $(CONFIGURE_ARGS)
+@@ -250,7 +250,7 @@
+ 	$(ROOTDIR)/configure $(CONFIGURE_ARGS)
  
  # Binary
 -${PROG}: check_config $(OBJS) $(ALLDEPS)
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 58965d6..5ddcd75c 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,8 +4,8 @@
 #
 ##############################################################
 
-TVHEADEND_VERSION           = v3.5
-TVHEADEND_SITE              = http://github.com/tvheadend/tvheadend/tarball/$(TVHEADEND_VERSION)
+TVHEADEND_VERSION           = 5513b44
+TVHEADEND_SITE              = git://github.com/tvheadend/tvheadend.git
 TVHEADEND_LICENSE           = GPLv3+
 TVHEADEND_LICENSE_FILES     = LICENSE
 TVHEADEND_DEPENDENCIES      = host-pkgconf host-python openssl
-- 
1.8.1.2
