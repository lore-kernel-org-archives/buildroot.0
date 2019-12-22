From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:30:27 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/gdb: disable
 gdbserver if full gdb is enabled for ARC
Message-ID: <20191222204328.2D31A8D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bfa0c33fa8b3c13315926669a66b6c9db1d4570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

With recent update of ARC toolchain to arc-2019.09-eng/rc1 versions
GDB package builds started to fail in autobuilder:

 http://autobuild.buildroot.net/results/bc5/bc52d0012944e15dee30a6e00a92f23c87d0dfda//

This error is caused by 73cc72729a18 ("Move gnulib to top level")
commit in binutils-gdb master branch and appears in ARC case because
arc-2019.09 GDB is based on binutils-gdb master branch and includes
this commit.

More information about this bug can be found there:
https://sourceware.org/bugzilla/show_bug.cgi?id=24729
https://sourceware.org/bugzilla/show_bug.cgi?id=25171
https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/issues/30

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 27fc00c31336cf84066fdea641326b26e494c342)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 48ec3e0202..4c787d49a1 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -49,6 +49,11 @@ config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	depends on !BR2_riscv
+	# Simultaneous build of gdbserver and full gdb is not possible
+	# with arc-2019.09. This bug comes from upstream GDB. So
+	# simultaneous usage of full gdb and gdbserver is temporaly
+	# disabled for ARC until a fix becomes available.
+	depends on !(BR2_arc && BR2_PACKAGE_GDB_DEBUGGER)
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the progam.
