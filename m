From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 23:21:22 +0100
Subject: [Buildroot] [git commit] btrfs-progs: fix build with e2fsprogs
 1.44.0
Message-ID: <20180319222354.A1E6C837FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4d2c9cafb19312f6d2f2a9bc0740f45b65559c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

e2fsprogs 1.44.0 renamed a struct field name, breaking the build of code
using it. Add a patch suggested upstream to fix that.

Fixes:
http://autobuild.buildroot.net/results/d6b/d6b5fb377f44d0b6eef96c08e550ec7277a9e3cd/
http://autobuild.buildroot.net/results/651/651518f12b8a98d53cb5402445a476bd2bf32155/
http://autobuild.buildroot.net/results/3c7/3c771455cbc8460fffab6c4dd9835ee4a5776c19/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-convert-ext2-Remove-check-for-ext2_ext_a.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/btrfs-progs/0003-btrfs-progs-convert-ext2-Remove-check-for-ext2_ext_a.patch b/package/btrfs-progs/0003-btrfs-progs-convert-ext2-Remove-check-for-ext2_ext_a.patch
new file mode 100644
index 0000000000..cb92837d21
--- /dev/null
+++ b/package/btrfs-progs/0003-btrfs-progs-convert-ext2-Remove-check-for-ext2_ext_a.patch
@@ -0,0 +1,38 @@
+From 3dd9cc2b2411a691f321c01a91bcdac42d476150 Mon Sep 17 00:00:00 2001
+From: Qu Wenruo <wqu@suse.com>
+Date: Wed, 14 Mar 2018 08:56:57 +0800
+Subject: [PATCH] btrfs-progs: convert/ext2: Remove check for
+ ext2_ext_attr_entry->e_value_block
+
+In latest e2fsprogs (1.44.0) definition of ext2_ext_attr_entry has
+removed member e_value_block, as currently ext* doesn't support it set
+anyway.
+
+So remove such check so that we can pass compile.
+
+Signed-off-by: Qu Wenruo <wqu@suse.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://patchwork.kernel.org/patch/10281327/ (applied; not
+yet in git)
+
+ convert/source-ext2.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/convert/source-ext2.c b/convert/source-ext2.c
+index b1492c78693d..070126ec38ec 100644
+--- a/convert/source-ext2.c
++++ b/convert/source-ext2.c
+@@ -422,8 +422,7 @@ static int ext2_xattr_check_entry(struct ext2_ext_attr_entry *entry,
+ {
+ 	size_t value_size = entry->e_value_size;
+ 
+-	if (entry->e_value_block != 0 || value_size > size ||
+-	    entry->e_value_offs + value_size > size)
++	if (value_size > size || entry->e_value_offs + value_size > size)
+ 		return -EIO;
+ 	return 0;
+ }
+-- 
+2.16.2
+
