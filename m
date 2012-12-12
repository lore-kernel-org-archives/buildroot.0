From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Dec 2012 20:38:43 +0100
Subject: [Buildroot] [PATCH 2/2] libhib: fix build on PowerPC
In-Reply-To: <1355341123-7974-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1355341123-7974-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1355341123-7974-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to remove some stupid configure.ac that does completely
crazy things with the CFLAGS and CXXFLAGS leading to build failures
like:

  http://autobuild.buildroot.org/results/7beec6b72652cc118240c959ed744ee5f2991c12/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libhid-dont-fiddle-with-debug-flags.patch      |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/libhid/libhid-dont-fiddle-with-debug-flags.patch

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
-- 
1.7.9.5
