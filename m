From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Thu,  3 Sep 2020 13:01:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/bison: bump to 3.7.1
Message-ID: <20200903110112.1752588-1-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
	https://lists.gnu.org/archive/html/info-gnu/2020-08/msg00000.html

Tested using utils/test-pkg with toolchain br-arm-full on the
following reverse-dependencies: bash at dtc host-dtc.  Also tested
using a custom toolchain and configuration on: conntrack-tools
iproute2 libnl libpcap libtasn1.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 ...0001-src-make-path-to-m4-relocatable.patch | 70 -------------------
 package/bison/bison.hash                      |  2 +-
 package/bison/bison.mk                        |  2 +-
 3 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 package/bison/0001-src-make-path-to-m4-relocatable.patch

diff --git a/package/bison/0001-src-make-path-to-m4-relocatable.patch b/package/bison/0001-src-make-path-to-m4-relocatable.patch
deleted file mode 100644
index f40c39c558..0000000000
--- a/package/bison/0001-src-make-path-to-m4-relocatable.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 50c8a3af1661c3950b9743d673fd46872860aa08 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 18 May 2020 07:53:20 +0200
-Subject: [PATCH] src: make path to m4 relocatable
-
-Commit a4ede8f85b0c9a254fcb01e5888cee1983095669 ("package: make bison
-a relocatable package") made Bison relocatable, but in fact it still
-contains one absolute reference: the M4 variable, which points to the
-M4 program. Let's fix that by using relocate().
-
-We don't use relocate2() to store the temporary buffer and re-use it,
-because m4path() is only called once.
-
-Upstream: submitted to the bison-patches at gnu.org mailing list
-https://lists.gnu.org/archive/html/bison-patches/2020-05/msg00078.html
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/files.c  | 7 +++++++
- src/files.h  | 3 +++
- src/output.c | 2 +-
- 3 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/src/files.c b/src/files.c
-index 71c10e34..b8b43230 100644
---- a/src/files.c
-+++ b/src/files.c
-@@ -421,6 +421,13 @@ pkgdatadir (void)
-     }
- }
- 
-+char const *
-+m4path (void)
-+{
-+  char const *m4 = getenv("M4");
-+  return m4 ? m4 : relocate(M4);
-+}
-+
- void
- output_file_names_free (void)
- {
-diff --git a/src/files.h b/src/files.h
-index 00814ad0..64b6f8b5 100644
---- a/src/files.h
-+++ b/src/files.h
-@@ -64,6 +64,9 @@ extern char *all_but_ext;
- /* Where our data files are installed.  */
- char const *pkgdatadir (void);
- 
-+/* Where the m4 program is installed.  */
-+char const *m4path (void);
-+
- void compute_output_file_names (void);
- void output_file_names_free (void);
- 
-diff --git a/src/output.c b/src/output.c
-index 1871fd75..ebe75095 100644
---- a/src/output.c
-+++ b/src/output.c
-@@ -682,7 +682,7 @@ static void
- output_skeleton (void)
- {
-   /* Compute the names of the package data dir and skeleton files.  */
--  char const *m4 = (m4 = getenv ("M4")) ? m4 : M4;
-+  char const *m4 = m4path ();
-   char const *datadir = pkgdatadir ();
-   char *skeldir = xpath_join (datadir, "skeletons");
-   char *m4sugar = xpath_join (datadir, "m4sugar/m4sugar.m4");
--- 
-2.26.2
-
diff --git a/package/bison/bison.hash b/package/bison/bison.hash
index 9c3f32b4b4..123b6100c4 100644
--- a/package/bison/bison.hash
+++ b/package/bison/bison.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  8b13473b31ca7fcf65e5e8a74224368ffd5df19275602a9c9567ba393f18577d  bison-3.6.4.tar.xz
+sha256  55c215521a13982a9bee68cd42eed51a65713f96c530a739a57de4438ac1bb69  bison-3.7.1.tar.xz
 # License files, locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index b73e9163ad..45364e3cd5 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.6.4
+BISON_VERSION = 3.7.1
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
-- 
2.28.0
