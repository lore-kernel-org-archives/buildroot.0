From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Feb 2014 15:01:09 -0300
Subject: [Buildroot] [PATCH] iucode-tools: requires argp_standalone with
	uclibc toolchains
Message-ID: <1391536869-3937-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/3fc/3fc0b3f356efdebae4f7597a16d0d67f8bc4b76d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iucode-tool/Config.in      | 1 +
 package/iucode-tool/iucode-tool.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/iucode-tool/Config.in b/package/iucode-tool/Config.in
index 19e2254..8f90350 100644
--- a/package/iucode-tool/Config.in
+++ b/package/iucode-tool/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IUCODE_TOOL
 	bool "iucode-tool"
 	depends on BR2_x86_64 || BR2_i386
 	select BR2_PACKAGE_INTEL_MICROCODE
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  Intel processor microcode tool
 
diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 2d52b16..3124c73 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -6,6 +6,10 @@
 
 IUCODE_TOOL_VERSION = v1.0.1
 IUCODE_TOOL_SITE = git://git.debian.org/users/hmh/iucode-tool.git
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+IUCODE_TOOL_CONF_ENV = LIBS="-largp"
+IUCODE_TOOL_DEPENDENCIES = argp-standalone
+endif
 IUCODE_TOOL_AUTORECONF = YES
 IUCODE_TOOL_LICENSE = GPLv2+
 IUCODE_TOOL_LICENSE_FILES = COPYING
-- 
1.8.3.2
