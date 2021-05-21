From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 16:44:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/lvm2: fix inverted logic that is
 confusing
In-Reply-To: <cover.1621608266.git.yann.morin.1998@free.fr>
References: <cover.1621608266.git.yann.morin.1998@free.fr>
Message-ID: <eb20b6e4abe02eb0af674b787e49a8370c5491f6.1621608266.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit ff0f55e38197 (lvm2: replace !BR2_PACKAGE_LVM2_DMSETUP_ONLY by
BR2_PACKAGE_LVM2_STANDARD_INSTALL) changed a negative-logic option to a
positive-logic option.

However, it kept the ordering of the conditional block, which became a
negatice-logic condition.

This is confusing; let's fix that.

Reported-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lvm2/lvm2.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 224dbf5d54..00baa50a86 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -46,13 +46,13 @@ else
 LVM2_CONF_OPTS += --disable-selinux
 endif
 
-ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),)
+ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
+LVM2_INSTALL_STAGING_OPTS += install
+LVM2_INSTALL_TARGET_OPTS += install
+else
 LVM2_MAKE_OPTS = device-mapper
 LVM2_INSTALL_STAGING_OPTS += install_device-mapper
 LVM2_INSTALL_TARGET_OPTS += install_device-mapper
-else
-LVM2_INSTALL_STAGING_OPTS += install
-LVM2_INSTALL_TARGET_OPTS += install
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-- 
2.25.1
