From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 2 Jun 2021 23:08:13 +0200
Subject: [Buildroot] [git commit] package/lvm2: fix inverted logic that is
 confusing
Message-ID: <20210602204131.3F29A8B3DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4526078d1b4be109d13343243151a6eb98f0532f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ff0f55e38197 (lvm2: replace !BR2_PACKAGE_LVM2_DMSETUP_ONLY by
BR2_PACKAGE_LVM2_STANDARD_INSTALL) changed a negative-logic option to a
positive-logic option.

However, it kept the ordering of the conditional block, which became a
negatice-logic condition.

This is confusing; let's fix that.

Reported-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
