From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 24 Jan 2014 16:24:24 +0100
Subject: [Buildroot] [PATCH] gtest: force static library build
Message-ID: <1390577064-16525-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While it seems possible to build gtest as a shared library, using it
in other projects requires to set some specific configuration flags
in these projects for correctly linking against the shared version
of the gtest library.

So, to avoid bothering many projects and keep things as they were so
far, we just force gtest to be built as a static library.

Fixes:
  http://autobuild.buildroot.net/results/20cbf90749672607cb277c676a45d2c0c3965fa0/
  http://autobuild.buildroot.net/results/5c6e58c51b2a14a7f23d296f771a76096b80362a/
  http://autobuild.buildroot.net/results/bde777d343e9c4884272893d0da3b113dcc75e3a/
  http://autobuild.buildroot.net/results/20cbf90749672607cb277c676a45d2c0c3965fa0/
  http://autobuild.buildroot.net/results/89a29d1f597dbc12a6fc8eb079133a84952fc612/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/gtest/gtest.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index e661d73..c7b2cf0 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -12,6 +12,15 @@ GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3c
 GTEST_LICENSE_FILES = LICENSE
 
+# While it is possible to build gtest as shared library, using this gtest shared
+# library requires to set some special configure option in the project using
+# gtest.
+# So, force to build gtest as a static library.
+#
+# For further details, refer to the explaination given in the README file from
+# the gtest sources.
+GTEST_CONF_OPT = -DBUILD_SHARED_LIBS=OFF
+
 define GTEST_EXTRACT_CMDS
 	unzip $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
 endef
-- 
1.8.5.3
