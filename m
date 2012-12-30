From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Dec 2012 22:33:30 +0100
Subject: [Buildroot] [PATCH 6/8] scons: add host-python2-if-needed dependency
In-Reply-To: <cover.1356903063.git.s.martin49@gmail.com>
References: <cover.1356903063.git.s.martin49@gmail.com>
Message-ID: <099cb20cc058b466103e469591e49b67ff73c71c.1356903063.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, ensure $(HOST_DIR)/usr/bin is in the PATH during the configure phase.
---
 package/scons/scons.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 79fd6b1..e3ada92 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,12 +4,16 @@ SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSIO
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
 
+# Because Scons is not python3-friendly, we have to ensure that
+HOST_SCONS_DEPENDENCIES = host-python2-if-needed
+
 define HOST_SCONS_BUILD_CMDS
-	(cd $(@D); python setup.py build)
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) python setup.py build)
 endef
 
 define HOST_SCONS_INSTALL_CMDS
-	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr \
+	(cd $(@D) ; $(HOST_CONFIGURE_OPTS) python setup.py install \
+		--prefix=$(HOST_DIR)/usr \
 		--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION))
 endef
 
-- 
1.8.0.3
