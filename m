From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 06:50:26 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: bump to
	version 1.17.2
Message-ID: <20150621045030.CA845804F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=482127b1ba0c3c359bf456b8e46951c1abed2964
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches committed upstream:
http://cgit.freedesktop.org/xorg/xserver/commit/os/backtrace.c?h=server-1.17-branch&id=8b7e1f362bf6940eb863fd02395bf8155d10604b
http://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/sdksyms.sh?h=server-1.17-branch&id=7a45d1684f626f3045305328c3aab85eed0673ea

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-backtrace.c-Fix-word-cast-to-a-pointer.patch |   90 --------------------
 ...sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch |   52 -----------
 package/x11r7/xserver_xorg-server/Config.in        |    4 +-
 .../xserver_xorg-server/xserver_xorg-server.hash   |    6 +-
 4 files changed, 5 insertions(+), 147 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/1.17.1/0001-backtrace.c-Fix-word-cast-to-a-pointer.patch b/package/x11r7/xserver_xorg-server/1.17.1/0001-backtrace.c-Fix-word-cast-to-a-pointer.patch
deleted file mode 100644
index 08944d6..0000000
--- a/package/x11r7/xserver_xorg-server/1.17.1/0001-backtrace.c-Fix-word-cast-to-a-pointer.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-backtrace.c: Fix word cast to a pointer
-
-This patch fixes a compilation problem of Xorg + libunwind support when
-building it on MIPS variants with 32-bit pointers.
-
-Related:
-
-  http://lists.busybox.net/pipermail/buildroot/2014-December/114404.html
-
-Patch submitted upstream:
-
-  http://lists.x.org/archives/xorg-devel/2015-January/045226.html
-
-Patch reviewed by an Xorg developer:
-
-  http://lists.x.org/archives/xorg-devel/2015-January/045383.html
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 84f04e0274661401a91efd4e9b21dccc1396e1d6 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Wed, 3 Dec 2014 11:34:47 +0000
-Subject: [PATCH] backtrace.c: Fix word cast to a pointer
-
-backtrace.c uses a word size provided by libunwind. In some
-architectures like MIPS, libunwind makes that word size 64-bit for all
-variants of the architecture.
-
-In the lines #90 and #98, backtrace.c tries to do a cast to a pointer,
-which fails in all MIPS variants with 32-bit pointers, like MIPS32 or
-MIPS64 n32, because it's trying to do a cast from a 64-bit wide variable
-to a 32-bit pointer:
-
-Making all in os
-make[2]: Entering directory
-`/home/test/test/1/output/build/xserver_xorg-server-1.15.1/os'
-  CC     WaitFor.lo
-  CC     access.lo
-  CC     auth.lo
-  CC     backtrace.lo
-backtrace.c: In function 'xorg_backtrace':
-backtrace.c:90:20: error: cast to pointer from integer of different size
-[-Werror=int-to-pointer-cast]
-	 if (dladdr((void *)(pip.start_ip + off), &dlinfo) &&
-dlinfo.dli_fname &&
-		    ^
-backtrace.c:98:13: error: cast to pointer from integer of different size
-[-Werror=int-to-pointer-cast]
-	     (void *)(pip.start_ip + off));
-	     ^
-cc1: some warnings being treated as errors
-make[2]: *** [backtrace.lo] Error 1
-make[2]: *** Waiting for unfinished jobs....
-
-Making the cast to a pointer-sized integer, and then to a pointer fixes
-the problem.
-
-Related:
-  https://bugs.freedesktop.org/show_bug.cgi?id=79939
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- os/backtrace.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/os/backtrace.c b/os/backtrace.c
-index 3d1195b..fd129ef 100644
---- a/os/backtrace.c
-+++ b/os/backtrace.c
-@@ -87,7 +87,7 @@ xorg_backtrace(void)
-             procname[1] = 0;
-         }
- 
--        if (dladdr((void *)(pip.start_ip + off), &dlinfo) && dlinfo.dli_fname &&
-+        if (dladdr((void *)(uintptr_t)(pip.start_ip + off), &dlinfo) && dlinfo.dli_fname &&
-                 *dlinfo.dli_fname)
-             filename = dlinfo.dli_fname;
-         else
-@@ -95,7 +95,7 @@ xorg_backtrace(void)
- 
-         ErrorFSigSafe("%u: %s (%s%s+0x%x) [%p]\n", i++, filename, procname,
-             ret == -UNW_ENOMEM ? "..." : "", (int)off,
--            (void *)(pip.start_ip + off));
-+            (void *)(uintptr_t)(pip.start_ip + off));
- 
-         ret = unw_step(&cursor);
-         if (ret < 0)
--- 
-1.7.1
-
diff --git a/package/x11r7/xserver_xorg-server/1.17.1/0002-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch b/package/x11r7/xserver_xorg-server/1.17.1/0002-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
deleted file mode 100644
index 01eefe5..0000000
--- a/package/x11r7/xserver_xorg-server/1.17.1/0002-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-backported from upstream
-http://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/sdksyms.sh?id=21b896939c5bb242f3aacc37baf12379e43254b6
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-From 21b896939c5bb242f3aacc37baf12379e43254b6 Mon Sep 17 00:00:00 2001
-From: Egbert Eich <eich@freedesktop.org>
-Date: Tue, 3 Mar 2015 16:27:05 +0100
-Subject: symbols: Fix sdksyms.sh to cope with gcc5
-
-Gcc5 adds additional lines stating line numbers before and
-after __attribute__() which need to be skipped.
-
-Signed-off-by: Egbert Eich <eich@freedesktop.org>
-Tested-by: Daniel Stone <daniels@collabora.com>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-
-diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
-index 2305073..05ac410 100755
---- a/hw/xfree86/sdksyms.sh
-+++ b/hw/xfree86/sdksyms.sh
-@@ -350,13 +350,25 @@ BEGIN {
-     if (sdk) {
- 	n = 3;
- 
-+        # skip line numbers GCC 5 adds before __attribute__
-+        while ($n == "" || $0 ~ /^# [0-9]+ "/) {
-+           getline;
-+           n = 1;
-+        }
-+
- 	# skip attribute, if any
- 	while ($n ~ /^(__attribute__|__global)/ ||
- 	    # skip modifiers, if any
- 	    $n ~ /^\*?(unsigned|const|volatile|struct|_X_EXPORT)$/ ||
- 	    # skip pointer
--	    $n ~ /^[a-zA-Z0-9_]*\*$/)
-+	    $n ~ /^[a-zA-Z0-9_]*\*$/) {
- 	    n++;
-+            # skip line numbers GCC 5 adds after __attribute__
-+            while ($n == "" || $0 ~ /^# [0-9]+ "/) {
-+               getline;
-+               n = 1;
-+            }
-+        }
- 
- 	# type specifier may not be set, as in
- 	#   extern _X_EXPORT unsigned name(...)
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 97700df..dc0b70c 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -70,7 +70,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
-	bool "1.17.1"
+	bool "1.17.2"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
@@ -82,7 +82,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.17.1" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
+	default "1.17.2" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
 choice
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 135d0f3..4f57787 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
 # From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
 sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
-# From http://lists.x.org/archives/xorg-announce/2015-February/002530.html
-sha1	490118810a54e91c8814245c99d6285caf4985dd				xorg-server-1.17.1.tar.bz2
-sha256	2bf8e9f6f0a710dec1d2472467bff1f4e247cb6dcd76eb469aafdc8a2d7db2ab	xorg-server-1.17.1.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-June/002614.html
+sha1	56ac29a82b99bcf4c7ba2fca41a44cfa18748262				xorg-server-1.17.2.tar.bz2
+sha256	f61120612728f2c5034671d0ca3e2273438c60aba93b3dda4a8aa40e6a257993	xorg-server-1.17.2.tar.bz2
