From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 23:55:48 +0200
Subject: [Buildroot] [git commit] crda: bump to version 3.13
Message-ID: <20140625215606.B23F69D0C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce6595a6055700efda88dd0d3a783ad9cdbe73e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: adjust patch to also drop ldconfig call]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-DESTDIR-support-in-install-libreg-rules.patch |   41 ++++++++++++++++++++
 package/crda/crda.mk                               |    6 +-
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch b/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch
new file mode 100644
index 0000000..617d05f
--- /dev/null
+++ b/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch
@@ -0,0 +1,41 @@
+From 2cabb2588da56735369131b709f191453c080be0 Mon Sep 17 00:00:00 2001
+From: "John W. Linville" <linville@tuxdriver.com>
+Date: Fri, 14 Feb 2014 13:58:44 -0500
+Subject: [PATCH 1/4] crda: Add DESTDIR support in install-libreg* rules in
+ Makefile
+
+Also drop ldconfig call, as that causes problems when cross compiling /
+installing as non-root.
+
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0b2f0d7..1f25509 100644
+--- a/Makefile
++++ b/Makefile
+@@ -120,13 +120,12 @@ $(LIBREG): regdb.h reglib.h reglib.c
+ 
+ install-libreg-headers:
+ 	$(NQ) '  INSTALL  libreg-headers'
+-	$(Q)mkdir -p $(INCLUDE_DIR)
+-	$(Q)cp *.h $(INCLUDE_DIR)/
++	$(Q)mkdir -p $(DESTDIR)/$(INCLUDE_DIR)
++	$(Q)cp *.h $(DESTDIR)/$(INCLUDE_DIR)/
+ 
+ install-libreg:
+ 	$(NQ) '  INSTALL  libreg'
+-	$(Q)mkdir -p $(LIBDIR)
+-	$(Q)cp $(LIBREG) $(LIBDIR)/
+-	$(Q)ldconfig
++	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
++	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
+ 
+ %.o: %.c regdb.h $(LIBREG)
+-- 
+1.8.5.5
+
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index 01e8684..f3d3e80 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CRDA_VERSION = 1.1.3
-CRDA_SOURCE = crda-$(CRDA_VERSION).tar.bz2
-CRDA_SITE = http://wireless.kernel.org/download/crda
+CRDA_VERSION = 3.13
+CRDA_SOURCE = crda-$(CRDA_VERSION).tar.xz
+CRDA_SITE = $(BR2_KERNEL_MIRROR)/software/network/crda
 CRDA_DEPENDENCIES = host-pkgconf host-python-m2crypto \
 	libnl libgcrypt host-python
 CRDA_LICENSE = ISC
