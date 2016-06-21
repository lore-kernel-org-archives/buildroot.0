From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 21 Jun 2016 13:36:43 -0400
Subject: [Buildroot] [PATCH 1/1] toolchain: allow crosstool-ng musl
	toolchains
Message-ID: <1466530603-6041-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, if using a crosstool-ng-generated external musl toolchain,
Buildroot exits with "Incorrect selection of the C library".

The musl.codu.org cross-compilers put their libraries in <sysroot>/lib
while crosstool-ng uses <sysroot>/usr/lib. This change checks that
location for libc.so as well.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
To test, create a crosstool-ng musl toolchain or use one that I built.
For the latter, modify qemu_mipsel_malta_defconfig with the following:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/nerves-project/nerves-toolchain/releases/download/v0.6.3/nerves-mipsel-unknown-linux-musl-linux-x86_64-v0.6.3.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="mipsel-unknown-linux-musl"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_4=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y

 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 108fdaa..9a41bd6 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -210,7 +210,7 @@ check_glibc = \
 # $1: sysroot directory
 check_musl = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if test ! -f $${SYSROOT_DIR}/lib/libc.so -o -e $${SYSROOT_DIR}/lib/libm.so ; then \
+	if test ! \( -f $${SYSROOT_DIR}/lib/libc.so -o -f $${SYSROOT_DIR}/usr/lib/libc.so \) -o -e $${SYSROOT_DIR}/lib/libm.so ; then \
 		echo "Incorrect selection of the C library" ; \
 		exit -1; \
 	fi
--
2.5.0
