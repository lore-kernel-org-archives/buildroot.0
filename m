From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Dec 2012 22:25:13 +0100
Subject: [Buildroot] [git commit] libhib: fix build on PowerPC
Message-ID: <20121212213256.66E819A1B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d813f707411d525a493b3d91c8266cc516e56dc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to remove some stupid configure.ac that does completely
crazy things with the CFLAGS and CXXFLAGS leading to build failures
like:

  http://autobuild.buildroot.org/results/7beec6b72652cc118240c959ed744ee5f2991c12/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libhid-dont-fiddle-with-debug-flags.patch      |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/libhid/libhid-dont-fiddle-with-debug-flags.patch b/package/libhid/libhid-dont-fiddle-with-debug-flags.patch
new file mode 100644
index 0000000..139357b
--- /dev/null
+++ b/package/libhid/libhid-dont-fiddle-with-debug-flags.patch
@@ -0,0 +1,29 @@
+Don't do horrible magic with CFLAGS and CXXFLAGS
+
+The purpose of the lines being removed is to suppress the
+-g<something> option from the CFLAGS or CXXFLAGS, when --enable-debug
+is not used. This is stupid because it is up to the user to pass these
+flags or not.
+
+But it is not only stupid, but utterly broken: if your CFLAGS contains
+a flags like -mfloat-gprs=double, then this option gets truncated to
+-mfloat simply because the option contained the -g string!
+
+Completely ridiculous piece of code, so get rid of it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: libhid-0.2.16/m4/md_conf_debugging.m4
+===================================================================
+--- libhid-0.2.16.orig/m4/md_conf_debugging.m4	2004-11-08 18:16:25.000000000 +0100
++++ libhid-0.2.16/m4/md_conf_debugging.m4	2012-12-12 20:24:50.000000000 +0100
+@@ -1,7 +1,7 @@
+ AC_DEFUN([MD_CONF_DEBUGGING],
+   [
+-    CFLAGS=$(echo $CFLAGS | sed -e 's,-g[[^[:space:]]]*,,g')
+-    CXXFLAGS=$(echo $CXXFLAGS | sed -e 's,-g[[^[:space:]]]*,,g')
++#    CFLAGS=$(echo $CFLAGS | sed -e 's,-g[[^[:space:]]]*,,g')
++#    CXXFLAGS=$(echo $CXXFLAGS | sed -e 's,-g[[^[:space:]]]*,,g')
+     MD_CHECK_ARG_ENABLE(debug,
+       [
+         DEBUG_FLAG=-g
