From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 19:19:24 +0100
Subject: [Buildroot] [PATCH 3/9] gd: add patch to fix gdlib-config script
In-Reply-To: <1364149170-5521-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364149170-5521-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364149170-5521-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gd/gd-gdlib-config.patch |   32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/gd/gd-gdlib-config.patch

diff --git a/package/gd/gd-gdlib-config.patch b/package/gd/gd-gdlib-config.patch
new file mode 100644
index 0000000..bfff88b
--- /dev/null
+++ b/package/gd/gd-gdlib-config.patch
@@ -0,0 +1,32 @@
+Fix gdlib-config
+
+Since the @LIBICONV@ macro doesn't get replaced at compile time, we
+end up installing an invalid gdlib-config: the gdlib-config --libs
+says that one should link against @LIBICONV@ which obviously doesn't
+work.
+
+Use the OpenWRT patch from
+https://dev.openwrt.org/browser/packages/libs/gd/patches/101-gdlib-config.patch
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+--- a/config/gdlib-config.in
++++ b/config/gdlib-config.in
+@@ -71,7 +71,7 @@ while test $# -gt 0; do
+ 	echo @LDFLAGS@
+ 	;;
+     --libs)
+-	echo @LIBS@ @LIBICONV@
++	echo @LIBS@
+ 	;;
+     --cflags|--includes)
+ 	echo -I at includedir@
+@@ -84,7 +84,7 @@ while test $# -gt 0; do
+ 	echo "includedir: $includedir"
+ 	echo "cflags:     -I at includedir@"
+ 	echo "ldflags:    @LDFLAGS@"
+-	echo "libs:       @LIBS@ @LIBICONV@"
++	echo "libs:       @LIBS@"
+ 	echo "libdir:     $libdir"
+ 	echo "features:   @FEATURES@"
+ 	;;
-- 
1.7.9.5
