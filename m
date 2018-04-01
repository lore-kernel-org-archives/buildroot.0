From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 1 Apr 2018 17:05:35 +0200
Subject: [Buildroot] [git commit] Allow adding per-package override rsync
 exclusions
Message-ID: <20180401150540.457E282D13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94e80d78cf22fd4daa047b42467638e3164874ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Arnout: move documentation to the end of the section]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/using-buildroot-development.txt | 16 ++++++++++++++++
 package/pkg-generic.mk                      |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
index 1071de5132..3389a37b39 100644
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -81,3 +81,19 @@ make busybox-rebuild all
 
 the root filesystem image in +output/images+ contains the updated
 BusyBox.
+
+Source trees for big projects often contain hundreds or thousands of
+files which are not needed for building, but will slow down the process
+of copying the sources with _rsync_. Optionally, it is possible define
++<pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS+ to skip syncing certain files
+from the source tree. For example, when working on the +webkitgtk+
+package, the following will exclude the tests and in-tree builds from
+a local WebKit source tree:
+
+------------------
+WEBKITGTK_OVERRIDE_SRCDIR = /home/bob/WebKit
+WEBKITGTK_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS = \
+	--exclude JSTests --exclude ManualTests --exclude PerformanceTests \
+	--exclude WebDriverTests --exclude WebKitBuild --exclude WebKitLibraries \
+	--exclude WebKit.xcworkspace --exclude Websites --exclude Examples
+------------------
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d870921def..84d77822d4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -168,7 +168,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
-	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
+	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
