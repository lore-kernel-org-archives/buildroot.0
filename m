From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jan 2014 22:52:33 +0100
Subject: [Buildroot] [git commit] toolchain-external: Fix ld.so naming with
	uClibc and EABIhf.
Message-ID: <20140115215415.A1AD89B1EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=803a105f90c939464cbabf8ee91f0d63e5f70f68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently ld-linux-armhf.so.* is added to external libs when
using an EABIhf toolchain, but this naming is not used by uClibc.
Fix by adding a check for glibc.

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 1084ee2..a7bfafc 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -63,7 +63,7 @@
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 LIB_EXTERNAL_LIBS+=libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
-ifeq ($(BR2_ARM_EABIHF),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
 LIB_EXTERNAL_LIBS+=ld-linux-armhf.so.*
 else
 LIB_EXTERNAL_LIBS+=ld*.so.*
