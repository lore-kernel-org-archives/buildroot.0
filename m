From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jul 2010 16:53:51 +0200
Subject: [Buildroot] [PATCH 3/4] setserial: convert to autotargets and fix
	bug 2269
In-Reply-To: <cover.1280069623.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280069623.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e6ef954e507703efcbbe4e6a9bff18cb1d8e2cbb.1280069623.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../setserial-2.17-build-system-fix.patch          |   28 ++++++++++++++++++++
 package/setserial/setserial.mk                     |   16 ++++++-----
 2 files changed, 37 insertions(+), 7 deletions(-)
 create mode 100644 package/setserial/setserial-2.17-build-system-fix.patch

diff --git a/package/setserial/setserial-2.17-build-system-fix.patch b/package/setserial/setserial-2.17-build-system-fix.patch
new file mode 100644
index 0000000..598217e
--- /dev/null
+++ b/package/setserial/setserial-2.17-build-system-fix.patch
@@ -0,0 +1,28 @@
+Install the setserial program in /usr/bin instead of /bin, and make
+sure that the directories (especially the manpages directory) are
+created before installing files to them. This is similar to what
+automake does.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.in |    6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+Index: setserial-2.17/Makefile.in
+===================================================================
+--- setserial-2.17.orig/Makefile.in
++++ setserial-2.17/Makefile.in
+@@ -26,9 +26,11 @@
+ 	nroff -man setserial.8 > setserial.cat
+ 
+ install: setserial setserial.8
+-	$(INSTALL_PROGRAM) setserial $(DESTDIR)/bin
++	mkdir -p $(DESTDIR)/usr/bin
++	$(INSTALL_PROGRAM) setserial $(DESTDIR)/usr/bin
+ 	$(STRIP) $(DESTDIR)/bin/setserial
+-	$(INSTALL_DATA) setserial.8 $(DESTDIR)/usr/man/man8
++	mkdir -p $(DESTDIR)/usr/share/man/man8
++	$(INSTALL_DATA) setserial.8 $(DESTDIR)/usr/share/man/man8
+ 
+ clean:
+ 	$(RM) setserial setserial.o setserial.cat *~
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 1c222a2..0b67346 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -3,16 +3,18 @@
 # Setserial
 #
 #############################################################
-SETSERIAL_VERSION:=2.17
-SETSERIAL_PATCH_VERSION:=.orig
-SETSERIAL_PATCH_FILE:=setserial_2.17-45.diff.gz
-SETSERIAL_SOURCE:=setserial_$(SETSERIAL_VERSION)$(SETSERIAL_PATCH_VERSION).tar.gz
-SETSERIAL_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial/
-SETSERIAL_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
+SETSERIAL_VERSION            = 2.17
+SETSERIAL_PATCH              = setserial_2.17-45.2.diff.gz
+SETSERIAL_SOURCE             = setserial_$(SETSERIAL_VERSION).orig.tar.gz
+SETSERIAL_SITE               = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial/
+SETSERIAL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
+	# Touching gorhack.h is needed for the Debian patch 18 to work
 	if [ -d $(@D)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+		touch $(@D)/gorhack.h; \
+		rm $(@D)/debian/patches/01_makefile.dpatch; \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches *.dpatch; \
 	fi
 endef
 
-- 
1.7.0.4
