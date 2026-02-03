Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FDBE8B368
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EC5B60901;
	Tue,  3 Feb 2026 21:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPZBRBQTcize; Tue,  3 Feb 2026 21:43:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 718E960A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770154983;
	bh=IWhe6HKCLla8GiW7BY2H+1QyI2Z2ppQ47BiAna6EGQE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=irsLv30DIOUwUDq6DcUYYwnh01AxP2TZuZ2CxScmfRu6+k90kdDm1oFksycDQ9rgK
	 QGmqIEsnfWoBdL7LlEFb72KvrbTRFxH3Afbf1/fxzzK5N0t077tY3huVJVHlcr5PLD
	 xq3iO5j97DAMwnoxhysRrZ4Q6XUOpcxChriVNtKLTmvnT+F4BvDJHUDjQxmn3wt+9o
	 fl3uoBubwLEXzT61lsl2KC1ulKfHDS7QikESumRADHYQeC5SPE5EMexvquj8YnfJUd
	 u56Su24VEFMD2Umqo8ZFTQPQPC3b2VZTixuenw/a4XqfSAB+DWd5BnDafrh4XTv/w2
	 dmfRGDFS6bI3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 718E960A41;
	Tue,  3 Feb 2026 21:43:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 831F9F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F8EA4030E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6oEszv6faDo for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:43:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A313440185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A313440185
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A313440185
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:43:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 43E1A19F59C;
 Tue,  3 Feb 2026 22:42:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Feb 2026 22:42:55 +0100
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 22:42:54 +0100
Message-ID: <20260203214254.335146-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770154979;
 bh=VdeKlh+R5jKTbpX67u1C46Wy0cODXTiddxB11Z/nqqo=;
 h=From:To:Cc:Subject:Date:From;
 b=ceVErXxF/NEd9XP/wQTV9+YRlj++kTwS3bf7UdOQzfwUPmg1Uvg2ZiDbT2BpNoAPh
 rNVkIJE94lA9lE08gHrmTkNorB0/Mf4U9KU/2IZlAK86YVCWdFB+WnaohnDQJc3VLJ
 2JTjQM+tFGIkxQ2SUkETzgFP/6rsDoLofq077xeRvg/kNXYiyn1SX6dZJRdtE5mLpI
 3VXFk0w/6I4OzOrn3qZmub7clbC9BpkalLGZzUEDoF8GGxnE88+51UHjpy6f0wAbG3
 xvYur48AwXQdpWXDVffp7zoBMw8Ovc99WQyGPqRiEn7wJ8O6cBZIfgBUSmjdjVh5if
 R+kt0dc9BbyFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ceVErXxF
Subject: [Buildroot] [PATCH] package/pico-sdk: fix host install
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Jesse Taube <mr.bossman075@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We've not been using HOST/usr for years now, and 'make check-package'
finds and reports the issue:

    $ ./utils/docker-run make check-package
    package/pico-sdk/pico-sdk.mk:23: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/
    package/pico-sdk/pico-sdk.mk:24: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/

Fixes: ceb800d3c63fe91628f42ce749c211ebef278628
Fixes: 926381d360082e926cb6be28cb1e97639d26ea0f

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Jesse Taube <mr.bossman075@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/pico-sdk/pico-sdk.mk | 4 ++--
 package/picotool/picotool.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 5bcf71650d..dfb29d2320 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -20,8 +20,8 @@ define PICO_SDK_INSTALL_STAGING_CMDS
 endef
 
 define HOST_PICO_SDK_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/usr/share/pico-sdk
-	cp -r $(@D)/* $(HOST_DIR)/usr/share/pico-sdk
+	mkdir -p $(HOST_DIR)/share/pico-sdk
+	cp -r $(@D)/* $(HOST_DIR)/share/pico-sdk
 endef
 
 $(eval $(generic-package))
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index bca9489665..cf8e294835 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -12,7 +12,7 @@ PICOTOOL_LICENSE_FILES = LICENSE.TXT
 PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
 PICOTOOL_DEPENDENCIES = libusb pico-sdk
 
-HOST_PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(HOST_DIR)/usr/share/pico-sdk
+HOST_PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(HOST_DIR)/share/pico-sdk
 HOST_PICOTOOL_DEPENDENCIES = host-libusb host-pico-sdk
 
 $(eval $(cmake-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
