From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 11 Feb 2020 18:55:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix build with atomic
Message-ID: <20200211175511.12719-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use HAVE_CXX_ATOMICS_WITHOUT_LIB variable to tell opencv3 to check for
atomic library and add it in $(REQUIRED_LIBRARIES) if needed (atomic
workaround was removed when bumping to version 3.4.9 in commit
id=f6fb2cae0691d25b034b12a16261ee26096db7d1 but it seems tha opencv3
still needs help to detect atomic library)

Fixes:
 - http://autobuild.buildroot.org/results/9162b29725f8d9b891eb74fcb8078f211140a841

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/opencv3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index fab6716340..ffe5ca44ae 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -347,6 +347,10 @@ OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_python3=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+OPENCV3_CONF_OPTS += -DHAVE_CXX_ATOMICS_WITHOUT_LIB=OFF
+endif
+
 # Installation hooks:
 define OPENCV3_CLEAN_INSTALL_DOC
 	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
-- 
2.24.1
