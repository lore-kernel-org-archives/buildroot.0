From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 16:37:41 +0200
Subject: [Buildroot] [git commit] gcc: add support for MIPS R6 Musl
Message-ID: <20161015144058.ACCA180179@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc77d63534b34e5fe9edfc3c2e2adfdee1a451e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream patch to add support for MIPS R6 Musl:

  https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=83717065090bb8b954556d1216dd9dc397dc0243

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../941-mips-Add-support-for-mips-r6-musl.patch    | 43 ++++++++++++++++++++++
 .../941-mips-Add-support-for-mips-r6-musl.patch    | 43 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/package/gcc/5.4.0/941-mips-Add-support-for-mips-r6-musl.patch b/package/gcc/5.4.0/941-mips-Add-support-for-mips-r6-musl.patch
new file mode 100644
index 0000000..337d376
--- /dev/null
+++ b/package/gcc/5.4.0/941-mips-Add-support-for-mips-r6-musl.patch
@@ -0,0 +1,43 @@
+From 83717065090bb8b954556d1216dd9dc397dc0243 Mon Sep 17 00:00:00 2001
+From: nsz <nsz@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 25 Aug 2016 14:13:02 +0000
+Subject: [PATCH] [mips] Add support for mips*r6-*-musl
+
+gcc/
+	* config/mips/linux.h (MUSL_DYNAMIC_LINKER32): Update.
+	(MUSL_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKERN32): Update.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 239760 138bc75d-0d04-0410-961f-82ee72b054a4
+
+[Vincent: tweak to not patch ChangeLog]
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ gcc/config/mips/linux.h | 9 ++++++---
+ 1 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
+index fa253b6..dc51c45 100644
+--- a/gcc/config/mips/linux.h
++++ b/gcc/config/mips/linux.h
+@@ -38,10 +38,13 @@ along with GCC; see the file COPYING3.  If not see
+   "%{mnan=2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0}"
+ 
+ #undef MUSL_DYNAMIC_LINKER32
+-#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-mips%{EL:el}%{msoft-float:-sf}.so.1"
++#define MUSL_DYNAMIC_LINKER32 \
++  "/lib/ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
+ #undef MUSL_DYNAMIC_LINKER64
+-#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-mips64%{EL:el}%{msoft-float:-sf}.so.1"
+-#define MUSL_DYNAMIC_LINKERN32 "/lib/ld-musl-mipsn32%{EL:el}%{msoft-float:-sf}.so.1"
++#define MUSL_DYNAMIC_LINKER64 \
++  "/lib/ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
++#define MUSL_DYNAMIC_LINKERN32 \
++  "/lib/ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
+ 
+ #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
+ #define GNU_USER_DYNAMIC_LINKERN32 \
+-- 
+2.10.0
+
diff --git a/package/gcc/6.2.0/941-mips-Add-support-for-mips-r6-musl.patch b/package/gcc/6.2.0/941-mips-Add-support-for-mips-r6-musl.patch
new file mode 100644
index 0000000..337d376
--- /dev/null
+++ b/package/gcc/6.2.0/941-mips-Add-support-for-mips-r6-musl.patch
@@ -0,0 +1,43 @@
+From 83717065090bb8b954556d1216dd9dc397dc0243 Mon Sep 17 00:00:00 2001
+From: nsz <nsz@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 25 Aug 2016 14:13:02 +0000
+Subject: [PATCH] [mips] Add support for mips*r6-*-musl
+
+gcc/
+	* config/mips/linux.h (MUSL_DYNAMIC_LINKER32): Update.
+	(MUSL_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKERN32): Update.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 239760 138bc75d-0d04-0410-961f-82ee72b054a4
+
+[Vincent: tweak to not patch ChangeLog]
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ gcc/config/mips/linux.h | 9 ++++++---
+ 1 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
+index fa253b6..dc51c45 100644
+--- a/gcc/config/mips/linux.h
++++ b/gcc/config/mips/linux.h
+@@ -38,10 +38,13 @@ along with GCC; see the file COPYING3.  If not see
+   "%{mnan=2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0}"
+ 
+ #undef MUSL_DYNAMIC_LINKER32
+-#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-mips%{EL:el}%{msoft-float:-sf}.so.1"
++#define MUSL_DYNAMIC_LINKER32 \
++  "/lib/ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
+ #undef MUSL_DYNAMIC_LINKER64
+-#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-mips64%{EL:el}%{msoft-float:-sf}.so.1"
+-#define MUSL_DYNAMIC_LINKERN32 "/lib/ld-musl-mipsn32%{EL:el}%{msoft-float:-sf}.so.1"
++#define MUSL_DYNAMIC_LINKER64 \
++  "/lib/ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
++#define MUSL_DYNAMIC_LINKERN32 \
++  "/lib/ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
+ 
+ #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
+ #define GNU_USER_DYNAMIC_LINKERN32 \
+-- 
+2.10.0
+
