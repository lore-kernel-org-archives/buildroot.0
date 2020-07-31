From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:39 +0200
Subject: [Buildroot] [PATCH 14/15] package/refpolicy: fix the configure,
 build and install steps
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-15-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The refpolicy configure and build step were not correctly defined. The
configuration was split between the configure and build step, while both
the compilation and the installation were done in the install step. Fix
this by moving all the configuration within the configuration step and
by adding a call to make in the build step to compile the policy.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/refpolicy/refpolicy.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 51ac71075fb8..5c100168401c 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -95,7 +95,7 @@ define REFPOLICY_CONFIGURE_SYSTEMD
 endef
 endif
 
-define REFPOLICY_CONFIGURE_CMDS
+define REFPOLICY_CONFIGURE_BUILD
 	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
 		$(@D)/build.conf
 	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
@@ -103,13 +103,18 @@ define REFPOLICY_CONFIGURE_CMDS
 	$(REFPOLICY_CONFIGURE_SYSTEMD)
 endef
 
-define REFPOLICY_BUILD_CMDS
+define REFPOLICY_CONFIGURE_CMDS
+	$(REFPOLICY_CONFIGURE_BUILD)
 	$(if $(call qstrip,$(REFPOLICY_EXTRA_MODULES)),\
 		$(REFPOLICY_COPY_MODULES))
-	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) bare conf
+	$(REFPOLICY_MAKE) -C $(@D) bare conf
 	$(REFPOLICY_CONFIGURE_MODULES)
 endef
 
+define REFPOLICY_BUILD_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) policy
+endef
+
 define REFPOLICY_INSTALL_STAGING_CMDS
 	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) \
 		install-src install-headers
-- 
2.26.2
