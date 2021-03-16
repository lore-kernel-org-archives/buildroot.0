From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:07:48 +0100
Subject: [Buildroot] [git commit] package/cifs-utils: bump version to 6.12
Message-ID: <20210316194402.B85CE8120A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5dede7d1a03ab2b8caa0a8e79b09c8df6c62fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- removed 0001-Use-DESTDIR-when-installing-mount.smb3-and-optionall.patch
  (superseded by upstream commit [1])

- adjust autoreconf comment accordingly

- add option for smb tools to avoid hard python runtime dependency
  (smbinfo and smb2-quota are python scripts)

Changelog ([2]):

  December, 2020: Release 6.12
  get/setcifsacl tools are improved to support changing owner, group and SACLs
  mount.cifs is enhanced to use SUDO_UID env variable for cruid
  smbinfo is re-written in Python language
  https://lists.samba.org/archive/samba-technical/2020-December/136156.html

[1] https://git.samba.org/?p=cifs-utils.git;a=patch;h=a00e84378d9c5e63272ff69ca18fd0e872b384d3
[2] https://wiki.samba.org/index.php/LinuxCIFS_utils

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-when-installing-mount.smb3-and-optionall.patch | 41 ----------------------
 package/cifs-utils/Config.in                       | 11 ++++++
 package/cifs-utils/cifs-utils.hash                 |  2 +-
 package/cifs-utils/cifs-utils.mk                   | 12 +++++--
 4 files changed, 22 insertions(+), 44 deletions(-)

diff --git a/package/cifs-utils/0001-Use-DESTDIR-when-installing-mount.smb3-and-optionall.patch b/package/cifs-utils/0001-Use-DESTDIR-when-installing-mount.smb3-and-optionall.patch
deleted file mode 100644
index e36ec5b5da..0000000000
--- a/package/cifs-utils/0001-Use-DESTDIR-when-installing-mount.smb3-and-optionall.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From dbb4452787cb966cc74b2015689961875fd5d668 Mon Sep 17 00:00:00 2001
-From: Ryan Barnett <ryanbarnett3@gmail.com>
-Date: Mon, 27 Apr 2020 22:03:25 -0500
-Subject: [PATCH] Use DESTDIR when installing mount.smb3 and optionally install
- man page
-
-Properly create mount.smb3 symlink by using DESTDIR. Also use
-CONFIG_MAN to optionally install manpage for mount.smb3.
-
-Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
----
-Upstream: https://marc.info/?l=linux-cifs&m=158804444725745&w=2
----
- Makefile.am | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index fe9cd34..e0587f1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -119,11 +119,13 @@ endif
- SUBDIRS = contrib
- 
- install-exec-hook:
--	(cd $(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
-+	(cd $(DESTDIR)$(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
- 
-+if CONFIG_MAN
- install-data-hook:
--	(cd $(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
-+	(cd $(DESTDIR)$(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
-+endif
- 
- uninstall-hook:
--	(cd $(ROOTSBINDIR) && rm -f $(ROOTSBINDIR)/mount.smb3)
--	(cd $(man8dir) && rm -f $(man8dir)/mount.smb3.8)
-+	rm -f $(DESTDIR)$(ROOTSBINDIR)/mount.smb3
-+	rm -f $(DESTDIR)$(man8dir)/mount.smb3.8
--- 
-2.17.1
-
diff --git a/package/cifs-utils/Config.in b/package/cifs-utils/Config.in
index b433850a18..0e61243de4 100644
--- a/package/cifs-utils/Config.in
+++ b/package/cifs-utils/Config.in
@@ -13,3 +13,14 @@ config BR2_PACKAGE_CIFS_UTILS
 	  split them off into their own package.
 
 	  http://wiki.samba.org/index.php/LinuxCIFS_utils
+
+if BR2_PACKAGE_CIFS_UTILS
+
+config BR2_PACKAGE_CIFS_UTILS_SMBTOOLS
+	bool "smbtools"
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON # runtime
+	help
+	  Install the smb tools smbinfo and smb2-quota (python
+	  implementations).
+
+endif
diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index ca97eb8e56..cd7a9bba62 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  b859239a3f204f8220d3e54ed43bf8109e1ef202042dd87ba87492f8878728d9  cifs-utils-6.11.tar.bz2
+sha256  922ddcc3059922e80789312c386b9c569991b4350d3ae3099de3e4b82f3885ef  cifs-utils-6.12.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 63b454413c..473e8a2c28 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.11
+CIFS_UTILS_VERSION = 6.12
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
 CIFS_UTILS_LICENSE_FILES = COPYING
 CIFS_UTILS_CPE_ID_VENDOR = samba
-# Missing install-sh in release tarball and patching Makefile.am
+# Missing install-sh in release tarball
 CIFS_UTILS_AUTORECONF = YES
 CIFS_UTILS_DEPENDENCIES = host-pkgconf
 
@@ -31,4 +31,12 @@ endef
 
 CIFS_UTILS_POST_PATCH_HOOKS += CIFS_UTILS_NO_WERROR
 
+ifeq ($(BR2_PACKAGE_CIFS_UTILS_SMBTOOLS),)
+define CIFS_UTILS_REMOVE_SMBTOOLS
+	rm -f $(TARGET_DIR)/usr/bin/smbinfo
+	rm -f $(TARGET_DIR)/usr/bin/smb2-quota
+endef
+CIFS_UTILS_POST_INSTALL_TARGET_HOOKS += CIFS_UTILS_REMOVE_SMBTOOLS
+endif
+
 $(eval $(autotools-package))
