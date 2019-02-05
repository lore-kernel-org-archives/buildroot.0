From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 16:51:19 +0100
Subject: [Buildroot] [PATCH 10/10] package/mender-artifact: initial support
In-Reply-To: <1549381879-2207-1-git-send-email-angelo@amarulasolutions.com>
References: <1549381879-2207-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1549381879-2207-11-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mender-artifact is a host tool to generate update images
in the Mender artifact file format.

Example usage:

    $ mender-artifact write rootfs-image \
         --update rootfs.ext4 \
         --output-path rootfs.mender \
         --artifact-name "release-v1.0.0" \
         --device-type "beaglebone"

Above will generate a Mender artifact called "rootfs.mender"
containing the "rootfs.ext4" image along with meta-data.

One can read-out the meta-data with the following command:

    $ mender-artifact read rootfs.mender
      Mender artifact:
      Name: release-v1.0.0
      Format: mender
      Version: 2
      Signature: no signature
      Compatible devices: '[beaglebone]'

    Updates:
      0000:
        Type:   rootfs-image
        Files:
          name:     rootfs.ext4
          size:     52428800
          modified: 2018-08-27 09:10:55 +0200 CEST
          checksum: e70b113fb0964a810a3043586eb4fc1c48e684ba78b02ba65fead4aa3e540d87

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in.host                       |  1 +
 package/mender-artifact/Config.in.host       | 18 +++++++++++++++++
 package/mender-artifact/mender-artifact.hash | 28 ++++++++++++++++++++++++++
 package/mender-artifact/mender-artifact.mk   | 30 ++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 package/mender-artifact/Config.in.host
 create mode 100644 package/mender-artifact/mender-artifact.hash
 create mode 100644 package/mender-artifact/mender-artifact.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 59e1f32..be223b2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1560,6 +1560,7 @@ F:	package/shadowsocks-libev/
 
 N:	Mirza Krak <mirza.krak@northern.tech>
 F:	package/mender/
+F:	package/mender-artifact/
 
 N:	Morgan Delestre <m.delestre@sinters.fr>
 F:	package/monkey/
diff --git a/package/Config.in.host b/package/Config.in.host
index 3b75f23..9916114 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -33,6 +33,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
+	source "package/mender-artifact/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
diff --git a/package/mender-artifact/Config.in.host b/package/mender-artifact/Config.in.host
new file mode 100644
index 0000000..181d57d
--- /dev/null
+++ b/package/mender-artifact/Config.in.host
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_HOST_MENDER_ARTIFACT
+	bool "host mender-artifact"
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
+	help
+	  The mender-artifact tool is a CLI implementation of the
+	  Mender artifacts library.
+
+	  A Mender artifact can be recognized by its .mender suffix.
+	  Mender artifacts can contain binaries, metadata, checksums,
+	  signatures and scripts that are used during a deployment.
+	  The artifact format acts as a wrapper, and uses the tar
+	  format to bundle several files into one.
+
+	  In its simplest form, an artifact contains just a rootfs
+	  image, along with its checksum, id and device type
+	  compatibility.
+
+	  https://github.com/mendersoftware/mender-artifact
diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
new file mode 100644
index 0000000..d44244d
--- /dev/null
+++ b/package/mender-artifact/mender-artifact.hash
@@ -0,0 +1,28 @@
+# Locally computed:
+sha256 fde448af4811600a130b243d59e21b1f9cdd60fd991bd418246c913ebf945206 2.4.0.tar.gz
+
+# License hash extracted from LIC_FILES_CHKSUM.sha256 using the
+# following command:
+#
+#     sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
+
+# Apache 2.0 licenses.
+sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7 LICENSE
+sha256 ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680 vendor/github.com/mendersoftware/mendertesting/LICENSE
+#
+# BSD 2 Clause licenses.
+sha256 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86 vendor/github.com/pkg/errors/LICENSE
+#
+# BSD 3 Clause licenses.
+sha256 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477 vendor/github.com/pmezard/go-difflib/LICENSE
+sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067 vendor/golang.org/x/sys/LICENSE
+sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067 vendor/golang.org/x/crypto/LICENSE
+#
+# ISC licenses.
+sha256 3525392c6db3b804af76980b2c560ee9ec1abdadd907d76a26091df7c78f3a25 vendor/github.com/davecgh/go-spew/LICENSE
+#
+# MIT licenses.
+sha256 402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f vendor/github.com/stretchr/testify/LICENSE
+sha256 402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f vendor/github.com/stretchr/testify/LICENSE
+sha256 da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7 vendor/github.com/urfave/cli/LICENSE
+sha256 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b vendor/github.com/sirupsen/logrus/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
new file mode 100644
index 0000000..9ed0b1a
--- /dev/null
+++ b/package/mender-artifact/mender-artifact.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# host-mender-artifact
+#
+################################################################################
+
+HOST_MENDER_ARTIFACT_VERSION = 2.4.0
+HOST_MENDER_ARTIFACT_SITE = https://github.com/mendersoftware/mender-artifact/archive
+HOST_MENDER_ARTIFACT_SOURCE = $(HOST_MENDER_ARTIFACT_VERSION).tar.gz
+HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
+HOST_MENDER_ARTIFACT_LICENSE_FILES = \
+	LICENSE \
+	LIC_FILES_CHKSUM.sha256 \
+	vendor/github.com/mendersoftware/mendertesting/LICENSE \
+	vendor/github.com/pkg/errors/LICENSE \
+	vendor/github.com/pmezard/go-difflib/LICENSE \
+	vendor/golang.org/x/sys/LICENSE \
+	vendor/golang.org/x/crypto/LICENSE \
+	vendor/github.com/davecgh/go-spew/LICENSE \
+	vendor/github.com/stretchr/testify/LICENSE \
+	vendor/github.com/stretchr/testify/LICENSE \
+	vendor/github.com/urfave/cli/LICENSE \
+	vendor/github.com/sirupsen/logrus/LICENSE
+
+HOST_MENDER_ARTIFACT_BUILD_TARGETS = cli/mender-artifact
+
+HOST_MENDER_ARTIFACT_BIN_NAME = mender-artifact
+HOST_MENDER_ARTIFACT_INSTALL_BINS = $(HOST_MENDER_ARTIFACT_BIN_NAME)
+
+$(eval $(host-golang-package))
-- 
2.7.4
