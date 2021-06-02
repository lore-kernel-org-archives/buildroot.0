From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 2 Jun 2021 23:08:48 +0200
Subject: [Buildroot] [git commit] package/lvm2: fix installation of systemd
 units
Message-ID: <20210602204131.4965E8B4CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a313b019c7d7e898186a8b08f9c25ae0194fa16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we bump the version in commit 80997acd3587 (package/lvm2: bump
version to 2.03.12), the installation of systemd units is no longer
functional without a full installation.

As Pascal puts it: the systemd service files don't make a whole lot of
sense when there isn't a full lvm2 install.

Move the conditional block that install system units, so that it only
occurs when we do a full installation.

Fixes;
    http://autobuild.buildroot.org/results/f47/f470ffb55625e2639cecde713442550eb532d0d7/
    http://autobuild.buildroot.org/results/954/9547929292e81671fbe3a5b4bbc87a6424edb1ca/
    http://autobuild.buildroot.org/results/303/30359c351a6ce2f9139494a531e036f0b0406ccf

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Co-Developped-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lvm2/lvm2.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 00baa50a86..70787fe91b 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -49,14 +49,15 @@ endif
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
 LVM2_INSTALL_STAGING_OPTS += install
 LVM2_INSTALL_TARGET_OPTS += install
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
+endif
 else
 LVM2_MAKE_OPTS = device-mapper
 LVM2_INSTALL_STAGING_OPTS += install_device-mapper
 LVM2_INSTALL_TARGET_OPTS += install_device-mapper
 endif
 
-ifeq ($(BR2_INIT_SYSTEMD),y)
-LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
 endif
 
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
