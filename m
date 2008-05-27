From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 27 May 2008 14:30:44 +0200
Subject: [Buildroot] [PATCH 1/1] samba: install SWAT properly if selected
	and help autoconf detect iface ifconf
Message-ID: <1211891444-4185-1-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will install SWAT properly if select in kconfig and help autoconf on
the way by telling it that iface ifconf is available.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 package/samba/samba.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index af3e9df..2486074 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -28,10 +28,13 @@ $(SAMBA_DIR)/.configured: $(SAMBA_DIR)/.unpacked
 		samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
 		samba_cv_USE_SETREUID=yes \
 		samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
+		samba_cv_HAVE_IFACE_IFCONF=yes \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--localstatedir=/var \
 		--with-lockdir=/var/cache/samba \
 		--with-piddir=/var/run \
 		--with-privatedir=/etc/samba \
@@ -96,6 +99,9 @@ $(TARGET_DIR)/$(SAMBA_TARGET_BINARY): $(SAMBA_DIR)/$(SAMBA_BINARY)
 	for file in $(SAMBA_TARGETS_y); do \
 		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$$file; \
 	done
+ifeq ($(strip $(BR2_PACKAGE_SAMBA_SWAT)),y)
+	cp -dpfr $(SAMBA_DIR)/../swat $(TARGET_DIR)/usr/
+endif
 	$(INSTALL) -m 0755 package/samba/S91smb $(TARGET_DIR)/etc/init.d
 	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
 		$(INSTALL) -m 0755 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
-- 
1.5.4.3
