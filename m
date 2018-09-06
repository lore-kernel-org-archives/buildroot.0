From: Joel Carlson <joelsoncarl@gmail.com>
Date: Thu,  6 Sep 2018 13:20:11 -0600
Subject: [Buildroot] [PATCH] flatcc: add dependency on C++11
Message-ID: <1536261611-13825-1-git-send-email-JoelsonCarl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of the components built by flatcc require C++. Also, while older
toolchains may work, C11/C++11 is the reference that is expected to
always work.

Fixes
http://autobuild.buildroot.net/results/8fb0447eed1d55b7687f657530e31695cf77ce5c/

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
---
 package/flatcc/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/flatcc/Config.in b/package/flatcc/Config.in
index 6273f2b..557bd9b 100644
--- a/package/flatcc/Config.in
+++ b/package/flatcc/Config.in
@@ -1,8 +1,15 @@
 config BR2_PACKAGE_FLATCC
 	bool "flatcc"
+	# Some components require C++, and C11/C++11 is the reference
+	# expected to always work
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
 	  flatcc is C language implementation of Google Flatbuffers. It
 	  consists of both a library for the target as well as a
 	  flatbuffer compiler tool for the host.
 
 	  https://github.com/dvidelabs/flatcc
+
+comment "flatcc needs a toolchain w/ C++11"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-- 
2.7.4
