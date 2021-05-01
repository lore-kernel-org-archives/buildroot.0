From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 May 2021 14:17:05 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/mkpimage: define
 extract step to allow patching
Message-ID: <20210501115434.B7DC28654B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8396da40d4fd6dc81a70a52454f0320e66f15dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

As recently discussed on the list:
http://lists.busybox.net/pipermail/buildroot/2021-April/308373.html

Packages like mkpimage where the source code is included in the Buildroot
tree, currently doesn't use an extract step (which also skips the patch
step), so they cannot be patched by a patch in BR2_GLOBAL_PATCH_DIR (or the
pkgdir), which is a bit confusing.

As a fix, add a simple extract step that copies the source file to the build
directory, so the patch step gets run as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 89d4e1ccdbef234b227a2fa33666e0d89e508a82)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mkpimage/mkpimage.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/mkpimage/mkpimage.mk b/package/mkpimage/mkpimage.mk
index 8e08013f91..71500f00f3 100644
--- a/package/mkpimage/mkpimage.mk
+++ b/package/mkpimage/mkpimage.mk
@@ -9,9 +9,13 @@ HOST_MKPIMAGE_LICENSE = GPL-2.0
 # source included in the package
 # came from barebox's repository:
 # https://git.pengutronix.de/cgit/barebox/tree/scripts/socfpga_mkimage.c?id=55d29525146dcd280987dfd565bfd34f08858fb3
+define HOST_MKPIMAGE_EXTRACT_CMDS
+	cp $(HOST_MKPIMAGE_PKGDIR)/mkpimage.c $(@D)
+endef
+
 define HOST_MKPIMAGE_BUILD_CMDS
 	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
-		package/mkpimage/mkpimage.c -o $(@D)/mkpimage
+		$(@D)/mkpimage.c -o $(@D)/mkpimage
 endef
 
 define HOST_MKPIMAGE_INSTALL_CMDS
