From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Apr 2015 23:02:17 +0200
Subject: [Buildroot] [git commit] pcre: bump to version 8.37
Message-ID: <20150429213022.6DC3981D99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87ec20c1f009307f0a1a928d4d4a7f7e67d6230d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security patch now upstream so drop it.
Also switch to bz2 compression.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre/0003-fix-CVE-2014-8964.patch |   25 -------------------------
 package/pcre/pcre.hash                    |    6 +++---
 package/pcre/pcre.mk                      |    3 ++-
 3 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/package/pcre/0003-fix-CVE-2014-8964.patch b/package/pcre/0003-fix-CVE-2014-8964.patch
deleted file mode 100644
index bfc5860..0000000
--- a/package/pcre/0003-fix-CVE-2014-8964.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Description: CVE-2014-8964, heap buffer overflow
- Heap buffer overflow if an assertion with a zero minimum repeat is used as
- the condition in a conditional group.
-Origin: upstream http://bugs.exim.org/show_bug.cgi?id=1546
-Bug: http://bugs.exim.org/show_bug.cgi?id=1546
-Applied-Upstream: Yes, after 8.36
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
---- a/pcre_exec.c
-+++ b/pcre_exec.c
-@@ -1404,8 +1404,11 @@
-         condition = TRUE;
- 
-         /* Advance ecode past the assertion to the start of the first branch,
--        but adjust it so that the general choosing code below works. */
-+        but adjust it so that the general choosing code below works. If the
-+	assertion has a quantifier that allows zero repeats we must skip over
-+	the BRAZERO. This is a lunatic thing to do, but somebody did! */
- 
-+	if (*ecode == OP_BRAZERO) ecode++;
-         ecode += GET(ecode, 1);
-         while (*ecode == OP_ALT) ecode += GET(ecode, 1);
-         ecode += 1 + LINK_SIZE - PRIV(OP_lengths)[condcode];
diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index 56c5a17..0b2b1c4 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/pcre/files/pcre/8.36/
-md5	ff7b4bb14e355f04885cf18ff4125c98	pcre-8.36.tar.gz
-sha1	fb537757756818133d8157ec878bc11f5a93ef4d	pcre-8.36.tar.gz
+# From http://sourceforge.net/projects/pcre/files/pcre/8.37/
+md5	ed91be292cb01d21bc7e526816c26981	pcre-8.37.tar.bz2
+sha1	4c629b3f582366fae4e8912f0d9fa3140347d6e7	pcre-8.37.tar.bz2
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 4ff7abd..fd339ed 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.36
+PCRE_VERSION = 8.37
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
+PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3c
 PCRE_LICENSE_FILES = LICENCE
 PCRE_INSTALL_STAGING = YES
