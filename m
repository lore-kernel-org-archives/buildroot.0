From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Jun 2017 15:31:51 +0200
Subject: [Buildroot] [PATCH v3 2/6] gdb: not available on ARM noMMU and
	OpenRISC
In-Reply-To: <1497015115-8740-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1497015115-8740-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1497015115-8740-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Neither gdb nor gdbserver have support for ARM noMMU and OpenRISC, so
let's disable gdb on those architectures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - Fixed BR2_openrisc to BR2_or1k in Config.in.host
Changes since v1:
 - Fixed BR2_openrisc to BR2_or1k
---
 package/gdb/Config.in      | 2 ++
 package/gdb/Config.in.host | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 3acc6ef..67ef010 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	bool
 	default y
+	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_bfin
 	depends on !BR2_nios2
+	depends on !BR2_or1k
 
 comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index cd763aa..464457e 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -6,7 +6,9 @@ config BR2_PACKAGE_HOST_GDB
 	# allow to build a cross-gdb, as the one of the external
 	# toolchain should be used.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
+	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_nios2
+	depends on !BR2_or1k
 	help
 	  Build a cross gdb that runs on the host machine and debugs
 	  programs running on the target. It requires 'gdbserver'
-- 
2.7.4
