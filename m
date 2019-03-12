From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Mar 2019 13:56:27 +0200
Subject: [Buildroot] [PATCH v2] ntp: security bump to version 4.2.8p13
Message-ID: <7ad4d84e13d178902878c73f5995ff242aa8028e.1552391787.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2019-8936: Crafted null dereference attack in authenticated
mode 6 packet.

Drop upstream patches.

Update COPYRIGHT file hash; text formatting (line width) changes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Update license file hash
---
 package/ntp/0003-fix-nommu.patch              | 29 -------------------
 .../0004-fix-work-fork-without-droproot.patch | 26 -----------------
 package/ntp/ntp.hash                          |  8 ++---
 package/ntp/ntp.mk                            |  2 +-
 4 files changed, 5 insertions(+), 60 deletions(-)
 delete mode 100644 package/ntp/0003-fix-nommu.patch
 delete mode 100644 package/ntp/0004-fix-work-fork-without-droproot.patch

diff --git a/package/ntp/0003-fix-nommu.patch b/package/ntp/0003-fix-nommu.patch
deleted file mode 100644
index 0959fa0ba522..000000000000
--- a/package/ntp/0003-fix-nommu.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Fix no-MMU build
-
-The detach_from_terminal() is unused for no-MMU, but it depends on symbols
-that are not defined for no-MMU. Don't define detach_from_terminal() when
-HAVE_WORKING_FORK is not defined.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: http://bugs.ntp.org/show_bug.cgi?id=3538
-
-diff -Nuar ntp-4.2.8p12.orig/ntpd/ntpd.c ntp-4.2.8p12/ntpd/ntpd.c
---- ntp-4.2.8p12.orig/ntpd/ntpd.c	2018-08-14 14:51:30.000000000 +0300
-+++ ntp-4.2.8p12/ntpd/ntpd.c	2018-10-13 21:25:25.858261249 +0300
-@@ -534,6 +534,7 @@
-  * Detach from terminal (much like daemon())
-  * Nothe that this function calls exit()
-  */
-+# ifdef HAVE_WORKING_FORK
- static void
- detach_from_terminal(
- 	int pipe_fds[2],
-@@ -617,6 +618,7 @@
- 
- 	return;
- }
-+# endif /* HAVE_WORKING_FORK */
- 
- #ifdef HAVE_DROPROOT
- /*
diff --git a/package/ntp/0004-fix-work-fork-without-droproot.patch b/package/ntp/0004-fix-work-fork-without-droproot.patch
deleted file mode 100644
index cb6fec012575..000000000000
--- a/package/ntp/0004-fix-work-fork-without-droproot.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fix work_fork build when droproot is disabled
-
-The set_user_group_ids() depends on HAVE_DROPROOT. When HAVE_DROPROOT is not
-enabled, work_fork.c code causes a link failure:
-
-../libntp/libntp.a(work_fork.o): In function `send_blocking_req_internal':
-work_fork.c:(.text+0x498): undefined reference to `set_user_group_ids'
-
-Make the set_user_group_ids() call depend on HAVE_DROPROOT.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: http://bugs.ntp.org/show_bug.cgi?id=3539
-
---- ntp-4.2.8p12.orig/libntp/work_fork.c	2018-08-14 14:51:06.000000000 +0300
-+++ ntp-4.2.8p12/libntp/work_fork.c	2018-10-15 21:10:54.580917962 +0300
-@@ -594,7 +594,9 @@
- 	init_logging("ntp_intres", 0, FALSE);
- 	setup_logfile(NULL);
- 
-+#if defined(HAVE_DROPROOT)
- 	(void) set_user_group_ids();
-+#endif
- 
- 	/*
- 	 * And now back to the portable code
diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 2fd8a8322b1a..4014936e61e7 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,5 +1,5 @@
-# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p12.tar.gz.md5
-md5 1522d66574bae14abb2622746dad2bdc  ntp-4.2.8p12.tar.gz
+# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p13.tar.gz.md5
+md5 ea040ab9b4ca656b5229b89d6b822f13  ntp-4.2.8p13.tar.gz
 # Calculated based on the hash above
-sha256 709b222b5013d77d26bfff532b5ea470a8039497ef29d09363931c036cb30454  ntp-4.2.8p12.tar.gz
-sha256 62c87b269365b38b55359b16dfde7ec28c683c722ef489db90afd0f2e478e4a1  COPYRIGHT
+sha256 288772cecfcd9a53694ffab108d1825a31ba77f3a8466b0401baeca3bc232a38  ntp-4.2.8p13.tar.gz
+sha256 3828da5fc8126889d6a64432288ace08526c490bf5427d799931689069968d91  COPYRIGHT
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index c62d59e81ac4..d53fcc5d0ba0 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p12
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p13
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent
 NTP_LICENSE = NTP
-- 
2.20.1
