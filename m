From: Mirza Krak <mirza.krak@northern.tech>
Date: Sun, 26 Aug 2018 23:41:45 +0200
Subject: [Buildroot] [PATCH 2/3] package/mender-artifact: initial support
In-Reply-To: <20180826214146.28328-1-mirza.krak@northern.tech>
References: <20180826214146.28328-1-mirza.krak@northern.tech>
Message-ID: <20180826214146.28328-3-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mender-artifact is a host tool to generate update images
in the Mender artifact file format.

See https://github.com/mendersoftware/mender-artifact for more
information about the format and the tool.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/Config.in.host                       |  1 +
 package/mender-artifact/Config.in.host       |  7 +++++++
 package/mender-artifact/mender-artifact.hash | 29 ++++++++++++++++++++++++++++
 package/mender-artifact/mender-artifact.mk   | 21 ++++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 package/mender-artifact/Config.in.host
 create mode 100644 package/mender-artifact/mender-artifact.hash
 create mode 100644 package/mender-artifact/mender-artifact.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 7838ffc219..2b85d2b189 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -30,6 +30,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
+	source "package/mender-artifact/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
diff --git a/package/mender-artifact/Config.in.host b/package/mender-artifact/Config.in.host
new file mode 100644
index 0000000000..bb03e96018
--- /dev/null
+++ b/package/mender-artifact/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_MENDER_ARTIFACT
+    depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+    depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+    depends on BR2_TOOLCHAIN_HAS_THREADS
+    bool "host mender-artifact"
+    help
+      Mender image artifact tool
diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
new file mode 100644
index 0000000000..af003fe7de
--- /dev/null
+++ b/package/mender-artifact/mender-artifact.hash
@@ -0,0 +1,29 @@
+# Locally computed:
+sha256 2a0322d8707c8ea7cada12c8f96144382264c898cadc35e8058bb9ea6bf8b041 mender-artifact-2.2.0.tar.gz
+
+# License, locally computed
+
+
+# Vendor licenses
+# Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
+
+# Apache-2.0 license.
+sha256 b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1 LICENSE
+sha256 ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680 vendor/github.com/mendersoftware/mendertesting/LICENSE
+
+# BSD 2 Clause licenses.
+sha256 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86 vendor/github.com/pkg/errors/LICENSE
+
+# BSD 3 Clause licenses.
+sha256 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477 vendor/github.com/pmezard/go-difflib/LICENSE
+
+# ISC licenses.
+sha256 3525392c6db3b804af76980b2c560ee9ec1abdadd907d76a26091df7c78f3a25 vendor/github.com/davecgh/go-spew/LICENSE
+
+# MIT licenses.
+sha256 402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f vendor/github.com/stretchr/testify/LICENSE
+sha256 402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f vendor/github.com/stretchr/testify/LICENCE.txt
+sha256 da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7 vendor/github.com/urfave/cli/LICENSE
+
+# sha256 of all the vendor licenses combined
+sha256 a9d3dea05c34f2bf7eb3fa677dafe09e9a80edd024cb31da750616c10f2bbcbb LIC_FILES_CHKSUM.sha256
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
new file mode 100644
index 0000000000..590895de8c
--- /dev/null
+++ b/package/mender-artifact/mender-artifact.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# mender-artifact
+#
+################################################################################
+
+MENDER_ARTIFACT_VERSION = 2.2.0
+MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(MENDER_ARTIFACT_VERSION))
+MENDER_ARTIFACT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
+MENDER_ARTIFACT_LICENSE_FILES = \
+	LICENSE \
+	LIC_FILES_CHKSUM.sha256 \
+	vendor/github.com/mendersoftware/mendertesting/LICENSE \
+	vendor/github.com/pkg/errors/LICENSE \
+	vendor/github.com/pmezard/go-difflib/LICENSE \
+	vendor/github.com/davecgh/go-spew/LICENSE \
+	vendor/github.com/stretchr/testify/LICENSE \
+	vendor/github.com/stretchr/testify/LICENCE.txt \
+	vendor/github.com/urfave/cli/LICENSE
+
+$(eval $(host-golang-package))
-- 
2.11.0
