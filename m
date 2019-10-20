From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Oct 2019 12:11:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/elfutils: bump version to 0.177
Message-ID: <20191020101145.7417-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patched applied upstream, rebased remaining patches.
Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...nable-disable-progs-configure-option.patch |  4 +-
 ...e-Werror-conditional-to-BUILD_WERROR.patch |  4 +-
 ...source-leak-in-elf-32-64-_updatefile.patch | 32 ----------
 ...ix_memalign-instead-of-aligned_alloc.patch | 58 -------------------
 package/elfutils/elfutils.hash                |  6 +-
 package/elfutils/elfutils.mk                  |  2 +-
 6 files changed, 11 insertions(+), 95 deletions(-)
 delete mode 100644 package/elfutils/0003-libelf-Fix-possible-resource-leak-in-elf-32-64-_updatefile.patch
 delete mode 100644 package/elfutils/0004-libelf-Use-posix_memalign-instead-of-aligned_alloc.patch

diff --git a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
index 3f80fe60df..36bd462175 100644
--- a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
+++ b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
@@ -13,9 +13,11 @@ obstack_printf() in uClibc for example).
 Based on the former patch by Thomas Petazzoni.
 
 [Vincent: tweak patch for 0.166]
+[Bernd: rebased patch for 0.177]
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  Makefile.am  | 6 +++++-
  configure.ac | 6 ++++++
@@ -44,7 +46,7 @@ diff --git a/configure.ac b/configure.ac
 index c2c1d90b2133..7b4c38381cca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -259,6 +259,12 @@ AC_SUBST([LIBEBL_SUBDIR])
+@@ -345,6 +345,12 @@ AC_SUBST([LIBEBL_SUBDIR])
  AC_DEFINE_UNQUOTED(LIBEBL_SUBDIR, "$LIBEBL_SUBDIR")
  AH_TEMPLATE([LIBEBL_SUBDIR], [$libdir subdirectory containing libebl modules.])
  
diff --git a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
index 21ffa7f31b..85ac1e4b64 100644
--- a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
+++ b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
@@ -12,9 +12,11 @@ function [-Werror=maybe-uninitialized]
 cc1: all warnings being treated as errors
 
 [Vincent: tweak patch for 0.166]
+[Bernd: rebased patch for 0.177]
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  config/eu.am | 1 -
  1 file changed, 1 deletion(-)
@@ -24,7 +26,7 @@ index c2cc349ce876..99b368e09060 100644
 --- a/config/eu.am
 +++ b/config/eu.am
 @@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
- 	    -Wold-style-definition -Wstrict-prototypes \
+ 	    -Wold-style-definition -Wstrict-prototypes -Wtrampolines \
  	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
 -	    $(if $($(*F)_no_Werror),,-Werror) \
diff --git a/package/elfutils/0003-libelf-Fix-possible-resource-leak-in-elf-32-64-_updatefile.patch b/package/elfutils/0003-libelf-Fix-possible-resource-leak-in-elf-32-64-_updatefile.patch
deleted file mode 100644
index ab76bd7a4f..0000000000
--- a/package/elfutils/0003-libelf-Fix-possible-resource-leak-in-elf-32-64-_updatefile.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 75e147d0ab85262d9bb2fff093db7ce67dbd4b62 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Wed, 6 Mar 2019 19:56:54 +0100
-Subject: [PATCH] libelf: Fix possible resource leak in elf[32|64]_updatefile.
-
-When we cannot allocate enough memory to convert the data in
-updatemmap we should free the scns before returning an error.
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-[Retrieved (and slightly updated to remove ChangeLog update) from:
-https://sourceware.org/git/?p=elfutils.git;a=patch;h=75e147d0ab85262d9bb2fff093db7ce67dbd4b62]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libelf/elf32_updatefile.c | 1 +
- 2 files changed, 6 insertions(+)
-
- 	* gelf_xlate.c (__elf_xfctstof): Remove alias.
-diff --git a/libelf/elf32_updatefile.c b/libelf/elf32_updatefile.c
-index 2899c6f..457d18e 100644
---- a/libelf/elf32_updatefile.c
-+++ b/libelf/elf32_updatefile.c
-@@ -365,6 +365,7 @@ __elfw2(LIBELFBITS,updatemmap) (Elf *elf, int change_bo, size_t shnum)
- 			    char *converted = aligned_alloc (align, size);
- 			    if (converted == NULL)
- 			      {
-+				free (scns);
- 				__libelf_seterrno (ELF_E_NOMEM);
- 				return 1;
- 			      }
--- 
-2.9.3
-
diff --git a/package/elfutils/0004-libelf-Use-posix_memalign-instead-of-aligned_alloc.patch b/package/elfutils/0004-libelf-Use-posix_memalign-instead-of-aligned_alloc.patch
deleted file mode 100644
index 70f1f9af21..0000000000
--- a/package/elfutils/0004-libelf-Use-posix_memalign-instead-of-aligned_alloc.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 6bd060a23f43a842fbc37dd1bb8d6d7964eda36e Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Thu, 7 Mar 2019 17:31:53 +0100
-Subject: [PATCH] libelf: Use posix_memalign instead of aligned_alloc.
-
-Older glibc might not have aligned_alloc (it is C11).
-Use posix_memalign instead. posix_memalign requires the alignment to
-be a multiple of sizeof (void *). So use malloc for smaller alignments.
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-[Retrieved (and slighlty updated to remove ChangeLog update) from:
-https://sourceware.org/git/?p=elfutils.git;a=patch;h=6bd060a23f43a842fbc37dd1bb8d6d7964eda36e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libelf/elf32_updatefile.c | 20 +++++++++++++++++---
- 2 files changed, 22 insertions(+), 3 deletions(-)
-
-diff --git a/libelf/elf32_updatefile.c b/libelf/elf32_updatefile.c
-index 457d18e..eea51a7 100644
---- a/libelf/elf32_updatefile.c
-+++ b/libelf/elf32_updatefile.c
-@@ -360,16 +360,30 @@ __elfw2(LIBELFBITS,updatemmap) (Elf *elf, int change_bo, size_t shnum)
- 			else
- 			  {
- 			    /* We have to do the conversion on properly
--			       aligned memory first.  */
-+			       aligned memory first.  align is a power of 2,
-+			       but posix_memalign only works for alignments
-+			       which are a multiple of sizeof (void *).
-+			       So use normal malloc for smaller alignments.  */
- 			    size_t size = dl->data.d.d_size;
--			    char *converted = aligned_alloc (align, size);
-+			    void *converted;
-+			    if (align < sizeof (void *))
-+			      converted = malloc (size);
-+			    else
-+			      {
-+				int res;
-+				res = posix_memalign (&converted, align, size);
-+				if (res != 0)
-+				  converted = NULL;
-+			      }
-+
- 			    if (converted == NULL)
- 			      {
- 				free (scns);
- 				__libelf_seterrno (ELF_E_NOMEM);
- 				return 1;
- 			      }
--                            (*fctp) (converted, dl->data.d.d_buf, size, 1);
-+
-+			    (*fctp) (converted, dl->data.d.d_buf, size, 1);
- 
- 			    /* And then write it to the mmapped file.  */
- 			    memcpy (last_position, converted, size);
--- 
-2.9.3
-
diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index 15dddc2fdf..d8a1ce3915 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,7 @@
-# From https://sourceware.org/elfutils/ftp/0.176/sha512.sum
-sha512 7f032913be363a43229ded85d495dcf7542b3c85974aaaba0d984228dc9ac1721da3dc388d3fa02325a80940161db7e9ad2c9e4521a424ad8a7d050c0902915b  elfutils-0.176.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.177/md5.sum
+md5 0b583722f911e1632544718d502aab87  elfutils-0.177.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.177/sha512.sum
+sha512 2779987463a22ed220759e25a09c9a1eb84c0f36db37675136e59aa55c7f8f90b7a7d34ffc4e6a4291d7fa73692a1bd1a303a74270b11d1623b4f9868d19498f  elfutils-0.177.tar.bz2
 # Locally calculated
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 00d247e584..29cfdc2159 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.176
+ELFUTILS_VERSION = 0.177
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
-- 
2.20.1
