From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu,  9 Jul 2015 12:45:26 +0300
Subject: [Buildroot] [PATCH] pure-ftpd: add patch that fixes build if
	HAVE_EXPLICIT_BZERO is defined
Message-ID: <1436435126-3620-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch was already merged upstream and once bumping version of that
package this patch must be removed.

See this change upstream:
https://github.com/jedisct1/pure-ftpd/commit/2d34799585dc65c8c314a2f09a281874dd9b3d55

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...x-building-in-case-of-HAVE_EXPLICIT_BZERO.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/pure-ftpd/0002-Fix-building-in-case-of-HAVE_EXPLICIT_BZERO.patch

diff --git a/package/pure-ftpd/0002-Fix-building-in-case-of-HAVE_EXPLICIT_BZERO.patch b/package/pure-ftpd/0002-Fix-building-in-case-of-HAVE_EXPLICIT_BZERO.patch
new file mode 100644
index 0000000..8117f88
--- /dev/null
+++ b/package/pure-ftpd/0002-Fix-building-in-case-of-HAVE_EXPLICIT_BZERO.patch
@@ -0,0 +1,40 @@
+From f70c363b633229368ed352ce4f599da033cbbdf1 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Thu, 9 Jul 2015 09:38:25 +0300
+Subject: [PATCH] Fix building in case of HAVE_EXPLICIT_BZERO
+
+Currently if toolchain has implementation of explicit_bzero() and so
+HAVE_EXPLICIT_BZERO gets defined during configuration compilation will
+fail that way:
+------------------------------------>8------------------------------
+utils.c: In function 'pure_memzero':
+utils.c:49:1: error: expected declaration or statement at end of input
+ }
+ ^
+------------------------------------>8------------------------------
+
+That happens because closing "#endif" is put 1 line below than really
+meant.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ src/utils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/utils.c b/src/utils.c
+index 228a8dc..f41492d 100644
+--- a/src/utils.c
++++ b/src/utils.c
+@@ -25,8 +25,8 @@ void pure_memzero(void * const pnt, const size_t len)
+     while (i < len) {
+         pnt_[i++] = 0U;
+     }
+-}
+ # endif
++}
+ 
+ int pure_memcmp(const void * const b1_, const void * const b2_, size_t len)
+ {
+-- 
+2.4.3
+
-- 
2.4.3
