From: Yann Droneaud <ydroneaud@opteya.com>
Date: Mon,  2 Sep 2019 08:37:27 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/external: copy libssp.so if SSP
 is enabled
Message-ID: <20190902063728.31203-1-ydroneaud@opteya.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unlike libgcc_s.so, libssp.so is not copied on the target file
system. As it's available at link time, allowing packages such
as sox to be linked against the library.

As it's not copied, running programs linked against libssp.so
lead to failure such as the following:

  $ sox
  sox: error while loading shared libraries: libssp.so.0: cannot open shared object file: No such file or directory

  $ rec
  rec: error while loading shared libraries: libssp.so.0: cannot open shared object file: No such file or directory

If BR2_SSP_REGULAR, BR2_SSP_STRONG, or BR2_SSP_ALL is set, as
libssp.so provides __stack_chk_fail, and *_chk symbols, the
library must be copied to the target filesystem, like libgcc_s.so.

If BR2_SSP_NONE is set, there should be no need to copy it.

Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c3ddff263fe9..175a87756437 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -114,6 +114,10 @@ endif
 
 TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.*
 
+ifneq ($(BR2_SSP_NONE),y)
+TOOLCHAIN_EXTERNAL_LIBS += libssp.so.*
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.21.0
