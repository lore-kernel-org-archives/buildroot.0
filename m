Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A824ECAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 15:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E56481584;
	Fri,  3 Oct 2025 15:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id StICmXyJNMzQ; Fri,  3 Oct 2025 15:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 656C8821DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 656C8821DC;
	Fri,  3 Oct 2025 15:01:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1DF2226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 15:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3E014015A
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 15:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1echJunE6GX for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 15:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.117;
 helo=smtpdh17-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5C6040029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5C6040029
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5C6040029
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 15:01:26 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba SMTP with ESMTPSA
 id 4hHfv18GXtfOn4hHfvrk2O; Fri, 03 Oct 2025 17:01:24 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  3 Oct 2025 17:01:22 +0200
Message-ID: <20251003150122.633790-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD3lSsS4PM/1RggYu8uirw+ETAldrSpDHgOefQHfwdsHVPle5/Issm8WiCSV62e9VD1OQRJF4Zuc9D9Z5eHRzdQIxmj8L9w/zABjYxTSuK29WOTkNb/j
 KKIhSBoA2E/H7KcPv5e0rXosp51dqh/IbYra4zRFrFpv8fvRX4i7FRtm9cukM1C4MGtKH8lt/EyfWbnOKA6IcC6A7uso8pLOYjw1nWkX6pNVmEPYxTUYOUwz
 ZBMxJDFGsewkYhhcUW5oR8l+of2E1BTfSTezxTGOLcvhXjpWWpq8LAf+YtwkwKhi
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759503684; bh=Ou4CkbaAcIYUz8TQRcGWDB7r7mfkVjGlhiYIUZJIcUo=;
 h=From:To:Subject:Date:MIME-Version;
 b=SQnrDJwySfRKLaCWTrTnc963hNVQwfDBD4z8At6uLamtH4skH3ZG7kXSKbhQvxhzA
 3b2M+caRfdC3D8nTobR963yrgyjOtagzzWotG6iRcannUL87nm7ykhp1BeXZ64ytvX
 Uml8IIMfHg5wgAEpPYjIqwunwME6MHiHguUHakr0SbL+DYz0ZT9r9kYUFa9ftWjACe
 AA+wk8gpxMeCiErYcE/G5rRzy+rViV+jfpouMgMkVRIuKivBupmHNaswiRDYo4c/H2
 MLjCMuDDsMi17+SNXOl2ARflwpMBHYVSGplwB2wpFHdQkCBWP5OEQjpDcL02ks+I5z
 mcnqNpW6IlggQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=SQnrDJwy
Subject: [Buildroot] [PATCH] package/esp-hosted: drop
 BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32 choice
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As pointed in this PR[0] ESP_SLAVE and CONFIG_TARGET_* became useless after
commit [1] so let's drop the SoC Target choice. The SoC ID is automatically
retrieved via SDIO commands, so no need to specify it.

[0]: https://github.com/espressif/esp-hosted/pull/668
[1]: https://github.com/espressif/esp-hosted/commit/b544b01e201bdef20c680a6902c1495e46dde1ff

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/esp-hosted/Config.in     | 14 --------------
 package/esp-hosted/esp-hosted.mk |  6 ------
 2 files changed, 20 deletions(-)

diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
index 5abab73b57..42e1afa8c5 100644
--- a/package/esp-hosted/Config.in
+++ b/package/esp-hosted/Config.in
@@ -28,18 +28,4 @@ config BR2_PACKAGE_ESP_HOSTED_SPI
 
 endchoice
 
-choice
-	prompt "Target"
-	default BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32
-	help
-	  Select which SoC Target driver is used for
-
-config BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32
-	bool "ESP32"
-
-config BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32C6
-	bool "ESP32C6"
-
-endchoice
-
 endif
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 965d3a5cc6..74fab6602b 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -29,11 +29,5 @@ else
 ESP_HOSTED_MODULE_MAKE_OPTS = target=sdio
 endif
 
-ifeq ($(BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32),y)
-ESP_HOSTED_MODULE_MAKE_OPTS += ESP_SLAVE=CONFIG_TARGET_ESP32=y
-else
-ESP_HOSTED_MODULE_MAKE_OPTS += ESP_SLAVE=CONFIG_TARGET_ESP32C6=y
-endif
-
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
