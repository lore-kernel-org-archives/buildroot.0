From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 21:56:13 +0100
Subject: [Buildroot] [git commit] tcpdump: use libpcap shared library
Message-ID: <20141030205900.20C42B22EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=746116d1eb2ec11f9d477e8fddfb41fc63ed86b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the tcpdump configure script finds libpcap.a in
output/build/libpcap-[version]. This check is hard coded in aclocal.m4. Add a
patch to optionally ignore local libpcap so that the system shared library
version is found instead. This reduces the tcpdump binary size in a few 100KB.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...libpcap-when-configured-with-with-system-.patch |   78 ++++++++++++++++++++
 package/tcpdump/tcpdump.mk                         |    7 +-
 2 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/package/tcpdump/0001-Use-system-libpcap-when-configured-with-with-system-.patch b/package/tcpdump/0001-Use-system-libpcap-when-configured-with-with-system-.patch
new file mode 100644
index 0000000..7f8b715
--- /dev/null
+++ b/package/tcpdump/0001-Use-system-libpcap-when-configured-with-with-system-.patch
@@ -0,0 +1,78 @@
+From 4289e62c7966e5abeb95307717cef30a51fcdccf Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 29 Oct 2014 13:21:05 +0200
+Subject: [PATCH] Use system libpcap when configured with --with-system-pcap
+
+Don't force the local libpcap build when the system provides one. When
+--with-system-pcap is given to configure, don't try to locate a local libpcap
+build. This help build systems like Buildroot that store build trees in the
+same directory, but still prefer dynamically linking against system wide
+libpcap.so to save space.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Status: sent upstream (https://github.com/the-tcpdump-group/tcpdump/pull/408)
+
+ aclocal.m4 | 46 +++++++++++++++++++++++++---------------------
+ 1 file changed, 25 insertions(+), 21 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 80614cf21050..cd0a94414bbf 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -438,27 +438,31 @@ AC_DEFUN(AC_LBL_LIBPCAP,
+ 		    LIBS="$LIBS $pfopen"
+ 	    fi
+     fi
+-    AC_MSG_CHECKING(for local pcap library)
+-    libpcap=FAIL
+-    lastdir=FAIL
+-    places=`ls $srcdir/.. | sed -e 's,/$,,' -e "s,^,$srcdir/../," | \
+-	egrep '/libpcap-[[0-9]]+\.[[0-9]]+(\.[[0-9]]*)?([[ab]][[0-9]]*|-PRE-GIT)?$'`
+-    places2=`ls .. | sed -e 's,/$,,' -e "s,^,../," | \
+-	egrep '/libpcap-[[0-9]]+\.[[0-9]]+(\.[[0-9]]*)?([[ab]][[0-9]]*|-PRE-GIT)?$'`
+-    for dir in $places $srcdir/../libpcap ../libpcap $srcdir/libpcap $places2 ; do
+-	    basedir=`echo $dir | sed -e 's/[[ab]][[0-9]]*$//' | \
+-	        sed -e 's/-PRE-GIT$//' `
+-	    if test $lastdir = $basedir ; then
+-		    dnl skip alphas when an actual release is present
+-		    continue;
+-	    fi
+-	    lastdir=$dir
+-	    if test -r $dir/libpcap.a ; then
+-		    libpcap=$dir/libpcap.a
+-		    d=$dir
+-		    dnl continue and select the last one that exists
+-	    fi
+-    done
++	libpcap=FAIL
++	AC_MSG_CHECKING(for local pcap library)
++	AC_ARG_WITH([system-libpcap],
++		[AS_HELP_STRING([--with-system-libpcap], [don't use local pcap library])])
++	if test "x$with_system_libpcap" != xyes ; then
++		lastdir=FAIL
++    	places=`ls $srcdir/.. | sed -e 's,/$,,' -e "s,^,$srcdir/../," | \
++		egrep '/libpcap-[[0-9]]+\.[[0-9]]+(\.[[0-9]]*)?([[ab]][[0-9]]*|-PRE-GIT)?$'`
++    	places2=`ls .. | sed -e 's,/$,,' -e "s,^,../," | \
++		egrep '/libpcap-[[0-9]]+\.[[0-9]]+(\.[[0-9]]*)?([[ab]][[0-9]]*|-PRE-GIT)?$'`
++    	for dir in $places $srcdir/../libpcap ../libpcap $srcdir/libpcap $places2 ; do
++	    	basedir=`echo $dir | sed -e 's/[[ab]][[0-9]]*$//' | \
++	        	sed -e 's/-PRE-GIT$//' `
++	    	if test $lastdir = $basedir ; then
++		    	dnl skip alphas when an actual release is present
++		    	continue;
++	    	fi
++	    	lastdir=$dir
++	    	if test -r $dir/libpcap.a ; then
++		    	libpcap=$dir/libpcap.a
++		    	d=$dir
++		    	dnl continue and select the last one that exists
++	    	fi
++		done
++	fi
+     if test $libpcap = FAIL ; then
+ 	    AC_MSG_RESULT(not found)
+ 
+-- 
+2.1.1
+
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 550400d..e62dfaf 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -8,10 +8,13 @@ TCPDUMP_VERSION = 4.6.2
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
-TCPDUMP_CONF_ENV = ac_cv_linux_vers=2 td_cv_buggygetaddrinfo=no
-TCPDUMP_CONF_OPTS = --without-crypto \
+TCPDUMP_CONF_ENV = ac_cv_linux_vers=2 td_cv_buggygetaddrinfo=no \
+		PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
+TCPDUMP_CONF_OPTS = --without-crypto --with-system-libpcap \
 		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
 TCPDUMP_DEPENDENCIES = zlib libpcap
+# Patching aclocal.m4
+TCPDUMP_AUTORECONF = YES
 
 # make install installs an unneeded extra copy of the tcpdump binary
 define TCPDUMP_REMOVE_DUPLICATED_BINARY
