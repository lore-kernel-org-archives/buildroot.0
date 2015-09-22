From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 22 Sep 2015 17:03:33 +0200
Subject: [Buildroot] [PATCH] python: rework *.pyc files generation
Message-ID: <1442934213-26231-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

This patch generates all *.pyc files from *.py located in
<target>/usr/python*/site-packages, before stripping the rootfs.

*.pyc generation on per package basis is disabled through
"--no-compile" option.

This prevents modules from packages that do not compile the *.py
files from disappearing.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 Makefile              | 5 +++++
 package/pkg-python.mk | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fdbca02..74164c3 100644
--- a/Makefile
+++ b/Makefile
@@ -558,6 +558,11 @@ $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
+ifneq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC)$(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PY_PYC),)
+	PYTHONPATH="$(PYTHON_PATH)" \
+		$(HOST_DIR)/usr/bin/python -c "import compileall; \
+			compileall.compile_dir('$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages')"
+endif
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b7a702d..9725d24 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -253,7 +253,7 @@ ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) setup.py install \
+		$$($(2)_PYTHON_INTERPRETER) setup.py install --no-compile \
 		$$($$(PKG)_BASE_INSTALL_TARGET_OPTS) \
 		$$($$(PKG)_INSTALL_TARGET_OPTS))
 endef
-- 
2.1.4
