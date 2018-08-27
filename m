From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 27 Aug 2018 13:37:28 +0200
Subject: [Buildroot] [[PATCH v2 2/2] package/mender-artifact: initial support
In-Reply-To: <20180827113728.20856-1-mirza.krak@northern.tech>
References: <20180827113728.20856-1-mirza.krak@northern.tech>
Message-ID: <20180827113728.20856-3-mirza.krak@northern.tech>
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

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---

Changes in v2:
  - Merged DEVELOPERS change and fixed indentation
  - Fixed indentation in Config.in.host and order (check-package warnings)
  - Added a more descriptive help section in Config.in.host with URL to upstream
  - Clarified comments in mender-artifact.hash around license hash and
    how they are generated
  - Updated commit message to a bit more descriptive and with examples.

 DEVELOPERS                                   |  1 +
 package/Config.in.host                       |  1 +
 package/mender-artifact/Config.in.host       | 20 ++++++++++++++++++++
 package/mender-artifact/mender-artifact.hash | 28 ++++++++++++++++++++++++++++
 package/mender-artifact/mender-artifact.mk   | 21 +++++++++++++++++++++
 5 files changed, 71 insertions(+)
 create mode 100644 package/mender-artifact/Config.in.host
 create mode 100644 package/mender-artifact/mender-artifact.hash
 create mode 100644 package/mender-artifact/mender-artifact.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a6d76dd9c4..3f8390285e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1439,6 +1439,7 @@ F:	package/shadowsocks-libev/

 N:	Mirza Krak <mirza.krak@northern.tech>
 F:	package/mender/
+F:	package/mender-artifact/

 N:	Morgan Delestre <m.delestre@sinters.fr>
 F:	package/monkey/
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
index 0000000000..d2deabc783
--- /dev/null
+++ b/package/mender-artifact/Config.in.host
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_HOST_MENDER_ARTIFACT
+	bool "host mender-artifact"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
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
index 0000000000..96a2cbc6a1
--- /dev/null
+++ b/package/mender-artifact/mender-artifact.hash
@@ -0,0 +1,28 @@
+# Locally computed:
+sha256 2a0322d8707c8ea7cada12c8f96144382264c898cadc35e8058bb9ea6bf8b041 mender-artifact-2.2.0.tar.gz
+
+# License hash extracted from LIC_FILES_CHKSUM.sha256 using the
+# following command:
+#
+#     sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
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
+# sha256 of all licenses files combined (locally computed)
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
