From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 15:14:37 +0100
Subject: [Buildroot] [git commit] package/f2fs-tools: furthe endianness fixes
Message-ID: <20141226141441.5479780766@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81c8bf16c115c0edf30df7d15f18b0894a5345ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add appropriate checks in configure.ac.

Fixes a slew of autobuilder failures:
    http://autobuild.buildroot.org/results/cf6/cf6f5b6981694f74bfca45b3d04ff35e4226b162/
    http://autobuild.buildroot.org/results/b34/b346472e686af5b517b689217349eab21878bb7b/
    http://autobuild.buildroot.org/results/49a/49a6a2a88cac6e0899f271a5e65c78dd9eb2eab4/
    ...

Note: patches sent upstream, awaiting for reply...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...3-mkfs.f2fs-fix-missing-endian-conversion.patch |   42 ++++++++++++++++
 .../0004-configure-also-check-for-byteswap.h.patch |   35 ++++++++++++++
 .../0005-configure-add-check-for-bswap_64.patch    |   50 ++++++++++++++++++++
 3 files changed, 127 insertions(+), 0 deletions(-)

diff --git a/package/f2fs-tools/0003-mkfs.f2fs-fix-missing-endian-conversion.patch b/package/f2fs-tools/0003-mkfs.f2fs-fix-missing-endian-conversion.patch
new file mode 100644
index 0000000..3197385
--- /dev/null
+++ b/package/f2fs-tools/0003-mkfs.f2fs-fix-missing-endian-conversion.patch
@@ -0,0 +1,42 @@
+commit 0b4d168d07b54f1dc6db0c4da11a939222e817f2
+Author: Changman Lee <cm224.lee@samsung.com>
+Date:   Thu Nov 13 20:15:05 2014 +0900
+
+    mkfs.f2fs: fix missing endian conversion
+    
+    This is for conversion from cpu to little endian and vice versa.
+    
+    Signed-off-by: Changman Lee <cm224.lee@samsung.com>
+    Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
+
+diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
+index 0a9d728..c0028a3 100644
+--- a/mkfs/f2fs_format.c
++++ b/mkfs/f2fs_format.c
+@@ -71,7 +71,7 @@ static void configure_extension_list(void)
+ 		memcpy(super_block.extension_list[i++], *extlist, name_len);
+ 		extlist++;
+ 	}
+-	super_block.extension_count = i;
++	super_block.extension_count = cpu_to_le32(i);
+ 
+ 	if (!ext_str)
+ 		return;
+@@ -86,7 +86,7 @@ static void configure_extension_list(void)
+ 			break;
+ 	}
+ 
+-	super_block.extension_count = i;
++	super_block.extension_count = cpu_to_le32(i);
+ 
+ 	free(config.extension_list);
+ }
+@@ -211,7 +211,7 @@ static int f2fs_prepare_super_block(void)
+ 	if (max_sit_bitmap_size >
+ 			(CHECKSUM_OFFSET - sizeof(struct f2fs_checkpoint) + 65)) {
+ 		max_nat_bitmap_size = CHECKSUM_OFFSET - sizeof(struct f2fs_checkpoint) + 1;
+-		super_block.cp_payload = F2FS_BLK_ALIGN(max_sit_bitmap_size);
++		super_block.cp_payload = cpu_to_le32(F2FS_BLK_ALIGN(max_sit_bitmap_size));
+ 	} else {
+ 		max_nat_bitmap_size = CHECKSUM_OFFSET - sizeof(struct f2fs_checkpoint) + 1
+ 			- max_sit_bitmap_size;
diff --git a/package/f2fs-tools/0004-configure-also-check-for-byteswap.h.patch b/package/f2fs-tools/0004-configure-also-check-for-byteswap.h.patch
new file mode 100644
index 0000000..786c27d
--- /dev/null
+++ b/package/f2fs-tools/0004-configure-also-check-for-byteswap.h.patch
@@ -0,0 +1,35 @@
+From 7b9da72b1779cbc7b6c092523877860ef9315a36 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Thu, 25 Dec 2014 18:39:19 +0100
+Subject: [PATCH] configure: also check for byteswap.h
+
+include/f2fs_fs.h checks the HAVE_BYTESWAP_H conditional, but it is
+never checked for in configure.
+
+Add that header to the list of headers checked for.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Note: not exactly the same as submitted upstreram, because they already
+check for more headers.
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d66cb73..7cfd9b4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -57,7 +57,7 @@ PKG_CHECK_MODULES([libuuid], [uuid])
+ 
+ # Checks for header files.
+ AC_CHECK_HEADERS([linux/fs.h fcntl.h mntent.h stdlib.h string.h \
+-		sys/ioctl.h sys/mount.h unistd.h])
++		sys/ioctl.h sys/mount.h unistd.h byteswap.h])
+ 
+ # Checks for typedefs, structures, and compiler characteristics.
+ AC_C_INLINE
+-- 
+1.9.1
+
diff --git a/package/f2fs-tools/0005-configure-add-check-for-bswap_64.patch b/package/f2fs-tools/0005-configure-add-check-for-bswap_64.patch
new file mode 100644
index 0000000..8523f02
--- /dev/null
+++ b/package/f2fs-tools/0005-configure-add-check-for-bswap_64.patch
@@ -0,0 +1,50 @@
+From e436e40b57125472ba732a5d39407ff52f008f52 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Thu, 25 Dec 2014 18:52:00 +0100
+Subject: [PATCH] configure: add check for bswap_64
+
+include/f2fs_fs.h checks the HAVE_BSWAP_64 conidtional, but configure
+nevers checks for it.
+
+Add a check that the function is indeed declared, and fix the variable
+name to match the naming scheme of autoconf (and not those of WAF like
+is used by samba), and adapt the check as suggested in the autoconf
+manual.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac      | 3 +++
+ include/f2fs_fs.h | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7cfd9b4..ae451b8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -72,6 +72,9 @@ AC_CHECK_FUNCS_ONCE([
+ 	memset
+ ])
+ 
++AS_IF([test "$ac_cv_header_byteswap_h" = "yes"],
++      [AC_CHECK_DECLS([bswap_64],,,[#include <byteswap.h>])])
++
+ # Install directories
+ AC_PREFIX_DEFAULT([/usr])
+ AC_SUBST([sbindir], [/sbin])
+diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
+index 0c3ba04..4dc2426 100644
+--- a/include/f2fs_fs.h
++++ b/include/f2fs_fs.h
+@@ -63,7 +63,7 @@ static inline uint32_t bswap_32(uint32_t val)
+ }
+ #endif /* !HAVE_BYTESWAP_H */
+ 
+-#if !HAVE_BSWAP_64
++#if defined HAVE_DECL_BSWAP_64 && !HAVE_DECL_BSWAP_64
+ /**
+  * bswap_64 - reverse bytes in a uint64_t value.
+  * @val: value whose bytes to swap.
+-- 
+1.9.1
+
