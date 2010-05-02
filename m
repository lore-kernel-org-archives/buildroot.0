From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] busybox: 1.16.1 fixes for ash and
	cpio
Message-ID: <20100502074441.630EC8A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7548e5a70700e1280f16a8f4c33c68fb883a1821
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.16.1-ash.patch  |   15 ++++++++
 package/busybox/busybox-1.16.1-cpio.patch |   51 +++++++++++++++++++++++++++++
 package/busybox/busybox-1.16.1-dnsd.patch |   29 +++++++++++++---
 3 files changed, 90 insertions(+), 5 deletions(-)
 create mode 100644 package/busybox/busybox-1.16.1-ash.patch
 create mode 100644 package/busybox/busybox-1.16.1-cpio.patch

diff --git a/package/busybox/busybox-1.16.1-ash.patch b/package/busybox/busybox-1.16.1-ash.patch
new file mode 100644
index 0000000..629874e
--- /dev/null
+++ b/package/busybox/busybox-1.16.1-ash.patch
@@ -0,0 +1,15 @@
+diff -urpN busybox-1.16.1/shell/ash.c busybox-1.16.1-ash/shell/ash.c
+--- busybox-1.16.1/shell/ash.c	2010-03-28 19:44:04.000000000 +0200
++++ busybox-1.16.1-ash/shell/ash.c	2010-04-26 14:18:36.000000000 +0200
+@@ -5424,7 +5424,11 @@ rmescapes(char *str, int flag)
+ 		size_t fulllen = len + strlen(p) + 1;
+ 
+ 		if (flag & RMESCAPE_GROW) {
++			int strloc = str - (char *)stackblock();
+ 			r = makestrspace(fulllen, expdest);
++			/* p and str may be invalidated by makestrspace */
++			str = (char *)stackblock() + strloc;
++			p = str + len;
+ 		} else if (flag & RMESCAPE_HEAP) {
+ 			r = ckmalloc(fulllen);
+ 		} else {
diff --git a/package/busybox/busybox-1.16.1-cpio.patch b/package/busybox/busybox-1.16.1-cpio.patch
new file mode 100644
index 0000000..e8282bd
--- /dev/null
+++ b/package/busybox/busybox-1.16.1-cpio.patch
@@ -0,0 +1,51 @@
+diff -urpN busybox-1.16.1/archival/cpio.c busybox-1.16.1-cpio/archival/cpio.c
+--- busybox-1.16.1/archival/cpio.c	2010-03-20 03:58:07.000000000 +0100
++++ busybox-1.16.1-cpio/archival/cpio.c	2010-04-27 08:15:37.000000000 +0200
+@@ -424,7 +424,7 @@ int cpio_main(int argc UNUSED_PARAM, cha
+ 	if (archive_handle->cpio__blocks != (off_t)-1
+ 	 && !(opt & CPIO_OPT_QUIET)
+ 	) {
+-		printf("%"OFF_FMT"u blocks\n", archive_handle->cpio__blocks);
++		fprintf(stderr, "%"OFF_FMT"u blocks\n", archive_handle->cpio__blocks);
+ 	}
+ 
+ 	return EXIT_SUCCESS;
+diff -urpN busybox-1.16.1/testsuite/cpio.tests busybox-1.16.1-cpio/testsuite/cpio.tests
+--- busybox-1.16.1/testsuite/cpio.tests	2010-03-28 19:59:59.000000000 +0200
++++ busybox-1.16.1-cpio/testsuite/cpio.tests	2010-04-27 08:15:37.000000000 +0200
+@@ -32,7 +32,7 @@ rm -rf cpio.testdir cpio.testdir2 2>/dev
+ # testing "test name" "command" "expected result" "file input" "stdin"
+ 
+ testing "cpio extracts zero-sized hardlinks" \
+-"$ECHO -ne '$hexdump' | bzcat | cpio -i; echo \$?;
++"$ECHO -ne '$hexdump' | bzcat | cpio -i 2>&1; echo \$?;
+ ls -ln cpio.testdir | $FILTER_LS" \
+ "\
+ 1 blocks
+@@ -45,7 +45,7 @@ ls -ln cpio.testdir | $FILTER_LS" \
+ 
+ test x"$SKIP_KNOWN_BUGS" = x"" && {
+ # Currently fails. Numerous buglets: "1 blocks" versus "1 block",
+-# "1 block" must go to stderr, does not list cpio.testdir/x and cpio.testdir/y
++# does not list cpio.testdir/x and cpio.testdir/y
+ testing "cpio lists hardlinks" \
+ "$ECHO -ne '$hexdump' | bzcat | cpio -t 2>&1; echo \$?" \
+ "\
+@@ -70,7 +70,7 @@ ln cpio.testdir/nonempty cpio.testdir/no
+ mkdir cpio.testdir2
+ 
+ testing "cpio extracts zero-sized hardlinks 2" \
+-"find cpio.testdir | cpio -H newc --create | (cd cpio.testdir2 && cpio -i); echo \$?;
++"find cpio.testdir | cpio -H newc --create | (cd cpio.testdir2 && cpio -i 2>&1); echo \$?;
+ ls -ln cpio.testdir2/cpio.testdir | $FILTER_LS" \
+ "\
+ 2 blocks
+@@ -87,7 +87,7 @@ ls -ln cpio.testdir2/cpio.testdir | $FIL
+ # Was trying to create "/usr/bin", correct is "usr/bin".
+ rm -rf cpio.testdir
+ testing "cpio -p with absolute paths" \
+-"echo /usr/bin | cpio -dp cpio.testdir; echo \$?;
++"echo /usr/bin | cpio -dp cpio.testdir 2>&1; echo \$?;
+ ls cpio.testdir" \
+ "\
+ 1 blocks
diff --git a/package/busybox/busybox-1.16.1-dnsd.patch b/package/busybox/busybox-1.16.1-dnsd.patch
index 414ac33..bbcd116 100644
--- a/package/busybox/busybox-1.16.1-dnsd.patch
+++ b/package/busybox/busybox-1.16.1-dnsd.patch
@@ -1,6 +1,6 @@
 diff -urpN busybox-1.16.1/include/platform.h busybox-1.16.1-dnsd/include/platform.h
---- busybox-1.16.1/include/platform.h	2010-03-28 10:43:35.000000000 -0700
-+++ busybox-1.16.1-dnsd/include/platform.h	2010-04-14 10:06:10.888341149 -0700
+--- busybox-1.16.1/include/platform.h	2010-03-28 19:43:35.000000000 +0200
++++ busybox-1.16.1-dnsd/include/platform.h	2010-04-14 19:06:10.000000000 +0200
 @@ -291,10 +291,12 @@ typedef unsigned smalluint;
  #if 1 /* if needed: !defined(arch1) && !defined(arch2) */
  # define ALIGN1 __attribute__((aligned(1)))
@@ -15,9 +15,28 @@ diff -urpN busybox-1.16.1/include/platform.h busybox-1.16.1-dnsd/include/platfor
  
  
 diff -urpN busybox-1.16.1/networking/dnsd.c busybox-1.16.1-dnsd/networking/dnsd.c
---- busybox-1.16.1/networking/dnsd.c	2010-03-28 10:43:36.000000000 -0700
-+++ busybox-1.16.1-dnsd/networking/dnsd.c	2010-04-14 10:06:10.922348571 -0700
-@@ -459,7 +459,8 @@ int dnsd_main(int argc UNUSED_PARAM, cha
+--- busybox-1.16.1/networking/dnsd.c	2010-03-28 19:43:36.000000000 +0200
++++ busybox-1.16.1-dnsd/networking/dnsd.c	2010-04-26 14:20:25.000000000 +0200
+@@ -44,10 +44,15 @@ struct dns_head {
+ 	uint16_t nauth;
+ 	uint16_t nadd;
+ };
++/* Structure used to access type and class fields.
++ * They are totally unaligned, but gcc 4.3.4 thinks that pointer of type uint16_t*
++ * is 16-bit aligned and replaces 16-bit memcpy (in move_from_unaligned16 macro)
++ * with aligned halfword access on arm920t!
++ * Oh well. Slapping PACKED everywhere seems to help: */
+ struct dns_prop {
+-	uint16_t type;
+-	uint16_t class;
+-};
++	uint16_t type PACKED;
++	uint16_t class PACKED;
++} PACKED;
+ /* element of known name, ip address and reversed ip address */
+ struct dns_entry {
+ 	struct dns_entry *next;
+@@ -459,7 +464,8 @@ int dnsd_main(int argc UNUSED_PARAM, cha
  	unsigned lsa_size;
  	int udps, opts;
  	uint16_t port = 53;
-- 
1.6.3.3
