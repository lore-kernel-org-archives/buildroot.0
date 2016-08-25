From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 25 Aug 2016 17:04:39 +0300
Subject: [Buildroot] [PATCH v1 1/9] package/acpica: Add host configuration
	to the tool
In-Reply-To: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <1472133887-34746-2-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ACPI excerpts, which would be added to an initial RAM disk image, require
to be compiled first. iasl tool from acpica package helps do that.

Enable host variant of the application to be built.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 package/Config.in.host        |  1 +
 package/acpica/Config.in.host |  9 +++++++++
 package/acpica/acpica.mk      | 15 +++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/acpica/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 1c99e34..992e2bb 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+	source "package/acpica/Config.in.host"
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
 	source "package/cbootimage/Config.in.host"
diff --git a/package/acpica/Config.in.host b/package/acpica/Config.in.host
new file mode 100644
index 0000000..4e5751e
--- /dev/null
+++ b/package/acpica/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_ACPICA
+	bool "host acpica"
+	help
+	  The ACPI Component Architecture (ACPICA) project provides an
+	  operating system (OS)-independent reference implementation of
+	  the Advanced Configuration and Power Interface Specification
+	  (ACPI).
+
+	  https://www.acpica.org
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index b8459d8..40ec81b 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -23,4 +23,19 @@ define ACPICA_INSTALL_TARGET_CMDS
 		INSTALLFLAGS=-m755 install
 endef
 
+HOST_ACPICA_DEPENDENCIES = host-bison host-flex
+
+define HOST_ACPICA_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)				\
+		HARDWARE_NAME=$(BR2_ARCH) HOST=_LINUX CC="$(HOSTCC)"	\
+		all
+endef
+
+define HOST_ACPICA_INSTALL_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)				\
+		HARDWARE_NAME=$(BR2_ARCH) DESTDIR="$(HOST_DIR)"		\
+		INSTALLFLAGS=-m755 install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.8.1
