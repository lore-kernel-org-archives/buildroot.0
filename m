From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 17:10:25 +0200
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_90620
Message-ID: <20190620151226.C857882C2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efc53530cb30c97f849e5bfae5dca711a263199c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC fails building the haproxy package for the Microblaze architecture:

  http://autobuild.buildroot.org/results/64706f96db793777de9d3ec63b0a47d776cf33fd/

The gcc bug was originally reported gpsd:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620

This gcc bug no longer appeared with gcc 8.x but reappeared in gcc
9.x, so we introduce a config symbol so that packages can work it
around by disabling optimization.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 2da537e7d4..7cdcb0e514 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -145,6 +145,14 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
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
 
