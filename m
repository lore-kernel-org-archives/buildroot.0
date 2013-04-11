From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 21:47:57 +0200
Subject: [Buildroot] [git commit] toolchain-external: support more gdbserver
	locations
Message-ID: <20130411211022.823649B5A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8fad4d95d65e11ddb8a40bf9396f0da140c0269
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The x86/x86-64 CodeSourcery toolchains use some weird locations for
the gdbserver binary:

$ find . -name 'gdbserver'
./i686-pc-linux-gnu/libc/atom/usr/bin/gdbserver
./i686-pc-linux-gnu/libc/atom/usr/lib/bin/gdbserver
./i686-pc-linux-gnu/libc/core2/usr/bin/gdbserver
./i686-pc-linux-gnu/libc/core2/usr/lib64/bin/gdbserver
./i686-pc-linux-gnu/libc/usr/lib/bin/gdbserver
./i686-pc-linux-gnu/libc/usr/lib64/bin/gdbserver

Notice that it's sometimes hidden in a usr/{lib,lib64}/bin
directory. This patch changes the gdbserver logic to also try in this
location.

Originally based on work done by Daniel Nilsson, visible at
http://patchwork.ozlabs.org/patch/155767/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/ext-tool.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index c4ddb0b..5c5935c 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -444,9 +444,9 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	if test x"$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" == x"y"; then \
 		$(call MESSAGE,"Copying gdbserver") ; \
 		gdbserver_found=0 ; \
-		for d in $${ARCH_SYSROOT_DIR} $${ARCH_SYSROOT_DIR}/../debug-root/ ; do \
-			if test -f $${d}/usr/bin/gdbserver ; then \
-				install -m 0755 -D $${d}/usr/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
+		for d in $${ARCH_SYSROOT_DIR}/usr $${ARCH_SYSROOT_DIR}/../debug-root/usr $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} ; do \
+			if test -f $${d}/bin/gdbserver ; then \
+				install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
 				gdbserver_found=1 ; \
 				break ; \
 			fi ; \
