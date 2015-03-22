From: Chris Stone <chris@sombrio.com>
Date: Sun, 22 Mar 2015 13:08:58 -0400
Subject: [Buildroot] [PATCH 1/1] busybox: add conditional dependency on
	libselinux (v2)
Message-ID: <1427044138-10848-1-git-send-email-chris@sombrio.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you select the selinux applets when configuring
busybox then the busybox build fails due to a missing selinux.h file. This is
because there is no dependency on libselinux in the busybox make. The lack of
dependency is completely understandable, since there is no such dependency
when a user does not configure in the selinux applets. The attached patch
adds a conditional libselinux dependency to the busybox make when the
libselinux package has been selected for the target. It is not unreasonable
to assume that if a user selects libselinux, then he may also select the
busybox selinux applets. Additionally, if the user has already selected
libselinux for the target, then adding a dependency to libselinx to busybox
does no harm, even if the user does not configure in the selinux applet.

Signed-off-by: Chris Stone <chris@sombrio.com>
---
 package/busybox/busybox.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a3ac7e7..4a57521 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -25,6 +25,12 @@ BUSYBOX_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
 # the non-final link of modules as well.
 BUSYBOX_CFLAGS_busybox += -ltirpc
 endif
+# The user may select the selinux support applets.
+# We'll assume he's smart enough to select libselinux in that case.
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+BUSYBOX_DEPENDENCIES += libselinux
+BUSYBOX_LDFLAGS += -lselinux
+endif
 
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
-- 
1.9.1
