From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 22:21:34 +0200
Subject: [Buildroot] [git commit] package/python-pillow: fix wrong install
	step
Message-ID: <20160706202142.130BB805E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e3b154243a7c3bb77659a3564b62e2989d59415
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch changes PYTHON_PILLOW_INSTALL_TARGET_CMDS to actually
install pillow in target directory instead of host.

While at it, it also fixes the version for the hash, and uses the more
conventional "define ... endef" construct to define variables in
python-pillow.mk.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pillow/python-pillow.hash |  2 +-
 package/python-pillow/python-pillow.mk   | 13 +++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

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
index 84d6e65..619c55b 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -54,11 +54,20 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-zlib
 endif
 
-PYTHON_PILLOW_BUILD_CMDS = cd $(PYTHON_PILLOW_BUILDDIR); \
+define PYTHON_PILLOW_BUILD_CMDS
+	cd $(PYTHON_PILLOW_BUILDDIR); \
 		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
 		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
 		$(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
+endef
 
-PYTHON_PILLOW_INSTALL_TARGET_CMDS = $(PYTHON_PILLOW_BUILD_CMDS) install
+define PYTHON_PILLOW_INSTALL_TARGET_CMDS
+	cd $(PYTHON_PILLOW_BUILDDIR); \
+		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
+		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
+		$(PYTHON_PILLOW_BUILD_OPTS) install \
+		$(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
+		$(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
+endef
 
 $(eval $(python-package))
