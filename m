From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jan 2015 16:33:40 +0100
Subject: [Buildroot] [git commit] read-edid: make available for !x86
Message-ID: <20150114153612.45CC27FFF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71539b69ae9bf521aaf8c2adb48545a9355dce5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is only the get-edid tool that is x86 specific, parse-edid builds and
works fine on other architectures so make it available everywhere.

Also drop the custom install step as 'make install' does the right thing.
This does cause us to install into /usr/sbin instead of /sbin, but as that
is what upstream wants we can consider that a bugfix.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/read-edid/Config.in    |    3 ++-
 package/read-edid/read-edid.mk |    5 -----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/read-edid/Config.in b/package/read-edid/Config.in
index bdcb7a7..f1ad1c4 100644
--- a/package/read-edid/Config.in
+++ b/package/read-edid/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_READ_EDID
 	bool "read-edid"
-	depends on BR2_i386
 	help
 	  Read-edid is a pair of tools for reading the EDID from a
 	  monitor.  It should work with most monitors made since 1996
@@ -11,4 +10,6 @@ config BR2_PACKAGE_READ_EDID
 	  which turns the raw binary information into an
 	  XF86Config-compatible monitor section.
 
+	  Notice that the get-edid tool is only available on x86.
+
 	  http://polypux.org/projects/read-edid/
diff --git a/package/read-edid/read-edid.mk b/package/read-edid/read-edid.mk
index 54064d3..f047e79 100644
--- a/package/read-edid/read-edid.mk
+++ b/package/read-edid/read-edid.mk
@@ -13,9 +13,4 @@ define READ_EDID_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
-define READ_EDID_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/get-edid $(TARGET_DIR)/sbin/get-edid
-	$(INSTALL) -D -m 0755 $(@D)/parse-edid $(TARGET_DIR)/sbin/parse-edid
-endef
-
 $(eval $(autotools-package))
