From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  6 Jul 2016 22:07:57 +0200
Subject: [Buildroot] [PATCH v2] package/python-pillow: fix wrong install step
Message-ID: <1467835677-3867-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch changes PYTHON_PILLOW_INSTALL_TARGET_CMDS to actually
install pillow in target directory instead of host.
It also fixes the version for the hash.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes:

v1 -> v2:

* reworked build and install cmds with define [suggested by Thomas Petazzoni]

 package/python-pillow/python-pillow.hash |  2 +-
 package/python-pillow/python-pillow.mk   | 19 ++++++++++++++-----
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 033692d..bf7828d 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,4 +1,4 @@
 # https://pypi.python.org/pypi?:action=show_md5&digest=b5a15b03bf402fe254636c015fcf04da
 md5 b5a15b03bf402fe254636c015fcf04da  Pillow-3.3.0.tar.gz
 # sha256 locally computed
-sha256 031e7c9c885a4f343d1ad366c7fd2340449dc70318acb4a28d6411994f0accd1  Pillow-3.2.0.tar.gz
+sha256 031e7c9c885a4f343d1ad366c7fd2340449dc70318acb4a28d6411994f0accd1  Pillow-3.3.0.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 84d6e65..0346ae8 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -54,11 +54,20 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-zlib
 endif
 
-PYTHON_PILLOW_BUILD_CMDS = cd $(PYTHON_PILLOW_BUILDDIR); \
-		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
-		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
-		$(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
+define PYTHON_PILLOW_BUILD_CMDS
+	cd $(PYTHON_PILLOW_BUILDDIR); \
+	$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
+	$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
+	$(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
+endef
 
-PYTHON_PILLOW_INSTALL_TARGET_CMDS = $(PYTHON_PILLOW_BUILD_CMDS) install
+define PYTHON_PILLOW_INSTALL_TARGET_CMDS
+	cd $(PYTHON_PILLOW_BUILDDIR); \
+	$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
+	$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
+	$(PYTHON_PILLOW_BUILD_OPTS) install \
+	$(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
+	$(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
+endef
 
 $(eval $(python-package))
-- 
1.9.1
