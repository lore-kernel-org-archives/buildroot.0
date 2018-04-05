From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:23 +0200
Subject: [Buildroot] [PATCH 09/23] binutils: remove Blackfin patches
In-Reply-To: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180405195037.32641-10-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/2.27/0905-bfin-rofixup-bug.patch  | 21 ---------------
 .../binutils/2.28.1/0905-bfin-rofixup-bug.patch    | 21 ---------------
 ...LINKER-BUG-.rofixup-section-size-mismatch.patch | 31 ----------------------
 ...LINKER-BUG-.rofixup-section-size-mismatch.patch | 31 ----------------------
 4 files changed, 104 deletions(-)
 delete mode 100644 package/binutils/2.27/0905-bfin-rofixup-bug.patch
 delete mode 100644 package/binutils/2.28.1/0905-bfin-rofixup-bug.patch
 delete mode 100644 package/binutils/2.29.1/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
 delete mode 100644 package/binutils/2.30/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch

diff --git a/package/binutils/2.27/0905-bfin-rofixup-bug.patch b/package/binutils/2.27/0905-bfin-rofixup-bug.patch
deleted file mode 100644
index da9d586551..0000000000
--- a/package/binutils/2.27/0905-bfin-rofixup-bug.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Fixes: LINKER BUG: .rofixup section size mismatch
-
-Workaround from adi-toolchain commit:
-af414ec1fb628ddb1562f062f3db49823ca14ca2
-[#6798] binutils-2.21/bfd: temp workaround for rofixup mismatch errors.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur binutils-2.26.1.orig/bfd/elf32-bfin.c binutils-2.26.1/bfd/elf32-bfin.c
---- binutils-2.26.1.orig/bfd/elf32-bfin.c	2015-11-13 09:27:40.000000000 +0100
-+++ binutils-2.26.1/bfd/elf32-bfin.c	2016-07-31 00:50:48.357995132 +0200
-@@ -4879,7 +4879,8 @@
- 
- 	case R_BFIN_FUNCDESC:
- 	  picrel->fd++;
--	  picrel->relocsfd++;
-+	  if (bfd_get_section_flags (abfd, sec) & SEC_ALLOC)
-+	    picrel->relocsfd++;
- 	  break;
- 
-         /* This relocation describes the C++ object vtable hierarchy.
diff --git a/package/binutils/2.28.1/0905-bfin-rofixup-bug.patch b/package/binutils/2.28.1/0905-bfin-rofixup-bug.patch
deleted file mode 100644
index 5733b219d7..0000000000
--- a/package/binutils/2.28.1/0905-bfin-rofixup-bug.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Fixes: LINKER BUG: .rofixup section size mismatch
-
-Workaround from adi-toolchain commit:
-af414ec1fb628ddb1562f062f3db49823ca14ca2
-[#6798] binutils-2.21/bfd: temp workaround for rofixup mismatch errors.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur binutils-2.26.1.orig/bfd/elf32-bfin.c binutils-2.26.1/bfd/elf32-bfin.c
---- binutils-2.26.1.orig/bfd/elf32-bfin.c	2015-11-13 09:27:40.000000000 +0100
-+++ binutils-2.26.1/bfd/elf32-bfin.c	2016-07-31 00:50:48.357995132 +0200
-@@ -4845,7 +4845,8 @@
- 
- 	case R_BFIN_FUNCDESC:
- 	  picrel->fd++;
--	  picrel->relocsfd++;
-+	  if (bfd_get_section_flags (abfd, sec) & SEC_ALLOC)
-+	    picrel->relocsfd++;
- 	  break;
- 
-         /* This relocation describes the C++ object vtable hierarchy.
diff --git a/package/binutils/2.29.1/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch b/package/binutils/2.29.1/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
deleted file mode 100644
index e5409efe14..0000000000
--- a/package/binutils/2.29.1/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 122de3b633f4273826a2d01702d7c515f93ec2be Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sat, 29 Jul 2017 14:08:20 +0200
-Subject: [PATCH] Fixes: LINKER BUG: .rofixup section size mismatch
-
-Workaround from adi-toolchain commit:
-af414ec1fb628ddb1562f062f3db49823ca14ca2
-[#6798] binutils-2.21/bfd: temp workaround for rofixup mismatch errors.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- bfd/elf32-bfin.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/bfd/elf32-bfin.c b/bfd/elf32-bfin.c
-index b3e09bd..660eec5 100644
---- a/bfd/elf32-bfin.c
-+++ b/bfd/elf32-bfin.c
-@@ -4845,7 +4845,8 @@ bfinfdpic_check_relocs (bfd *abfd, struct bfd_link_info *info,
- 
- 	case R_BFIN_FUNCDESC:
- 	  picrel->fd++;
--	  picrel->relocsfd++;
-+	  if (bfd_get_section_flags (abfd, sec) & SEC_ALLOC)
-+	    picrel->relocsfd++;
- 	  break;
- 
-         /* This relocation describes the C++ object vtable hierarchy.
--- 
-2.9.4
-
diff --git a/package/binutils/2.30/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch b/package/binutils/2.30/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
deleted file mode 100644
index 0ce2cf2288..0000000000
--- a/package/binutils/2.30/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c3bd478ac1b7e83765230505eb08a0acf2fe3867 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sat, 29 Jul 2017 14:08:20 +0200
-Subject: [PATCH] Fixes: LINKER BUG: .rofixup section size mismatch
-
-Workaround from adi-toolchain commit:
-af414ec1fb628ddb1562f062f3db49823ca14ca2
-[#6798] binutils-2.21/bfd: temp workaround for rofixup mismatch errors.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- bfd/elf32-bfin.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/bfd/elf32-bfin.c b/bfd/elf32-bfin.c
-index 478b8d4731..a38519b585 100644
---- a/bfd/elf32-bfin.c
-+++ b/bfd/elf32-bfin.c
-@@ -4655,7 +4655,8 @@ bfinfdpic_check_relocs (bfd *abfd, struct bfd_link_info *info,
- 
- 	case R_BFIN_FUNCDESC:
- 	  picrel->fd++;
--	  picrel->relocsfd++;
-+	  if (bfd_get_section_flags (abfd, sec) & SEC_ALLOC)
-+	    picrel->relocsfd++;
- 	  break;
- 
- 	/* This relocation describes the C++ object vtable hierarchy.
--- 
-2.14.3
-
-- 
2.14.3
