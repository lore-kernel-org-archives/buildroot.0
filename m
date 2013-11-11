From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 22:00:09 +0100
Subject: [Buildroot] [PATCH 3/7] eigen: fix install rules
In-Reply-To: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
References: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1384203613-17871-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eigen provides a set of headers well-supported (in the Eigen directory),
and another one provided release "as-is", ie. with no real support
according to the README.txt; though other package may depend on these
headers.

Also, remove unnecessary files from installation:
- CMakeLists.txt files since the package does not use the cmake infra;
- doc sources;
- test and bench sources.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/eigen/eigen.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 5abd464..63e21e9 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -16,8 +16,14 @@ EIGEN_INSTALL_TARGET = NO
 # This package only consists of headers that need to be
 # copied over to the sysroot for compile time use
 define EIGEN_INSTALL_STAGING_CMDS
-	$(RM) -r $(STAGING_DIR)/usr/include/Eigen
-	cp -a $(@D)/Eigen $(STAGING_DIR)/usr/include/
+	for d in Eigen unsupported ; do \
+		$(RM) -r $(STAGING_DIR)/usr/include/$${d} ; \
+		rsync -ar --exclude=CMakeLists.txt \
+			--exclude=test \
+			--exclude=bench \
+			--exclude=doc \
+			$(@D)/$${d} $(STAGING_DIR)/usr/include/ ; \
+	done
 endef
 
 $(eval $(generic-package))
-- 
1.8.4.2
