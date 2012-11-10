From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 23:28:56 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain/gdb: exceptionally allow building
	gdbserver for the target on blackfin
In-Reply-To: <1352586536-19621-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1352586536-19621-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1352586536-19621-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to guarantee the compatibility between the cross gdb and the
gdbserver, we expect external toolchains to provide both cross gcc and
gdbserver. Unfortunately, external toolchains provided by Analog
Devices for Blackfin do not come with a gdbserver, so we
exceptionnally allow the building on gdbserver even with external
toolchains in the Blackfin case.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/Config.in |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index ca0c821..66f1b42 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -20,7 +20,14 @@ comment "Gdb debugger for the target needs WCHAR support in toolchain"
 
 config BR2_PACKAGE_GDB_SERVER
 	bool "Build gdb server for the Target"
-	depends on !BR2_TOOLCHAIN_EXTERNAL
+	# In order to guarantee the compatibility between the cross
+	# gdb and the gdbserver, we expect external toolchains to
+	# provide both cross gcc and gdbserver. Unfortunately,
+	# external toolchains provided by Analog Devices for Blackfin
+	# do not come with a gdbserver, so we exceptionnally allow the
+	# building on gdbserver even with external toolchains in the
+	# Blackfin case.
+	depends on !BR2_TOOLCHAIN_EXTERNAL || BR2_bfin
 	help
 	    Build the gdbserver stub to run on the target.
 	    A full gdb is needed to debug the progam.
-- 
1.7.9.5
