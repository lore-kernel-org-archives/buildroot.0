From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  9 Mar 2015 17:24:23 +0100
Subject: [Buildroot] [PATCH 1/2] target-finalize: generate all *.pyc
Message-ID: <1425918264-1912-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch generates all *.pyc files from *.py located in
<target>/usr/python*/site-packages, before stripping the rootfs.

This prevents modules from packages that do not compile the *.py
files from disappearing.

Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index af043a3..ec0b923 100644
--- a/Makefile
+++ b/Makefile
@@ -564,6 +564,11 @@ $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(TARGETS)
 	@$(call MESSAGE,"Finalizing target directory")
+ifneq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),)
+	PYTHONPATH="$(PYTHON_PATH)" \
+		$(HOST_DIR)/usr/bin/python -c "import compileall; \
+			compileall.compile_dir('$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages')"
+endif
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
-- 
2.1.0
