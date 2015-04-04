From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 18:07:52 +0200
Subject: [Buildroot] [git commit] ipmiutil: new package
Message-ID: <20150404160908.A838680E63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=749100e45998d19664aebe2570b481aaff3effad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - remove dependency on SSP support by adding a patch that changes
    the configure.ac script stack protector test to actually work.
  - rewrap Config.in help text
  - fix how BR2_USE_MMU is used when displaying the comment.
  - fix the license, it's BSD-3c, not BSD-2c.
  - bump to version 2.9.5.]

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 ...c-use-CC-instead-of-gcc-full-link-for-sta.patch |   43 ++++++++++++++++++++
 package/ipmiutil/Config.in                         |   16 +++++++
 package/ipmiutil/ipmiutil.mk                       |   16 +++++++
 4 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 702de90..9d81399 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -357,6 +357,7 @@ endif
 	source "package/intel-microcode/Config.in"
 	source "package/iostat/Config.in"
 	source "package/ipmitool/Config.in"
+	source "package/ipmiutil/Config.in"
 	source "package/irda-utils/Config.in"
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
diff --git a/package/ipmiutil/0001-configure.ac-use-CC-instead-of-gcc-full-link-for-sta.patch b/package/ipmiutil/0001-configure.ac-use-CC-instead-of-gcc-full-link-for-sta.patch
new file mode 100644
index 0000000..07e37d4
--- /dev/null
+++ b/package/ipmiutil/0001-configure.ac-use-CC-instead-of-gcc-full-link-for-sta.patch
@@ -0,0 +1,43 @@
+From 2909bfbc97559cf3e28c9045f64e3078aacca354 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 4 Apr 2015 17:59:32 +0200
+Subject: [PATCH] configure.ac: use CC instead of gcc, full link for stack
+ protector test
+
+Using gcc directly is incorrect when cross-compiling, $CC should be
+used instead.
+
+Also, for the stack protector test, a full link is needed, since just
+the compilation can work, but the link can fail due to libssp not
+being available in the toolchain.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c1193c6..61efbc5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -308,7 +308,7 @@ else
+ 	echo $ECHO_N "checking compile warning flags ... $ECHO_C"
+ 	cfwarn="-Wno-pointer-sign -Wno-sign-conversion -Wunused-result -Wgnu-designator"
+ 	echo "int main() { return(1); }" >$tmpc
+-	gcc -o $tmpo -c $cfwarn $tmpc  >/dev/null 2>&1
++	$CC -o $tmpo -c $cfwarn $tmpc  >/dev/null 2>&1
+ 	if test $? -ne 0 ; then
+ 	   cfwarn=
+ 	   echo "skip"
+@@ -319,7 +319,7 @@ else
+ 	echo $ECHO_N "checking compile fortify flags ... $ECHO_C"
+ 	cfhard="-fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
+ 	echo "int main() { return(1); }" >$tmpc
+-	gcc -o $tmpo -c $cfhard $tmpc  >/dev/null 2>&1
++	$CC -o $tmpo $cfhard $tmpc  >/dev/null 2>&1
+ 	if test $? -ne 0 ; then
+ 	   cfhard=
+ 	   echo "skip"
+-- 
+2.1.0
+
diff --git a/package/ipmiutil/Config.in b/package/ipmiutil/Config.in
new file mode 100644
index 0000000..b6a1760
--- /dev/null
+++ b/package/ipmiutil/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_IPMIUTIL
+	bool "ipmiutil"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  The ipmiutil package provides easy-to-use utilities to view
+	  the SEL, perform an IPMI chassis reset, set up the IPMI LAN
+	  and Platform Event Filter entries to allow SNMP alerts,
+	  Serial-Over-LAN console, event daemon, and other IPMI tasks.
+
+	  http://ipmiutil.sourceforge.net/
+
+comment "ipmiutil needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
new file mode 100644
index 0000000..8e281d4
--- /dev/null
+++ b/package/ipmiutil/ipmiutil.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# ipmiutil
+#
+################################################################################
+
+IPMIUTIL_VERSION = 2.9.5
+IPMIUTIL_SITE = http://sourceforge.net/projects/ipmiutil/files/
+IPMIUTIL_LICENSE = BSD-3c
+IPMIUTIL_LICENSE_FILES = COPYING
+# We're patching configure.ac
+IPMIUTIL_AUTORECONF = YES
+
+IPMIUTIL_DEPENDENCIES = openssl
+
+$(eval $(autotools-package))
