From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 13:10:21 +0100
Subject: [Buildroot] [git commit] libcap: Add optional support for libattr
	capabilities
Message-ID: <20130319121032.26CD49AE30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bf3d6f8cf3a2dca9ce1c6f3e68b077724f21db6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcap can optionally link to libattr to support extra
file capabilities. Link to this library and pull it as
dependency if BR2_PACKAGE_ATTR is selected.

[Peter: use LIBCAP_ prefix on variable]
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcap/libcap.mk |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index dcd3a18..6adac73 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -15,19 +15,27 @@ LIBCAP_LICENSE_FILES = License
 LIBCAP_DEPENDENCIES = host-libcap
 LIBCAP_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_ATTR),y)
+	LIBCAP_DEPENDENCIES += attr
+	LIBCAP_HAVE_LIBATTR = yes
+else
+	LIBCAP_HAVE_LIBATTR = no
+endif
+
 define LIBCAP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		LIBATTR=no BUILD_CC="$(HOSTCC)" BUILD_CFLAGS="$(HOST_CFLAGS)"
+		LIBATTR=$(LIBCAP_HAVE_LIBATTR) BUILD_CC="$(HOSTCC)" \
+		BUILD_CFLAGS="$(HOST_CFLAGS)"
 endef
 
 define LIBCAP_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(STAGING_DIR) \
-		prefix=/usr lib=lib install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
+		DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib install
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(TARGET_DIR) \
-		prefix=/usr lib=lib install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
+		DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib install
 endef
 
 # progs use fork()
