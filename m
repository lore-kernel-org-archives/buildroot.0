From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 17:35:10 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/cifs-utils: bump
 to version 6.10
Message-ID: <20200929152803.2F1BD81585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cc9ced194fd43ac8644cbf5f2cd9fd8d03535ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

In the version bump to 6.10 the following changes were:

 * Fix hash file to two spaces format
 * Add patch to respect DESTDIR and optionally install man pages for
   mount.smb3 by utilizing CONFIG_MAN.
 * Pass -std=gnu11 to fix compile issues found with the sourcery-arm
   toolchain with C99 style code errors in smbinfo.c and defintion of
   'struct sa' uisng gnu11 for C11 GNU extensions.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
CC: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3fe17ae48d65dc76edea7f961494543708ac7f08)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-when-installing-mount.smb3-and-optionall.patch | 41 ++++++++++++++++++++++
 package/cifs-utils/cifs-utils.hash                 |  4 +--
 package/cifs-utils/cifs-utils.mk                   |  7 ++--
 3 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/package/cifs-utils/0001-Use-DESTDIR-when-installing-mount.smb3-and-optionall.patch b/package/cifs-utils/0001-Use-DESTDIR-when-installing-mount.smb3-and-optionall.patch
new file mode 100644
index 0000000000..e36ec5b5da
--- /dev/null
+++ b/package/cifs-utils/0001-Use-DESTDIR-when-installing-mount.smb3-and-optionall.patch
@@ -0,0 +1,41 @@
+From dbb4452787cb966cc74b2015689961875fd5d668 Mon Sep 17 00:00:00 2001
+From: Ryan Barnett <ryanbarnett3@gmail.com>
+Date: Mon, 27 Apr 2020 22:03:25 -0500
+Subject: [PATCH] Use DESTDIR when installing mount.smb3 and optionally install
+ man page
+
+Properly create mount.smb3 symlink by using DESTDIR. Also use
+CONFIG_MAN to optionally install manpage for mount.smb3.
+
+Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
+---
+Upstream: https://marc.info/?l=linux-cifs&m=158804444725745&w=2
+---
+ Makefile.am | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index fe9cd34..e0587f1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -119,11 +119,13 @@ endif
+ SUBDIRS = contrib
+ 
+ install-exec-hook:
+-	(cd $(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
++	(cd $(DESTDIR)$(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
+ 
++if CONFIG_MAN
+ install-data-hook:
+-	(cd $(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
++	(cd $(DESTDIR)$(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
++endif
+ 
+ uninstall-hook:
+-	(cd $(ROOTSBINDIR) && rm -f $(ROOTSBINDIR)/mount.smb3)
+-	(cd $(man8dir) && rm -f $(man8dir)/mount.smb3.8)
++	rm -f $(DESTDIR)$(ROOTSBINDIR)/mount.smb3
++	rm -f $(DESTDIR)$(man8dir)/mount.smb3.8
+-- 
+2.17.1
+
diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index bbfbc1d8f4..5eaa84f370 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	18d8f1bf92c13c4d611502dbd6759e3a766ddc8467ec8a2eda3f589e40b9ac9c	cifs-utils-6.9.tar.bz2
+sha256  92fc29c8e9039637f3344267500f1fa381e2cccd7d10142f0c1676fa575904a7  cifs-utils-6.10.tar.bz2
 
 # Hash for license file:
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 511e9ccc01..b59a54d987 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.9
+CIFS_UTILS_VERSION = 6.10
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
 CIFS_UTILS_LICENSE_FILES = COPYING
-# Missing install-sh in release tarball
+# Missing install-sh in release tarball and patching Makefile.am
 CIFS_UTILS_AUTORECONF = YES
 CIFS_UTILS_DEPENDENCIES = host-pkgconf
 
@@ -17,6 +17,9 @@ CIFS_UTILS_DEPENDENCIES = host-pkgconf
 # the global BR2_RELRO_FULL option.
 CIFS_UTILS_CONF_OPTS = --disable-pie --disable-man
 
+# uses C11 code in smbinfo.c and mtab.c
+CIFS_UTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu11"
+
 ifeq ($(BR2_PACKAGE_KEYUTILS),y)
 CIFS_UTILS_DEPENDENCIES += keyutils
 endif
