Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C366C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 09:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02D2440C7F;
	Wed, 10 Jul 2024 09:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKHE5aQoDZQU; Wed, 10 Jul 2024 09:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C49F140C8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C49F140C8F;
	Wed, 10 Jul 2024 09:54:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B63D81BF2FF
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A231C4030F
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cU-drFOwK3qs for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 09:54:00 +0000 (UTC)
X-Greylist: delayed 736 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 10 Jul 2024 09:53:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 739D7402D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 739D7402D5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=b.bilas@grinn-global.com;
 receiver=<UNKNOWN> 
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 739D7402D5
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 09:53:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (8)
Received: from localhost.localdomain (host-81-161-192-19.oxylion.net.pl
 [81.161.192.19])
 by server220076.nazwa.pl (Postfix) with ESMTP id 7F0251BDA44;
 Wed, 10 Jul 2024 11:41:40 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 11:41:38 +0200
Message-ID: <20240710094138.44054-1-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH] package: rauc-hawkbit-updater: add systemd
 optional dependency
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, colin.foster@in-advantage.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Take the systemd into account if present.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
index 3836d3c84e..5cbef28306 100644
--- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
@@ -12,4 +12,11 @@ RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
 RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib libcurl
 RAUC_HAWKBIT_UPDATER_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+RAUC_HAWKBIT_UPDATER_DEPENDENCIES += systemd
+RAUC_HAWKBIT_UPDATER_CONF_OPTS += -Dsystemd=enabled
+else
+RAUC_HAWKBIT_UPDATER_CONF_OPTS += -Dsystemd=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
