From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sun, 11 Nov 2018 16:06:48 +0100
Subject: [Buildroot] [PATCH] linux-tools: Add liblockdep
In-Reply-To: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
Message-ID: <20181111150652.17459-3-alexander.sverdlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 package/linux-tools/Config.in                | 13 ++++++++
 package/linux-tools/linux-tool-liblockdep.mk | 34 ++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-liblockdep.mk

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 349dc6bf0d..63b48cfa80 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -34,6 +34,19 @@ config BR2_PACKAGE_LINUX_TOOLS_IIO
 
 	  These tools are available only from kernel version 4.7.
 
+config BR2_PACKAGE_LINUX_TOOLS_LIBLOCKDEP
+	bool "liblockdep"
+	help
+	  liblockdep is a tiny wrapper built around kernel/lockdep.c.
+	  The aim is to provide the same functionality the kernel gets
+	  from lockdep to userspace.
+
+	  The bulk of the code here is the LD_PRELOAD support which
+	  provides users an easy way to test their code without having
+	  to integrate liblockdep into said code.
+
+	  http://lwn.net/Articles/536363/
+
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-liblockdep.mk b/package/linux-tools/linux-tool-liblockdep.mk
new file mode 100644
index 0000000000..63c6fa3500
--- /dev/null
+++ b/package/linux-tools/linux-tool-liblockdep.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# liblockdep
+#
+################################################################################
+
+LINUX_TOOLS += liblockdep
+
+LIBLOCKDEP_MAKE_FLAGS = \
+	$(LINUX_MAKE_FLAGS) \
+	prefix=/usr
+
+define LIBLOCKDEP_BUILD_CMDS
+	$(Q)if test ! -f $(@D)/tools/lib/lockdep/Makefile ; then \
+		echo "Your kernel version is too old and does not have the liblockdep." ; \
+		echo "At least kernel 4.1 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBLOCKDEP_MAKE_FLAGS) -C $(@D)/tools \
+		liblockdep
+endef
+
+define LIBLOCKDEP_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBLOCKDEP_MAKE_FLAGS) -C $(@D)/tools \
+		DESTDIR=$(STAGING_DIR) \
+		liblockdep_install
+endef
+
+define LIBLOCKDEP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBLOCKDEP_MAKE_FLAGS) -C $(@D)/tools \
+		DESTDIR=$(TARGET_DIR) \
+		liblockdep_install
+endef
-- 
2.19.1
