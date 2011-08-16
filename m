From: Daniel Mack <zonque@gmail.com>
Date: Tue, 16 Aug 2011 14:16:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/libusb: move pkgconfig file to
	staging dir after install
In-Reply-To: <1313496979-1565-1-git-send-email-zonque@gmail.com>
References: <1313496979-1565-1-git-send-email-zonque@gmail.com>
Message-ID: <1313496979-1565-2-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is unfortunately no way to tell udev's configure process about
the install location of its pkgconfig files. However, should should
clearly end up in the staging area and not in the target.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/libusb/libusb.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 050e2ba..1dc28d9 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -10,4 +10,10 @@ LIBUSB_DEPENDENCIES = host-pkg-config
 LIBUSB_INSTALL_STAGING = YES
 LIBUSB_INSTALL_TARGET = YES
 
+define LIBUSB_POST_INSTALL
+        mv $(TARGET_DIR)/usr/lib/pkgconfig/libusb*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
+endef
+
+LIBUSB_POST_INSTALL_TARGET_HOOKS += LIBUSB_POST_INSTALL
+
 $(eval $(call AUTOTARGETS,package,libusb))
-- 
1.7.6
