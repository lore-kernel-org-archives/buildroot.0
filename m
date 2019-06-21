From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 21 Jun 2019 11:23:39 +0100
Subject: [Buildroot] [PATCH 3/3] package/jailhouse: introduce python helpers
In-Reply-To: <20190621102339.22286-1-ccaione@baylibre.com>
References: <20190621102339.22286-1-ccaione@baylibre.com>
Message-ID: <20190621102339.22286-4-ccaione@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compile the python helpers tool as a separate BR2 package depending on
the pyjailhouse library.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 package/jailhouse/Config.in    | 12 ++++++++++++
 package/jailhouse/jailhouse.mk |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
index 385acdd627..b189822dae 100644
--- a/package/jailhouse/Config.in
+++ b/package/jailhouse/Config.in
@@ -12,3 +12,15 @@ comment "Jailhouse needs a Linux kernel to be built"
 
 comment "Jailhouse only supports X86_64, ARMv8 or ARMv7 with virtualization extensions"
 	depends on !(BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_x86_64)
+
+if BR2_PACKAGE_JAILHOUSE
+
+config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
+	bool "Jailhouse helper scripts"
+	select BR2_PACKAGE_PYTHON_JAILHOUSE
+	help
+	  Python-based helpers for the Jailhouse Hypervison".
+
+	  https://github.com/siemens/jailhouse
+
+endif
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index 78de8f6dc8..2065812369 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -16,6 +16,12 @@ JAILHOUSE_MAKE_OPTS = \
 	KDIR="$(LINUX_DIR)" \
 	DESTDIR="$(TARGET_DIR)"
 
+ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
+JAILHOUSE_MAKE_OPTS += PYTHON_PIP_USABLE="yes"
+else
+JAILHOUSE_MAKE_OPTS += PYTHON_PIP_USABLE="no"
+endif
+
 define JAILHOUSE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(JAILHOUSE_MAKE_OPTS) -C $(@D)
 endef
-- 
2.20.1
