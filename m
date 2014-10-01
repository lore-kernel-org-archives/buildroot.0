From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 1 Oct 2014 13:44:10 +0100
Subject: [Buildroot] [PATCH v2] opencv: Replace absolute path of static
	library with -l$library_name
Message-ID: <1412167450-26406-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some opencv modules are forced to build statically (for instance the
"ts" module) because they have a line like this one in their
CMakeLists.txt file:

  set(OPENCV_MODULE_TYPE STATIC)

That makes a static library get installed and also listed in the "Libs:"
line of the pkgconfig file (opencv.pc) along with all the shared
libraries. That can cause link failures in other packages which link to
opencv, for instance the gst1-plugins-bad package. Here is an example of
the link failure:

  CXXLD    libgstopencv.la

*** Warning: Linking the shared library libgstopencv.la against the
*** static library /usr/lib/libopencv_ts.a is not portable!
mips-linux-gnu-g++: error: /usr/lib/libopencv_ts.a: No such file or
directory
make[4]: *** [libgstopencv.la] Error 1

The solution is to not list the static library in the "Libs:" line of
the pkgconfig file and add '-lopencv_ts' instead.

This issue has been reported upstream:
  http://code.opencv.org/issues/3931

Fixes:
  http://autobuild.buildroot.net/results/e8a/e8a859276db34aff87ef181b0cce98916b0afc90/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/opencv/opencv.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 628624a..949dbfd 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -247,4 +247,12 @@ endef
 OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DATA
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_LIB_TS),y)
+define OPENCV_FIX_PC_FILE_LIBS
+	$(SED) '/^Libs:/s/$${exec_prefix}\/lib\/libopencv_ts.a/-lopencv_ts/' \
+	       $(STAGING_DIR)/usr/lib/pkgconfig/opencv.pc
+endef
+OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_FIX_PC_FILE_LIBS
+endif
+
 $(eval $(cmake-package))
-- 
1.7.1
