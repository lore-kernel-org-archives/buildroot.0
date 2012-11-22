From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:17:53 +0100
Subject: [Buildroot] [PATCH 03/33] tcpdump: use 'pkg-config pcap' instead of
	pcap-config
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...ump-use-pkg-config-instead-of-pcap-config.patch | 68 ++++++++++++++++++++++
 package/tcpdump/tcpdump.mk                         |  3 +-
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 package/tcpdump/tcpdump-use-pkg-config-instead-of-pcap-config.patch

diff --git a/package/tcpdump/tcpdump-use-pkg-config-instead-of-pcap-config.patch b/package/tcpdump/tcpdump-use-pkg-config-instead-of-pcap-config.patch
new file mode 100644
index 0000000..bd12580
--- /dev/null
+++ b/package/tcpdump/tcpdump-use-pkg-config-instead-of-pcap-config.patch
@@ -0,0 +1,68 @@
+Use 'pkg-config pcap' instead of the pcap-config binary which does not
+correctly support cross-compilation.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+--- tcpdump-4.3.0.orig/aclocal.m4	2012-11-17 14:04:17.159100154 +0100
++++ tcpdump-4.3.0/aclocal.m4	2012-11-17 15:28:46.319808067 +0100
+@@ -287,29 +287,13 @@ AC_DEFUN(AC_LBL_LIBPCAP,
+     AC_MSG_CHECKING(for local pcap library)
+     libpcap=FAIL
+     lastdir=FAIL
+-    places=`ls $srcdir/.. | sed -e 's,/$,,' -e "s,^,$srcdir/../," | \
+-	egrep '/libpcap-[[0-9]]+\.[[0-9]]+(\.[[0-9]]*)?([[ab]][[0-9]]*|-PRE-GIT)?$'`
+-    for dir in $places $srcdir/../libpcap $srcdir/libpcap ; do
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
+     if test $libpcap = FAIL ; then
+ 	    AC_MSG_RESULT(not found)
+ 
+ 	    #
+ 	    # Look for pcap-config.
+ 	    #
+-	    AC_PATH_TOOL(PCAP_CONFIG, pcap-config)
++	    AC_PATH_TOOL(PCAP_CONFIG, pkg-config)
+ 	    if test -n "$PCAP_CONFIG" ; then
+ 		#
+ 		# Found - use it to get the include flags for
+@@ -322,9 +322,9 @@ AC_DEFUN(AC_LBL_LIBPCAP,
+ 		# double-quoted strings inside double-quoted back-quoted
+ 		# expressions (pfew!)."
+ 		#
+-		cflags=`"$PCAP_CONFIG" --cflags`
++		cflags=`"$PCAP_CONFIG" pcap --cflags`
+ 		$2="$cflags $$2"
+-		libpcap=`"$PCAP_CONFIG" --libs`
++		libpcap=`"$PCAP_CONFIG" pcap --libs`
+ 	    else
+ 		#
+ 		# Not found; look for pcap.
+@@ -380,7 +380,7 @@ AC_DEFUN(AC_LBL_LIBPCAP,
+                     AC_MSG_ERROR(cannot find pcap.h, see INSTALL)
+  	    fi
+ 	    AC_MSG_RESULT($libpcap)
+-	    AC_PATH_PROG(PCAP_CONFIG, pcap-config,, $d)
++	    AC_PATH_PROG(PCAP_CONFIG, pkg-config,, $d)
+ 	    if test -n "$PCAP_CONFIG"; then
+ 		#
+ 		# The libpcap directory has a pcap-config script.
+@@ -395,7 +395,7 @@ AC_DEFUN(AC_LBL_LIBPCAP,
+ 		# double-quoted strings inside double-quoted back-quoted
+ 		# expressions (pfew!)."
+ 		#
+-		additional_libs=`"$PCAP_CONFIG" --additional-libs --static`
++		additional_libs=`"$PCAP_CONFIG" pcap --libs --static`
+ 		libpcap="$libpcap $additional_libs"
+ 	    fi
+     fi
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 96414ef..72def58 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -11,10 +11,11 @@ TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
 
+TCPDUMP_AUTORECONF = YES
 TCPDUMP_CONF_ENV = ac_cv_linux_vers=2 td_cv_buggygetaddrinfo=no
 TCPDUMP_CONF_OPT = --without-crypto \
 		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
-TCPDUMP_DEPENDENCIES = zlib libpcap
+TCPDUMP_DEPENDENCIES = host-pkgconf zlib libpcap
 
 # make install installs an unneeded extra copy of the tcpdump binary
 define TCPDUMP_REMOVE_DUPLICATED_BINARY
-- 
1.8.0
