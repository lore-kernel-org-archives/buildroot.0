From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Apr 2019 19:43:59 +0200
Subject: [Buildroot] [PATCH] package/qemu: unset TARGET_DIR
Message-ID: <20190428174359.8908-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qemu uses TARGET_DIR internally, and it is at least used to display the
shortened compiling commands, like (with a TARGET_DIR=/path/to/target):

    CC /path/to/targetblock/write-threshold.o

There does not seem to be any adverse effect to that, but this is very
confusing to see, especially when building the host variant.

Fix that by unsetting TARGET_DIR prior to building.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
---
 package/qemu/qemu.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 30cd5972ef..19bcafa62f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -95,7 +95,8 @@ endif
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
-	( cd $(@D); \
+	unset TARGET_DIR; \
+	cd $(@D); \
 		LIBS='$(QEMU_LIBS)' \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -137,15 +138,16 @@ define QEMU_CONFIGURE_CMDS
 			--disable-capstone \
 			--disable-git-update \
 			--disable-opengl \
-			$(QEMU_OPTS) \
-	)
+			$(QEMU_OPTS)
 endef
 
 define QEMU_BUILD_CMDS
+	unset TARGET_DIR; \
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define QEMU_INSTALL_TARGET_CMDS
+	unset TARGET_DIR; \
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(QEMU_MAKE_ENV) DESTDIR=$(TARGET_DIR) install
 endef
 
@@ -264,6 +266,7 @@ endif
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
+	unset TARGET_DIR; \
 	cd $(@D); $(HOST_CONFIGURE_OPTS) CPP="$(HOSTCC) -E" \
 		./configure \
 		--target-list="$(HOST_QEMU_TARGETS)" \
@@ -277,10 +280,12 @@ define HOST_QEMU_CONFIGURE_CMDS
 endef
 
 define HOST_QEMU_BUILD_CMDS
+	unset TARGET_DIR; \
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define HOST_QEMU_INSTALL_CMDS
+	unset TARGET_DIR; \
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-- 
2.14.1
