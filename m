From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 May 2015 16:28:34 +0200
Subject: [Buildroot] [PATCH] gdb: disable on Blackfin
Message-ID: <1430663314-27156-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gdbserver does not build on Blackfin FLAT (undefined reference to
`_td_thr_tlsbase') and while it builds on Blackfin FDPIC, it's pretty
unlikely that it is going to work properly with the cross-gdb provided
by the Analog Devices toolchain: the Analog Devices toolchain provides
a 6.6 cross-gdb, while we use gdb 7.8.2 for gdbserver.

Therefore, let's simply disable gdb completely for Blackfin.

Fixes:

  http://autobuild.buildroot.org/results/2e5/2e5310d0e869f036ec70b978c62c7bd9d3d2bd70/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index db6adf5..feab01d 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -1,5 +1,5 @@
 comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
-	depends on !BR2_nios2
+	depends on !BR2_nios2 && !BR2_bfin
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 
 config BR2_PACKAGE_GDB
@@ -10,7 +10,7 @@ config BR2_PACKAGE_GDB
 	select BR2_PACKAGE_GDB_SERVER if \
 		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
 	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	depends on !BR2_nios2
+	depends on !BR2_nios2 && !BR2_bfin
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
 	  going on `inside' another program while it executes -- or
@@ -40,10 +40,10 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
-	depends on !BR2_sh && !BR2_sh64 && !BR2_microblaze && !BR2_bfin
+	depends on !BR2_sh && !BR2_sh64 && !BR2_microblaze
 
 comment "full gdb on target needs a toolchain w/ wchar"
-	depends on !BR2_sh && !BR2_sh64 && !BR2_microblaze && !BR2_bfin
+	depends on !BR2_sh && !BR2_sh64 && !BR2_microblaze
 	depends on !BR2_USE_WCHAR
 
 if BR2_PACKAGE_GDB_DEBUGGER
-- 
2.1.0
