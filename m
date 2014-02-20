From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2014 22:50:42 +0100
Subject: [Buildroot] [git commit] libsepol: really fix static library build
Message-ID: <20140220215248.A846A9CAF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=777f3b56be9debbf75f5f08b5e3f2a86811e5fbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 52eeb04c7608b9675bd8c2d57d3a4d1373ee72ad ('libsepol: fix
static-only library build') I forgot to git add the changes made to
the libsepol.mk file itself. Those changes are needed to actually pass
STATIC=<something> when building static libraries only.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsepol/libsepol.mk |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index c359cd7..19b193c 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -11,18 +11,24 @@ LIBSEPOL_LICENSE_FILES = COPYING
 
 LIBSEPOL_INSTALL_STAGING = YES
 
+LIBSEPOL_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS)
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBSEPOL_MAKE_FLAGS += STATIC=1
+endif
+
 define LIBSEPOL_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR)
+	$(MAKE) -C $(@D) $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(STAGING_DIR)
 endef
 
 define LIBSEPOL_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) install $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR)
+	$(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(STAGING_DIR)
 endef
 
 define LIBSEPOL_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) install $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR)
+	$(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(TARGET_DIR)
 endef
 
 define HOST_LIBSEPOL_BUILD_CMDS
