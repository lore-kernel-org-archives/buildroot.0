From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 25 Oct 2019 21:54:45 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-uvloop: force re-cythonize
 on build
In-Reply-To: <20191025185448.32633-1-asafka7@gmail.com>
References: <20191025185448.32633-1-asafka7@gmail.com>
Message-ID: <20191025185448.32633-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The generated loop.c provided with the tarball was generated
with Cython 0.29.10 and it doesn't compile against the new
Python 3.8 headers. Upstream is now working on a new uvloop
release which will use the newest Cython (0.29.13).
Until then, we will remove the current loop.c and force
regenration of it.

Fixes:
 - http://autobuild.buildroot.net/results/bffe1b2ee7b674f870e15398680ce5b5b22fd296

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-uvloop/python-uvloop.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index d9932b931d..13880ec7e1 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -10,8 +10,14 @@ PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/e3/15/dc3276384f436
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
+define PYTHON_UVLOOP_HOOK
+	$(RM) $(@D)/uvloop/loop.c
+endef
+
+PYTHON_UVLOOP_PRE_BUILD_HOOKS += PYTHON_UVLOOP_HOOK
 
 $(eval $(python-package))
-- 
2.20.1
