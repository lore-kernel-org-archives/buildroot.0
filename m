From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 11 Oct 2018 18:12:48 +0200
Subject: [Buildroot] [V2 4/4] [RFC] pkg-perl: add per package upgrade target
In-Reply-To: <20181011161248.13457-1-francois.perrad@gadz.org>
References: <20181011161248.13457-1-francois.perrad@gadz.org>
Message-ID: <20181011161248.13457-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-generic.mk |  6 +++++-
 package/pkg-perl.mk    | 11 +++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

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
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 74a116075..53413b3eb 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -61,6 +61,17 @@ ifeq ($(4),target)
 SCANCPAN_ALL_DISTRIB += $$($(2)_DISTNAME)
 endif
 
+# Upgrade helper
+ifeq ($(4),target)
+define $(2)_UPGRADE_CMDS
+	utils/scancpan -force -target $$($(3)_DISTNAME)
+endef
+else
+define $(2)_UPGRADE_CMDS
+	utils/scancpan -force -host $$($(3)_DISTNAME)
+endef
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
-- 
2.17.1
