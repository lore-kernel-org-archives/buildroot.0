From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:46:26 +0200
Subject: [Buildroot] [PATCH 1/3] package/makedevs: define extract step to
 allow patching
Message-ID: <20210426214628.20941-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As recently discussed on the list:
http://lists.busybox.net/pipermail/buildroot/2021-April/308373.html

Packages like makedevs where the source code is included in the Buildroot
tree, currently doesn't use an extract step (which also skips the patch
step), so they cannot be patched by a patch in BR2_GLOBAL_PATCH_DIR (or the
pkgdir), which is a bit confusing.

As a fix, add a simple extract step that copies the source file to the build
directory, so the patch step gets run as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/makedevs/makedevs.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 36837a191e..9b0f44610c 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -15,8 +15,12 @@ HOST_MAKEDEVS_CFLAGS += -DEXTENDED_ATTRIBUTES
 HOST_MAKEDEVS_LDFLAGS += -lcap
 endif
 
+define HOST_MAKEDEVS_EXTRACT_CMDS
+	cp $(HOST_MAKEDEVS_PKGDIR)/makedevs.c $(@D)
+endef
+
 define HOST_MAKEDEVS_BUILD_CMDS
-	$(HOSTCC) $(HOST_MAKEDEVS_CFLAGS) package/makedevs/makedevs.c \
+	$(HOSTCC) $(HOST_MAKEDEVS_CFLAGS) $(@D)/makedevs.c \
 		-o $(@D)/makedevs $(HOST_MAKEDEVS_LDFLAGS)
 endef
 
-- 
2.20.1
