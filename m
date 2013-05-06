From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 23:58:27 +0200
Subject: [Buildroot] [git commit] ebtables: fix static build
Message-ID: <20130506221623.54E1899C7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ee4b6946ef87533ad29d1c2438b1d4ffbf8ca5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ebtables has a funky way of building the static version.
Fixes:
http://autobuild.buildroot.net/results/f5916d84194b6aa02d8eca7cbbb4e7867bb6afd4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ebtables/ebtables.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 3f667ba..7ccdcb4 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -9,11 +9,19 @@ EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
 EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(EBTABLES_VERSION)
 EBTABLES_LICENSE = GPLv2
 EBTABLES_LICENSE_FILES = COPYING
+EBTABLES_STATIC = $(if $(BR2_PREFER_STATIC_LIB),static)
 
 define EBTABLES_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LIBDIR=/lib/ebtables -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) LIBDIR=/lib/ebtables $(EBTABLES_STATIC) \
+		-C $(@D)
 endef
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define EBTABLES_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/static \
+		$(TARGET_DIR)/sbin/ebtables
+endef
+else
 define EBTABLES_INSTALL_TARGET_CMDS
 	for so in $(@D)/$(EBTABLES_SUBDIR)/*.so \
 		$(@D)/$(EBTABLES_SUBDIR)/extensions/*.so; \
@@ -24,6 +32,7 @@ define EBTABLES_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables \
 		$(TARGET_DIR)/sbin/ebtables
 endef
+endif
 
 define EBTABLES_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/lib/ebtables
