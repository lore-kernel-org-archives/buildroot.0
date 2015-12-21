From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 16:56:53 +0100
Subject: [Buildroot] [PATCH 2/8 RFC] core/pkg-generic: use a $(foreach) loop
	to fix foo-config scripts
In-Reply-To: <cover.1450712392.git.yann.morin.1998@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
Message-ID: <9db77f2e0b231e340de82108b0b15b7ddc897a67.1450712392.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we fix all the foo-config scripts of a package in one sed
invocation. We can do so because we fix them in-place.

However, we're in the process of moving the fixed foo-config scripts to
their own directory, so we'll need to be able to sed them one by one.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1e024d3..69349f6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -238,6 +238,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
+		$(foreach s,$($(PKG)_CONFIG_SCRIPTS),\
 			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
 				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
 				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
@@ -245,7 +246,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
 				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
 				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
-				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
+				$(STAGING_DIR)/usr/bin/$(s); ) \
 	fi
 	@$(call MESSAGE,"Fixing libtool files")
 	$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
-- 
1.9.1
