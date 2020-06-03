From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  3 Jun 2020 23:21:34 +0200
Subject: [Buildroot] [PATCH v1] package/valgrind: bump version to 3.16.0
Message-ID: <20200603212134.18303-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- removed 0003-mips-fix-mips32r6-and-mips64r6-compilation-issue.patch
  (backport from upstream commit [1])

[1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=50dd9600ab1ad8933704ee85289191d9c65ba444

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...s32r6-and-mips64r6-compilation-issue.patch | 51 -------------------
 package/valgrind/valgrind.hash                |  6 +--
 package/valgrind/valgrind.mk                  |  2 +-
 3 files changed, 4 insertions(+), 55 deletions(-)
 delete mode 100644 package/valgrind/0003-mips-fix-mips32r6-and-mips64r6-compilation-issue.patch

diff --git a/package/valgrind/0003-mips-fix-mips32r6-and-mips64r6-compilation-issue.patch b/package/valgrind/0003-mips-fix-mips32r6-and-mips64r6-compilation-issue.patch
deleted file mode 100644
index da8c655f00..0000000000
--- a/package/valgrind/0003-mips-fix-mips32r6-and-mips64r6-compilation-issue.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 50dd9600ab1ad8933704ee85289191d9c65ba444 Mon Sep 17 00:00:00 2001
-From: Petar Jovanovic <mips32r2@gmail.com>
-Date: Fri, 19 Apr 2019 14:04:26 +0000
-Subject: [PATCH] mips: fix mips32r6 and mips64r6 compilation issue
-
-Add missing variable declarations.
-Modify local_sys_write_stderr to use movn if available, and use
-seleqz/selnez instructions otherwise.
-
-Backported from upstream commit
-50dd9600ab1ad8933704ee85289191d9c65ba444.
-
-Signed-off-by: Stefan Maksimovic <stefan.maksimovic@rt-rk.com>
----
- VEX/priv/guest_mips_toIR.c | 1 +
- coregrind/m_debuglog.c     | 6 ++++++
- 2 files changed, 7 insertions(+)
-
-diff --git a/VEX/priv/guest_mips_toIR.c b/VEX/priv/guest_mips_toIR.c
-index eb437ec..6e91329 100755
---- a/VEX/priv/guest_mips_toIR.c
-+++ b/VEX/priv/guest_mips_toIR.c
-@@ -20241,6 +20241,7 @@ static UInt disInstr_MIPS_WRK_00(UInt cins, const VexArchInfo* archinfo,
- #elif defined(__mips__) && ((defined(__mips_isa_rev) && __mips_isa_rev >= 6))
- 
-       case 0x08: { /* BEQZALC, BEQC, BOVC */
-+         IRTemp t1, t2, t3, t4;
-          if (rs == 0) { /* BEQZALC */
-             DIP("beqzalc r%u, %u", rt, imm);
- 
-diff --git a/coregrind/m_debuglog.c b/coregrind/m_debuglog.c
-index 456a711..289f275 100644
---- a/coregrind/m_debuglog.c
-+++ b/coregrind/m_debuglog.c
-@@ -452,7 +452,13 @@ static UInt local_sys_write_stderr ( const HChar* buf, Int n )
-    __asm__ volatile (
-       "syscall            \n\t"
-       "addiu   $4, $0, -1 \n\t"
-+      #if ((defined(__mips_isa_rev) && __mips_isa_rev >= 6))
-+      "selnez  $4, $4, $7 \n\t"
-+      "seleqz  $2, $2, $7 \n\t"
-+      "or      $2, $2, $4 \n\t"
-+      #else
-       "movn    $2, $4, $7 \n\t"
-+      #endif
-      : "+d" (v0), "+d" (a0), "+d" (a1), "+d" (a2)
-      :
-      : "$1", "$3", "$7", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15",
--- 
-2.7.4
-
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 3c7b98ef2b..942b4a8caf 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,6 +1,6 @@
 # From http://valgrind.org/downloads/current.html
-md5 46e5fbdcbc3502a5976a317a0860a975 valgrind-3.15.0.tar.bz2
+md5  495b30af5e5ed62ebb9bb777ee19b27f  valgrind-3.16.0.tar.bz2
 
 # License files
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
-sha256 56976e64523fa1e68db4e6f464f5b2cb89d7d08f54b1d012e317b8db286b3faf COPYING.DOCS
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  56976e64523fa1e68db4e6f464f5b2cb89d7d08f54b1d012e317b8db286b3faf  COPYING.DOCS
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 41b2625191..035d7b23e9 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.15.0
+VALGRIND_VERSION = 3.16.0
 VALGRIND_SITE = ftp://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
-- 
2.26.2
