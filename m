From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 22:42:10 +0200
Subject: [Buildroot] [git commit] package/python3-cffi: add python3 host
 variant
Message-ID: <20210606203301.96D28815DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f87c377a53e31e2638d0193acab5a40b4aa49b59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a python3 host variant since we are adding a python3 host variant of
python-cryptography and it is dependent on this.

Signed-off-by: Donald Chan <hoiho@lab126.com>
[yann.morin.1998 at free.fr:
  - drop target _DEPENDENCIES since this is a host-only package
  - also add sync comment to python-cffi
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-cffi/python-cffi.mk     |  1 +
 package/python3-cffi/python3-cffi.hash |  1 +
 package/python3-cffi/python3-cffi.mk   | 29 +++++++++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index f882349fd7..f0b5b4560f 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-cffi/python3-cffi.mk
 PYTHON_CFFI_VERSION = 1.14.2
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
 PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8
diff --git a/package/python3-cffi/python3-cffi.hash b/package/python3-cffi/python3-cffi.hash
new file mode 120000
index 0000000000..1f98d8df9c
--- /dev/null
+++ b/package/python3-cffi/python3-cffi.hash
@@ -0,0 +1 @@
+../python-cffi/python-cffi.hash
\ No newline at end of file
diff --git a/package/python3-cffi/python3-cffi.mk b/package/python3-cffi/python3-cffi.mk
new file mode 100644
index 0000000000..7541e71b73
--- /dev/null
+++ b/package/python3-cffi/python3-cffi.mk
@@ -0,0 +1,29 @@
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
