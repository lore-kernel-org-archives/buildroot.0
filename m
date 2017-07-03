From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 00:04:55 +0200
Subject: [Buildroot] [git commit] package/devmem2: fix legal-info
Message-ID: <20170703220337.16CA580796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1b630779f78e0413d8d70ffcc209e412c9f887f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1c6/1c69c77d7b378f6f76790fb5ca0078d0db0c40f8

devmem2 is a single C file that is downloaded as-is, and we patch it.
We also use that file as the license file.

Thus, the file when it is downloaded has a specific hash, but when
saved by legal-info, it has a different hash.

However, we can't store two different hashes for the same _filename_
with different content.

So, we extract the license file as a pre-patch hook, and store it in a
separate file, for which we can now add a hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/devmem2/devmem2.hash | 1 +
 package/devmem2/devmem2.mk   | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/devmem2/devmem2.hash b/package/devmem2/devmem2.hash
index fff5306..aa638d6 100644
--- a/package/devmem2/devmem2.hash
+++ b/package/devmem2/devmem2.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639  devmem2.c
+sha256 560913d09310d446920c16bd0aca1ff21d3b6fedd527195bacfc832ce343e0ae  devmem2.c.license
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index 45d3c99..eb92db6 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -8,12 +8,17 @@ DEVMEM2_SITE = http://free-electrons.com/pub/mirror
 DEVMEM2_SOURCE = devmem2.c
 DEVMEM2_VERSION = 1
 DEVMEM2_LICENSE = GPL-2.0+
-DEVMEM2_LICENSE_FILES = devmem2.c
+DEVMEM2_LICENSE_FILES = devmem2.c.license
 
 define DEVMEM2_EXTRACT_CMDS
 	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
 endef
 
+define DEVMEM2_EXTRACT_LICENSE
+	head -n 38 $(@D)/devmem2.c >$(@D)/devmem2.c.license
+endef
+DEVMEM2_PRE_PATCH_HOOKS += DEVMEM2_EXTRACT_LICENSE
+
 define DEVMEM2_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) devmem2
 endef
