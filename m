From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Aug 2016 22:20:57 +0200
Subject: [Buildroot] [git commit] package/ncurses: fix build on noMMU
	uclinux targets
Message-ID: <20160821202106.C66C88213B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c215ce5021334edfd7385a5218548959438463f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ncurses buildsystem does not recognise 'uclinux' as being a 'linux',
so it falls back to generic checks, especially when trying to decide
what macros to define. So it misses defining absolutely required macros
when doing widechar, which break the bui,d.

But 'uclinux' is just a 'linux' like any other in this respect.

We fix both aclocal.m4 and the generated ./configure script because
ncurses does not autoreconf correctly (see comment in 0001-*.patch).

Fixes:
    http://autobuild.buildroot.org/results/d5c/d5c787d34acbfc0c0c7bd8cc0e15b5bc2460d88a/
    http://autobuild.buildroot.org/results/fc4/fc4b41fb955c390913a879e0202760347ce29987/
    [...too many to list...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/0003-recognise-uclinux.patch | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/ncurses/0003-recognise-uclinux.patch b/package/ncurses/0003-recognise-uclinux.patch
new file mode 100644
index 0000000..e86546c
--- /dev/null
+++ b/package/ncurses/0003-recognise-uclinux.patch
@@ -0,0 +1,30 @@
+aclocal: fix detection for uclinux hosts
+
+uclinux is just a linux like the others...
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN ncurses-5.9.orig/aclocal.m4 ncurses-5.9/aclocal.m4
+--- ncurses-5.9.orig/aclocal.m4	2011-04-01 01:35:38.000000000 +0200
++++ ncurses-5.9/aclocal.m4	2016-08-21 15:24:47.003620029 +0200
+@@ -6531,7 +6531,7 @@
+ irix[[56]].*) #(vi
+ 	cf_xopen_source="-D_SGI_SOURCE"
+ 	;;
+-linux*|gnu*|mint*|k*bsd*-gnu) #(vi
++linux*|uclinux*|gnu*|mint*|k*bsd*-gnu) #(vi
+ 	CF_GNU_SOURCE
+ 	;;
+ mirbsd*) #(vi
+diff -durN ncurses-5.9.orig/configure ncurses-5.9/configure
+--- ncurses-5.9.orig/configure	2016-08-21 15:21:50.789285661 +0200
++++ ncurses-5.9/configure	2016-08-21 15:24:35.187463625 +0200
+@@ -6984,7 +6984,7 @@
+ irix[56].*) #(vi
+ 	cf_xopen_source="-D_SGI_SOURCE"
+ 	;;
+-linux*|gnu*|mint*|k*bsd*-gnu) #(vi
++linux*|uclinux*|gnu*|mint*|k*bsd*-gnu) #(vi
+ 
+ echo "$as_me:6996: checking if we must define _GNU_SOURCE" >&5
+ echo $ECHO_N "checking if we must define _GNU_SOURCE... $ECHO_C" >&6
