From: Brian 'redbeard' Harrington <redbeard@coreos.com>
Date: Mon, 23 May 2016 08:07:30 -0700
Subject: [Buildroot] [v2] fs/aci: Add App Container Image (ACI) support to
	filesystems
Message-ID: <57431CB2.1040601@coreos.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

App Container Images (ACI) are a Linux containerization image format
defined as a part of the AppC specification as defined by CoreOS,
Red Hat, Google, and community members. These images consist of a Linux
userland and a JSON metadata file describing how to execute the actual
runtime.

This filesystem package utilizes Buildroot for the generation of
the userland and provides the user with a mechanism for configuring the
contents of the manifest file.

---
Changes v1 -> v2
  - Remove accidental 'default' of the fs/aci
  - Remove dependency on host Jq
  - Remove numerous "depends" lines in Kconfig, now in if block
  - Set default name of localhost/buildroot as well as error check
  - Allowed user to specify external manifest
  - Enabled setting of timestamp annotation via a (non default) config
    option
  - Set default version via sha256 of .config file
  - Added dependency on specific architectures
  - Moved logic for architecture checks into Kconfig
  - Use qstrip to clean up variables
  - Export variables to scripts in package to avoid numerous
    re-declarations
  - Removed setting of xattrs in tar command
  - Removed accidental re-use of TAR_OPTS
  - Decoupled initial creation of tarball and adding of additional files
    to simplify logic
  - Removed stray debugging "echo" lines used during development
  - Removed extra blank lines
  - Moved logic for generation of json manifest into a shell script

Signed-off-by: Brian 'redbeard' Harrington <redbeard@coreos.com>
---
 fs/Config.in       |   1 +
 fs/aci/Config.in   | 117 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/aci/aci.json.sh |  51 +++++++++++++++++++++++
 fs/aci/aci.mk      |  80 ++++++++++++++++++++++++++++++++++++
 4 files changed, 249 insertions(+)
 create mode 100644 fs/aci/Config.in
 create mode 100755 fs/aci/aci.json.sh
 create mode 100644 fs/aci/aci.mk

diff --git a/fs/Config.in b/fs/Config.in
index 51ccf28..1c468c5 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -1,5 +1,6 @@
 menu "Filesystem images"
 
+source "fs/aci/Config.in"
 source "fs/axfs/Config.in"
 source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
diff --git a/fs/aci/Config.in b/fs/aci/Config.in
new file mode 100644
index 0000000..4df4791
--- /dev/null
+++ b/fs/aci/Config.in
@@ -0,0 +1,117 @@
+config BR2_TARGET_ROOTFS_ACI
+	bool "app container image (aci)"
+	default n
+        depends on BR2_arm || BR2_armeb || BR2_aarch64_eb || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le
+        depends on !BR2_ARM_CPU_ARMV4 
+	help
+	  Build an App Container Image for use with a Linux
+	  containerization engine like rkt, Kurma, 3ofCoins, nosecone,
+	  etc.
+
+if BR2_TARGET_ROOTFS_ACI
+
+config BR2_TARGET_ROOTFS_ACI_ARCH
+	string
+	default "i386"       if BR2_i386
+	default "arm64"      if BR2_x86_64
+	default "aarch64"    if BR2_aarch64
+	default "aarch64_be" if BR2_aarch64_be
+	default "ppc64"      if BR2_powerpc64
+	default "armv6l"     if BR2_arm && BR2_ARM_CPU_ARMV6
+	default "armv7l"     if BR2_arm && BR2_ARM_CPU_ARMV7A
+	default "armv7l"     if BR2_arm && BR2_ARM_CPU_ARMV7M
+	default "armv7b"     if BR2_armeb && BR2_ARM_CPU_ARMV7A
+	default "armv7b"     if BR2_armeb && BR2_ARM_CPU_ARMV7M
+
+choice
+	prompt "compression method"
+	default BR2_TARGET_ROOTFS_ACI_NONE
+	help
+	  Select compressor for application container image.
+
+config BR2_TARGET_ROOTFS_ACI_NONE
+	bool "no compression"
+	help
+	  Do not compress the ACI.
+
+config BR2_TARGET_ROOTFS_ACI_GZIP
+	bool "gzip"
+	help
+	  Do compress the ACI with gzip.
+
+config BR2_TARGET_ROOTFS_ACI_BZIP2
+	bool "bzip2"
+	help
+	  Do compress the ACI with bzip2.
+
+config BR2_TARGET_ROOTFS_ACI_LZMA
+	bool "lzma"
+	help
+	  Do compress the ACI with lzma.
+
+config BR2_TARGET_ROOTFS_ACI_LZO
+	bool "lzo"
+	help
+	  Do compress the ACI with lzop.
+
+config BR2_TARGET_ROOTFS_ACI_XZ
+	bool "xz"
+	help
+	  Do compress the ACI with xz.
+
+endchoice
+
+config BR2_TARGET_ROOTFS_ACI_USE_CUSTOM_MANIFEST
+        bool "custom aci manifest"
+        help
+          Use custom aci manifest.                                            
+
+if BR2_TARGET_ROOTFS_ACI_USE_CUSTOM_MANIFEST
+config BR2_TARGET_ROOTFS_ACI_MANIFEST_PATH
+        string "custom path"                                     
+        default ""                                                
+	depends on BR2_TARGET_ROOTFS_ACI_USE_CUSTOM_MANIFEST
+        help
+          Path to custom ACI manifest.
+endif # BR2_TARGET_ROOTFS_ACI_USE_CUSTOM_MANIFEST
+
+if !BR2_TARGET_ROOTFS_ACI_OPTIONS_MANIFEST_CUSTOM
+config BR2_TARGET_ROOTFS_ACI_OPTIONS_NAME
+	string "name"
+	default "localhost/buildroot"
+	depends on !BR2_TARGET_ROOTFS_ACI_USE_CUSTOM_MANIFEST
+	help
+	  A human-readable name for this App Container Image (e.g. 
+	  example.com/my_app).
+
+comment "aci images must have a name"
+	depends on BR2_TARGET_ROOTFS_ACI_OPTIONS_NAME = "localhost/buildroot"
+	depends on !BR2_TARGET_ROOTFS_ACI_USE_CUSTOM_MANIFEST
+
+config BR2_TARGET_ROOTFS_ACI_OPTIONS_EXEC
+	string "exec command"
+	depends on !BR2_TARGET_ROOTFS_ACI_USE_CUSTOM_MANIFEST
+	help
+	  Executable to launch on container instantiation and any relevant flags
+	  (e.g. /bin/sh).
+
+config BR2_TARGET_ROOTFS_ACI_OPTIONS_VERSION
+	string "version"
+	depends on !BR2_TARGET_ROOTFS_ACI_USE_CUSTOM_MANIFEST
+	help
+	  When combined with "name", this SHOULD be unique for every 
+	  build of an app (on a given "os"/"arch" combination - e.g. v1.3.2).
+
+comment "aci images should be supplied with a version"
+	depends on BR2_TARGET_ROOTFS_ACI_OPTIONS_VERSION = ""
+	depends on !BR2_TARGET_ROOTFS_ACI_USE_CUSTOM_MANIFEST
+
+config BR2_TARGET_ROOTFS_ACI_TIMESTAMP
+	bool "include created timestamp"
+	default n
+	depends on !BR2_TARGET_ROOTFS_ACI_USE_CUSTOM_MANIFEST
+	help
+	  Include ACI annotation of timestamp when make was run.
+
+endif # !BR2_TARGET_ROOTFS_ACI_OPTIONS_MANIFEST_CUSTOM
+endif # BR2_TARGET_ROOTFS_ACI
diff --git a/fs/aci/aci.json.sh b/fs/aci/aci.json.sh
new file mode 100755
index 0000000..560e062
--- /dev/null
+++ b/fs/aci/aci.json.sh
@@ -0,0 +1,51 @@
+#!/bin/sh
+if [ "${ROOTFS_ACI_EXEC}n" == "n" ]; then
+	aciuser='"user": "0",'
+	acigroup='"group": "0"'
+else
+	aciuser='"user": '"\"${ROOTFS_ACI_EXEC}\","
+	acigroup='"group": '"\"${ROOTFS_ACI_EXEC}\""
+fi
+
+if [ "${ROOTFS_ACI_TIMESTAMP}n" != "n" ]; then
+createdat=",
+	{
+		\"name\": \"created\",
+		\"value\": \"${ROOTFS_ACI_TIMESTAMP}\"
+	}"
+fi
+
+
+cat <<EOF
+{
+	"acKind":"ImageManifest",
+	"acVersion":"0.7.4",
+	"name": "${ROOTFS_ACI_NAME}",
+	"labels":
+		[{
+			"name":"os",
+			"value":"linux"
+		},{
+			"name":"arch",
+			"value": "${ROOTFS_ACI_ARCH}"
+		},{ 
+			"name":"version",
+			"value": "${ROOTFS_ACI_VERSION}"
+		}],
+	"app":
+	{
+		"exec":
+			[
+			"${ROOTFS_ACI_EXEC}"
+			],
+		${aciuser}
+		${acigroup}
+	},
+	"annotations":
+	[{
+		"name": "buildroot.org/aci",
+		"value": "Generated by Buildroot"
+	}${createdat}
+	]
+}
+EOF
diff --git a/fs/aci/aci.mk b/fs/aci/aci.mk
new file mode 100644
index 0000000..abec378
--- /dev/null
+++ b/fs/aci/aci.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# Generate App Container Image (ACI)
+# https://github.com/appc/spec/blob/master/spec/aci.md
+#
+################################################################################
+
+ROOTFS_ACI_NAME = $(call qstrip,$(BR2_TARGET_ROOTFS_ACI_OPTIONS_NAME))
+ROOTFS_ACI_EXEC = $(call qstrip,$(BR2_TARGET_ROOTFS_ACI_OPTIONS_EXEC))
+ROOTFS_ACI_ARCH = $(call qstrip,$(BR2_TARGET_ROOTFS_ACI_ARCH))
+ROOTFS_ACI_VERSION = $(call qstrip,$(BR2_TARGET_ROOTFS_ACI_OPTIONS_VERSION))
+ROOTFS_ACI_MANIFEST = $(call qstrip,$(BR2_TARGET_ROOTFS_ACI_MANIFEST_PATH))
+
+# Passing the generated variables into the running environment for make targets
+# leads to a cleaner implementation of the resulting shell scripts. In this way
+# nothing getting passed to tar should need quotes
+export ROOTFS_ACI_NAME
+export ROOTFS_ACI_EXEC 
+export ROOTFS_ACI_ARCH
+export ROOTFS_ACI_VERSION 
+export ROOTFS_ACI_MANIFEST 
+
+# If the user does not supply a version number, generate one which should play
+# nicely with reproducible builds, ideally signalling that for a given pairing
+# of buildroot version and config generates a consistent output.
+ifndef $(ROOTFS_ACI_VERSION)
+ROOTFS_ACI_VERSION = $(shell cat .config | sha256sum | cut -f1 -d' ')
+endif
+
+# In continuing support of deterministic builds, allow the user to annotate a
+# manifest with a timestamp but do not make this the default behavior.  In this
+# case it will be the timestamp of when "make" is run.
+ifeq ($(BR2_TARGET_ROOTFS_ACI_TIMESTAMP),y)
+ROOTFS_ACI_TIMESTAMP = $(shell date --rfc-3339=ns | tr " " "T")
+export ROOTFS_ACI_TIMESTAMP
+endif
+
+# For the generation of our ACI we pass the variables from the main
+# configuration into a scrip to generate a JSON manifest unless the user
+# provided their own manifest
+ifneq ($(ROOTFS_ACI_MANIFEST),)
+define ROOTFS_ACI_COPY_MANIFEST
+	cp '$(ROOTFS_ACI_MANIFEST)' $(BINARIES_DIR)/manifest
+endef
+ROOTFS_ACI_PRE_GEN_HOOKS += ROOTFS_ACI_COPY_MANIFEST
+else
+define ROOTFS_ACI_GENERATE_MANIFEST
+	fs/aci/aci.json.sh > $(BINARIES_DIR)/manifest
+endef
+ROOTFS_ACI_PRE_GEN_HOOKS += ROOTFS_ACI_GENERATE_MANIFEST
+endif
+
+# We then create the TAR archive of all components, making sure all paths are
+# represented correctly. Unfortunately as per fs/common.mk:8 the only a single
+# command is allowed.  The spec requires storing any relevant xattrs but as of 
+# 2016-05-22 buildroot does not generate these, though tooling inside the
+# target system can be added via the package BR2_PACKAGE_ATTR
+define ROOTFS_ACI_CMD
+	tar -cf $@ -C $(BINARIES_DIR) --owner=0 --group=0 manifest && \
+	tar -rf $@ -C $(TARGET_DIR) --numeric-owner --transform 's,^\./,rootfs/,' .
+endef
+
+# ACI images are required to end in ".aci" regardless of compression
+ifneq ($(BR2_TARGET_ROOTFS_ACI_NONE),y)
+define ROOTFS_ACI_MOVE
+	mv -f $(BINARIES_DIR)/rootfs.aci$(ROOTFS_ACI_COMPRESS_EXT) \
+		$(BINARIES_DIR)/rootfs.aci
+endef
+
+ROOTFS_ACI_POST_GEN_HOOKS += ROOTFS_ACI_MOVE
+endif
+
+ifeq ($(ROOTFS_ACI_NAME),)
+ifeq ($(call qstrip,$(ROOTFS_ACI_MANIFEST)),)
+$(error You supplied neither BR2_TARGET_ROOTFS_ACI_MANIFEST_PATH, \
+ROOTFS_ACI_NAME, nor BR2_TARGET_ROOTFS_ACI_OPTIONS_NAME)
+endif
+endif
+
+$(eval $(call ROOTFS_TARGET,aci))
-- 
2.4.11
