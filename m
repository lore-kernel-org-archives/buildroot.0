From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Apr 2021 23:44:27 +0200
Subject: [Buildroot] [git commit] package/makedevs: define extract step to
 allow patching
Message-ID: <20210428211800.251BF861B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3355e31d2c70b19386ae9ed535a4bca68e669f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 
