From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Jan 2017 17:29:37 +0100
Subject: [Buildroot] [git commit] micropython-lib: needs pcre
Message-ID: <20170124163140.6359480145@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b4d4db2a296859fd509978003c4fa41e4073644
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The micropython libs load libpcre dynamically using the foreign function
interface (libffi). Without pcre the build will succeed but at run time
anything that uses the 're' module will have issues.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython-lib/Config.in          | 1 +
 package/micropython-lib/micropython-lib.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
index a7e017b..be8c875 100644
--- a/package/micropython-lib/Config.in
+++ b/package/micropython-lib/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MICROPYTHON_LIB
 	bool "micropython-lib"
+	select BR2_PACKAGE_PCRE
 	depends on BR2_PACKAGE_MICROPYTHON
 	help
 	  Core Python libraries ported to MicroPython.
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
index a0b533a..478d6d6 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -8,6 +8,7 @@ MICROPYTHON_LIB_VERSION = v1.8.2
 MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
 MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
+MICROPYTHON_LIB_DEPENDENCIES = pcre
 
 define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
