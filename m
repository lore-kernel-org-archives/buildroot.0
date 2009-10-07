From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed,  7 Oct 2009 22:08:25 +0200
Subject: [Buildroot] [PATCH 02/14] Allow for specifying kernel version
	manually
In-Reply-To: <4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 toolchain/kernel-headers/Config.in |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 1141d88..433c254 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -39,9 +39,11 @@ choice
 	config BR2_KERNEL_HEADERS_2_6_31
 		bool "Linux 2.6.31.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_VERSION
+		bool "Linux 2.6 (manually specified version)"
+
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Linux 2.6 snapshot"
-
 endchoice
 
 config BR2_KERNEL_HEADERS_RT
@@ -50,6 +52,13 @@ config BR2_KERNEL_HEADERS_RT
 	help
 	  Apply Ingo's realtime extensions to linux
 
+config BR2_DEFAULT_KERNEL_VERSION
+	string "linux version"
+	depends on BR2_KERNEL_HEADERS_VERSION
+	help
+	  Specify the version you want to use.
+	  E.g.: 2.6.31.2
+
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
@@ -59,4 +68,4 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.30.9"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.2"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
-
+	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.6.3.3
