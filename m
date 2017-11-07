From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue,  7 Nov 2017 03:57:30 +0200
Subject: [Buildroot] [PATCH 1/1] Allow adding per-package overrlice rsync
 exclusions
Message-ID: <20171107015730.20311-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows using <PKG>_SRCDIR_OVERRIDE_RSYNC_EXCLUSIONS in local.mk to
skip copying parts of source trees unneeded for building. For example,
when developing WebKitGTK+, it's handy to skip copying all the tests and
other build directories, which are huge:

    WEBKITGTK_OVERRIDE_SRCDIR = /home/aperez/WebKit
    WEBKITGTK_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS = \
        --exclude JSTests --exclude ManualTests \
	--exclude PerformanceTests --exclude WebDriverTests \
	--exclude WebKitBuild --exclude WebKitLibraries \
	--exclude WebKit.xcworkspace --exclude Websites \
	--exclude Examples

This saves a good chunk of time when rsync is used for the first time to
copy the source tree over before building.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0e28675fbe..c895afc498 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -181,7 +181,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
-	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
+	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
-- 
2.15.0
