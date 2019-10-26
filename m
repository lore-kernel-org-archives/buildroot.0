From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:35:22 +0200
Subject: [Buildroot] [git commit] package/python-uvloop: force re-cythonize
 on build
Message-ID: <20191026132859.2B8A28844E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ecfff0b9a205e0c4f60f992e7f586cba476826d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The generated loop.c provided with the tarball was generated with
Cython 0.29.10 and it doesn't compile against the new Python 3.8
headers. Upstream is now working on a new uvloop release which will
use the newest Cython (0.29.13).  Until then, we will remove the
current loop.c and force regenration of it.

Fixes:
 - http://autobuild.buildroot.net/results/bffe1b2ee7b674f870e15398680ce5b5b22fd296

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-uvloop/python-uvloop.mk | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index d9932b931d..8dbe3b36d9 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -10,8 +10,15 @@ PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/e3/15/dc3276384f436
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-PYTHON_UVLOOP_BUILD_OPTS = build_ext --inplace --use-system-libuv
-PYTHON_UVLOOP_INSTALL_TARGET_OPTS = build_ext --inplace --use-system-libuv
-PYTHON_UVLOOP_DEPENDENCIES = libuv
+PYTHON_UVLOOP_BUILD_OPTS = build_ext --inplace --cython-always --use-system-libuv
+PYTHON_UVLOOP_INSTALL_TARGET_OPTS = build_ext --inplace --cython-always --use-system-libuv
+PYTHON_UVLOOP_DEPENDENCIES = libuv host-python-cython
+
+# force regenerating loop.c with cython. can be removed with the next
+# uvloop version bump
+define PYTHON_UVLOOP_FORCE_REGEN_LOOPC
+	$(RM) $(@D)/uvloop/loop.c
+endef
+PYTHON_UVLOOP_PRE_BUILD_HOOKS += PYTHON_UVLOOP_FORCE_REGEN_LOOPC
 
 $(eval $(python-package))
