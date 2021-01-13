From: Raul Hidalgo Caballero <deinok@deinok.com>
Date: Wed, 13 Jan 2021 08:46:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/dotnet-sdk: new package
Message-ID: <20210113074647.1826-1-deinok@deinok.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 DEVELOPERS                                    |  5 ++++
 package/Config.in.host                        |  1 +
 package/dotnet-sdk/dotnet-sdk.hash            |  3 ++
 package/dotnet-sdk/dotnet-sdk.mk              | 20 +++++++++++++
 package/dotnet/Config.in.host                 | 15 ++++++++++
 .../testing/tests/package/test_dotnet_sdk.py  | 28 +++++++++++++++++++
 6 files changed, 72 insertions(+)
 create mode 100644 package/dotnet-sdk/dotnet-sdk.hash
 create mode 100644 package/dotnet-sdk/dotnet-sdk.mk
 create mode 100644 package/dotnet/Config.in.host
 create mode 100644 support/testing/tests/package/test_dotnet_sdk.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 05b509c9c4..ea85f7c9c3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2206,6 +2206,11 @@ F:	package/python-botocore/
 F:	package/python-jmespath/
 F:	package/python-s3transfer/
 
+N:	Raul Hidalgo Caballero <deinok@deinok.com>
+F:	package/dotnet/
+F:	package/dotnet-sdk/
+F:	support/testing/tests/package/test_dotnet_sdk.py
+
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
 F:	package/paho-mqtt-cpp/
diff --git a/package/Config.in.host b/package/Config.in.host
index ba6a68c728..16f0e9f690 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -16,6 +16,7 @@ menu "Host utilities"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
+	source "package/dotnet/Config.in.host"
 	source "package/doxygen/Config.in.host"
 	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
diff --git a/package/dotnet-sdk/dotnet-sdk.hash b/package/dotnet-sdk/dotnet-sdk.hash
new file mode 100644
index 0000000000..a3016b2e49
--- /dev/null
+++ b/package/dotnet-sdk/dotnet-sdk.hash
@@ -0,0 +1,3 @@
+sha256  cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310  LICENSE.txt
+sha256  01564961f8ca9744d0ecc5d3e72d7c1659df95898f3a077fd9140fd4023f3579  ThirdPartyNotices.txt
+sha256  23df1eca7eb1302dfb10f4edce7edf7150e57698576f61b2dcb777c833cbd80c  dotnet-sdk-5.0.101-linux-x64.tar.gz
diff --git a/package/dotnet-sdk/dotnet-sdk.mk b/package/dotnet-sdk/dotnet-sdk.mk
new file mode 100644
index 0000000000..133b39b3f5
--- /dev/null
+++ b/package/dotnet-sdk/dotnet-sdk.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# dotnet-sdk
+#
+################################################################################
+
+HOST_DOTNET_SDK_VERSION = 5.0.101
+HOST_DOTNET_SDK_SITE = https://dotnetcli.azureedge.net/dotnet/Sdk/$(HOST_DOTNET_SDK_VERSION)
+HOST_DOTNET_SDK_SOURCE = dotnet-sdk-$(HOST_DOTNET_SDK_VERSION)-$(call qstrip,$(BR2_PACKAGE_HOST_DOTNET_RID)).tar.gz
+HOST_DOTNET_SDK_LICENSE = MIT
+HOST_DOTNET_SDK_LICENSE_FILES = LICENSE.txt ThirdPartyNotices.txt
+
+define HOST_DOTNET_SDK_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/share/dotnet/
+	cp -dpfr $(@D)/* $(HOST_DIR)/usr/share/dotnet/
+	mkdir -p $(HOST_DIR)/usr/bin/
+	ln -s ../share/dotnet/dotnet $(HOST_DIR)/usr/bin/dotnet
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/dotnet/Config.in.host b/package/dotnet/Config.in.host
new file mode 100644
index 0000000000..90b477a6a1
--- /dev/null
+++ b/package/dotnet/Config.in.host
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_HOST_DOTNET_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "x86_64"
+
+config BR2_PACKAGE_HOST_DOTNET_RID
+	string
+	default "linux-x64" if BR2_HOSTARCH = "x86_64"
+
+config BR2_PACKAGE_HOST_DOTNET_SDK
+	bool "host dotnet-sdk"
+	depends on BR2_PACKAGE_HOST_DOTNET_ARCH_SUPPORTS
+	help
+		Dotnet SDK
+
+		https://dotnet.microsoft.com/
diff --git a/support/testing/tests/package/test_dotnet_sdk.py b/support/testing/tests/package/test_dotnet_sdk.py
new file mode 100644
index 0000000000..288e873597
--- /dev/null
+++ b/support/testing/tests/package/test_dotnet_sdk.py
@@ -0,0 +1,28 @@
+import os
+import tempfile
+import subprocess
+import shutil
+
+import infra.basetest
+
+
+class TestDotnetSdkBase(infra.basetest.BRTest):
+
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+class TestHostDotnetSdk(TestDotnetSdkBase):
+    config = TestDotnetSdkBase.config + \
+        """
+        BR2_PACKAGE_HOST_DOTNET_SDK=y
+        """
+
+    def test_run(self):
+        env = os.environ.copy()
+        hostdir = os.path.join(self.builddir, 'host')
+        dotnet = os.path.join(hostdir, 'usr', 'bin', 'dotnet')
+        cmd = [dotnet, '--version']
+        exit_code = subprocess.call(cmd, stdout=self.b.logfile, stderr=self.b.logfile, env=env)
+        self.assertEqual(exit_code, 0)
-- 
2.25.1
