From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Jan 2016 10:08:29 +0100
Subject: [Buildroot] [git commit] iucode-tool: argp-standalone also needed
	with musl
Message-ID: <20160122090837.13890806A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a774f400b20612cb77836a47aaf62ea72422fb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The iucode-tool package needs the argp functionality, which is
provided built-in by glibc, but not by uClibc and musl. In uClibc
configurations, it correctly selects the argp-standalone package to
compensate this, but forgets to do so in musl-based
configurations. This commit fixes that by selecting the
argp-standalone package, and adjusting the dependency in the .mk file.

Fixes:

  http://autobuild.buildroot.net/results/7f8626db69500a84a393053a485f04180c565673/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iucode-tool/Config.in      | 3 ++-
 package/iucode-tool/iucode-tool.mk | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/iucode-tool/Config.in b/package/iucode-tool/Config.in
index b996b36..aeb3b6e 100644
--- a/package/iucode-tool/Config.in
+++ b/package/iucode-tool/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_IUCODE_TOOL
 	bool "iucode-tool"
 	depends on BR2_x86_64 || BR2_i386
 	select BR2_PACKAGE_INTEL_MICROCODE
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ARGP_STANDALONE \
+	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Intel processor microcode tool
 
diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 44d49d9..30515f0 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -6,7 +6,7 @@
 
 IUCODE_TOOL_VERSION = 1cbd73013cd4c6b2b287f07f6189eef35cb83ca0
 IUCODE_TOOL_SITE = git://gitorious.org/iucode-tool/iucode-tool.git
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 IUCODE_TOOL_CONF_ENV = LIBS="-largp"
 IUCODE_TOOL_DEPENDENCIES = argp-standalone
 endif
