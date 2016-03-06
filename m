From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2016 00:02:44 +0100
Subject: [Buildroot] [git commit] erlang: remove unwanted packages from
	staging too
Message-ID: <20160306230259.E08667FEEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb0f32a057c62b8a4d19b8c1c95bf4a76dabb693
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes an issue where an Erlang program compiles fine against files
in staging, but fails to run on the target due to the unwanted packages
being removed.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/erlang.mk | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 638d2c2..3732d44 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -67,14 +67,20 @@ ifeq ($(BR2_PACKAGE_ERLANG_SMP),)
 ERLANG_CONF_OPTS += --disable-smp-support
 endif
 
-# Remove source, example, gs and wx files from the target
+# Remove source, example, gs and wx files from staging and target.
 ERLANG_REMOVE_PACKAGES = gs wx
 
 ifneq ($(BR2_PACKAGE_ERLANG_MEGACO),y)
 ERLANG_REMOVE_PACKAGES += megaco
 endif
 
-define ERLANG_REMOVE_UNUSED
+define ERLANG_REMOVE_STAGING_UNUSED
+	for package in $(ERLANG_REMOVE_PACKAGES); do \
+		rm -rf $(STAGING_DIR)/usr/lib/erlang/lib/$${package}-*; \
+	done
+endef
+
+define ERLANG_REMOVE_TARGET_UNUSED
 	find $(TARGET_DIR)/usr/lib/erlang -type d -name src -prune -exec rm -rf {} \;
 	find $(TARGET_DIR)/usr/lib/erlang -type d -name examples -prune -exec rm -rf {} \;
 	for package in $(ERLANG_REMOVE_PACKAGES); do \
@@ -82,7 +88,8 @@ define ERLANG_REMOVE_UNUSED
 	done
 endef
 
-ERLANG_POST_INSTALL_TARGET_HOOKS += ERLANG_REMOVE_UNUSED
+ERLANG_POST_INSTALL_STAGING_HOOKS += ERLANG_REMOVE_STAGING_UNUSED
+ERLANG_POST_INSTALL_TARGET_HOOKS += ERLANG_REMOVE_TARGET_UNUSED
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
