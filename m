From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 24 Jan 2017 23:14:22 +1300
Subject: [Buildroot] [PATCH 2/3] micropython-lib: depend on pcre
In-Reply-To: <20170124101423.11479-1-judge.packham@gmail.com>
References: <20170124101423.11479-1-judge.packham@gmail.com>
Message-ID: <20170124101423.11479-2-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The micropython libs load libpcre dynamically using the foreign function
interface (libffi). Without pcre the build will succeed but at run time
anything that uses the 're' module will have issues.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython-lib/Config.in          | 1 +
 package/micropython-lib/micropython-lib.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
index a7e017be7..be8c87562 100644
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
index a0b533a53..478d6d690 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -8,6 +8,7 @@ MICROPYTHON_LIB_VERSION = v1.8.2
 MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
 MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
+MICROPYTHON_LIB_DEPENDENCIES = pcre
 
 define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-- 
2.11.0.24.ge6920cf
