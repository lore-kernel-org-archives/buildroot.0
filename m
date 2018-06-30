From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:04:15 +0200
Subject: [Buildroot] [git commit] gstreamer: fix build on AArch64 BE
Message-ID: <20180630160209.2A805835D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d3fa007dc35b21ced60a4048ed51358fff8aeac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We recently enabled AArch64 big-endian testing in the autobuilders,
and gstreamer started failing because it does an AC_TRY_RUN() test to
check if unaligned accesses are allowed or not. We already handled the
AArch64 LE case, but not the AArch64 BE case, so let's handle it.

Fixes:

  http://autobuild.buildroot.net/results/b061948b04b42e753e52607f395ed7c597a52c68/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer/gstreamer/gstreamer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 91230aac28..88cc798828 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -18,7 +18,7 @@ GSTREAMER_LICENSE_FILES = COPYING
 ifeq ($(BR2_arc)$(BR2_xtensa)$(BR2_microblaze)$(BR2_nios2)$(BR2_or1k),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
-ifeq ($(BR2_aarch64),y)
+ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=yes
 endif
 
