From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Nov 2012 11:35:57 -0800
Subject: [Buildroot] [git commit] gdb: properly pass the PATH when building
	gdb for the host
Message-ID: <20121128193726.6F85480F4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21a0c11a90f9ff19c78a5f32e0a2e9064fd28054
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building gdb for the host, we properly pass the PATH (through
HOST_CONFIGURE_OPTS) during the configure step, but we forget to do so
for the compilation step.

The result of this is that when the Crosstool-NG backend is used, gawk
is built and installed in $(HOST_DIR), as a dependency of the
crosstool-ng package.

Then, the host gdb configure script detects this gawk binary
($(HOST_DIR) is in the PATH), and assumes gawk is
available. Unfortunately, during the compilation step, it fails to
find the expected gawk binary, because $(HOST_DIR) is no longer in the
PATH. This causes the following build failure:

  http://autobuild.buildroot.org/results/067d0c2ea01673ba98ec11de2426f1ab92dac800/build-end.log

In order to fix this, we simply call the compilation step of gdb for
the host with $(HOST_MAKE_ENV), as it should have been done from the
beginning.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/gdb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index c42c755..4b8fe3a 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -196,6 +196,7 @@ $(GDB_HOST_DIR)/.configured: $(GDB_DIR)/.unpacked
 
 $(GDB_HOST_DIR)/gdb/gdb: $(GDB_HOST_DIR)/.configured
 	# force ELF support since it fails due to BFD linking problems
+	$(HOST_MAKE_ENV) \
 	gdb_cv_var_elf=yes \
 	$(MAKE) -C $(GDB_HOST_DIR)
 	strip $(GDB_HOST_DIR)/gdb/gdb
