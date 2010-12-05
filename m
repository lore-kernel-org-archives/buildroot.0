From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:18 +0100
Subject: [Buildroot] [PATCH 47/55] linux: support a space-separated list of
	patches
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1baf7aad49e6e48e95506af55611e18d70e4209d.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The kernel being a component that often needs a fairly important set
of changes to be adapted to a particular hardware platform, having
maximum flexibility on the patching process is a nice
thing. Therefore, as per the discussions from the Buildroot Developer
Day, we add a mechanism to apply a list of patches (that could come
either from URLs, local files or local directories).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    9 +++++----
 linux/linux.mk  |   23 +++++++++++------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f10b34c..066723f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -70,11 +70,12 @@ config BR2_LINUX_KERNEL_VERSION
 #
 
 config BR2_LINUX_KERNEL_PATCH
-	string "Custom kernel patch"
+	string "Custom kernel patches"
 	help
-         The location can be an URL, a file path, or a directory. In
-         the case of a directory, all files matching linux-*.patch
-         will be applied.
+	  A space-separated list of patches to apply to the
+	  kernel. Each patch can be described as an URL, a local file
+	  path, or a directory. In the case of a directory, all files
+	  matching linux-*.patch in the directory will be applied.
 
 #
 # Configuration selection
diff --git a/linux/linux.mk b/linux/linux.mk
index 746eab0..96dd2ba 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -52,9 +52,8 @@ endif
 $(LINUX26_DIR)/.stamp_downloaded:
 	@$(call MESSAGE,"Downloading kernel")
 	$(call DOWNLOAD,$(LINUX26_SITE),$(LINUX26_SOURCE))
-ifneq ($(filter ftp://% http://%,$(LINUX26_PATCH)),)
-	$(call DOWNLOAD,$(dir $(LINUX26_PATCH)),$(notdir $(LINUX26_PATCH)))
-endif
+	$(foreach patch,$(filter ftp://% http://%,$(LINUX26_PATCH)),\
+		$(call DOWNLOAD,$(dir $(patch)),$(notdir $(patch)))$(sep))
 	mkdir -p $(@D)
 	touch $@
 
@@ -69,15 +68,15 @@ $(LINUX26_DIR)/.stamp_extracted: $(LINUX26_DIR)/.stamp_downloaded
 # Patch
 $(LINUX26_DIR)/.stamp_patched: $(LINUX26_DIR)/.stamp_extracted
 	@$(call MESSAGE,"Patching kernel")
-ifneq ($(LINUX26_PATCH),)
-ifneq ($(filter ftp://% http://%,$(LINUX26_PATCH)),)
-	toolchain/patch-kernel.sh $(@D) $(DL_DIR) $(notdir $(LINUX26_PATCH))
-else ifeq ($(shell test -d $(LINUX26_PATCH) && echo "dir"),dir)
-	toolchain/patch-kernel.sh $(@D) $(LINUX26_PATCH) linux-\*.patch
-else
-	toolchain/patch-kernel.sh $(@D) $(dir $(LINUX26_PATCH)) $(notdir $(LINUX26_PATCH))
-endif
-endif
+	for p in $(LINUX26_PATCH) ; do \
+		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
+			toolchain/patch-kernel.sh $(@D) $(DL_DIR) `basename $$p` ; \
+		elif test -d $$p ; then \
+			toolchain/patch-kernel.sh $(@D) $$p linux-\*.patch ; \
+		else \
+			toolchain/patch-kernel.sh $(@D) `dirname $$p` `basename $$p` ; \
+		fi \
+	done
 	$(Q)touch $@
 
 
-- 
1.7.0.4
