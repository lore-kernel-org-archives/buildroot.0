From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jan 2014 21:58:45 +0100
Subject: [Buildroot] [git commit] gtest: force static library build
Message-ID: <20140126210518.9718E9C64D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34924f620d7151d8f1d4f5561c754cdd63ab10b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtest/gtest.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

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
