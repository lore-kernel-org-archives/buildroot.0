From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 May 2013 21:59:28 +0200
Subject: [Buildroot] [git commit branch/next] ed: Convert to generic package
	infrastructure
Message-ID: <20130526205234.825D99A58B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a37b625e2d89cf64674f320de39d743db080c03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The package uses custom configure and Makefile files.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ed/ed.mk |   18 +++++++++++++++++-
 1 files changed, 17 insertions(+), 1 deletions(-)

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
