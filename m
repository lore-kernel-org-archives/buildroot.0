From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:49:39 +0200
Subject: [Buildroot] [git commit] dante: fix build on some PowerPC platforms
Message-ID: <20160809135014.A143281999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ee9bb0fdf354b2b1373e30471f9382c7e9b91d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dante configure script has some logic to remove the -g flag from
CFLAGS, but this logic is flawed and also removed -g in
-mfloat-gprs=double, turning it into the invalid -mfloatprs=double,
causing a build failure.

This commit adds a patch that gets rid of this -g removal logic, since
it is in fact unnecessary.

Fixes:

  http://autobuild.buildroot.net/results/313370bf05efe7fd87c281a97ecb6e06531a87ed/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-compiler.m4-do-not-remove-g-flag.patch    | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/dante/0002-compiler.m4-do-not-remove-g-flag.patch b/package/dante/0002-compiler.m4-do-not-remove-g-flag.patch
new file mode 100644
index 0000000..0b41de6
--- /dev/null
+++ b/package/dante/0002-compiler.m4-do-not-remove-g-flag.patch
@@ -0,0 +1,42 @@
+From c00e284dd2baa5ecdb0c9586044399cd7cacce3e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 8 Aug 2016 12:31:40 +0200
+Subject: [PATCH] compiler.m4: do not remove -g flag
+
+A sed expression such as 's/-g//' not only removes the -g
+debugging-related flag, but also turns more specific flags such as
+-mfloat-gprs=double into -mfloatprs=double, which is no longer a valid
+flag.
+
+However, it turns out that removing -g is not necessary: having -g0
+after -g negates the -g, and having -ggdb after -g is enough to produce
+debugging information for GDB.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ compiler.m4 | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/compiler.m4 b/compiler.m4
+index 3a23406..621372c 100644
+--- a/compiler.m4
++++ b/compiler.m4
+@@ -378,15 +378,9 @@ else
+ 	gcc)
+ 	    if test x"$aixldbug" != x; then
+ 	        #disable debug info
+-		if echo $CFLAGS | grep -- "-g" >/dev/null; then
+-		    CFLAGS="`echo $CFLAGS | sed -e 's/-g//g'`"
+-		fi
+ 		CFLAGS="$CFLAGS${CFLAGS:+ }-g0"
+ 	    else
+ 		#use -ggdb also when not debugging
+-		if echo $CFLAGS | grep -- "-g" >/dev/null; then
+-		    CFLAGS="`echo $CFLAGS | sed -e 's/-g//g'`"
+-		fi
+ 		CFLAGS="$CFLAGS${CFLAGS:+ }-ggdb"
+ 	    fi
+ 	    ;;
+-- 
+2.7.4
+
