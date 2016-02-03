From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 22:34:14 +0100
Subject: [Buildroot] [git commit] python-cffi: add host variant
Message-ID: <20160203213539.8B82B817D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce726bae3150506174fd612318615a3be81224bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host variant is needed to cross-compile CFFI based C library wrappers.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas:
 - add dependency on host-pkgconf for the host package variant.
 - add various environment variables needed to make pkg-config behave
   properly when building host-python-cffi. Otherwise, pkg-config
   returns values that are appropriate to build things for the target,
   and the build fails.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cffi/python-cffi.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 70fbe02..7151789 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -12,4 +12,16 @@ PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
 PYTHON_CFFI_LICENSE_FILES = LICENSE
 
+# This host package uses pkg-config to find libffi, so we have to
+# provide the proper hints for pkg-config to behave properly for host
+# packages.
+HOST_PYTHON_CFFI_ENV = \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig"
+HOST_PYTHON_CFFI_DEPENDENCIES = host-pkgconf host-python-pycparser host-libffi
+
 $(eval $(python-package))
+$(eval $(host-python-package))
