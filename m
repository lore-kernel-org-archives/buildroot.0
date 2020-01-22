From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 22 Jan 2020 16:44:50 +0000
Subject: [Buildroot] [PATCH] libnss: Re-add ZLIB_INCLUDE_DIR varible
Message-ID: <20200122164450.17963-1-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libnss patch adding ZLIB_INCLUDE_DIR is added to upstream on
2020-01-07 but the 3.49.1 release on 2020-01-13 does not contain this
patch, so we have actually prematurely removed it from Buildroot.

This only affects host-libnss when libzlib is not installed in the host
system. When building for the target, the toolchain-wrapper already
looks in the target sysroot default include path - where zlib.h is
installed.

Re-add this patch, so that we can build host-libnss 3.49.1.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 .../0001-add-zlib-include-dir-variable.patch  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/libnss/0001-add-zlib-include-dir-variable.patch

diff --git a/package/libnss/0001-add-zlib-include-dir-variable.patch b/package/libnss/0001-add-zlib-include-dir-variable.patch
new file mode 100644
index 0000000000..cd0bdeec31
--- /dev/null
+++ b/package/libnss/0001-add-zlib-include-dir-variable.patch
@@ -0,0 +1,49 @@
+Add ZLIB_INCLUDE_DIR variable
+
+On Linux platform[1], the build system forces to use zlib from the
+system instead of compiling the one located intree.
+
+The following error is raised when the zlib header is installed
+somewhere else than in the default system include path:
+
+	ssl3con.c:39:18: fatal error: zlib.h: No such file or directory
+	 #include "zlib.h"
+
+The same trick setup for sqlite include directory is reproduced for
+zlib. The build system disallows in any manner to give arguments to the
+compiler explicity.
+
+The variable ZLIB_INCLUDE_DIR point to the directory where the zlib
+header is located.
+
+[1]: https://hg.mozilla.org/projects/nss/file/NSS_3_33_BRANCH/coreconf/Linux.mk#l180
+[2]: https://hg.mozilla.org/projects/nss/file/NSS_3_33_BRANCH/lib/softoken/manifest.mn#l17
+
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+
+--- libnss-3.33.orig/nss/lib/ssl/manifest.mn	2017-09-20 02:47:27.000000000 -0400
++++ libnss-3.33/nss/lib/ssl/manifest.mn	2018-02-16 16:45:41.512709898 -0500
+@@ -6,6 +6,10 @@
+ 
+ # DEFINES = -DTRACE
+ 
++ifdef ZLIB_INCLUDE_DIR
++INCLUDES += -I$(ZLIB_INCLUDE_DIR)
++endif
++
+ EXPORTS = \
+         ssl.h \
+         sslt.h \
+--- host-libnss-3.33.orig/nss/cmd/signtool/manifest.mn.orig	2018-02-16 17:08:58.474777871 -0500
++++ host-libnss-3.33/nss/cmd/signtool/manifest.mn	2018-02-16 17:09:22.603710963 -0500
+@@ -6,6 +6,10 @@
+ 
+ MODULE = nss
+ 
++ifdef ZLIB_INCLUDE_DIR
++INCLUDES += -I$(ZLIB_INCLUDE_DIR)
++endif
++
+ EXPORTS = 
+ 
+ CSRCS = signtool.c		\
-- 
2.20.1
