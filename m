From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Nov 2014 20:51:50 -0300
Subject: [Buildroot] [PATCH -next] flac: unbreak powerpc e500 support
Message-ID: <1417132310-22933-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to avoid the enable/disable-debug options from unsetting -g
from CFLAGS in an incorrect way which breaks -mfloat-gprs=X (translit to
-mfloatprs=X).
It's possible to affect other less common CFLAGS with a '-g' in any
position.

Upstream status: sent different patch (configure.ac) - to avoid
autoreconfiguring.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-configure-don-t-try-to-unset-g-from-CFLAGS.txt | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt

diff --git a/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt b/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt
new file mode 100644
index 0000000..3aff5a8
--- /dev/null
+++ b/package/flac/0001-configure-don-t-try-to-unset-g-from-CFLAGS.txt
@@ -0,0 +1,27 @@
+The sed expression is wrong, any flags with '-g' in any position gets
+zapped, for example:
+
+-mfloat-gprs=double (for powerpc e500) -> -mfloatprs=double.
+
+Which gives build errors and is perfectly valid in real use scenarios to
+switch from e500v1 (single precision) code to e500v2 (double precision) code.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura flac-1.3.1.orig/configure flac-1.3.1/configure
+--- flac-1.3.1.orig/configure	2014-11-27 20:43:29.921303105 -0300
++++ flac-1.3.1/configure	2014-11-27 20:45:33.460250179 -0300
+@@ -19870,11 +19870,10 @@
+ 
+ if test "x$debug" = xtrue; then
+ 	CPPFLAGS="-DDEBUG $CPPFLAGS"
+-	CFLAGS=$(echo "$CFLAGS" | sed 's/-g//')
+-	CFLAGS="-g $CFLAGS"
++	CFLAGS=$(echo "-g $CFLAGS")
+ else
+ 	CPPFLAGS="-DNDEBUG $CPPFLAGS"
+-	CFLAGS=$(echo "$CFLAGS" | sed 's/-O2//;s/-g//')
++	CFLAGS=$(echo "$CFLAGS" | sed 's/-O2//')
+ 	CFLAGS="-O3 -funroll-loops $CFLAGS"
+ fi
+ 
-- 
2.0.4
