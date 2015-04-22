From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 22 Apr 2015 17:29:28 -0300
Subject: [Buildroot] [PATCH v2 1/1] gtest: update recipe to use autotools
In-Reply-To: <CAHkwnC-cZpP5m5009NiLZM07+t8CFSYVxqTBmNuXEA-x9mGwLg@mail.gmail.com>
References: <CAHkwnC-cZpP5m5009NiLZM07+t8CFSYVxqTBmNuXEA-x9mGwLg@mail.gmail.com>
Message-ID: <1429734568-20489-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous recipe build gtest using cmake, which prevented compiling
gmock (to be submitted in a following patch).

Gmock requires the gtest-config script, which is installed only if gtest
is built with autotools.

Change-Id: I71e52d2ccc19160ca936d80b41c127e79f1a7d6a
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/gtest/gtest.mk | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 7129c93..1176030 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -11,25 +11,20 @@ GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3c
 GTEST_LICENSE_FILES = LICENSE
-
-# While it is possible to build gtest as shared library, using this gtest shared
-# library requires to set some special configure option in the project using
-# gtest.
-# So, force to build gtest as a static library.
-#
-# For further details, refer to the explaination given in the README file from
-# the gtest sources.
-GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
+GTEST_CONF_OPTS = --enable-static --disable-shared
 
 define GTEST_EXTRACT_CMDS
 	$(UNZIP) $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
 endef
 
 define GTEST_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
-	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
+	$(INSTALL) -D -m 0644 $(@D)/lib/.libs/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
+	$(INSTALL) -D -m 0644 $(@D)/lib/.libs/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
+	$(INSTALL) -D -m 0644 $(@D)/scripts/gtest-config $(STAGING_DIR)/usr/lib/scripts/gtest-config
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
-	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/internal/
+	$(INSTALL) -D -m 0644 $(@D)/include/gtest/*.h* $(STAGING_DIR)/usr/include/gtest/
+	$(INSTALL) -D -m 0644 $(@D)/include/gtest/internal/*.h* $(STAGING_DIR)/usr/include/gtest/internal/
 endef
 
-$(eval $(cmake-package))
+$(eval $(autotools-package))
-- 
1.8.3.1
