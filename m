From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 28 Nov 2014 09:18:12 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: fix static build
Message-ID: <2de1279dcd485fe0a9dda147272221766bb7e187.1417159092.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libuuid needs -lintl when BR2_NEEDS_GETTEXT_IF_LOCALE is set.

Fixes:
http://autobuild.buildroot.net/results/9f1/9f182cd5955d724750135bcd6cb7e315fb28334f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/btrfs-progs/btrfs-progs.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index d16fa0d9aa6f..7122df1b0e76 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -17,6 +17,10 @@ BTRFS_PROGS_LICENSE_FILES = COPYING
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 BTRFS_PROGS_MAKE_TARGET = static
 BTRFS_PROGS_MAKE_INSTALL_TARGET = install-static
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+# Add -lintl for libuuid
+BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lm -lz -llzo2 -L. -lintl"
+endif
 else
 BTRFS_PROGS_MAKE_TARGET = all
 BTRFS_PROGS_MAKE_INSTALL_TARGET = install
-- 
2.1.3
