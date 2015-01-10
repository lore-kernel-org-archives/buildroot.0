From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 17:56:59 +0100
Subject: [Buildroot] [git commit] lzma: repair build
Message-ID: <20150110165800.A229A803E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b07b14a130f37a09d92a63ad22a16bdd61a1f8e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of host-lzma is broken since commit 97703978ac870ce2
("support/libtool: make -static behave like -all-static").

Lzma forces '-static' in its LDFLAGS, which contradicts what buildroot tries to
achieve by patching libtool scripts and configuring host packages with
'--disable-static'.

We add a patch to remove lzma's hardcoded LDFLAGS, to fix the build.

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../lzma-0001-Remove-static-from-LDFLAGS.patch     |   68 ++++++++++++++++++++
 1 files changed, 68 insertions(+), 0 deletions(-)

diff --git a/package/lzma/lzma-0001-Remove-static-from-LDFLAGS.patch b/package/lzma/lzma-0001-Remove-static-from-LDFLAGS.patch
new file mode 100644
index 0000000..9a33e44
--- /dev/null
+++ b/package/lzma/lzma-0001-Remove-static-from-LDFLAGS.patch
@@ -0,0 +1,68 @@
+From 1b33f6d13e5c25a2500ee312068c08a3d3811a5f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
+Date: Wed, 3 Dec 2014 21:32:02 +0100
+Subject: [PATCH] Remove -static from LDFLAGS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Buildroot does not enable static libraries by default for host builds. Having
+-static hardcoded in the LDFLAGS breaks the build, so remove it.
+
+Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
+---
+ src/lzmadec/Makefile.am  | 1 -
+ src/lzmadec/Makefile.in  | 1 -
+ src/lzmainfo/Makefile.am | 1 -
+ src/lzmainfo/Makefile.in | 1 -
+ 4 files changed, 4 deletions(-)
+
+diff --git a/src/lzmadec/Makefile.am b/src/lzmadec/Makefile.am
+index 7322b2a..13edec8 100644
+--- a/src/lzmadec/Makefile.am
++++ b/src/lzmadec/Makefile.am
+@@ -2,6 +2,5 @@ bin_PROGRAMS = lzmadec
+ lzmadec_SOURCES = lzmadec.c
+ lzmadec_LDADD = @top_builddir@/src/liblzmadec/liblzmadec.la
+ AM_CPPFLAGS = -I at top_srcdir@/src/liblzmadec
+-AM_LDFLAGS = -static
+ 
+ dist_man_MANS = lzmadec.1
+diff --git a/src/lzmadec/Makefile.in b/src/lzmadec/Makefile.in
+index 5af9240..4ed1de1 100644
+--- a/src/lzmadec/Makefile.in
++++ b/src/lzmadec/Makefile.in
+@@ -185,7 +185,6 @@ top_srcdir = @top_srcdir@
+ lzmadec_SOURCES = lzmadec.c
+ lzmadec_LDADD = @top_builddir@/src/liblzmadec/liblzmadec.la
+ AM_CPPFLAGS = -I at top_srcdir@/src/liblzmadec
+-AM_LDFLAGS = -static
+ dist_man_MANS = lzmadec.1
+ all: all-am
+ 
+diff --git a/src/lzmainfo/Makefile.am b/src/lzmainfo/Makefile.am
+index b5b01ec..e280bff 100644
+--- a/src/lzmainfo/Makefile.am
++++ b/src/lzmainfo/Makefile.am
+@@ -2,6 +2,5 @@ bin_PROGRAMS = lzmainfo
+ lzmainfo_SOURCES = lzmainfo.c
+ lzmainfo_LDADD = @top_builddir@/src/liblzmadec/liblzmadec.la
+ AM_CPPFLAGS = -I at top_srcdir@/src/liblzmadec
+-AM_LDFLAGS = -static
+ 
+ dist_man_MANS = lzmainfo.1
+diff --git a/src/lzmainfo/Makefile.in b/src/lzmainfo/Makefile.in
+index 6a2127a..f1f3441 100644
+--- a/src/lzmainfo/Makefile.in
++++ b/src/lzmainfo/Makefile.in
+@@ -185,7 +185,6 @@ top_srcdir = @top_srcdir@
+ lzmainfo_SOURCES = lzmainfo.c
+ lzmainfo_LDADD = @top_builddir@/src/liblzmadec/liblzmadec.la
+ AM_CPPFLAGS = -I at top_srcdir@/src/liblzmadec
+-AM_LDFLAGS = -static
+ dist_man_MANS = lzmainfo.1
+ all: all-am
+ 
+-- 
+2.1.3
+
