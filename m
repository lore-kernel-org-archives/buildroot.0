From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Mar 2016 00:04:55 +0100
Subject: [Buildroot] [PATCH 2/3] package/pax-utils: switch to autotools
In-Reply-To: <cover.1457305443.git.yann.morin.1998@free.fr>
References: <cover.1457305443.git.yann.morin.1998@free.fr>
Message-ID: <8b40df9919ccd68ba3389bdb961d9a57ca6948d4.1457305443.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: independently done a patch similar to the one
 by Thomas]
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pax-utils/pax-utils.mk | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index fc2e0ca..747c2bb 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -10,9 +10,21 @@ PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.xz
 PAX_UTILS_LICENSE = GPLv2
 PAX_UTILS_LICENSE_FILES = COPYING
 
+PAX_UTILS_DEPENDENCIES = host-pkgconf
+PAX_UTILS_CONF_OPTS = --without-python
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 PAX_UTILS_DEPENDENCIES += libcap
-PAX_UTILS_USE_CAP = USE_CAP=yes
+PAX_UTILS_CONF_OPTS += --with-caps
+else
+PAX_UTILS_CONF_OPTS += --without-caps
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+PAX_UTILS_DEPENDENCIES += libseccomp
+PAX_UTILS_CONF_OPTS += --with-seccomp
+else
+PAX_UTILS_CONF_OPTS += --without-seccomp
 endif
 
 # libcap is only useful for pspax (a running system)
@@ -26,22 +38,5 @@ endef
 endif
 PAX_UTILS_POST_INSTALL_TARGET_HOOKS += PAX_UTILS_REMOVE_BASH_TOOLS
 
-define HOST_PAX_UTILS_BUILD_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define PAX_UTILS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(PAX_UTILS_USE_CAP) -C $(@D)
-endef
-
-define HOST_PAX_UTILS_INSTALL_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) DESTDIR="$(HOST_DIR)" install
-endef
-
-define PAX_UTILS_INSTALL_TARGET_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		DESTDIR="$(TARGET_DIR)" install
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
