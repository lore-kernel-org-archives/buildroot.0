From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 18:07:53 +0100
Subject: [Buildroot] [PATCH] ipmiutil: bump version and build fix
Message-ID: <1483376873-27023-1-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/c01/c01548a751a08dcb176e8faa78a9850b68da2873/
  http://autobuild.buildroot.net/results/a35/a357ae5e96a8eca8b80f568870e08917c844ca05/

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 ...ss-compile-remove-linux-flavour-detection.patch | 93 ++++++++++++++++++++++
 ...lation-MD2-activation-is-now-a-configure-.patch | 61 ++++++++++++++
 ...cross-compilation-remove-stack-protection.patch | 38 +++++++++
 package/ipmiutil/ipmiutil.hash                     |  5 +-
 package/ipmiutil/ipmiutil.mk                       |  2 +-
 5 files changed, 196 insertions(+), 3 deletions(-)
 create mode 100644 package/ipmiutil/0002-cross-compile-remove-linux-flavour-detection.patch
 create mode 100644 package/ipmiutil/0003-cross-compilation-MD2-activation-is-now-a-configure-.patch
 create mode 100644 package/ipmiutil/0004-cross-compilation-remove-stack-protection.patch

diff --git a/package/ipmiutil/0002-cross-compile-remove-linux-flavour-detection.patch b/package/ipmiutil/0002-cross-compile-remove-linux-flavour-detection.patch
new file mode 100644
index 0000000..68507f9
--- /dev/null
+++ b/package/ipmiutil/0002-cross-compile-remove-linux-flavour-detection.patch
@@ -0,0 +1,93 @@
+cross-compile: remove linux flavour detection
+
+Signed-off-by: David Bachelart <david.bachelart@bbright.com>
+
+diff --git a/configure.ac b/configure.ac
+index ae584ce..e744f7b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -353,68 +353,10 @@ else
+ 	   echo "ok, add"
+ 	fi
+ 	rm -f $tmpc $tmpo >/dev/null 2>&1
+-        if test -f "/etc/debian_version"; then
+-           echo "Detected Debian Linux"
+-           os=debian
+-	   PKG_DIR=..
+-	   INS_LIB="# "
+-	   # use dpkg-buildpackage instead of rpmbuild
+-	else 
+-	   which rpm  >/dev/null 2>&1
+-	   if test $? -eq 0; then
+-			pkgtop=`rpm --eval "%{_topdir}"`
+-			PKG_DIR=$pkgtop
+-	   fi
+-	fi
+-        if test -f "/etc/redhat-release"; then
+-			echo "Detected Red Hat Linux"
+-			os=redhat
+-			isredhat=1
+-		fi
+-        if test -f "/etc/SuSE-release"; then
+-			echo "Detected SuSE Linux"
+-			os=suse
+-			sed -e 's/# POST_INSTALL/if [ ! -f \/etc\/snmp\/snmpd.conf ]; then\n if [ -f \/etc\/ucdsnmpd.conf ]; then\n mkdir -p \/etc\/snmp; ln -s \/etc\/ucdsnmpd.conf  \/etc\/snmp\/snmpd.conf\n fi\nif [ -f \/etc\/snmpd.conf ]; then\nmkdir -p \/etc\/snmp; ln -s \/etc\/snmpd.conf  \/etc\/snmp\/snmpd.conf\nfi\nfi\n#/' -e 's/make install DEST/make install-strip DEST/'  doc/ipmiutil.spec >$tmpspec
+-			cp -f $tmpspec doc/ipmiutil.spec
+-		fi
+-	if test -f "/etc/mvl-release"; then
+-			echo "Detected MontaVista Linux"
+-			os=montavista
+-		init0=/etc/init.d
+-		sed -e 's/openssl-devel/openssl-dev\n%ifarch x86_pentium3 x86_pentium4\nAutoReqProv: No\n%endif/' -e 's/%{_mandir}/\/usr\/share\/man/' -e 's/%{_initrddir}/\/etc\/init.d/' -e 's/%{_sysconfdir}/\/etc/' -e 's/# POST_INSTALL/newcrypto=%{_libdir}\/libcrypto.so.4\nif [ ! -f $newcrypto ]; then\n cp -f %{_libdir}\/libcrypto.so.0 $newcrypto\nfi\n#/' -e 's/make install DEST/make install-strip DEST/' doc/ipmiutil.spec >$tmpspec
+-		cp -f $tmpspec doc/ipmiutil.spec
+-	fi
+-        if test -f "/etc/wrs-release" -o -d "$WIND_HOME"; then
+-                echo "Detected WindRiver Linux"
+-                os=windriver
+-                echo "Be sure to set up the WR build environment first"
+-		# WR requires extra steps in the spec file.
+-		grep "%configure_target" doc/ipmiutil.spec >/dev/null 2>&1
+-		if test $? -ne 0; then
+-			# WR changes have not been patched in, so make them.
+-			sed -e 's/Release: 1%{?dist}/Release: 1_WR/' -e 's/%build/%build\n%configure_target\n%define _config_cache config.cache\n/' -e 's/^make$/make CC="$CC" TARGET_CFLAGS="$CFLAGS" TARGET_LDADD="-L%{_host_cross_lib_dir}" LDFLAGS="$LDFLAGS" CXX="$CXX" CXXFLAGS="$CXXFLAGS" LD="$LD" AS="$AS" AR="$AR" CPP="$CPP" NM="$NM" OBJCOPY="$OPBJCOPY" OBJDUMP="$OPBJDUMP" RANLIB="$RANLIB" STRIP="$STRIP"/' -e 's/%install/%install\n%configure_target\n/' doc/ipmiutil.spec >$tmpspec
+-			cp -f $tmpspec doc/ipmiutil.spec
+-		fi
+-		# WRL libcrypto does not have MD2
+-		MD2_CFLAGS="-DSKIP_MD2"
+-		init0=/etc/rc.d/init.d
+-        fi
+-	if test $isredhat -eq 0 ; then
+-	   # set default start/stop for init scripts
+-           sed -i 's/# Default-Start:/# Default-Start: 3 4 5/' $init_scripts
+-	   sed -i 's/# Default-Stop:/# Default-Stop:  0 1 2 6/' $init_scripts
+-	fi
+-    # The openssl rpm might not be installed
+-    which rpm >/dev/null 2>&1
+-	if test $? -eq 0 ; then
+-		sslver=`rpm -q openssl-devel |cut -f3 -d'-' |cut -f1-2 -d'.'`
+-    else
+-        sslver=`openssl version |awk '{ print $2 }'|cut -f1-2 -d'.'`
+-	fi 
+-	if test "$sslver" = "1.1"; then
+-		echo "Detected openssl-$sslver" 
+-		MD2_CFLAGS="-DSKIP_MD2 -DSSL11"
+-	else 
++#	if test "$sslver" = "1.1"; then
++#		echo "Detected openssl-$sslver" 
++#		MD2_CFLAGS="-DSKIP_MD2 -DSSL11"
++#	else 
+ 	 if test -f "$LIB_DIR/libcrypto.so"; then
+ 		strings $LIB_DIR/libcrypto.so | grep EVP_md2 >/dev/null 2>&1
+ 		if test $? -ne 0; then
+@@ -425,7 +367,7 @@ else
+ 		echo "No openssl $LIB_DIR/libcrypto.so detected"
+ 		MD2_CFLAGS="-DSKIP_MD2"
+ 	 fi
+-	fi
++#	fi
+ 	OS_CFLAGS="-DLINUX $MD2_CFLAGS -fPIC $cfwarn $cfgnu $cfhard"
+   else
+      macos=1  # =1 means not mac
+-- 
+2.1.4
+
diff --git a/package/ipmiutil/0003-cross-compilation-MD2-activation-is-now-a-configure-.patch b/package/ipmiutil/0003-cross-compilation-MD2-activation-is-now-a-configure-.patch
new file mode 100644
index 0000000..79f01c9
--- /dev/null
+++ b/package/ipmiutil/0003-cross-compilation-MD2-activation-is-now-a-configure-.patch
@@ -0,0 +1,61 @@
+cross compilation: MD2 activation is now a configure option
+
+Signed-off-by: David Bachelart <david.bachelart@bbright.com>
+
+diff --git a/configure.ac b/configure.ac
+index e744f7b..b9adfae 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -136,6 +136,14 @@ AC_ARG_ENABLE([sha256],
+     fi]
+     )
+ 
++MD2_CFLAGS="-DSKIP_MD2"
++AC_ARG_ENABLE([md2],
++    [  --enable-md2        build with MD2 support, requires later openssl.],
++    [if test "x$enableval" = "xyes"; then
++	MD2_CFLAGS=""
++    fi]
++    )
++
+ dnl configure for EKANALYZER, build with ekanalyzer function enabled
+ AC_ARG_ENABLE([ekanalyzer],
+     [  --enable-ekanalyzer        build with ekanalyzer function enabled.],
+@@ -308,7 +316,6 @@ if test "x$sysname" = "xSunOS"; then
+ 	SHR_LINK=""
+ else
+   if test "x$sysname" = "xLinux"; then
+-	MD2_CFLAGS=""
+ 	OS_LFLAGS=""
+ 	OS_DRIVERS="imbapi.c ipmimv.c ipmild.c ipmidir.c"
+ 	if test $drv_landesk -eq 1; then
+@@ -357,16 +364,16 @@ else
+ #		echo "Detected openssl-$sslver" 
+ #		MD2_CFLAGS="-DSKIP_MD2 -DSSL11"
+ #	else 
+-	 if test -f "$LIB_DIR/libcrypto.so"; then
+-		strings $LIB_DIR/libcrypto.so | grep EVP_md2 >/dev/null 2>&1
+-		if test $? -ne 0; then
+-			echo "No MD2 detected in openssl libcrypto.so"
+-			MD2_CFLAGS="-DSKIP_MD2"
+-		fi
+-	 else
+-		echo "No openssl $LIB_DIR/libcrypto.so detected"
+-		MD2_CFLAGS="-DSKIP_MD2"
+-	 fi
++#	 if test -f "$LIB_DIR/libcrypto.so"; then
++#		strings $LIB_DIR/libcrypto.so | grep EVP_md2 >/dev/null 2>&1
++#		if test $? -ne 0; then
++#			echo "No MD2 detected in openssl libcrypto.so"
++#			MD2_CFLAGS="-DSKIP_MD2"
++#		fi
++#	 else
++#		echo "No openssl $LIB_DIR/libcrypto.so detected"
++#		MD2_CFLAGS="-DSKIP_MD2"
++#	 fi
+ #	fi
+ 	OS_CFLAGS="-DLINUX $MD2_CFLAGS -fPIC $cfwarn $cfgnu $cfhard"
+   else
+-- 
+2.1.4
+
diff --git a/package/ipmiutil/0004-cross-compilation-remove-stack-protection.patch b/package/ipmiutil/0004-cross-compilation-remove-stack-protection.patch
new file mode 100644
index 0000000..d58602b
--- /dev/null
+++ b/package/ipmiutil/0004-cross-compilation-remove-stack-protection.patch
@@ -0,0 +1,38 @@
+cross compilation: remove stack protection
+
+Fixes:
+    http://autobuild.buildroot.net/results/c01/c01548a751a08dcb176e8faa78a9850b68da2873/
+    http://autobuild.buildroot.net/results/a35/a357ae5e96a8eca8b80f568870e08917c844ca05/
+
+Signed-off-by: David Bachelart <david.bachelart@bbright.com>
+
+diff --git a/configure.ac b/configure.ac
+index b9adfae..8113f96 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -350,15 +350,15 @@ else
+ 	fi
+ 	rm -f $tmpc $tmpo >/dev/null 2>&1
+ 	echo $ECHO_N "checking compile fortify flags ... $ECHO_C"
+-	cfhard="-fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
+-	echo "int main() { alloca(100); return(1); }" >$tmpc
+-	$CC -o $tmpo $cfhard $tmpc  >/dev/null 2>&1
+-	if test $? -ne 0 ; then
++#	cfhard="-fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
++#	echo "int main() { alloca(100); return(1); }" >$tmpc
++#	$CC -o $tmpo $cfhard $tmpc  >/dev/null 2>&1
++#	if test $? -ne 0 ; then
+ 	   cfhard=
+ 	   echo "skip"
+-	else 
+-	   echo "ok, add"
+-	fi
++#	else 
++#	   echo "ok, add"
++#	fi
+ 	rm -f $tmpc $tmpo >/dev/null 2>&1
+ #	if test "$sslver" = "1.1"; then
+ #		echo "Detected openssl-$sslver" 
+-- 
+2.1.4
+
diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
index f9d086b..f51ae81 100644
--- a/package/ipmiutil/ipmiutil.hash
+++ b/package/ipmiutil/ipmiutil.hash
@@ -1,4 +1,5 @@
 # From http://sourceforge.net/projects/ipmiutil/files/?source=navbar
-sha1	f423a77a374b6a37a16496844f1e6e363e7d63fe	ipmiutil-2.9.9.tar.gz
+md5 75a84f307b07c2d60afacb6f7e0fdc56    ipmiutil-3.0.1.tar.gz
+sha1	805926ed2f531ea83627825965f7624d52010b43	ipmiutil-3.0.1.tar.gz
 # Locally computed
-sha256	beace08386a002c6a4bbbf894bda9899ea34fae4c2181c89f29fb1fa136925f6	ipmiutil-2.9.9.tar.gz
+sha256	762cbd40cc17f81512ca94a622bc01bd122c92215880407e906356c0b3da309d	ipmiutil-3.0.1.tar.gz
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 392856c..517ff21 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPMIUTIL_VERSION = 2.9.9
+IPMIUTIL_VERSION = 3.0.1
 IPMIUTIL_SITE = http://sourceforge.net/projects/ipmiutil/files
 IPMIUTIL_LICENSE = BSD-3c
 IPMIUTIL_LICENSE_FILES = COPYING
-- 
2.1.4
