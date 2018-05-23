From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 May 2018 21:19:04 +0300
Subject: [Buildroot] [PATCH] procps-ng: security bump to version 3.3.15
Message-ID: <91aa34326a9720369e4291afea525bd4260677c6.1527099544.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

This release fixes the issues listed below.

CVE-2018-1122: Local privilege escalation in top

CVE-2018-1123: Denial of service in ps

CVE-2018-1124: Local privilege escalation in libprocps

CVE-2018-1125: Stack buffer overflow in pgrep

CVE-2018-1126: Integer overflow in proc/alloc

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-proc-sig-fix-build-for-sparc.patch   | 43 -------------------
 package/procps-ng/procps-ng.hash              |  8 ++--
 package/procps-ng/procps-ng.mk                |  2 +-
 3 files changed, 5 insertions(+), 48 deletions(-)
 delete mode 100644 package/procps-ng/0001-proc-sig-fix-build-for-sparc.patch

diff --git a/package/procps-ng/0001-proc-sig-fix-build-for-sparc.patch b/package/procps-ng/0001-proc-sig-fix-build-for-sparc.patch
deleted file mode 100644
index 74f822aea357..000000000000
--- a/package/procps-ng/0001-proc-sig-fix-build-for-sparc.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 070feb7c5ebd0f2ca721ca5d75bdd3fd8cffe961 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 27 Apr 2018 07:34:57 +0300
-Subject: [PATCH] proc/sig: fix build for sparc
-
-The code undefines SIGLOST which breaks references to SIGPWR.
-
-Taken from a patch suggested in upstream bug report #93.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://gitlab.com/procps-ng/procps/issues/93
----
- proc/sig.c | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/proc/sig.c b/proc/sig.c
-index b883185fc28a..6ca9512cc70c 100644
---- a/proc/sig.c
-+++ b/proc/sig.c
-@@ -52,10 +52,6 @@
- #  undef SIGSTKFLT
- #endif
- 
--#if !defined(__GNU__) && defined(SIGLOST)
--#  undef SIGLOST
--#endif
--
- #ifndef SIGRTMIN
- #  warning Standards require that <signal.h> define SIGRTMIN; assuming 32
- #  define SIGRTMIN 32
-@@ -87,7 +83,7 @@ static const mapstruct sigtable[] = {
-   {"ILL",    SIGILL},
-   {"INT",    SIGINT},
-   {"KILL",   SIGKILL},
--#ifdef SIGLOST
-+#if defined(__GNU__)
-   {"LOST",   SIGLOST},  /* Hurd-specific */
- #endif
-   {"PIPE",   SIGPIPE},
--- 
-2.17.0
-
diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
index 9488af2d9fb4..123db992ef89 100644
--- a/package/procps-ng/procps-ng.hash
+++ b/package/procps-ng/procps-ng.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/procps-ng/files/Production/
-md5	fce371ccc1c15a67af9d85e4057e559d	procps-ng-3.3.14.tar.xz
-sha1	fcc4631b1185f7250daecee2fcebe15efbbe0d65	procps-ng-3.3.14.tar.xz
+md5	2b0717a7cb474b3d6dfdeedfbad2eccc	procps-ng-3.3.15.tar.xz
+sha1	2929bc64f0cf7b2db997eef79b7187658e47230d	procps-ng-3.3.15.tar.xz
 # Locally calculated after checking signature
-# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-3.3.14.tar.xz.asc
-sha256 5eda0253999b7d786e690edfa73301b3113c7a67058478866e98e9ff6736726c  procps-ng-3.3.14.tar.xz
+# http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-3.3.15.tar.xz.asc
+sha256 10bd744ffcb3de2d591d2f6acf1a54a7ba070fdcc432a855931a5057149f0465  procps-ng-3.3.15.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  COPYING.LIB
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 0d5ce9ddf085..e1fddea32c22 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 3.3.14
+PROCPS_NG_VERSION = 3.3.15
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
-- 
2.17.0
