From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 31 Jan 2011 20:23:42 +0100
Subject: [Buildroot] [git commit master 1/1] libusb-compat: fixup
	libusb-config script similarly to other *-config scripts
Message-ID: <20110131192513.5497E8E2D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7e7a8dc85e92171e93e14eb0323bc518ecada3cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So programs using this don't end up looking for host includes / libraries.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libusb-compat/libusb-compat.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 98271c7..6590e89 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -11,4 +11,12 @@ LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
 LIBUSB_COMPAT_INSTALL_TARGET = YES
 
+define LIBUSB_COMPAT_FIXUP_CONFIG
+	$(SED) 's%prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
+	    -e 's%exec_prefix=/usr%exec_prefix=$(STAGING_DIR)/usr%' \
+		$(STAGING_DIR)/usr/bin/libusb-config
+endef
+
+LIBUSB_COMPAT_POST_INSTALL_STAGING_HOOKS+=LIBUSB_COMPAT_FIXUP_CONFIG
+
 $(eval $(call AUTOTARGETS,package,libusb-compat))
-- 
1.7.3.4
