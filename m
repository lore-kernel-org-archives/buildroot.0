From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Oct 2018 18:32:59 +0200
Subject: [Buildroot] [scanrock 5/5] [RFC] pkg-luarocks: add per package
 upgrade target
In-Reply-To: <20181021163259.28335-1-francois.perrad@gadz.org>
References: <20181021163259.28335-1-francois.perrad@gadz.org>
Message-ID: <20181021163259.28335-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-generic.mk  | 6 +++++-
 package/pkg-luarocks.mk | 8 ++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 91b61c6de..f349c6c1f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -779,6 +779,9 @@ $(1)-external-deps:
 	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
 endif
 
+$(1)-upgrade:
+			+$$($(2)_UPGRADE_CMDS)
+
 $(1)-show-version:
 			@echo $$($(2)_VERSION)
 
@@ -1030,7 +1033,8 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 	$(1)-rsync \
 	$(1)-show-depends \
 	$(1)-show-version \
-	$(1)-source
+	$(1)-source \
+	$(1)-upgrade
 
 ifneq ($$($(2)_SOURCE),)
 ifeq ($$($(2)_SITE),)
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index e2b48cfb4..55f7300d3 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -44,6 +44,14 @@ $(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
 # a target package, and can just add the required dependencies
 $(2)_DEPENDENCIES	+= host-luarocks luainterpreter
 
+# Upgrade helper
+ifndef $(2)_UPGRADE_CMDS
+define $(2)_UPGRADE_CMDS
+	PATH=$(BR_PATH) \
+	utils/scanrock $$($(2)_NAME_UPSTREAM) $(1)
+endef
+endif
+
 #
 # Extract step. Extract into a temporary dir and move the relevant part to the
 # source dir.
-- 
2.17.1
