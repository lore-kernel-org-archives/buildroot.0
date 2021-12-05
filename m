Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4A4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 15:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8270683103;
	Sun,  5 Dec 2021 15:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pCGIAhOxrt2H; Sun,  5 Dec 2021 15:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C32B383083;
	Sun,  5 Dec 2021 15:39:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D931F1BF57C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C958960642
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZOAHYC0Qx9z for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:39:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D02606062E
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:39:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E62F280139; Sun,  5 Dec 2021 15:34:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 16:35:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 086c96b4527425e0b4e1adf0531c83ea7f617c02
X-Git-Newrev: 2f5068640161f7b267099e28b69d4c2280b4ded3
X-Patchwork-Hint: ignore
Message-Id: <20211205153452.E62F280139@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: fix mount -a
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f5068640161f7b267099e28b69d4c2280b4ded3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14351

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...mark-cache-as-probed-if-sys-not-available.patch | 141 +++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch b/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
new file mode 100644
index 0000000000..bfc8f60834
--- /dev/null
+++ b/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
@@ -0,0 +1,141 @@
+From 84d38ae3eca523ef990cb848563cc63de25266e6 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Fri, 19 Nov 2021 14:19:03 +0100
+Subject: [PATCH] libblkid: don't mark cache as "probed" if /sys not available
+
+For "mount --all" we need to read the cache more than once in a short
+time. The library checks the delay between probes, and if the delay is
+too short, it does not read devices. This is a problem on boot when there
+are no /sys, and the cache is empty. In this case, we need to check
+for /sys until it's available constantly.
+
+https://github.com/util-linux/util-linux/issues/1492
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+[Retrieved from:
+https://github.com/util-linux/util-linux/commit/84d38ae3eca523ef990cb848563cc63de25266e6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libblkid/src/devname.c | 26 +++++++++++++++++---------
+ libblkid/src/resolve.c |  2 +-
+ libblkid/src/tag.c     |  8 +++++---
+ 3 files changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/libblkid/src/devname.c b/libblkid/src/devname.c
+index 90a8245fc9..9a173e3489 100644
+--- a/libblkid/src/devname.c
++++ b/libblkid/src/devname.c
+@@ -429,6 +429,8 @@ sysfs_probe_all(blkid_cache cache, int only_if_new, int only_removable)
+ 	if (!sysfs)
+ 		return -BLKID_ERR_SYSFS;
+ 
++	DBG(DEVNAME, ul_debug(" probe /sys/block"));
++
+ 	/* scan /sys/block */
+ 	while ((dev = xreaddir(sysfs))) {
+ 		DIR *dir = NULL;
+@@ -533,14 +535,18 @@ sysfs_probe_all(blkid_cache cache, int only_if_new, int only_removable)
+ /*
+  * Read the device data for all available block devices in the system.
+  */
+-static int probe_all(blkid_cache cache, int only_if_new)
++static int probe_all(blkid_cache cache, int only_if_new, int update_interval)
+ {
++	int rc;
++
+ 	if (!cache)
+ 		return -BLKID_ERR_PARAM;
+ 
+ 	if (cache->bic_flags & BLKID_BIC_FL_PROBED &&
+-	    time(NULL) - cache->bic_time < BLKID_PROBE_INTERVAL)
++	    time(NULL) - cache->bic_time < BLKID_PROBE_INTERVAL) {
++		DBG(PROBE, ul_debug("don't re-probe [delay < %d]", BLKID_PROBE_INTERVAL));
+ 		return 0;
++	}
+ 
+ 	blkid_read_cache(cache);
+ #ifdef VG_DIR
+@@ -548,7 +554,13 @@ static int probe_all(blkid_cache cache, int only_if_new)
+ #endif
+ 	ubi_probe_all(cache, only_if_new);
+ 
+-	sysfs_probe_all(cache, only_if_new, 0);
++	rc = sysfs_probe_all(cache, only_if_new, 0);
++
++	/* Don't mark the change as "probed" if /sys not avalable */
++	if (update_interval && rc == 0) {
++		cache->bic_time = time(NULL);
++		cache->bic_flags |= BLKID_BIC_FL_PROBED;
++	}
+ 
+ 	blkid_flush_cache(cache);
+ 	return 0;
+@@ -567,11 +579,7 @@ int blkid_probe_all(blkid_cache cache)
+ 	int ret;
+ 
+ 	DBG(PROBE, ul_debug("Begin blkid_probe_all()"));
+-	ret = probe_all(cache, 0);
+-	if (ret == 0) {
+-		cache->bic_time = time(NULL);
+-		cache->bic_flags |= BLKID_BIC_FL_PROBED;
+-	}
++	ret = probe_all(cache, 0, 1);
+ 	DBG(PROBE, ul_debug("End blkid_probe_all() [rc=%d]", ret));
+ 	return ret;
+ }
+@@ -589,7 +597,7 @@ int blkid_probe_all_new(blkid_cache cache)
+ 	int ret;
+ 
+ 	DBG(PROBE, ul_debug("Begin blkid_probe_all_new()"));
+-	ret = probe_all(cache, 1);
++	ret = probe_all(cache, 1, 0);
+ 	DBG(PROBE, ul_debug("End blkid_probe_all_new() [rc=%d]", ret));
+ 	return ret;
+ }
+diff --git a/libblkid/src/resolve.c b/libblkid/src/resolve.c
+index 641b022860..16653fa8e1 100644
+--- a/libblkid/src/resolve.c
++++ b/libblkid/src/resolve.c
+@@ -32,7 +32,7 @@ char *blkid_get_tag_value(blkid_cache cache, const char *tagname,
+ 	blkid_cache c = cache;
+ 	char *ret = NULL;
+ 
+-	DBG(TAG, ul_debug("looking for %s on %s", tagname, devname));
++	DBG(TAG, ul_debug("looking for tag %s on %s device", tagname, devname));
+ 
+ 	if (!devname)
+ 		return NULL;
+diff --git a/libblkid/src/tag.c b/libblkid/src/tag.c
+index 390a648648..178336505f 100644
+--- a/libblkid/src/tag.c
++++ b/libblkid/src/tag.c
+@@ -326,14 +326,14 @@ blkid_dev blkid_find_dev_with_tag(blkid_cache cache,
+ 	blkid_dev	dev;
+ 	int		pri;
+ 	struct list_head *p;
+-	int		probe_new = 0;
++	int		probe_new = 0, probe_all = 0;
+ 
+ 	if (!cache || !type || !value)
+ 		return NULL;
+ 
+ 	blkid_read_cache(cache);
+ 
+-	DBG(TAG, ul_debug("looking for %s=%s in cache", type, value));
++	DBG(TAG, ul_debug("looking for tag %s=%s in cache", type, value));
+ 
+ try_again:
+ 	pri = -1;
+@@ -366,9 +366,11 @@ blkid_dev blkid_find_dev_with_tag(blkid_cache cache,
+ 		goto try_again;
+ 	}
+ 
+-	if (!dev && !(cache->bic_flags & BLKID_BIC_FL_PROBED)) {
++	if (!dev && !probe_all
++	    && !(cache->bic_flags & BLKID_BIC_FL_PROBED)) {
+ 		if (blkid_probe_all(cache) < 0)
+ 			return NULL;
++		probe_all++;
+ 		goto try_again;
+ 	}
+ 	return dev;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
