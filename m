From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:21:40 +0200
Subject: [Buildroot] [git commit] package/libnids: new package
Message-ID: <20200622201947.CC9E38227E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6ce06cd64b0d85c9065c60fad933c8585730320
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libnids is a C based networking library, part of networking intrusion
detection tools.  It can watch network traffic & provide informations.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[Thomas:
 - only needs libpcap as a mandatory dependency
 - add patch to fix libpcap detection
 - pass install_root= at installation time
 - drop glibc dependency, it builds fine with uclibc]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                        |  1 +
 package/Config.in                                 |  1 +
 package/libnids/0001-libpcap-use-pkg-config.patch | 48 +++++++++++++++++++++++
 package/libnids/Config.in                         | 14 +++++++
 package/libnids/libnids.hash                      |  3 ++
 package/libnids/libnids.mk                        | 22 +++++++++++
 6 files changed, 89 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index dc9fa8a718..fb6d4cec64 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1053,6 +1053,7 @@ F:	package/c-icap-modules/
 F:	package/sdl2/
 
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
+F:	package/libnids/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/python-pybind/
diff --git a/package/Config.in b/package/Config.in
index dc24921e0f..e2bb004015 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1710,6 +1710,7 @@ menu "Networking"
 	source "package/libnfnetlink/Config.in"
 	source "package/libnftnl/Config.in"
 	source "package/libnice/Config.in"
+	source "package/libnids/Config.in"
 	source "package/libnl/Config.in"
 	source "package/liboauth/Config.in"
 	source "package/liboping/Config.in"
diff --git a/package/libnids/0001-libpcap-use-pkg-config.patch b/package/libnids/0001-libpcap-use-pkg-config.patch
new file mode 100644
index 0000000000..8f8df478d1
--- /dev/null
+++ b/package/libnids/0001-libpcap-use-pkg-config.patch
@@ -0,0 +1,48 @@
+configure.in: use pkg-config for libpcap detection
+
+The detection of libpcap was based in ${prefix}, which doesn't make
+sense in a cross-compilation context and can cause host leakage into
+the target build.
+
+So instead, let's use pkg-config to detect libpcap, since it is anyway
+already use in this configure.in to detect libglib.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+
+Index: b/configure.in
+===================================================================
+--- a/configure.in
++++ b/configure.in
+@@ -75,25 +75,13 @@
+      fi
+      ;;
+   esac ],
+-[ if test -f ${prefix}/include/pcap.h; then
+-     PCAP_CFLAGS="-I${prefix}/include"
+-     PCAPLIB="-L${exec_prefix}/lib -lpcap"
+-  elif test -f /usr/include/pcap/pcap.h; then
+-     PCAP_CFLAGS="-I/usr/include/pcap"
+-     PCAPLIB="-lpcap"
+-  else
+-	TMP=$LIBS
+-	LIBS="-lpcap $LIBS"
+-	AC_TRY_LINK([#include <pcap.h>], pcap_open_offline("",""),
+-	LIBPCAP_FOUND=1,LIBPCAP_FOUND=0)
+-	LIBS=$TMP
+-	if test $LIBPCAP_FOUND = 1 ; then
+-		PCAPLIB="-lpcap"
+-	else
+-		AC_ERROR(libpcap not found)
+-	fi
+-  fi
+-  AC_MSG_RESULT(yes) ]
++[
++    PKG_PROG_PKG_CONFIG
++    PKG_CHECK_MODULES(LIBPCAP, libpcap)
++    AC_MSG_RESULT(yes)
++    PCAP_CFLAGS=${LIBPCAP_CFLAGS}
++    PCAPLIB=${LIBPCAP_LIBS}
++]
+ )
+ AC_SUBST(PCAP_CFLAGS)
+ AC_SUBST(PCAPLIB)
diff --git a/package/libnids/Config.in b/package/libnids/Config.in
new file mode 100644
index 0000000000..30528f4d07
--- /dev/null
+++ b/package/libnids/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBNIDS
+	bool "libnids"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Libnids is an implementation of an E-component of Network
+	  Intrusion Detection System.
+
+	  libnids watches all local network traffic, and provides
+	  convenient information on them to perform further analysis.
+
+	  Libnids offers IP defragmentation, TCP stream assembly, TCP
+	  port scan detection.
+
+	  http://libnids.sourceforge.net/
diff --git a/package/libnids/libnids.hash b/package/libnids/libnids.hash
new file mode 100644
index 0000000000..4a2949c39d
--- /dev/null
+++ b/package/libnids/libnids.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 314b4793e0902fbf1fdb7fb659af37a3c1306ed1aad5d1c84de6c931b351d359  libnids-1.24.tar.gz
+sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
new file mode 100644
index 0000000000..ee7c71ee88
--- /dev/null
+++ b/package/libnids/libnids.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libnids
+#
+################################################################################
+
+LIBNIDS_VERSION = 1.24
+LIBNIDS_SITE = https://sourceforge.net/projects/libnids/files/libnids/$(LIBNIDS_VERSION)
+LIBNIDS_LICENSE = GPL-2.0
+LIBNIDS_LICENSE_FILES = COPYING
+LIBNIDS_INSTALL_STAGING = YES
+LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
+LIBNIDS_AUTORECONF = YES
+LIBNIDS_CONF_OPTS = \
+	--disable-libglib \
+	--disable-libnet
+# hand-written Makefile.in, not using automake, needs a custom
+# variable for the installation path.
+LIBNIDS_INSTALL_STAGING_OPTS = install_prefix=$(STAGING_DIR) install
+LIBNIDS_INSTALL_TARGET_OPTS = install_prefix=$(TARGET_DIR) install
+
+$(eval $(autotools-package))
