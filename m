From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 15:05:41 +0100
Subject: [Buildroot] [PATCH 22/22] package/python-cffi: host-package added
	(needs host-libffi).
In-Reply-To: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454335541-14224-23-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/libffi/libffi.mk           | 11 +++++++++++
 package/python-cffi/python-cffi.mk |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 8f0f72d..47de8cd 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -22,6 +22,17 @@ endef
 
 LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
 
+# Move the headers to the usual location, and adjust the .pc file
+# accordingly.
+define HOST_LIBFFI_MOVE_HOST_HEADERS
+	mv $(HOST_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(HOST_DIR)/usr/include/
+	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
+		$(HOST_DIR)/usr/lib/pkgconfig/libffi.pc
+	rm -rf $(HOST_DIR)/usr/lib/libffi-*
+endef
+
+HOST_LIBFFI_POST_INSTALL_HOOKS += HOST_LIBFFI_MOVE_HOST_HEADERS
+
 # Remove headers that are not at the usual location from the target
 define LIBFFI_REMOVE_TARGET_HEADERS
 	$(RM) -rf $(TARGET_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 70fbe02..02c969b 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -11,5 +11,7 @@ PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
 PYTHON_CFFI_LICENSE_FILES = LICENSE
+HOST_PYTHON_CFFI_DEPENDENCIES = host-python-pycparser host-libffi
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.1.4
