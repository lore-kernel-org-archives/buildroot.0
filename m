From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 20:26:22 +0100
Subject: [Buildroot] [git commit] package/gcc: bump 7.x series to 7.3.0
Message-ID: <20180128194835.473D1843E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9ec7ae71ce12932e3d5f56f96da3b39279e7477
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patches:
0870-xtensa-fix-PR-target-82181.patch
0893-ARC-Configure-script-to-allow-non-uclibc-based-tripl.patch

See: https://www.mail-archive.com/gcc at gcc.gnu.org/msg84336.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../7.2.0/0870-xtensa-fix-PR-target-82181.patch    | 31 -------------
 ...re-script-to-allow-non-uclibc-based-tripl.patch | 51 ----------------------
 .../gcc/{7.2.0 => 7.3.0}/0100-uclibc-conf.patch    |  0
 .../0810-arm-softfloat-libgcc.patch                |  0
 .../0860-cilk-fix-build-without-wchar.patch        |  0
 .../{7.2.0 => 7.3.0}/0891-fix-m68k-uclinux.patch   |  0
 .../{7.2.0 => 7.3.0}/0892-microblaze-Revert.patch  |  0
 .../{7.2.0 => 7.3.0}/0900-remove-selftests.patch   |  0
 package/gcc/Config.in.host                         |  2 +-
 package/gcc/gcc.hash                               |  4 +-
 10 files changed, 3 insertions(+), 85 deletions(-)

diff --git a/package/gcc/7.2.0/0870-xtensa-fix-PR-target-82181.patch b/package/gcc/7.2.0/0870-xtensa-fix-PR-target-82181.patch
deleted file mode 100644
index 7ac7cd9..0000000
--- a/package/gcc/7.2.0/0870-xtensa-fix-PR-target-82181.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3ed0c49a8d52e88648c7bb9f21a204b23595a6a9 Mon Sep 17 00:00:00 2001
-From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 11 Sep 2017 21:53:38 +0000
-Subject: [PATCH] xtensa: fix PR target/82181
-
-2017-09-11  Max Filippov  <jcmvbkbc@gmail.com>
-gcc/
-	Backport from mainline
-	* config/xtensa/xtensa.c (xtensa_mem_offset): Check that both
-	words of DImode object are reachable by xtensa_uimm8x4 access.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- gcc/config/xtensa/xtensa.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index 25e4a2894c3b..8c404187107b 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -605,6 +605,7 @@ xtensa_mem_offset (unsigned v, machine_mode mode)
-     case HImode:
-       return xtensa_uimm8x2 (v);
- 
-+    case DImode:
-     case DFmode:
-       return (xtensa_uimm8x4 (v) && xtensa_uimm8x4 (v + 4));
- 
--- 
-2.1.4
-
diff --git a/package/gcc/7.2.0/0893-ARC-Configure-script-to-allow-non-uclibc-based-tripl.patch b/package/gcc/7.2.0/0893-ARC-Configure-script-to-allow-non-uclibc-based-tripl.patch
deleted file mode 100644
index 4f97c2f..0000000
--- a/package/gcc/7.2.0/0893-ARC-Configure-script-to-allow-non-uclibc-based-tripl.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 927c0132251f1cd3452b96ebd75f1b06bc53e4ec Mon Sep 17 00:00:00 2001
-From: claziss <claziss@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 10 Jul 2017 13:55:26 +0000
-Subject: [PATCH] [ARC] Configure script to allow non uclibc based triplets
-
-gcc/
-2017-07-10  Vineet Gupta <vgupta@synopsys.com>
-
-        * config.gcc: Remove uclibc from arc target spec.
-
-libgcc/
-2017-07-10  Vineet Gupta <vgupta@synopsys.com>
-
-        * config.host: Remove uclibc from arc target spec.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 250097 138bc75d-0d04-0410-961f-82ee72b054a4
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- gcc/config.gcc     | 2 +-
- libgcc/config.host | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config.gcc b/gcc/config.gcc
-index 1b47457..933a451 100644
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -1044,7 +1044,7 @@ arc*-*-elf*)
- 	big*)	tm_file="arc/big.h ${tm_file}"
- 	esac
- 	;;
--arc*-*-linux-uclibc*)
-+arc*-*-linux*)
- 	tm_file="arc/arc-arch.h dbxelf.h elfos.h gnu-user.h linux.h linux-android.h glibc-stdint.h arc/linux.h ${tm_file}"
- 	tmake_file="${tmake_file} arc/t-arc"
- 	extra_gcc_objs="driver-arc.o"
-diff --git a/libgcc/config.host b/libgcc/config.host
-index 989ac71..a5ab453 100644
---- a/libgcc/config.host
-+++ b/libgcc/config.host
-@@ -383,7 +383,7 @@ arc*-*-elf*)
- 	extra_parts="crti.o crtn.o crtend.o crtbegin.o crtendS.o crtbeginS.o"
- 	extra_parts="$extra_parts crttls.o"
- 	;;
--arc*-*-linux-uclibc*)
-+arc*-*-linux*)
- 	tmake_file="${tmake_file} t-slibgcc-libgcc t-slibgcc-nolc-override arc/t-arc-uClibc arc/t-arc"
- 	extra_parts="$extra_parts crti.o crtn.o"
- 	extra_parts="$extra_parts crttls.o"
--- 
-2.10.2
-
diff --git a/package/gcc/7.2.0/0100-uclibc-conf.patch b/package/gcc/7.3.0/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/7.2.0/0100-uclibc-conf.patch
rename to package/gcc/7.3.0/0100-uclibc-conf.patch
diff --git a/package/gcc/7.2.0/0810-arm-softfloat-libgcc.patch b/package/gcc/7.3.0/0810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/7.2.0/0810-arm-softfloat-libgcc.patch
rename to package/gcc/7.3.0/0810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/7.2.0/0860-cilk-fix-build-without-wchar.patch b/package/gcc/7.3.0/0860-cilk-fix-build-without-wchar.patch
similarity index 100%
rename from package/gcc/7.2.0/0860-cilk-fix-build-without-wchar.patch
rename to package/gcc/7.3.0/0860-cilk-fix-build-without-wchar.patch
diff --git a/package/gcc/7.2.0/0891-fix-m68k-uclinux.patch b/package/gcc/7.3.0/0891-fix-m68k-uclinux.patch
similarity index 100%
rename from package/gcc/7.2.0/0891-fix-m68k-uclinux.patch
rename to package/gcc/7.3.0/0891-fix-m68k-uclinux.patch
diff --git a/package/gcc/7.2.0/0892-microblaze-Revert.patch b/package/gcc/7.3.0/0892-microblaze-Revert.patch
similarity index 100%
rename from package/gcc/7.2.0/0892-microblaze-Revert.patch
rename to package/gcc/7.3.0/0892-microblaze-Revert.patch
diff --git a/package/gcc/7.2.0/0900-remove-selftests.patch b/package/gcc/7.3.0/0900-remove-selftests.patch
similarity index 100%
rename from package/gcc/7.2.0/0900-remove-selftests.patch
rename to package/gcc/7.3.0/0900-remove-selftests.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 70cce0a..8432515 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -79,7 +79,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
-	default "7.2.0"     if BR2_GCC_VERSION_7_X
+	default "7.3.0"     if BR2_GCC_VERSION_7_X
 	default "arc-2017.09-release" if BR2_GCC_VERSION_ARC
 	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 76be455..4966b18 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683
 sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1  gcc-5.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.4.0/sha512.sum
 sha512  02c60e54527c7adf584798d5251f8a0b80c93d5deafce82501b2c28e6692e0bd783927bbfc4bc527a863c0cccc025150a34740a9e29badb02d4b48e56a8aba90  gcc-6.4.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.2.0/sha512.sum
-sha512  f853cd6530b4055d8d8289da74687cb4c6d5f363598d386332d31852b581bac76c3adb7d61889edec3b779f63d8646f0122840f12965ce4a4389ba535dbbb6e1  gcc-7.2.0.tar.xz
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.3.0/sha512.sum
+sha512  ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19c19921b0cdf6d05483faede8287bb9ea120c0d1559449a70e602c8d4  gcc-7.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  c30addd3c4dc66b90749a0f99b257c8a8e7966d27f286057b6b66f4a70ca22a1ee50d92882c4db13307d769a6fb28e1e2a2bab749a692cf3f89ef0c38f145efa  gcc-arc-2017.09-release.tar.gz
