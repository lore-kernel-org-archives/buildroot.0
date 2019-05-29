From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 May 2019 17:57:08 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_90620
In-Reply-To: <20190529155709.31207-1-giulio.benetti@micronovasrl.com>
References: <20190529155709.31207-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190529155709.31207-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC fails on building haproxy for the Microblaze Arch:
http://autobuild.buildroot.org/results/64706f96db793777de9d3ec63b0a47d776cf33fd/build-end.log

Originally reported for gpsd:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620

Fixed on Gcc 8.x but regressed in Gcc 9.x.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 toolchain/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index f73a5364fc..3f562e8d3c 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -152,6 +152,14 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
 	default y if BR2_microblaze
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
+# ICE: in do_output_reload, at reload1.c:7978 on microblaze.
+# It's been fixed on Gcc 8.x but reappeared on Gcc 9.x
+config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
+	bool
+	default y if BR2_microblaze
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.17.1
