From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:31:32 +0100
Subject: [Buildroot] [git commit branch/next] crda: bump to version 3.18
Message-ID: <20150219203155.3627D8179B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03e61317dcd7a14cfd8abaf6cbe907e945cdec2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...d-DESTDIR-support-in-install-libreg-rules.patch |   41 --------------------
 package/crda/0002-drop-ldconfig-call.patch         |   15 +++++++
 package/crda/crda.hash                             |    2 +-
 package/crda/crda.mk                               |    2 +-
 4 files changed, 17 insertions(+), 43 deletions(-)

diff --git a/package/crda/0002-Add-DESTDIR-support-in-install-libreg-rules.patch b/package/crda/0002-Add-DESTDIR-support-in-install-libreg-rules.patch
deleted file mode 100644
index 617d05f..0000000
--- a/package/crda/0002-Add-DESTDIR-support-in-install-libreg-rules.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2cabb2588da56735369131b709f191453c080be0 Mon Sep 17 00:00:00 2001
-From: "John W. Linville" <linville@tuxdriver.com>
-Date: Fri, 14 Feb 2014 13:58:44 -0500
-Subject: [PATCH 1/4] crda: Add DESTDIR support in install-libreg* rules in
- Makefile
-
-Also drop ldconfig call, as that causes problems when cross compiling /
-installing as non-root.
-
-Signed-off-by: John W. Linville <linville@tuxdriver.com>
-Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 0b2f0d7..1f25509 100644
---- a/Makefile
-+++ b/Makefile
-@@ -120,13 +120,12 @@ $(LIBREG): regdb.h reglib.h reglib.c
- 
- install-libreg-headers:
- 	$(NQ) '  INSTALL  libreg-headers'
--	$(Q)mkdir -p $(INCLUDE_DIR)
--	$(Q)cp *.h $(INCLUDE_DIR)/
-+	$(Q)mkdir -p $(DESTDIR)/$(INCLUDE_DIR)
-+	$(Q)cp *.h $(DESTDIR)/$(INCLUDE_DIR)/
- 
- install-libreg:
- 	$(NQ) '  INSTALL  libreg'
--	$(Q)mkdir -p $(LIBDIR)
--	$(Q)cp $(LIBREG) $(LIBDIR)/
--	$(Q)ldconfig
-+	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
-+	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
- 
- %.o: %.c regdb.h $(LIBREG)
--- 
-1.8.5.5
-
diff --git a/package/crda/0002-drop-ldconfig-call.patch b/package/crda/0002-drop-ldconfig-call.patch
new file mode 100644
index 0000000..f09e258
--- /dev/null
+++ b/package/crda/0002-drop-ldconfig-call.patch
@@ -0,0 +1,15 @@
+Drop ldconfig call, it's useless for cross-compiling.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura crda-3.18.orig/Makefile crda-3.18/Makefile
+--- crda-3.18.orig/Makefile	2015-02-18 10:34:23.841259401 -0300
++++ crda-3.18/Makefile	2015-02-18 10:35:10.524201452 -0300
+@@ -127,7 +127,6 @@
+ 	$(NQ) '  INSTALL  libreg'
+ 	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
+ 	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
+-	$(Q)ldconfig
+ 
+ %.o: %.c regdb.h $(LIBREG)
+ 	$(NQ) '  CC  ' $@
diff --git a/package/crda/crda.hash b/package/crda/crda.hash
index 2fc04e6..45b9d20 100644
--- a/package/crda/crda.hash
+++ b/package/crda/crda.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/crda/sha256sums.asc
-sha256	2f85da7ab0170b140d6ed62596c8f268d4a7dedecf84cac7182ada979742ff59	crda-3.13.tar.xz
+sha256	43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf	crda-3.18.tar.xz
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index 3c06e07..abfbb8e 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRDA_VERSION = 3.13
+CRDA_VERSION = 3.18
 CRDA_SOURCE = crda-$(CRDA_VERSION).tar.xz
 CRDA_SITE = $(BR2_KERNEL_MIRROR)/software/network/crda
 CRDA_DEPENDENCIES = host-pkgconf host-python-m2crypto \
