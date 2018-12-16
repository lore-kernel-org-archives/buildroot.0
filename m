From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:33:15 +0100
Subject: [Buildroot] [git commit] package/netsurf: enable javascript with
 duktape
Message-ID: <20181216204426.B38BC8B49B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d8407091d882d20e438a6390660c2e4b1fe7fd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-do-not-cross-compile-nsgenbind.patch      | 30 ++++++++++++++++++++++
 package/netsurf/netsurf.mk                         |  1 -
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch b/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch
new file mode 100644
index 0000000000..01e77e9774
--- /dev/null
+++ b/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch
@@ -0,0 +1,30 @@
+From 2419ad79b25fcc1746178aba609fddbb0aa8c9e0 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sat, 1 Dec 2018 16:10:13 +0100
+Subject: [PATCH] build nsgenbind for the build machine
+
+The nsgenbind tool is meant to be executed on the build machine during
+the build, so it should not be built with the cross-compiler, but with
+the native compiler.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index f279f01..5698c87 100644
+--- a/Makefile
++++ b/Makefile
+@@ -109,7 +109,7 @@ endef
+ 
+ # prefixed install macro for each host sub target
+ define do_build_prefix_install
+-	$(MAKE) install --directory=$1 HOST=$(BUILD) PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
++	$(MAKE) install --directory=$1 HOST=$(BUILD) CC=$(BUILD_CC) PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
+ 
+ endef
+ 
+-- 
+2.17.1
+
diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 23e4de6377..004d582562 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -44,7 +44,6 @@ endef
 endif
 
 define NETSURF_CONFIGURE_CMDS
-	echo "override NETSURF_USE_DUKTAPE := NO"       >  $(@D)/netsurf/Makefile.config
 	$(NETSURF_ICONV_CONFIGURE_CMDS)
 	$(NETSURF_SVG_CONFIGURE_CMDS)
 	$(NETSURF_FONTLIB_CONFIGURE_CMDS)
