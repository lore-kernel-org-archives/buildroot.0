From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 08:35:29 +0100
Subject: [Buildroot] [git commit] gstreamer: fix build on riscv
Message-ID: <20181118073519.D1C1E838B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b95c93bdfd0c46ee5384b2a883c171602af5d7f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RISC-V supports unaligned accesses, but these might run extremely slowly
depending on the implementation so set as_cv_unaligned_access to no on
this architecture, see:
https://gitlab.freedesktop.org/gstreamer/gstreamer/commit/8a156d1725ecd03f2e8cdc8874e081dda2d3b43d

Fixes:
 - http://autobuild.buildroot.org/results/dca32c929350311fca1a85e251d318b43c4a3177

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gstreamer/gstreamer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 88cc798828..2ec360c94d 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -15,7 +15,7 @@ GSTREAMER_LICENSE_FILES = COPYING
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze)$(BR2_nios2)$(BR2_or1k),y)
+ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze)$(BR2_nios2)$(BR2_or1k)$(BR2_riscv),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
