From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 13 Apr 2013 20:13:40 +0200
Subject: [Buildroot] [git commit] gdb: disable on AArch64
Message-ID: <20130413181339.34D4A9B622@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e49733b306b353aad3a29a2c7a6faf25841ef0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mainline gdb does not yet have AArch64 support at all, so let's
disable it for this platform. The external toolchain provided by
Linaro has gdbserver + cross-gdb, so it already provides what's
necessary to do some debugging.

Fixes
http://autobuild.buildroot.org/results/c330eb75bd2d3e2f002e7a362dd5b08c4fc7fafc/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gdb/Config.in      |    3 ++-
 package/gdb/Config.in.host |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 38f4564..631fdd7 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_GDB
 	select BR2_PACKAGE_GDB_SERVER if \
 	       (!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
 	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	depends on !BR2_aarch64
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
 	  going on `inside' another program while it executes -- or
@@ -38,7 +39,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
-	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
+	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin
 
 comment "full gdb on target needs WCHAR support in toolchain"
 	depends on !BR2_USE_WCHAR
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 1e09263..a791f09 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -4,6 +4,7 @@ config BR2_PACKAGE_HOST_GDB
 	# allow to build a cross-gdb, as the one of the external
 	# toolchain should be used.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
+	depends on !BR2_aarch64
 	help
 	  Build a cross gdb that runs on the host machine and debugs
 	  programs running on the target. It requires 'gdbserver'
