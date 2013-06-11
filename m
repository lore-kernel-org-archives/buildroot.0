From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jun 2013 21:28:27 +0200
Subject: [Buildroot] [git commit] openswan: fix older gcc build failure
Message-ID: <20130611193506.F3AD89AC6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9dee63bf4dfc56d43dc8e29e0185382ca21651c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Older gcc versions (< 4.4) don't accept cpp as -Werror / -Wno-error
parameters.
Disable it since it's not yet a default with any version and we don't do
-Werror by default. Fixes:
http://autobuild.buildroot.net/results/977/9779215c4dfb68dc105f27097246a97851b1f6c2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openswan/openswan-wno-error-cpp.patch |   29 +++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/openswan/openswan-wno-error-cpp.patch b/package/openswan/openswan-wno-error-cpp.patch
new file mode 100644
index 0000000..8e79ae9
--- /dev/null
+++ b/package/openswan/openswan-wno-error-cpp.patch
@@ -0,0 +1,29 @@
+Kill -Wno-error=cpp, old(ish) gcc versions (< 4.4) don't like it and we still
+got 4.3.x available for internal toolchains.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura openswan-2.6.39.orig/lib/libopenswan/Makefile openswan-2.6.39/lib/libopenswan/Makefile
+--- openswan-2.6.39.orig/lib/libopenswan/Makefile	2013-06-11 07:22:50.228520267 -0300
++++ openswan-2.6.39/lib/libopenswan/Makefile	2013-06-11 07:27:40.087849447 -0300
+@@ -86,7 +86,7 @@
+ CFLAGS+= -Wno-error=cast-qual
+
+ # some junk left in alg_info.c
+-CFLAGS+= -Wno-error=cpp
++#CFLAGS+= -Wno-error=cpp
+
+ #CFLAGS+= -Wmissing-declarations
+ CFLAGS+= -Wstrict-prototypes
+diff -Nura openswan-2.6.39.orig/programs/pluto/Makefile openswan-2.6.39/programs/pluto/Makefile
+--- openswan-2.6.39.orig/programs/pluto/Makefile	2013-06-11 07:22:49.753504978 -0300
++++ openswan-2.6.39/programs/pluto/Makefile	2013-06-11 07:27:53.020265681 -0300
+@@ -47,7 +47,7 @@
+
+ # must turn this off due to myid.c
+ CFLAGS+= -Wno-error=cast-qual
+-CFLAGS+= -Wno-error=cpp
++#CFLAGS+= -Wno-error=cpp
+
+ ifeq ($(HAVE_BROKEN_POPEN),true)
+ CFLAGS+=-DHAVE_BROKEN_POPEN
