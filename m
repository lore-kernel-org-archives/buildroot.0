From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Oct 2016 10:40:15 +0200
Subject: [Buildroot] [git commit] glibc: install libmvec.so when available
Message-ID: <20161027084254.19CB07FFBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c877590b3b18df4853989a66378c184713ccd55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some architectures (namely x86-64), glibc may provide a libmvec
library since glibc 2.22, which programs built with gcc OpenMP support
might get linked to.

In order for these programs to work on the target, we need to copy
this library to the target filesystem.

This commit takes care of this for the glibc package (used for the
internal toolchain backend). Note that libraries listed in
GLIBC_LIBS_LIB are silently ignored if they don't exist. Therefore, we
don't need to have any condition on the architecture or glibc version.

For more details on libmvec, see
https://sourceware.org/glibc/wiki/libmvec.

Fixes bug #9111.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 50154e8..c11f7cd 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -103,7 +103,7 @@ endef
 GLIBC_LIBS_LIB = \
 	ld*.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.*        \
 	libnsl.so.* libpthread.so.* libresolv.so.* librt.so.* libutil.so.*   \
-	libnss_files.so.* libnss_dns.so.*
+	libnss_files.so.* libnss_dns.so.* libmvec.so.*
 
 ifeq ($(BR2_PACKAGE_GDB),y)
 GLIBC_LIBS_LIB += libthread_db.so.*
