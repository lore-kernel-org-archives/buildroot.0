From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 02:21:34 +0200
Subject: [Buildroot] [PATCH 04/11 v3] package/igh-ethercat: use
	kernel-module helper
In-Reply-To: <cover.1436660369.git.yann.morin.1998@free.fr>
References: <cover.1436660369.git.yann.morin.1998@free.fr>
Message-ID: <a1f684748617ccb0ee8c3d3345a6fcc9362eaac3.1436660369.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

igh-ethercat's Makefile just contains calls to the Linux buildsystem,
that do exactly what we now do with our kernel-module infra.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
