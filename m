From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  1 Dec 2019 19:37:41 +0100
Subject: [Buildroot] [for-next] package/gcc: bump to version 7.5.0
Message-ID: <20191201183741.1815575-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patch [1]
1002-xtensa-backport-fix-for-PR-target-90922.patch

[1] https://github.com/gcc-mirror/gcc/commit/0110ab63c006fe8f1a86142cd6e86d5534f8bc8e

See:
https://gcc.gnu.org/ml/gcc/2019-11/msg00099.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...nsa-backport-fix-for-PR-target-90922.patch | 43 -------------------
 .../0001-uclibc-conf.patch}                   |  6 +--
 .../0002-arm-softfloat-libgcc.patch}          |  8 ++--
 .../0003-cilk-fix-build-without-wchar.patch}  |  6 +--
 ...-21-Ajit-Agarwal-ajitkum-xilinx.com.patch} | 15 ++++---
 ...R-target-81497-Fix-arm_acle.h-for-C.patch} | 13 +++---
 ...RANT-for-RISC-V-when-pthread-is-pas.patch} |  4 +-
 .../0007-xtensa-fix-PR-target-91880.patch}    |  0
 package/gcc/Config.in.host                    |  2 +-
 package/gcc/gcc.hash                          |  4 +-
 10 files changed, 29 insertions(+), 72 deletions(-)
 delete mode 100644 package/gcc/7.4.0/1002-xtensa-backport-fix-for-PR-target-90922.patch
 rename package/gcc/{7.4.0/0100-uclibc-conf.patch => 7.5.0/0001-uclibc-conf.patch} (89%)
 rename package/gcc/{7.4.0/0810-arm-softfloat-libgcc.patch => 7.5.0/0002-arm-softfloat-libgcc.patch} (90%)
 rename package/gcc/{7.4.0/0860-cilk-fix-build-without-wchar.patch => 7.5.0/0003-cilk-fix-build-without-wchar.patch} (96%)
 rename package/gcc/{7.4.0/0892-microblaze-Revert.patch => 7.5.0/0004-Revert-2016-01-21-Ajit-Agarwal-ajitkum-xilinx.com.patch} (81%)
 rename package/gcc/{7.4.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch => 7.5.0/0005-PR-target-81497-Fix-arm_acle.h-for-C.patch} (97%)
 rename package/gcc/{7.4.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch => 7.5.0/0006-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch} (92%)
 rename package/gcc/{7.4.0/1003-xtensa-fix-PR-target-91880.patch => 7.5.0/0007-xtensa-fix-PR-target-91880.patch} (100%)

diff --git a/package/gcc/7.4.0/1002-xtensa-backport-fix-for-PR-target-90922.patch b/package/gcc/7.4.0/1002-xtensa-backport-fix-for-PR-target-90922.patch
deleted file mode 100644
index 38e0309e5c..0000000000
--- a/package/gcc/7.4.0/1002-xtensa-backport-fix-for-PR-target-90922.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a592242578e573778241cae6d3928c064dcdfda4 Mon Sep 17 00:00:00 2001
-From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 18 Jun 2019 22:19:12 +0000
-Subject: [PATCH] xtensa: fix for PR target/90922
-
-Stack pointer adjustment code in prologue missed a case of no
-callee-saved registers and a stack frame size bigger than 128 bytes.
-Handle that case.
-
-This fixes the following gcc tests with call0 ABI:
-  gcc.c-torture/execute/stdarg-2.c
-  gcc.dg/torture/pr55882.c
-  gcc.dg/torture/pr57569.c
-
-gcc/
-2019-06-18  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* config/xtensa/xtensa.c (xtensa_expand_prologue): Add stack
-	pointer adjustment for the case of no callee-saved registers and
-	stack frame bigger than 128 bytes.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- gcc/config/xtensa/xtensa.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index 19bd616d67f6..ee5612441e25 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -2802,7 +2802,8 @@ xtensa_expand_prologue (void)
- 			    gen_rtx_SET (mem, reg));
- 	    }
- 	}
--      if (total_size > 1024)
-+      if (total_size > 1024
-+	  || (!callee_save_size && total_size > 128))
- 	{
- 	  rtx tmp_reg = gen_rtx_REG (Pmode, A9_REG);
- 	  emit_move_insn (tmp_reg, GEN_INT (total_size -
--- 
-2.11.0
-
diff --git a/package/gcc/7.4.0/0100-uclibc-conf.patch b/package/gcc/7.5.0/0001-uclibc-conf.patch
similarity index 89%
rename from package/gcc/7.4.0/0100-uclibc-conf.patch
rename to package/gcc/7.5.0/0001-uclibc-conf.patch
index d354baf81f..29c5c010ed 100644
--- a/package/gcc/7.4.0/0100-uclibc-conf.patch
+++ b/package/gcc/7.5.0/0001-uclibc-conf.patch
@@ -1,4 +1,4 @@
-From 326b880b20e5f8187dbda736b4c4c662cbfb00ca Mon Sep 17 00:00:00 2001
+From 0ff63500a600b758cd88ebcd048d7150df9ac881 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Tue, 2 May 2017 22:36:15 +0200
 Subject: [PATCH] uclibc-conf
@@ -10,7 +10,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/contrib/regression/objs-gcc.sh b/contrib/regression/objs-gcc.sh
-index 60b0497..6dc7ead 100755
+index 60b0497fea2..6dc7eadff36 100755
 --- a/contrib/regression/objs-gcc.sh
 +++ b/contrib/regression/objs-gcc.sh
 @@ -106,6 +106,10 @@ if [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-gnu ]
@@ -25,5 +25,5 @@ index 60b0497..6dc7ead 100755
    make bootstrap || exit 1
    make install || exit 1
 -- 
-2.9.3
+2.21.0
 
diff --git a/package/gcc/7.4.0/0810-arm-softfloat-libgcc.patch b/package/gcc/7.5.0/0002-arm-softfloat-libgcc.patch
similarity index 90%
rename from package/gcc/7.4.0/0810-arm-softfloat-libgcc.patch
rename to package/gcc/7.5.0/0002-arm-softfloat-libgcc.patch
index 63880dd091..c2c3450310 100644
--- a/package/gcc/7.4.0/0810-arm-softfloat-libgcc.patch
+++ b/package/gcc/7.5.0/0002-arm-softfloat-libgcc.patch
@@ -1,4 +1,4 @@
-From 420a304ac0daa29d66da6ed5b0b49fc4c482d522 Mon Sep 17 00:00:00 2001
+From 1d0a47a72a1357e4a298d611bd2499e1b72c6f86 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Tue, 2 May 2017 22:46:18 +0200
 Subject: [PATCH] arm softfloat libgcc
@@ -11,7 +11,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  2 files changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index 3d62367..dad0b97 100644
+index 3d62367ae68..dad0b97d39f 100644
 --- a/gcc/config/arm/linux-elf.h
 +++ b/gcc/config/arm/linux-elf.h
 @@ -58,7 +58,7 @@
@@ -24,7 +24,7 @@ index 3d62367..dad0b97 100644
  #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
  
 diff --git a/libgcc/config/arm/t-linux b/libgcc/config/arm/t-linux
-index 3d520de..e7bc042 100644
+index 3d520decafb..e7bc042d4e4 100644
 --- a/libgcc/config/arm/t-linux
 +++ b/libgcc/config/arm/t-linux
 @@ -1,6 +1,11 @@
@@ -41,5 +41,5 @@ index 3d520de..e7bc042 100644
  # Just for these, we omit the frame pointer since it makes such a big
  # difference.
 -- 
-2.9.3
+2.21.0
 
diff --git a/package/gcc/7.4.0/0860-cilk-fix-build-without-wchar.patch b/package/gcc/7.5.0/0003-cilk-fix-build-without-wchar.patch
similarity index 96%
rename from package/gcc/7.4.0/0860-cilk-fix-build-without-wchar.patch
rename to package/gcc/7.5.0/0003-cilk-fix-build-without-wchar.patch
index 61ab01c713..7821d06024 100644
--- a/package/gcc/7.4.0/0860-cilk-fix-build-without-wchar.patch
+++ b/package/gcc/7.5.0/0003-cilk-fix-build-without-wchar.patch
@@ -1,4 +1,4 @@
-From 714739e69ead1d9823233af40645277f6d4633ea Mon Sep 17 00:00:00 2001
+From a605662776a3bd50ebbb84509958cb42f44ec998 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Tue, 2 May 2017 23:21:46 +0200
 Subject: [PATCH] cilk: fix build without wchar
@@ -16,7 +16,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 8 insertions(+)
 
 diff --git a/libcilkrts/include/cilk/reducer_min_max.h b/libcilkrts/include/cilk/reducer_min_max.h
-index 641aa82..4f8e010 100644
+index 641aa823901..4f8e0102b90 100644
 --- a/libcilkrts/include/cilk/reducer_min_max.h
 +++ b/libcilkrts/include/cilk/reducer_min_max.h
 @@ -3289,7 +3289,9 @@ __CILKRTS_BEGIN_EXTERN_C
@@ -60,5 +60,5 @@ index 641aa82..4f8e010 100644
  CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
  CILK_C_REDUCER_MIN_INDEX_INSTANCE(int,                int,        INT_MAX)
 -- 
-2.9.3
+2.21.0
 
diff --git a/package/gcc/7.4.0/0892-microblaze-Revert.patch b/package/gcc/7.5.0/0004-Revert-2016-01-21-Ajit-Agarwal-ajitkum-xilinx.com.patch
similarity index 81%
rename from package/gcc/7.4.0/0892-microblaze-Revert.patch
rename to package/gcc/7.5.0/0004-Revert-2016-01-21-Ajit-Agarwal-ajitkum-xilinx.com.patch
index f7ea1e8382..0ae6876ee6 100644
--- a/package/gcc/7.4.0/0892-microblaze-Revert.patch
+++ b/package/gcc/7.5.0/0004-Revert-2016-01-21-Ajit-Agarwal-ajitkum-xilinx.com.patch
@@ -1,8 +1,7 @@
-From 707a69dfb56a2976e2b5c010f0e5cb2ac9905a07 Mon Sep 17 00:00:00 2001
+From 01fb9550fd858e441c3c2f358318af6e28e56181 Mon Sep 17 00:00:00 2001
 From: eager <eager@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 27 May 2017 18:29:40 +0000
-Subject: [PATCH] 	Revert: 	2016-01-21  Ajit Agarwal 
- <ajitkum@xilinx.com>
+Subject: [PATCH] Revert: 2016-01-21 Ajit Agarwal <ajitkum@xilinx.com>
 
 	See https://gcc.gnu.org/ml/gcc/2017-05/msg00221.html.
 
@@ -10,13 +9,15 @@ Subject: [PATCH] 	Revert: 	2016-01-21  Ajit Agarwal
 	(FIXED_REGISTERS): Update in macro.
 	(CALL_USED_REGISTERS): Update in macro.
 
-
-
 git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 248540 138bc75d-0d04-0410-961f-82ee72b054a4
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/microblaze/microblaze.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
 diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
-index 66e4ef5..2c9ece1 100644
+index 66e4ef5c3db..2c9ece1d6c6 100644
 --- a/gcc/config/microblaze/microblaze.h
 +++ b/gcc/config/microblaze/microblaze.h
 @@ -269,14 +269,14 @@ extern enum pipeline_type microblaze_pipe;
@@ -37,5 +38,5 @@ index 66e4ef5..2c9ece1 100644
  }
  #define GP_REG_FIRST    0
 -- 
-2.1.4
+2.21.0
 
diff --git a/package/gcc/7.4.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch b/package/gcc/7.5.0/0005-PR-target-81497-Fix-arm_acle.h-for-C.patch
similarity index 97%
rename from package/gcc/7.4.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch
rename to package/gcc/7.5.0/0005-PR-target-81497-Fix-arm_acle.h-for-C.patch
index fb8509fae7..0c7ab36770 100644
--- a/package/gcc/7.4.0/1000-arm-PR-target-81497-Fix-arm_acle.h-for-C.patch
+++ b/package/gcc/7.5.0/0005-PR-target-81497-Fix-arm_acle.h-for-C.patch
@@ -1,9 +1,9 @@
-From 1a259ac3e39bf87e6e6a5eface8b0ebc6b2a0dfe Mon Sep 17 00:00:00 2001
+From f1c05207166a16d0a6242f2fa642adc439f835a8 Mon Sep 17 00:00:00 2001
 From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 5 Jun 2018 09:50:16 +0000
-Subject: [PATCH] [arm] PR target/81497: Fix arm_acle.h for C++
+Subject: [PATCH] PR target/81497: Fix arm_acle.h for C++
 MIME-Version: 1.0
-Content-Type: text/plain; charset=utf-8
+Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
 When trying to compile something with arm_acle.h using G++ we get a number of nasty errors:
@@ -24,7 +24,6 @@ const-qualified versions and uses that in the specification of these intrinsics.
 This gives us the opportunity of creating an arm subdirectory in g++.dg and inaugurates it
 with the first arm-specific C++ tests (in that directory).
 
-
 	PR target/81497
 	* config/arm/arm-builtins.c (arm_type_qualifiers): Add
 	qualifier_void_pointer and qualifier_const_void_pointer.
@@ -53,7 +52,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  create mode 100644 gcc/testsuite/g++.target/arm/pr81497.C
 
 diff --git a/gcc/config/arm/arm-builtins.c b/gcc/config/arm/arm-builtins.c
-index 7fde7a04672..183a7b907f6 100644
+index d3b67184362..dd56f13251f 100644
 --- a/gcc/config/arm/arm-builtins.c
 +++ b/gcc/config/arm/arm-builtins.c
 @@ -75,7 +75,11 @@ enum arm_type_qualifiers
@@ -127,7 +126,7 @@ index 7fde7a04672..183a7b907f6 100644
  	 return type.  Otherwise, we are still processing
  	 arguments.  */
 diff --git a/gcc/config/arm/arm_acle.h b/gcc/config/arm/arm_acle.h
-index 9a2f0ba30dc..c0f6ea2d156 100644
+index 972e28edb86..69c29df4313 100644
 --- a/gcc/config/arm/arm_acle.h
 +++ b/gcc/config/arm/arm_acle.h
 @@ -38,35 +38,35 @@ __arm_cdp (const unsigned int __coproc, const unsigned int __opc1,
@@ -320,5 +319,5 @@ index 00000000000..0519a3a3045
 +  return 0;
 +}
 -- 
-2.17.1
+2.21.0
 
diff --git a/package/gcc/7.4.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch b/package/gcc/7.5.0/0006-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
similarity index 92%
rename from package/gcc/7.4.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
rename to package/gcc/7.5.0/0006-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
index accaf0214d..de0f453348 100644
--- a/package/gcc/7.4.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
+++ b/package/gcc/7.5.0/0006-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
@@ -1,4 +1,4 @@
-From 6ea832d09415cd82b744d0cf168cdd728c43df47 Mon Sep 17 00:00:00 2001
+From 1d78555bfc753039546ce5ca655dece67732e7bd Mon Sep 17 00:00:00 2001
 From: Mark Corbin <mark.corbin@embecosm.com>
 Date: Thu, 22 Nov 2018 12:19:11 +0000
 Subject: [PATCH] gcc: define _REENTRANT for RISC-V when -pthread is passed
@@ -27,5 +27,5 @@ index 4b2f7b6e1fd..b00d23ddfa0 100644
  -melf" XLEN_SPEC "lriscv \
  %{shared} \
 -- 
-2.19.1
+2.21.0
 
diff --git a/package/gcc/7.4.0/1003-xtensa-fix-PR-target-91880.patch b/package/gcc/7.5.0/0007-xtensa-fix-PR-target-91880.patch
similarity index 100%
rename from package/gcc/7.4.0/1003-xtensa-fix-PR-target-91880.patch
rename to package/gcc/7.5.0/0007-xtensa-fix-PR-target-91880.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e2a4032c90..7e2881e5b7 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -93,7 +93,7 @@ config BR2_GCC_SUPPORTS_DLANG
 config BR2_GCC_VERSION
 	string
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
-	default "7.4.0"     if BR2_GCC_VERSION_7_X
+	default "7.5.0"     if BR2_GCC_VERSION_7_X
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
 	default "9.2.0"     if BR2_GCC_VERSION_9_X
 	default "arc-2019.09-eng002" if BR2_GCC_VERSION_ARC
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 756e133820..d18b51de9a 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.5.0/sha512.sum
 sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1  gcc-5.5.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.4.0/sha512.sum
-sha512  8864d8e4b97c2e1a4f17422f6e68120172ebefeab97b1757734f7185ca68a6b9a89011c6833c03fa454c17b0ac35b15e1d284881e6971035948ac6100f3aa45e  gcc-7.4.0.tar.xz
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.5.0/sha512.sum
+sha512  fe716cc19f2e3255d3a8b1b8290777bf769c6d98e6e0b07b81a3d6ad43f8af74cb170dfa18b1555dbfcd3f55ae582b91a286ccef496b9b65c1579902f96a1f60  gcc-7.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.3.0/sha512.sum
 sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8dfe7e10be2276b4f62c357659ce2902f239f60a8648548231b4b5802  gcc-8.3.0.tar.xz
 #  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.2.0/sha512.sum
-- 
2.23.0
