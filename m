From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 22:28:57 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/elfutils: fix
 build with glibc < 2.16
Message-ID: <20190830202602.B991488755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f818f820d8175a308629c613715276baa7fa0f1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - autobuild.buildroot.net/results/1053e2b4b51bc225c4a1a29c93946101a7a53be9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dde53fd59e80298e749151d386d6b91a6d512782)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...le-resource-leak-in-elf-32-64-_updatefile.patch | 32 ++++++++++++
 ...e-posix_memalign-instead-of-aligned_alloc.patch | 58 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/package/elfutils/0004-libelf-Fix-possible-resource-leak-in-elf-32-64-_updatefile.patch b/package/elfutils/0004-libelf-Fix-possible-resource-leak-in-elf-32-64-_updatefile.patch
new file mode 100644
index 0000000000..ab76bd7a4f
--- /dev/null
+++ b/package/elfutils/0004-libelf-Fix-possible-resource-leak-in-elf-32-64-_updatefile.patch
@@ -0,0 +1,32 @@
+From 75e147d0ab85262d9bb2fff093db7ce67dbd4b62 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Wed, 6 Mar 2019 19:56:54 +0100
+Subject: [PATCH] libelf: Fix possible resource leak in elf[32|64]_updatefile.
+
+When we cannot allocate enough memory to convert the data in
+updatemmap we should free the scns before returning an error.
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+[Retrieved (and slightly updated to remove ChangeLog update) from:
+https://sourceware.org/git/?p=elfutils.git;a=patch;h=75e147d0ab85262d9bb2fff093db7ce67dbd4b62]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libelf/elf32_updatefile.c | 1 +
+ 2 files changed, 6 insertions(+)
+
+ 	* gelf_xlate.c (__elf_xfctstof): Remove alias.
+diff --git a/libelf/elf32_updatefile.c b/libelf/elf32_updatefile.c
+index 2899c6f..457d18e 100644
+--- a/libelf/elf32_updatefile.c
++++ b/libelf/elf32_updatefile.c
+@@ -365,6 +365,7 @@ __elfw2(LIBELFBITS,updatemmap) (Elf *elf, int change_bo, size_t shnum)
+ 			    char *converted = aligned_alloc (align, size);
+ 			    if (converted == NULL)
+ 			      {
++				free (scns);
+ 				__libelf_seterrno (ELF_E_NOMEM);
+ 				return 1;
+ 			      }
+-- 
+2.9.3
+
diff --git a/package/elfutils/0005-libelf-Use-posix_memalign-instead-of-aligned_alloc.patch b/package/elfutils/0005-libelf-Use-posix_memalign-instead-of-aligned_alloc.patch
new file mode 100644
index 0000000000..70f1f9af21
--- /dev/null
+++ b/package/elfutils/0005-libelf-Use-posix_memalign-instead-of-aligned_alloc.patch
@@ -0,0 +1,58 @@
+From 6bd060a23f43a842fbc37dd1bb8d6d7964eda36e Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 7 Mar 2019 17:31:53 +0100
+Subject: [PATCH] libelf: Use posix_memalign instead of aligned_alloc.
+
+Older glibc might not have aligned_alloc (it is C11).
+Use posix_memalign instead. posix_memalign requires the alignment to
+be a multiple of sizeof (void *). So use malloc for smaller alignments.
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+[Retrieved (and slighlty updated to remove ChangeLog update) from:
+https://sourceware.org/git/?p=elfutils.git;a=patch;h=6bd060a23f43a842fbc37dd1bb8d6d7964eda36e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libelf/elf32_updatefile.c | 20 +++++++++++++++++---
+ 2 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/libelf/elf32_updatefile.c b/libelf/elf32_updatefile.c
+index 457d18e..eea51a7 100644
+--- a/libelf/elf32_updatefile.c
++++ b/libelf/elf32_updatefile.c
+@@ -360,16 +360,30 @@ __elfw2(LIBELFBITS,updatemmap) (Elf *elf, int change_bo, size_t shnum)
+ 			else
+ 			  {
+ 			    /* We have to do the conversion on properly
+-			       aligned memory first.  */
++			       aligned memory first.  align is a power of 2,
++			       but posix_memalign only works for alignments
++			       which are a multiple of sizeof (void *).
++			       So use normal malloc for smaller alignments.  */
+ 			    size_t size = dl->data.d.d_size;
+-			    char *converted = aligned_alloc (align, size);
++			    void *converted;
++			    if (align < sizeof (void *))
++			      converted = malloc (size);
++			    else
++			      {
++				int res;
++				res = posix_memalign (&converted, align, size);
++				if (res != 0)
++				  converted = NULL;
++			      }
++
+ 			    if (converted == NULL)
+ 			      {
+ 				free (scns);
+ 				__libelf_seterrno (ELF_E_NOMEM);
+ 				return 1;
+ 			      }
+-                            (*fctp) (converted, dl->data.d.d_buf, size, 1);
++
++			    (*fctp) (converted, dl->data.d.d_buf, size, 1);
+ 
+ 			    /* And then write it to the mmapped file.  */
+ 			    memcpy (last_position, converted, size);
+-- 
+2.9.3
+
