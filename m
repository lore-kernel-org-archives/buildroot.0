From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 25 May 2021 19:14:31 +0200
Subject: [Buildroot] [PATCH 5/5] package/zstd: Add option for cli binary
In-Reply-To: <20210525171432.819180-1-nolange79@gmail.com>
References: <20210525171432.819180-1-nolange79@gmail.com>
Message-ID: <20210525171432.819180-5-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are a couple of targets to build the cli tool with less
features (no legacy-support, benchmarking),
or dynamically linked to the library.

Add an option to choose the variant.

To allow the installation step to pick the variant, it
has to be copied to the normal location.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/zstd/Config.in | 21 +++++++++++++++++++++
 package/zstd/zstd.mk   |  9 ++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/package/zstd/Config.in b/package/zstd/Config.in
index 9fa70c65cc..0d2ab84771 100644
--- a/package/zstd/Config.in
+++ b/package/zstd/Config.in
@@ -10,3 +10,24 @@ config BR2_PACKAGE_ZSTD
 	  compression formats
 
 	  https://facebook.github.io/zstd
+
+if BR2_PACKAGE_ZSTD
+
+choice
+	prompt "Executable flavor"
+	help
+	  Pick between variants of the zstd tool.
+
+config BR2_PACKAGE_ZSTD_PROG_DEFAULT
+	bool "Default build (static, full-featured)"
+
+config BR2_PACKAGE_ZSTD_PROG_DYNAMIC
+	bool "Dynamic build (needs library with identical version)"
+	depends on !BR2_STATIC_LIBS
+
+config BR2_PACKAGE_ZSTD_PROG_SMALL
+	bool "Small build (static, less features)"
+
+endchoice
+
+endif
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index a9499df4d0..ecad26e0df 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -48,6 +48,11 @@ endif
 ZSTD_OPTS += "MOREFLAGS=$(ZSTD_OPTS_MOREFLAGS)"
 
 ZSTD_BUILD_PROG_TARGET := zstd-release
+ifeq ($(BR2_PACKAGE_ZSTD_PROG_DYNAMIC),y)
+ZSTD_BUILD_PROG_TARGET := zstd-dll
+else ifeq ($(BR2_PACKAGE_ZSTD_PROG_SMALL),y)
+ZSTD_BUILD_PROG_TARGET := zstd-small
+endif
 
 # Since v1.5.0 the dynamic library is built for
 # multithreading, while the static library is not.
@@ -78,7 +83,9 @@ define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D)/lib $(addsuffix -release,$(ZSTD_BUILD_LIBS) libzstd.pc)
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
+		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET) && \
+	{ [ ! -e $(@D)/programs/$(ZSTD_BUILD_PROG_TARGET) ] || \
+		ln -f $(@D)/programs/$(ZSTD_BUILD_PROG_TARGET) $(@D)/programs/zstd; }
 endef
 
 define ZSTD_INSTALL_STAGING_CMDS
-- 
2.30.2
