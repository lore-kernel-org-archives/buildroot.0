From: Touhtarian, Eric <etouhtarian@distech-controls.com>
Date: Thu, 1 Oct 2020 14:49:02 +0000
Subject: [Buildroot] TR: [PATCH 1/1] Set external version into os-release
In-Reply-To: <20200917153243.8745-1-etouhtarian@distech-controls.com>
References: <20200917153243.8745-1-etouhtarian@distech-controls.com>
Message-ID: <DM6PR01MB4137169BE8F2D5C93A2D89DA8A300@DM6PR01MB4137.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Touhtarian <etouhtarian@distech-controls.com>
---
 Makefile                        | 16 ++++++++++++++--
 support/scripts/setlocalversion | 15 ++++++++++++---
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index b2afe5bcfb..e6693d2f45 100644
--- a/Makefile
+++ b/Makefile
@@ -111,9 +111,12 @@ CONFIG_CONFIG_IN = Config.in  CONFIG = support/kconfig  DATE := $(shell date +%Y%m%d)
 
+define setlocalversion
+$(shell $(TOPDIR)/support/scripts/setlocalversion $(1) $(2)) endef
 # Compute the full local version string so packages can use it as-is  # Need to export it, so it can be got from environment in children (eg. mconf) -export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
+export BR2_VERSION_FULL := $(BR2_VERSION)$(call setlocalversion)
 
 # List of targets and target patterns for which .config doesn't need to be read in  noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \ @@ -740,6 +743,14 @@ host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
 .PHONY: staging-finalize
 staging-finalize: $(STAGING_DIR_SYMLINK)
 
+define set-external-info
+index=1; \
+$(foreach ext, $(BR2_EXTERNAL_DIRS), \
+	echo "EXTERNAL_$${index}_PATH=$(ext)"; \
+	echo "EXTERNAL_$${index}_VERSION=\"$(call setlocalversion,"--unmodify-version", $(ext))\""; \
+	index=$$(expr $$index + 1); )
+endef
+
 .PHONY: target-finalize
 target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
 	@$(call MESSAGE,"Finalizing target directory") @@ -779,7 +790,8 @@ endif
 		echo "VERSION=$(BR2_VERSION_FULL)"; \
 		echo "ID=buildroot"; \
 		echo "VERSION_ID=$(BR2_VERSION)"; \
-		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
+		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\""; \
+		$(call set-external-info) \
 	) >  $(TARGET_DIR)/usr/lib/os-release
 	ln -sf ../usr/lib/os-release $(TARGET_DIR)/etc
 
diff --git a/support/scripts/setlocalversion b/support/scripts/setlocalversion index b39b751f03..459b4765fa 100755
--- a/support/scripts/setlocalversion
+++ b/support/scripts/setlocalversion
@@ -10,10 +10,16 @@
 #
 
 usage() {
-	echo "Usage: $0 [srctree]" >&2
+	echo "Usage: $0 [--unmodify-version] [srctree]" >&2
 	exit 1
 }
 
+original_ver=false
+if test "$1" = "--unmodify-version"; then
+	original_ver=true
+	shift
+fi
+
 cd "${1:-.}" || usage
 
 # Check for git and a git repo.
@@ -26,8 +32,11 @@ if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
 		# If we are past a tagged commit (like "v2.6.30-rc5-302-g72357d5"),
 		# we pretty print it.
 		if atag="`git describe 2>/dev/null`"; then
-			echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
-
+			if $original_ver; then
+				printf $atag
+			else
+				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
+			fi
 		# If we don't have a tag at all we print -g{commitish}.
 		else
 			printf '%s%s' -g $head
--
2.17.1
