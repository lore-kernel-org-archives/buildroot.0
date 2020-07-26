From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 Jul 2020 11:43:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/elf2flt: bump to version 2019.12
Message-ID: <20200726094338.1276868-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop first patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...add-new-relocation-types-for-xtensa.patch} |  0
 ...e-properly-when-called-with-a-name-d.patch | 79 -------------------
 package/elf2flt/elf2flt.hash                  |  2 +-
 package/elf2flt/elf2flt.mk                    |  4 +-
 4 files changed, 3 insertions(+), 82 deletions(-)
 rename package/elf2flt/{0002-elf2flt.c-add-new-relocation-types-for-xtensa.patch => 0001-elf2flt.c-add-new-relocation-types-for-xtensa.patch} (100%)
 delete mode 100644 package/elf2flt/0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch

diff --git a/package/elf2flt/0002-elf2flt.c-add-new-relocation-types-for-xtensa.patch b/package/elf2flt/0001-elf2flt.c-add-new-relocation-types-for-xtensa.patch
similarity index 100%
rename from package/elf2flt/0002-elf2flt.c-add-new-relocation-types-for-xtensa.patch
rename to package/elf2flt/0001-elf2flt.c-add-new-relocation-types-for-xtensa.patch
diff --git a/package/elf2flt/0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch b/package/elf2flt/0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch
deleted file mode 100644
index a27c4913fb..0000000000
--- a/package/elf2flt/0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From b31e9b1bff6832063816b972395179859d1d4619 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 13 Aug 2017 16:03:20 +0200
-Subject: [PATCH] ld-elf2flt: behave properly when called with a name different
- from TARGET_ALIAS
-
-ld-elf2flt currently handles two cases:
-
- 1 It is called as the wrapper for <TARGET_ALIAS>-ld, generally
-   installed in the bin/ directory of a toolchain.
-
- 2 It is called as the wrapper for "ld", generally installed in the
-   TARGET_ALIAS/bin/ directory of a toolchain.
-
-Unfortunately, if for some reason it gets called using a FOOBAR-ld
-name that is different from <TARGET_ALIAS>-ld, it assumes it is in
-case (2), while it really is in case (1). Due to this, the path
-mangling logic doesn't work, and it doesn't find ld.real.
-
-This happens for example when the binary program in bin/ is named
-arm-buildroot-uclinux-uclibcgnueabi-ld, but also has a simpler symlink
-named arm-linux-ld. In this case,
-arm-buildroot-uclinux-uclibcgnueabi-ld is recognized by ld-elf2flt as
-containing TARGET_ALIAS, and therefore the proper logic to find
-ld.real is applied. However, when arm-linux-ld is used, ld-elf2flt
-doesn't find TARGET_ALIAS, and therefore assumes we're being called as
-TARGET_ALIAS/bin/ld.. and searches for a program called ld.real in
-bin/, which doesn't exist.
-
-See:
-
-$ ./output/host/bin/arm-buildroot-uclinux-uclibcgnueabi-ld
-/home/thomas/buildroot/buildroot/output/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: no input files
-
-$ ./output/host/bin/arm-linux-ld
-arm-linux-ld (ld-elf2flt): error trying to exec '/home/thomas/buildroot/buildroot/output/host/bin/ld.real': execvp: No such file or directory
-
-$ ./output/host/arm-buildroot-uclinux-uclibcgnueabi/bin/ld
-/home/thomas/buildroot/buildroot/output/host/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: no input files
-
-This commit fixes that by inverting the logic: if we're being called
-as just "ld", then we assume it's the program in
-TARGET_ALIAS/bin/. Otherwise, we're called through some variant of
-TARGET-ld.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Submitted-upstream: https://github.com/uclinux-dev/elf2flt/pull/8
----
- ld-elf2flt.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/ld-elf2flt.c b/ld-elf2flt.c
-index de39fe0..c187c2e 100644
---- a/ld-elf2flt.c
-+++ b/ld-elf2flt.c
-@@ -506,15 +506,15 @@ int main(int argc, char *argv[])
- 	   the host while those in <TARGET_ALIAS>/lib are for the target.
- 	   Make bindir point to the bin dir for bin/<TARGET_ALIAS>-foo.
- 	   Make tooldir point to the bin dir for <TARGET_ALIAS>/bin/foo.  */
--	if (streqn(elf2flt_progname, TARGET_ALIAS)) {
--		tmp = concat(argv0_dir, "../" TARGET_ALIAS "/bin", NULL);
-+	if (streqn(elf2flt_progname, "ld")) {
-+		tmp = concat(argv0_dir, "../../bin", NULL);
- 		if (stat(tmp, &buf) == 0 && S_ISDIR(buf.st_mode)) {
--			tooldir = concat(tmp, "/", NULL);
-+			bindir = concat(tmp, "/", NULL);
- 		}
- 	} else {
--		tmp = concat(argv0_dir, "../../bin", NULL);
-+		tmp = concat(argv0_dir, "../" TARGET_ALIAS "/bin", NULL);
- 		if (stat(tmp, &buf) == 0 && S_ISDIR(buf.st_mode)) {
--			bindir = concat(tmp, "/", NULL);
-+			tooldir = concat(tmp, "/", NULL);
- 		}
- 	}
- 
--- 
-2.9.4
-
diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
index c4b0697fcd..afa19076b9 100644
--- a/package/elf2flt/elf2flt.hash
+++ b/package/elf2flt/elf2flt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d63baae6fe0d7fcc50a635be151a6f9e1e83dba30568046a869a395c15bf6284  elf2flt-7e33f28df198c46764021ed14408bd262751e148.tar.gz
+sha256  a535facbcdc2f2e86778dff84c99c32eca5eb0138bd09a8dc49da3b47c59f743  elf2flt-2019.12.tar.gz
 sha256  f20bc5007904094e3a4e9fbcc3526cdd40893f91d458c3139b308e5c4c0899c6  LICENSE.TXT
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index e7edd8b9de..dbbe88d117 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 7e33f28df198c46764021ed14408bd262751e148
-ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,$(ELF2FLT_VERSION))
+ELF2FLT_VERSION = 2019.12
+ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,v$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPL-2.0+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
 
-- 
2.27.0
