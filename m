From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:14:38 +0200
Subject: [Buildroot] [git commit] jimtcl: fix installation in
	BR2_STATIC_LIBS case
Message-ID: <20150401211756.95CC98191D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef854d14f1eb8baed98014d216be3b97e6b44f06
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed by Yann E. Morin in the review of
http://patchwork.ozlabs.org/patch/429533/, there was something fishy
in the jimtcl installation logic:

  ln -s libjim.$(JIMTCL_LIB) $(STAGING_DIR)/usr/lib/libjim.so

where JIMTCL_LIB has the value 'a' for BR2_STATIC_LIBS=y builds. Which
means we're linking libjim.so to libjim.a. Not great.

This commit therefore reworks the installation logic of the jimtcl.mk
package to install the shared library when BR2_STATIC_LIBS is not set,
and the static library when BR2_STATIC_LIBS is enabled. The macro
JIMTCL_INSTALL_LIB now takes as argument where the library should be
installed, so that it can be used for both the target and staging
installations.

Note that we can only either build the shared library *or* the static
library with the jimtcl build system. There is no possibility of
building both.

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jimtcl/jimtcl.mk |   18 ++++++++----------
 1 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index c2e04ff..e79e0f6 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -26,16 +26,15 @@ endef
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-JIMTCL_SHARED =
-JIMTCL_LIB = a
-JIMTCL_INSTALL_LIB =
+define JIMTCL_INSTALL_LIB
+	$(INSTALL) -m 0644 -D $(@D)/libjim.a $(1)/usr/lib/libjim.a
+endef
 else
 JIMTCL_SHARED = --shared
-JIMTCL_LIB = so.$(JIMTCL_VERSION)
 define JIMTCL_INSTALL_LIB
-	$(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) \
-		$(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB)
-	ln -s libjim.$(JIMTCL_LIB) $(TARGET_DIR)/usr/lib/libjim.so
+	$(INSTALL) -m 0755 -D $(@D)/libjim.so.$(JIMTCL_VERSION) \
+		$(1)/usr/lib/libjim.$(JIMTCL_VERSION)
+	ln -s libjim.$(JIMTCL_VERSION) $(1)/usr/lib/libjim.so
 endef
 endif
 
@@ -55,13 +54,12 @@ define JIMTCL_INSTALL_STAGING_CMDS
 	for i in $(JIMTCL_HEADERS_TO_INSTALL); do \
 		cp -a $(@D)/$$i $(STAGING_DIR)/usr/include/ || exit 1 ; \
 	done; \
-	$(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) $(STAGING_DIR)/usr/lib/libjim.$(JIMTCL_LIB);
-	ln -s libjim.$(JIMTCL_LIB) $(STAGING_DIR)/usr/lib/libjim.so
+	$(call JIMTCL_INSTALL_LIB,$(STAGING_DIR))
 endef
 
 define JIMTCL_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/jimsh $(TARGET_DIR)/usr/bin/jimsh
-	$(JIMTCL_INSTALL_LIB)
+	$(call JIMTCL_INSTALL_LIB,$(TARGET_DIR))
 	$(JIMTCL_LINK_TCLSH)
 endef
 
