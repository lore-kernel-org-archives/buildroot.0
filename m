From: Mao Han <han_mao@c-sky.com>
Date: Thu,  2 Jan 2020 11:57:20 +0800
Subject: [Buildroot] [PATCH 1/2] package/toolchain-external: ensure
 ARCH_LIB_DIR exist
Message-ID: <1577937441-18703-1-git-send-email-han_mao@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Different architecture may have different arch library folder structure
for their multilib toolchain. RISC-V toolchain has folder structure
like:
/sysroot/lib64/
/sysroot/lib64/lp64
/sysroot/lib64/lp64d
The first level is for ISA and the second level is for ABI.
Current buildroot only creat lib and lib64, some error is reported
while installing the external toolchain:
>>> toolchain-external-custom  Installing to staging directory
/usr/bin/install -D -m 0755 /.../build/toolchain-external-custom/toolchain-wrapper /.../host/bin/toolchain-wrapper
ln: failed to create symbolic link '/.../host/riscv64-buildroot-linux-gnu/sysroot/lib64/lp64': No such file or directory
ln: failed to create symbolic link '/.../host/riscv64-buildroot-linux-gnu/sysroot/usr/lib64/lp64': No such file or directory

Signed-off-by: Qu Xianmiao <xianmiao_qu@c-sky.com>
Signed-off-by: Chen Hongdeng <hongdeng_chen@c-sky.com>
Signed-off-by: Guo Ren<ren_guo@c-sky.com>
Signed-off-by: Mao Han <han_mao@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mark Corbin <mark.corbin@embecosm.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index baf719a..13b2468 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -454,6 +454,8 @@ create_lib_symlinks = \
 	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
 		relpath="$(call relpath_prefix,$${ARCH_LIB_DIR})" ; \
+		mkdir -p "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
+		mkdir -p "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
 		ln -snf $${relpath}lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
 		ln -snf $${relpath}lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
 	fi
-- 
2.7.4
