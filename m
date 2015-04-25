From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:22:42 +0200
Subject: [Buildroot] [git commit] gtest: generate the gtest-config script
Message-ID: <20150425092418.2541080794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39186b5f5ac61c72d4b3d3088b7facbfd739abfa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gtest has moved from the autotools to CMake, but the CMake build
system is currently not installing the gtest-config script. Work
around that by installing it manually, after doing the necessary
sed-ing from the gtest-config.in template.

Reported-by: Carlos Santos <casantos@datacom.ind.br>
Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtest/gtest.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 7129c93..562acf0 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -30,6 +30,20 @@ define GTEST_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
 	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
+	# Generate the gtest-config script manually, since the CMake
+	# build system is not doing it.
+	sed 's%@PACKAGE_TARNAME@%gtest%;\
+		s%@PACKAGE_VERSION@%$(GTEST_VERSION)%;\
+		s%@prefix@%$(STAGING_DIR)/usr%;\
+		s%@exec_prefix@%$(STAGING_DIR)/usr%;\
+		s%@libdir@%$(STAGING_DIR)/usr/lib%;\
+		s%@includedir@%$(STAGING_DIR)/usr/include%;\
+		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
+		s%@PTHREAD_CFLAGS@%%;\
+		s%@PTHREAD_LIBS@%-lpthread%;' \
+		$(@D)/scripts/gtest-config.in \
+		> $(STAGING_DIR)/usr/bin/gtest-config
+	chmod +x $(STAGING_DIR)/usr/bin/gtest-config
 endef
 
 $(eval $(cmake-package))
