From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 19:48:04 +0100
Subject: [Buildroot] [git commit] gd: add patch to fix gdlib-config script
Message-ID: <20130324194036.3082A9B28F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d50c7be769f078aa1e867b03d297777c89ae956c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gd/gd-gdlib-config.patch |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

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
