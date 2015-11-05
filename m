From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 23:21:38 +0100
Subject: [Buildroot] [git commit] toolchain/external: fix gdbserver install
	with Linaro 2015.08
Message-ID: <20151105222430.A36E78181F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7a92aa2fbe1cfd13c8d0bf7c7942b2ead747ffe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the latest Linaro toolchain, the gdbserver has moved (surprise!)
and is now located side-by-side with the toolchain executables.

This commit adds this path as a new location where to search for a
gdbserver, and while at it wraps the line that has become too long in
the process.

[Thomas: rework commit log according to Yann's suggestion.]

Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 958ab18..613ce50 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -645,7 +645,10 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
 		$(call MESSAGE,"Copying gdbserver") ; \
 		gdbserver_found=0 ; \
-		for d in $${ARCH_SYSROOT_DIR}/usr $${ARCH_SYSROOT_DIR}/../debug-root/usr $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} ; do \
+		for d in $${ARCH_SYSROOT_DIR}/usr \
+			 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
+			 $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
+			 $(TOOLCHAIN_EXTERNAL_INSTALL_DIR); do \
 			if test -f $${d}/bin/gdbserver ; then \
 				install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
 				gdbserver_found=1 ; \
