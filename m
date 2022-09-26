Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BDDC07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4AE240BEF;
	Mon, 26 Sep 2022 12:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4AE240BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7PxlNs6CBuM; Mon, 26 Sep 2022 12:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 833A340BC0;
	Mon, 26 Sep 2022 12:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 833A340BC0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEAE61BF3B0
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A94340BE3
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A94340BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-HwWDzgQdeW for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:09:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1E6440BC0
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E6440BC0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE1F986384; Mon, 26 Sep 2022 12:09:03 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 14:08:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81a56ab9cb9f371cd34e459d8f1eec8c7f888cec
X-Git-Newrev: 15f48d57f73da375ed28e582ab68740704b499fd
X-Patchwork-Hint: ignore
Message-Id: <20220926120903.CE1F986384@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectd: work around gcc bug 68485
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

commit: https://git.buildroot.net/buildroot/commit/?id=15f48d57f73da375ed28e582ab68740704b499fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

collectd is impacted by the microblaze-specific gcc bug #68485 [0].

As for all other impacted packages, force no optimisation when using a
toolchain riddled with that bug.

Fixes:
   http://autobuild.buildroot.net/results/6a8/6a87bbe17e6f606a97097800dc484a7b17bffa7d/

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/collectd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 5751757040..5510c265e8 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -27,6 +27,14 @@ COLLECTD_PLUGINS_DISABLE = \
 
 COLLECTD_CONF_ENV += LIBS="-lm"
 
+COLLECTD_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+COLLECTD_CFLAGS += -O0
+endif
+
+COLLECTD_CONF_ENV += CFLAGS="$(COLLECTD_CFLAGS)"
+
 #
 # NOTE: There's also a third availible setting "intswap", which might
 # be needed on some old ARM hardware (see [2]), but is not being
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
