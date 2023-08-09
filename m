Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38328C0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7E34417E0;
	Wed,  9 Aug 2023 21:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7E34417E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LL8vr7oI7TUG; Wed,  9 Aug 2023 21:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8316417C2;
	Wed,  9 Aug 2023 21:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8316417C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A15E1BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21906417C6
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21906417C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjW3djXkcNgB for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:38:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2BA0417C1
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2BA0417C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7D07853EE; Wed,  9 Aug 2023 21:38:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 23:38:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0fdd17ec254ecaca28b40254e0679e24078c5e5
X-Git-Newrev: cebd9c7c04e355b8996d601c63602512106ca631
X-Patchwork-Hint: ignore
Message-Id: <20230809213848.C7D07853EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: fix build failure when
 Linux CONFIG_PM is not defined
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cebd9c7c04e355b8996d601c63602512106ca631
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream[1] to guard structure member wowlan that
is only present if CONFIG_PM is defined.

Fixes:
http://autobuild.buildroot.net/results/d47317640de39baabeefb8d9e04fa7f3e2dc873a

[1]: https://github.com/espressif/esp-hosted/pull/254

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ng-host-fix-build-failure-when-CONFIG_PM-.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch b/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch
new file mode 100644
index 0000000000..abbc64a434
--- /dev/null
+++ b/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch
@@ -0,0 +1,33 @@
+From 56920e3ce04aa2eadb529a6787200789bf1c3925 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 9 Aug 2023 23:16:52 +0200
+Subject: [PATCH] esp_hosted_ng: host: fix build failure when CONFIG_PM is not
+ defined
+
+wiphy->wowlan is not defined when CONFIG_PM is not enabled so let's
+guard the assignment to wiphy->wowlan according to option CONFIG_PM.
+
+Upstream: https://github.com/espressif/esp-hosted/pull/254
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/esp_cfg80211.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/esp_hosted_ng/host/esp_cfg80211.c b/esp_hosted_ng/host/esp_cfg80211.c
+index 70fdbb9773..d3c4108c29 100644
+--- a/esp_hosted_ng/host/esp_cfg80211.c
++++ b/esp_hosted_ng/host/esp_cfg80211.c
+@@ -638,7 +638,9 @@ int esp_cfg80211_register(struct esp_adapter *adapter)
+ 	wiphy->max_scan_ie_len = 1000;
+ 	wiphy->max_sched_scan_ssids = 10;
+ 	wiphy->signal_type = CFG80211_SIGNAL_TYPE_MBM;
++#ifdef CONFIG_PM
+ 	wiphy->wowlan = &esp_wowlan_support;
++#endif
+ 
+ 	/* Advertise SAE support */
+ 	wiphy->features |= NL80211_FEATURE_SAE;
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
