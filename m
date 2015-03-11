From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2015 23:30:20 +0100
Subject: [Buildroot] [PATCH 5/7] packages: generate services sub-menu
In-Reply-To: <cover.1426112628.git.yann.morin.1998@free.fr>
References: <cover.1426112628.git.yann.morin.1998@free.fr>
Message-ID: <85da70ce35318c97ef6b6d54cb42d61b40bcff7e.1426112628.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For each declared service, generate an entry in the services sub-menu.

This is a no-op for now: nothing is made of the enabled/disabled
services; also, no package defines services yes. Both will come in later
patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile               | 13 ++++++++++++-
 package/pkg-generic.mk |  5 +++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b53fcf5..599000c 100644
--- a/Makefile
+++ b/Makefile
@@ -829,7 +829,18 @@ endif
 
 .PHONY: $(BASE_DIR)/build/.services.in
 $(BASE_DIR)/build/.services.in:
-	@touch $(@)
+	@{ \
+	printf 'menu "Services to enable"\n\n'; \
+	$(foreach pkg,$(sort $(PACKAGES_WITH_SERVICES)),\
+		printf 'if BR2_PACKAGE_$(call UPPERCASE,$(pkg))\n\n'; \
+		printf 'comment "$(pkg) services"\n\n'; \
+		$(foreach srv,$($(call UPPERCASE,$(pkg))_SERVICES), \
+			printf 'config BR2_PACKAGE_$(call UPPERCASE,$(pkg))_SRV_$(call UPPERCASE,$(srv))\n'; \
+			printf '\tbool "$(srv)"\n\n'; \
+		)\
+		printf 'endif\n\n';) \
+	printf 'endmenu\n'; \
+	} >$(@)
 
 # printvars prints all the variables currently defined in our Makefiles
 printvars:
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ad4831b..7ea23ce 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -478,6 +478,11 @@ $(2)_POST_INSTALL_IMAGES_HOOKS  ?=
 $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 
+# Services to enable/disable
+ifneq ($$($(2)_SERVICES),)
+PACKAGES_WITH_SERVICES += $(1)
+endif
+
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
 
-- 
1.9.1
