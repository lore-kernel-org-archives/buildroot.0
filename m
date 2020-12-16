From: Paul Soucy <paul.soucy@sense.com>
Date: Wed, 16 Dec 2020 12:44:04 -0500
Subject: [Buildroot] [PATCH 1/1] package/gtest: host-gtest install like a
 normal cmake package
Message-ID: <20201216174404.47363-1-paul.soucy@sense.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-gtest does not actually build and install gtest libraries or header files, it just installs the gmock_gen stuff. This patch will now build and install gtest to the host like a normal cmake package.

Signed-off-by: Paul Soucy <paul.soucy@sense.com>
---
 package/gtest/gtest.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 7f967b8bfb..f35ae63383 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -88,14 +88,15 @@ else
 GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
 endif
 
-define HOST_GTEST_INSTALL_CMDS
+define HOST_GTEST_POST_INSTALL_PYTHON
 	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
 		$(HOST_DIR)/bin/gmock_gen
 	cp -rp $(@D)/googlemock/scripts/generator/cpp \
 		$(HOST_GTEST_GMOCK_PYTHONPATH)
 endef
 
+HOST_GTEST_POST_INSTALL_HOOKS += HOST_GTEST_POST_INSTALL_PYTHON
+
+
 $(eval $(cmake-package))
-# The host package does not build anything, just installs gmock_gen stuff, so
-# it does not need to be a host-cmake-package.
-$(eval $(host-generic-package))
+$(eval $(host-cmake-package))
-- 
2.24.1 (Apple Git-126)
