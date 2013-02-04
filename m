From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Feb 2013 23:35:07 +0100
Subject: [Buildroot] [git commit] gdb: build gdbserver with TARGET_MAKE_ENV
Message-ID: <20130204223733.C70A49A808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a70663904fc2e9acad4e32a7da945c7603a0222
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the exact same problem than
21a0c11a90f9ff19c78a5f32e0a2e9064fd28054, but for the gdbserver
build. The problem is that when you use the Crosstool-NG toolchain
backend, gawk gets built as a dependency of Crosstool-NG. So the gdb
configure scripts detects it, and assumes it is in the PATH (because
the gdb configure step gets run with TARGET_MAKE_ENV).

But then, the build fails, because it tries to run gawk, but gawk
isn't in the PATH, because we forget to use this TARGET_MAKE_ENV
variable when building gdbserver.

Fixes http://autobuild.buildroot.org/results/d0173de533b5e2fffed2eff7327a502ed2d787cd/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/gdb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 4b8fe3a..a932b1f 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -144,6 +144,7 @@ $(GDB_SERVER_DIR)/.configured: $(GDB_DIR)/.unpacked
 	touch $@
 
 $(GDB_SERVER_DIR)/gdbserver: $(GDB_SERVER_DIR)/.configured
+	$(TARGET_MAKE_ENV) \
 	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(GDB_SERVER_DIR)
 
