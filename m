From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Sep 2016 11:59:07 +0200
Subject: [Buildroot] [git commit] toolchain-external: fix potential entire
	root filesystem removal
Message-ID: <20160915100429.CF4D88226D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b171466c445dbdd39d5084dd4e4c138a7051d99a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit a0aa7e0e1750f6ace2879ea8adb1425a41431b79 and reworks
the code to fix a major and potentially catastrophic bug when the
following conditions are met:

 - The user has selected a "known toolchain profile", such as a Linaro
   toolchain, a Sourcery CodeBench toolchain etc. People using "custom
   toolchain profile" are not affected.

 - The user has enabled BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y to
   indicate that the toolchain is already locally available (as
   opposed to having Buildroot download and extract the toolchain)

 - The user has left BR2_TOOLCHAIN_EXTERNAL_PATH empty, because his
   toolchain is directly available through the PATH environment
   variable. When BR2_TOOLCHAIN_EXTERNAL_PATH is non-empty, Buildroot
   will do something silly (remove the toolchain contents), but that
   are limited to the toolchain itself.

When such conditions are met, Buildroot will run "rm -rf /*" due to
TOOLCHAIN_EXTERNAL_INSTALL_DIR being empty.

This bug does not exist in 2016.05, and appeared in 2016.08 due to
commit a0aa7e0e1750f6ace2879ea8adb1425a41431b79.

Commit a0aa7e0e1750f6ace2879ea8adb1425a41431b79 removed the assignment
of TOOLCHAIN_EXTERNAL_SOURCE and TOOLCHAIN_EXTERNAL_SITE to empty, as
part of a global cleanup to remove such assignments that supposedly
had become unneeded following a fix of the package infrastructure
(75630eba22b20d6140a5b58a6d1e35598fb3c0d3: core: do not attempt
downloads with no _VERSION set).

However, this causes TOOLCHAIN_EXTERNAL_SOURCE to be non-empty even
for BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y configuration, with the
following consequences:

 - Buildroot downloads the toolchain tarball (while we're saying the
   toolchain is already available). Not dramatic, but clearly buggy.

 - Buildroot registers a post-extract hook that moves the toolchain
   from its extract directory (output/build/toolchain-external-.../ to
   its final location in host/opt/ext-toolchain/). Before doing this,
   it removes everything in TOOLCHAIN_EXTERNAL_INSTALL_DIR (which
   should normally be host/opt/ext-toolchain/).

Another mistake that caused the bug is commit
b731dc7bfb9c8ce7be502711f0b44ccab5515f1d ("toolchain-external: make
extraction idempotent"), which introduce the dangerous call "rm -rf
$(var)/*", which can be catastrophic if by mistake $(var) is
empty. Instead, this commit should have just used rm -rf $(var) to
remove the directory instead: it would have failed without consequences
if $(var) is empty, and the directory was anyway already re-created
right after with a mkdir.

To address this problem, we:

 - Revert commit a0aa7e0e1750f6ace2879ea8adb1425a41431b79, so that
   _SOURCE and _SITE are empty in the pre-installed toolchain case.

 - Rework the code to ensure that similar problems will no happen in the
   future, by:

   - Registering the TOOLCHAIN_EXTERNAL_MOVE hook only when
     BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y, since moving the toolchain is
     only needed when Buildroot downloaded the toolchain.

   - Introduce a variable TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR which
     is the path in which Buildroot installs external toolchains when it
     is in charge of downloading/extracting them. Then, the
     TOOLCHAIN_EXTERNAL_MOVE hook is changed to use this variable, which
     is guaranteed to be non-empty.

   - Replace the removal of the directory contents $(var)/* by removing
     the directory itself $(var). The directory was anyway already
     re-created if needed afterwards. Thanks to doing this, if $(var)
     ever becomes empty, we will do "rm -rf" which will fail and abort
     the build, and not the catastrophic "rm -rf /*".

Reported-by: Mason <slash.tmp@free.fr>
Cc: Mason <slash.tmp@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 8de3247..ad258b8 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -138,8 +138,10 @@ TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
 
 TOOLCHAIN_EXTERNAL_PREFIX = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
+TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain
+TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
 else
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 endif
@@ -454,21 +456,29 @@ TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= \
 	$(subst -i686-pc-linux-gnu.tar.bz2,.src.tar.bz2,$(subst -i686-pc-linux-gnu-i386-linux.tar.bz2,-i686-pc-linux-gnu.src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE)))
 endif
 
+# In fact, we don't need to download the toolchain, since it is already
+# available on the system, so force the site and source to be empty so
+# that nothing will be downloaded/extracted.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED),y)
+TOOLCHAIN_EXTERNAL_SITE =
+TOOLCHAIN_EXTERNAL_SOURCE =
+endif
+
 TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
 
 # Normal handling of downloaded toolchain tarball extraction.
-ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_EXCLUDES = usr/lib/locale/*
 
 # As a regular package, the toolchain gets extracted in $(@D), but
 # since it's actually a fairly special package, we need it to be moved
-# into TOOLCHAIN_EXTERNAL_INSTALL_DIR.
+# into TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR.
 define TOOLCHAIN_EXTERNAL_MOVE
-	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/*
-	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
-	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
+	rm -rf $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
+	mkdir -p $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
+	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)/
 endef
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
 	TOOLCHAIN_EXTERNAL_MOVE
