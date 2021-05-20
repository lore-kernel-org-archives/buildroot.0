From: Chan, Donald <hoiho@lab126.com>
Date: Thu, 20 May 2021 01:48:58 +0000
Subject: [Buildroot] [PATCH 4/5] package/python3-cffi: add python3 host
 variant
Message-ID: <1621475338676.25915@lab126.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a python3 host variant since we are adding a python3 host variant of
python-cryptography and it is dependent on this.

Signed-off-by: Donald Chan <hoiho@lab126.com>
---
 package/python3-cffi/python3-cffi.hash |  1 +
 package/python3-cffi/python3-cffi.mk   | 30 ++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 120000 package/python3-cffi/python3-cffi.hash
 create mode 100644 package/python3-cffi/python3-cffi.mk

diff --git a/package/python3-cffi/python3-cffi.hash b/package/python3-cffi/python3-cffi.hash
new file mode 120000
index 0000000..1f98d8d
--- /dev/null
+++ b/package/python3-cffi/python3-cffi.hash
@@ -0,0 +1 @@
+../python-cffi/python-cffi.hash
\ No newline at end of file
diff --git a/package/python3-cffi/python3-cffi.mk b/package/python3-cffi/python3-cffi.mk
new file mode 100644
index 0000000..c6f6391
--- /dev/null
+++ b/package/python3-cffi/python3-cffi.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# python3-cffi
+#
+################################################################################
+
+# Please keep in sync with package/python-cffi/python-cffi.mk
+PYTHON3_CFFI_VERSION = 1.14.2
+PYTHON3_CFFI_SOURCE = cffi-$(PYTHON3_CFFI_VERSION).tar.gz
+PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8
+PYTHON3_CFFI_SETUP_TYPE = setuptools
+PYTHON3_CFFI_DEPENDENCIES = host-pkgconf libffi
+PYTHON3_CFFI_LICENSE = MIT
+PYTHON3_CFFI_LICENSE_FILES = LICENSE
+
+# This host package uses pkg-config to find libffi, so we have to
+# provide the proper hints for pkg-config to behave properly for host
+# packages.
+HOST_PYTHON3_CFFI_ENV = \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
+HOST_PYTHON3_CFFI_DEPENDENCIES = host-pkgconf host-python3-pycparser host-libffi
+
+HOST_PYTHON3_CFFI_DL_SUBDIR = python-cffi
+HOST_PYTHON3_CFFI_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.17.1
