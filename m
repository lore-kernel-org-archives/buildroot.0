From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Feb 2015 14:20:44 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: fix static build with gettext
Message-ID: <be7f33ed40d541fb09ae8582b83f3b5c39d5dd27.1424175644.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gettext needs -pthread. Incidentally this change was also made in the package
Makefile itself for a different reason.

Also, drop -lm to match upstream change.

Fixes:
http://autobuild.buildroot.net/results/a53/a53f31355e955c734010922b47084605e13708ef/
http://autobuild.buildroot.net/results/43d/43deeeda31d9750b37e1f1058c3313a387843bee/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/btrfs-progs/btrfs-progs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index c6c36cf1556c..768660d27c8f 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -18,7 +18,7 @@ BTRFS_PROGS_MAKE_TARGET = static
 BTRFS_PROGS_MAKE_INSTALL_TARGET = install-static
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 # Add -lintl for libuuid
-BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lm -lz -llzo2 -L. -lintl"
+BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lz -llzo2 -L. -lintl -pthread"
 endif
 else
 BTRFS_PROGS_MAKE_TARGET = all
-- 
2.1.4
