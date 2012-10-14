From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Oct 2012 20:52:39 +0200
Subject: [Buildroot] [git commit] libv4l: properly error out when one of the
	make step fails
Message-ID: <20121014185341.D1B7999835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c28f5956f7da25071303411c8fef308065f2887
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In libv4l.mk, if there are multiple elements in $(LIBV4L_DIRS_y), they
are built in order, one after the other. However, our loop construct
doesn't take into account the fact that we should error out if one of
the steps failed.

A good illustration is having BR2_PACKAGE_LIBV4L_DECODE_TM6000 and
BR2_PACKAGE_LIBV4L_V4L2_CTL enabled. The build of decode-tm6000 will
fail, but the build will happily continue without stopping in libv4l.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libv4l/libv4l.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 6c782b0..15e48ed 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -24,19 +24,19 @@ endif
 define LIBV4L_BUILD_CMDS
 	for i in $(LIBV4L_DIRS_y); do \
 		$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/$$i \
-			$(LIBV4L_MAKE_OPTS); done
+			$(LIBV4L_MAKE_OPTS) || exit 1 ; done
 endef
 
 define LIBV4L_INSTALL_STAGING_CMDS
 	for i in $(LIBV4L_DIRS_y); do \
 		$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/$$i \
-			DESTDIR=$(STAGING_DIR) $(LIBV4L_MAKE_OPTS) install; done
+			DESTDIR=$(STAGING_DIR) $(LIBV4L_MAKE_OPTS) install || exit 1; done
 endef
 
 define LIBV4L_INSTALL_TARGET_CMDS
 	for i in $(LIBV4L_DIRS_y); do \
 		$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/$$i \
-			DESTDIR=$(TARGET_DIR) $(LIBV4L_MAKE_OPTS) install; done
+			DESTDIR=$(TARGET_DIR) $(LIBV4L_MAKE_OPTS) install || exit 1; done
 endef
 
 $(eval $(generic-package))
