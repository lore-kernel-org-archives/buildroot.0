From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 13:23:34 +0200
Subject: [Buildroot] [git commit] icu: fix build after custom data library
	patch
Message-ID: <20140729112444.DF9029D2F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4019fcaa940b9687bd337e8546b4c009428595e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit abded6bfead49d61c24a45d811a83ca082adf677 ("icu: add an option
to add a custom data library file") broke the build because of an
improper test on a non-qstripped variable. This commit fixes that.

Fixes:

  http://autobuild.buildroot.org/results/02a/02a0800b01a4bf8734d601f79dc12663fe8f7542/
  and many other similar occurences of the same issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/icu/icu.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 208229d..0312fac 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -26,9 +26,11 @@ ICU_MAKE = $(MAKE1)
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
-ifneq ($(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH),)
+ICU_CUSTOM_DATA_PATH = $(call qstrip,$(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH))
+
+ifneq ($(ICU_CUSTOM_DATA_PATH),)
 define ICU_COPY_CUSTOM_DATA
-	cp $(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH) $(@D)/source/data/in/
+	cp $(ICU_CUSTOM_DATA_PATH) $(@D)/source/data/in/
 endef
 ICU_POST_PATCH_HOOKS += ICU_COPY_CUSTOM_DATA
 endif
