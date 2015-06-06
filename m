From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jun 2015 00:20:40 +0200
Subject: [Buildroot] [PATCH 04/11] package/igh-ethercat: use kernel-module
	helper
In-Reply-To: <cover.1433628825.git.yann.morin.1998@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
Message-ID: <63e68bf4982621f390bcf1e8735529e7039ad9a1.1433628825.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/igh-ethercat/igh-ethercat.mk | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index b5221f8..32c49a3 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -10,7 +10,6 @@ IGH_ETHERCAT_SOURCE = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
 IGH_ETHERCAT_LICENSE = GPLv2 (IgH EtherCAT master), LGPLv2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
 
-IGH_ETHERCAT_DEPENDENCIES = linux
 IGH_ETHERCAT_INSTALL_STAGING = YES
 
 IGH_ETHERCAT_CONF_OPTS = \
@@ -22,16 +21,5 @@ IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,
 IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e)
 IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
 
-define IGH_ETHERCAT_BUILD_MODULES
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules
-endef
-
-IGH_ETHERCAT_POST_BUILD_HOOKS += IGH_ETHERCAT_BUILD_MODULES
-
-define IGH_ETHERCAT_INSTALL_MODULES
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules_install
-endef
-
-IGH_ETHERCAT_POST_INSTALL_TARGET_HOOKS += IGH_ETHERCAT_INSTALL_MODULES
-
+$(eval $(kernel-module))
 $(eval $(autotools-package))
-- 
1.9.1
