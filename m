From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 21:44:20 +0200
Subject: [Buildroot] [git commit] alsa-lib: don't pass --with-softfloat
Message-ID: <20160704194826.C04D480160@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adef0fde326a70d9b46d6949df80aea3f2857960
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Passing this option disables the lfloat and ladsp pcm plugins and certain
APIs as explained by:

https://patchwork.ozlabs.org/patch/619527/

But people might want to use these even if they use software floating point,
and the size difference is really minimal, so don't pass this option.

-rwxr-xr-x 1 peko peko 774K Jul  4 18:50 target-orig/usr/lib/libasound.so.2.0.0
-rwxr-xr-x 1 peko peko 709K Jul  4 19:08 target-softfloat/usr/lib/libasound.so.2.0.0

If people don't want the extra pcm plugins then they can simply be disabled
using BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/alsa-lib.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index ae0377d..c2120c9 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -62,10 +62,6 @@ else
 ALSA_LIB_CONF_OPTS += --disable-python
 endif
 
-ifeq ($(BR2_SOFT_FLOAT),y)
-ALSA_LIB_CONF_OPTS += --with-softfloat
-endif
-
 ifeq ($(BR2_bfin),y)
 # blackfin external toolchains don't have versionsort. Fake it using alphasort
 # instead
