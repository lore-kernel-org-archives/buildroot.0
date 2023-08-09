Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF2EEE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31F0C40BD2;
	Mon, 21 Aug 2023 20:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31F0C40BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mgTqWePrhQX; Mon, 21 Aug 2023 20:17:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79C9240C6C;
	Mon, 21 Aug 2023 20:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79C9240C6C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA071BF94D
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8123A4139E
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8123A4139E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hGjbXlMpK0Ws for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91DF241554
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91DF241554
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FB6686026; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 23:38:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0fdd17ec254ecaca28b40254e0679e24078c5e5
X-Git-Newrev: cebd9c7c04e355b8996d601c63602512106ca631
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.8FB6686026@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/esp-hosted: fix build
 failure when Linux CONFIG_PM is not defined
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
