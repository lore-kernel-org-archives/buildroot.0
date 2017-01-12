From: William A. Kennington III <wak@google.com>
Date: Thu, 12 Jan 2017 11:15:22 -0800
Subject: [Buildroot] [PATCH v2 2/3] nanopb: new package
In-Reply-To: <20170112191523.23814-1-wak@google.com>
References: <20161209011313.9549-1-wak@google.com>
 <20170112191523.23814-1-wak@google.com>
Message-ID: <20170112191523.23814-3-wak@google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We chose not to use a stable version so that our version of nanopb
is compatible with pblog. In the future a stable version should be used.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 package/Config.in          |  1 +
 package/nanopb/Config.in   |  8 ++++++++
 package/nanopb/nanopb.hash |  2 ++
 package/nanopb/nanopb.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/nanopb/Config.in
 create mode 100644 package/nanopb/nanopb.hash
 create mode 100644 package/nanopb/nanopb.mk

diff --git a/package/Config.in b/package/Config.in
index 8c8c33ec3..625315c1c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1362,6 +1362,7 @@ endif
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
 	source "package/musl-compat-headers/Config.in"
+	source "package/nanopb/Config.in"
 	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
diff --git a/package/nanopb/Config.in b/package/nanopb/Config.in
new file mode 100644
index 000000000..4c5779f58
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
index 000000000..0a9224777
--- /dev/null
+++ b/package/nanopb/nanopb.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d29305a235f9a58c95ffd999d258d7dd2c2cbb8b81312a4138dfe5802ff2c8e8 nanopb-afdbca39edfaef58073f661d23300e1133c4e8af.tar.gz
diff --git a/package/nanopb/nanopb.mk b/package/nanopb/nanopb.mk
new file mode 100644
index 000000000..0e3d8cf55
--- /dev/null
+++ b/package/nanopb/nanopb.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# nanopb
+#
+################################################################################
+
+NANOPB_VERSION = afdbca39edfaef58073f661d23300e1133c4e8af
+NANOPB_SITE = $(call github,nanopb,nanopb,$(NANOPB_VERSION))
+NANOPB_LICENSE = BSD-3c
+NANOPB_LICENSE_FILES = LICENSE.txt
+
+NANOPB_DEPENDENCIES = protobuf python-protobuf
+
+define HOST_NANOPB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/generator/proto
+endef
+
+define NANOPB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/generator/proto
+endef
+
+# We don't actually need to install anything as you include the library files
+# directly.
+$(eval $(host-generic-package))
+$(eval $(generic-package))
-- 
2.11.0
