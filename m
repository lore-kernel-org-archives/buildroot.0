From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:49:50 +0200
Subject: [Buildroot] [git commit] guile: handle readline support explicitly
Message-ID: <20151014215342.77C987FB77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8ce3d329778f39f097d959ac631cfff7d05bf49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the host readline (+ncurses) development files can poison the
build causing breakage. Fixes:
http://autobuild.buildroot.net/results/d0a/d0a8ad9d3f19592e06df36408d6af745f7908165/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/guile/guile.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 2bd7198..0e0b1a3 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -32,6 +32,16 @@ ifeq ($(BR2_STATIC_LIBS),y)
 GUILE_CFLAGS += -DGC_NO_DLOPEN
 endif
 
+# It can use readline, but on the condition that it was build against
+# ncurses. If both aren't present disable readline support since the
+# host readline/ncurses support can poison the build.
+ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
+GUILE_CONF_OPTS += --with-libreadline-prefix=$(STAGING_DIR)/usr
+GUILE_DEPENDENCIES += readline
+else
+GUILE_CONF_OPTS += --without-libreadline-prefix
+endif
+
 GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
 	CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
 
