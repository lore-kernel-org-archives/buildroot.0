From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Dec 2020 09:22:05 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/libcap: fix
 libcap.pc
Message-ID: <20201212103040.E688183EA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=226803e2135532860be3e06809ddd7c18575f4af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

libcap builds an incorrect libcap.pc because libdir is pulled from the
host os:

ifndef lib
lib=$(shell ldd /usr/bin/ld|egrep "ld-linux|ld.so"|cut -d/ -f2)
endif

Fix this error by passing lib=lib and prefix in
{HOST_LIBCAP,LIBCAP}_BUILD_CMDS

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13276

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 07f8ea39139299c83777a338a30cd480633d5706)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap/libcap.mk | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 4919a4adca..54a42f7be4 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -28,7 +28,9 @@ endif
 
 LIBCAP_MAKE_FLAGS = \
 	BUILD_CC="$(HOSTCC)" \
-	BUILD_CFLAGS="$(HOST_CFLAGS)"
+	BUILD_CFLAGS="$(HOST_CFLAGS)" \
+	lib=lib \
+	prefix=/usr
 
 ifeq ($(BR2_PACKAGE_LIBCAP_TOOLS),y)
 define LIBCAP_BUILD_TOOLS_CMDS
@@ -51,23 +53,27 @@ endef
 
 define LIBCAP_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libcap $(LIBCAP_MAKE_FLAGS) \
-		DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib $(LIBCAP_MAKE_INSTALL_TARGET)
+		DESTDIR=$(STAGING_DIR) $(LIBCAP_MAKE_FLAGS) $(LIBCAP_MAKE_INSTALL_TARGET)
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libcap $(LIBCAP_MAKE_FLAGS) \
-		DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib $(LIBCAP_MAKE_INSTALL_TARGET)
+		DESTDIR=$(TARGET_DIR) $(LIBCAP_MAKE_FLAGS) $(LIBCAP_MAKE_INSTALL_TARGET)
 	$(LIBCAP_INSTALL_TOOLS_CMDS)
 endef
 
+HOST_LIBCAP_MAKE_FLAGS = \
+	lib=lib \
+	prefix=$(HOST_DIR) \
+	RAISE_SETFCAP=no
+
 define HOST_LIBCAP_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
-		RAISE_SETFCAP=no
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(HOST_LIBCAP_MAKE_FLAGS)
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) \
-		RAISE_SETFCAP=no lib=lib install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBCAP_MAKE_FLAGS) install
 endef
 
 $(eval $(generic-package))
