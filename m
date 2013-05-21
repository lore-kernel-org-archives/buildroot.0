From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 21 May 2013 09:52:04 +0100
Subject: [Buildroot] [PATCH v2] ed: Convert to generic package infrastructure
Message-ID: <1369126324-7581-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

The package uses custom configure and Makefile files.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Changes since v1:
- whitespace cleanup
- Use $(TARGET_CONFIGURE_OPTS)
---
 package/ed/ed.mk | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 2bb8e0e..52ae1f0 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -11,4 +11,20 @@ ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 ED_LICENSE = GPLv3+
 ED_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+define ED_CONFIGURE_CMDS
+	(cd $(@D); \
+		./configure \
+		--prefix=/usr \
+		$(TARGET_CONFIGURE_OPTS) \
+	)
+endef
+
+define ED_BUILD_CMDS
+	$(MAKE)	-C $(@D)
+endef
+
+define ED_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
-- 
1.8.2.1
