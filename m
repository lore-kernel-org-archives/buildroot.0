From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 15:33:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20090128153310.4C6ED769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-28 15:33:08 +0000 (Wed, 28 Jan 2009)
New Revision: 25101

Log:
alsa-lib: fix build with largefile on 32bit archs

Thanks to Will Wagner <will_wagner@carallon.com> for reporting and working
with upstream to get it fixed. Patch from alsa-lib.git.

Added:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib-1.0.18-fix-off_t-in-kernel-struct.patch


Changeset:
Added: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib-1.0.18-fix-off_t-in-kernel-struct.patch
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib-1.0.18-fix-off_t-in-kernel-struct.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib-1.0.18-fix-off_t-in-kernel-struct.patch	2009-01-28 15:33:08 UTC (rev 25101)
@@ -0,0 +1,30 @@
+From c821f2e7f2534ece24a10402df3f501536a09cbd Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Wed, 28 Jan 2009 15:00:35 +0100
+Subject: [PATCH] Fix off_t in kernel struct
+
+The off_t in kernel struct (for ioctls) is actually different from the
+definition of user-space off_t.  The kernel off_t is equial with long
+while user-space off_t depends on the large-file support.
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+---
+ include/sound/asound.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/include/sound/asound.h b/include/sound/asound.h
+index 977b2d6..62d1e57 100644
+--- a/include/sound/asound.h
++++ b/include/sound/asound.h
+@@ -402,7 +402,7 @@ struct sndrv_pcm_sw_params {
+ 
+ struct sndrv_pcm_channel_info {
+ 	unsigned int channel;
+-	off_t offset;			/* mmap offset */
++	long offset;			/* mmap offset */
+ 	unsigned int first;		/* offset to first sample in bits */
+ 	unsigned int step;		/* samples distance in bits */
+ };
+-- 
+1.5.6.5
+
