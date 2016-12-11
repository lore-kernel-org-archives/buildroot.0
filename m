From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:26:26 +0100
Subject: [Buildroot] [git commit] pkg-waf: add a common variable for each
	step
Message-ID: <20161211142730.261457FB3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2618115c20fc871d8e77f1c43c1c67fb94b09a44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some waf packages may want to pass additional variables to waf script
for each build step. Add the possibility to do so by defining
<pkg>_WAF_OPTS.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-waf.mk | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index f9d435e..2cdd654 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -52,6 +52,7 @@ endif
 $(2)_BUILD_OPTS 			?=
 $(2)_INSTALL_STAGING_OPTS 		?=
 $(2)_INSTALL_TARGET_OPTS 		?=
+$(2)_WAF_OPTS				?=
 
 #
 # Configure step. Only define it if not already defined by the package
@@ -65,7 +66,8 @@ define $(2)_CONFIGURE_CMDS
 	$$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) configure \
 		--prefix=/usr \
 		--libdir=/usr/lib \
-		$$($(2)_CONF_OPTS)
+		$$($(2)_CONF_OPTS) \
+		$$($(2)_WAF_OPTS)
 endef
 endif
 
@@ -77,7 +79,8 @@ ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
-		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS)
+		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS) \
+		$$($(2)_WAF_OPTS)
 endef
 endif
 
@@ -90,7 +93,8 @@ define $(2)_INSTALL_STAGING_CMDS
 	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
 		install --destdir=$$(STAGING_DIR) \
-		$$($(2)_INSTALL_STAGING_OPTS)
+		$$($(2)_INSTALL_STAGING_OPTS) \
+		$$($(2)_WAF_OPTS)
 endef
 endif
 
@@ -103,7 +107,8 @@ define $(2)_INSTALL_TARGET_CMDS
 	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
 		install --destdir=$$(TARGET_DIR) \
-		$$($(2)_INSTALL_TARGET_OPTS)
+		$$($(2)_INSTALL_TARGET_OPTS) \
+		$$($(2)_WAF_OPTS)
 endef
 endif
 
