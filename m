From: William A. Kennington III <wak@google.com>
Date: Thu,  8 Dec 2016 17:13:12 -0800
Subject: [Buildroot] [PATCH 2/3] nanopb: Init at
	69e9c1fc8162956feffa32e07a97c53bdb92f5ef
In-Reply-To: <20161209011313.9549-1-wak@google.com>
References: <20161209011313.9549-1-wak@google.com>
Message-ID: <20161209011313.9549-3-wak@google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We chose not to use a stable version so that our version of nanopb
is compatible with pblog. In the future a stable version should be used.

Change-Id: I3f80c809efbe7c237de9b9de901d048247b4c6c1
Google-Bug-Id: 33072942
Signed-off-by: William A. Kennington III <wak@google.com>
---
  package/Config.in          |  1 +
  package/nanopb/Config.in   |  8 ++++++++
  package/nanopb/nanopb.hash |  2 ++
  package/nanopb/nanopb.mk   | 27 +++++++++++++++++++++++++++
  4 files changed, 38 insertions(+)
  create mode 100644 package/nanopb/Config.in
  create mode 100644 package/nanopb/nanopb.hash
  create mode 100644 package/nanopb/nanopb.mk

diff --git a/package/Config.in b/package/Config.in
index c14575c..2ffbcc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1348,6 +1348,7 @@ endif
  	source "package/msgpack/Config.in"
  	source "package/mtdev2tuio/Config.in"
  	source "package/musl-compat-headers/Config.in"
+	source "package/nanopb/Config.in"
  	source "package/openblas/Config.in"
  	source "package/orc/Config.in"
  	source "package/p11-kit/Config.in"
diff --git a/package/nanopb/Config.in b/package/nanopb/Config.in
new file mode 100644
index 0000000..4c5779f
--- /dev/null
+++ b/package/nanopb/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_NANOPB
+	bool "nanopb"
+	help
+	  Nanopb is a small code-size Protocol Buffers implementation in ansi C.
+	  It is especially suitable for use in microcontrollers,
+	  but fits any memory restricted system.
+
+	  https://github.com/nanopb/nanopb
diff --git a/package/nanopb/nanopb.hash b/package/nanopb/nanopb.hash
new file mode 100644
index 0000000..c74a0c5
--- /dev/null
+++ b/package/nanopb/nanopb.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 e6dbaf58574c54e67b6bdfdee71f62d52d261e77a5f8e3961b7a6a0abbf06a86  
nanopb-69e9c1fc8162956feffa32e07a97c53bdb92f5ef.tar.gz
diff --git a/package/nanopb/nanopb.mk b/package/nanopb/nanopb.mk
new file mode 100644
index 0000000..a162b82
--- /dev/null
+++ b/package/nanopb/nanopb.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# nanopb
+#
+################################################################################
+
+NANOPB_VERSION = 69e9c1fc8162956feffa32e07a97c53bdb92f5ef
+NANOPB_SITE = $(call github,nanopb,nanopb,$(NANOPB_VERSION))
+NANOPB_LICENSE = BSD-3c
+NANOPB_LICENSE_FILES = LICENSE.txt
+# no configure script
+
+# Need to use host protoc during cross compilation.
+NANOPB_DEPENDENCIES = protobuf python-protobuf
+
+define HOST_NANOPB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C  
$(@D)/generator/proto
+endef
+
+define NANOPB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C  
$(@D)/generator/proto
+endef
+
+# We don't actually need to install anything as you include the library  
files
+# directly.
+$(eval $(host-generic-package))
+$(eval $(generic-package))
-- 
2.8.0.rc3.226.g39d4020
