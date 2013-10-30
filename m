From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 23:41:45 +0100
Subject: [Buildroot] [PATCH] xenomai: use install-user to remove patch
Message-ID: <1383172905-22699-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noted by "George" in bug #6416, the xenomai-do-not-install-devices
patch is not needed, since Xenomai provides a "install-user" target to
only install the libraries/headers and not the device files. This
patch changes xenomai.mk to use 'install-user' and removes the useless
patch.

Fixes bug #6416.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/xenomai-do-not-install-devices.patch | 11 -----------
 package/xenomai/xenomai.mk                           |  2 ++
 2 files changed, 2 insertions(+), 11 deletions(-)
 delete mode 100644 package/xenomai/xenomai-do-not-install-devices.patch

diff --git a/package/xenomai/xenomai-do-not-install-devices.patch b/package/xenomai/xenomai-do-not-install-devices.patch
deleted file mode 100644
index 348abee..0000000
--- a/package/xenomai/xenomai-do-not-install-devices.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/Makefile.in	2011-06-24 16:11:23.591449817 +0200
-+++ b/Makefile.in	2011-06-24 16:20:29.638129633 +0200
-@@ -719,7 +719,7 @@
- 	  $$sudo mknod -m 666 $(DESTDIR)/dev/rtheap c 10 254 ; \
- 	fi
- 
--install-exec-local: devices
-+install-exec-local:
- 
- install-user:
- 	$(MAKE) SUDO=false install
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index f10dec0..786bdfd 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -16,6 +16,8 @@ XENOMAI_LICENSE = headers: GPLv2+ with exception, libraries: LGPLv2.1+, kernel:
 XENOMAI_LICENSE_FILES = debian/copyright include/COPYING src/skins/native/COPYING ksrc/nucleus/COPYING
 
 XENOMAI_INSTALL_STAGING = YES
+XENOMAI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-user
+XENOMAI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-user
 
 XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/
 
-- 
1.8.1.2
