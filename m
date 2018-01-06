From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat,  6 Jan 2018 15:53:49 +0100
Subject: [Buildroot] [PATCH] libsepol: set PREFIX to generate proper .pc file
Message-ID: <20180106145349.3225-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libsepol/libsepol.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index c54c3bfc42..d94955023c 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -19,10 +19,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
 LIBSEPOL_MAKE_FLAGS += STATIC=1
 endif
 
+# DESTDIR is needed during the compile to compute library and header paths.
 define LIBSEPOL_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(STAGING_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(STAGING_DIR) PREFIX=/usr
 endef
 
 define LIBSEPOL_INSTALL_STAGING_CMDS
@@ -33,6 +34,7 @@ define LIBSEPOL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(TARGET_DIR)
 endef
 
+# DESTDIR is needed during the compile to compute library and header paths.
 HOST_LIBSEPOL_MAKE_ENV = \
 	$(HOST_MAKE_ENV) \
 	DESTDIR=$(HOST_DIR) \
-- 
2.15.1
