From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Apr 2013 16:09:11 +0200
Subject: [Buildroot] [PATCH 2/2] gdb: disable on AArch64
In-Reply-To: <1365862152-24325-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365862152-24325-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365862152-24325-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mainline gdb does not yet have AArch64 support at all, so let's
disable it for this platform. The external toolchain provided by
Linaro has gdbserver + cross-gdb, so it already provides what's
necessary to do some debugging.

Fixes
http://autobuild.buildroot.org/results/c330eb75bd2d3e2f002e7a362dd5b08c4fc7fafc/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in      |    3 ++-
 package/gdb/Config.in.host |    1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

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
-- 
1.7.9.5
