From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:38 -0000
Subject: [Buildroot] [git commit branch/next] package/igh-ethercat: use
	kernel-module helper
Message-ID: <20150808105628.332A47FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95f52a7b7eac7696a6f627ba0cd68de11b12cfce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

igh-ethercat's Makefile just contains calls to the Linux buildsystem,
that do exactly what we now do with our kernel-module infra.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/igh-ethercat/igh-ethercat.mk |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

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
