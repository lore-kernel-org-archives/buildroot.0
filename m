From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 21:38:28 +0200
Subject: [Buildroot] [git commit branch/next] Revert "glibc: install the
 obsolete libnsl"
Message-ID: <20180519194728.B480E8B428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=345730c38c8fad89f771cf14e58df125bb15a6fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libnsl from Glibc is deprecated and should not be used anymore.
Remove libnsl.so.* from GLIBC_LIBS_LIB.

libnsl is now an separate library that can be packaged later if
necessary [1].

Note: libnsl from Glibc doesn't build with gcc 8 due new warning [2].

[1] https://github.com/thkukuk/libnsl.git
[2] http://patchwork.sourceware.org/patch/26437

This reverts commit 398747f5fafca8c07e696612d8eded53d4f935c7.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 3ab673c0cc..c1c5ac687f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -100,7 +100,6 @@ define GLIBC_CONFIGURE_CMDS
 		--disable-profile \
 		--without-gd \
 		--enable-obsolete-rpc \
-		--enable-obsolete-nsl \
 		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
 		--with-headers=$(STAGING_DIR)/usr/include)
 	$(GLIBC_ADD_MISSING_STUB_H)
@@ -113,7 +112,7 @@ endef
 
 GLIBC_LIBS_LIB = \
 	ld*.so.* libanl.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* \
-	libm.so.* libnsl.so.* libpthread.so.* libresolv.so.* librt.so.* \
+	libm.so.* libpthread.so.* libresolv.so.* librt.so.* \
 	libutil.so.* libnss_files.so.* libnss_dns.so.* libmvec.so.*
 
 ifeq ($(BR2_PACKAGE_GDB),y)
