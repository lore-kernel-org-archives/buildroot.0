From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 14:14:03 +0100
Subject: [Buildroot] [git commit] package/iprutils: add patch to fix musl
	build
Message-ID: <20160207131412.564FB802B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7b9b632fd1f9306dcb7d426ada8cf86001da424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to the iprutils to fix the build with the
musl C library.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: reformatted the patch with Git, added a better commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-iprlib-fixes-for-compatibility-with-musl.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/iprutils/0003-iprlib-fixes-for-compatibility-with-musl.patch b/package/iprutils/0003-iprlib-fixes-for-compatibility-with-musl.patch
new file mode 100644
index 0000000..0fe882f
--- /dev/null
+++ b/package/iprutils/0003-iprlib-fixes-for-compatibility-with-musl.patch
@@ -0,0 +1,34 @@
+From df3b2b74ed7b49d74f5a5ec5687bcc3188d3b319 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 7 Feb 2016 14:10:44 +0100
+Subject: [PATCH] iprlib: fixes for compatibility with musl
+
+<bits/sockaddr.h> is an internal C library header, which is not
+guaranteed to be available in all C libraries, so it shouldn't be
+included, otherwise iprutils cannot be built with musl.
+
+<limits.h> is needed to get the definition of PATH_MAX.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ iprlib.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iprlib.h b/iprlib.h
+index 16fe1e1..73aa1ce 100644
+--- a/iprlib.h
++++ b/iprlib.h
+@@ -46,9 +46,9 @@
+ #include <asm/byteorder.h>
+ #include <sys/mman.h>
+ #include <paths.h>
+-#include <bits/sockaddr.h>
+ #include <linux/netlink.h>
+ #include <time.h>
++#include <limits.h>
+ 
+ typedef uint8_t u8;
+ typedef uint16_t u16;
+-- 
+2.6.4
+
