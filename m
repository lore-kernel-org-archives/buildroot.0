Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67477C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 07:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0434340BA3;
	Wed, 15 Jun 2022 07:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0dvPRQHMLNdj; Wed, 15 Jun 2022 07:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED56840BA1;
	Wed, 15 Jun 2022 07:31:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51B2B1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 07:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EA8582E5F
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 07:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7KkB2HAZsdx for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 07:31:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 347F582E19
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 07:31:18 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se20.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1o1NUU-0005nV-F4; Wed, 15 Jun 2022 02:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t2WhVt33uwZmJxuLEVHjp2k4jZHsvDAQWN/h+DZVeHw=; b=Rb6QFCfkFLUaDhXVnlkFx1WQnR
 BoPNDvxkf4X+pEXN0JN4HQv9e+DUm+GOZ48xU+lctURirCGQI3J4hNclgSjQZmZ9k83uyLYeDfexp
 HFKZIVJU2e5X40JwxcbXo8RwI+8BGQGK/fOJEWzlq9qWYSGwh5m5iyWkak1Pwwm3XY3hi4tfMCV7X
 x/NyyBajfaqEZhg3Awqx/n5mclFCKDVp/btwMdY0FTVJiH/yzRUwDLEvbTAC1LCLxNjmGLMPICuya
 wXitWzLI8n/bqUH5T3Q1Dy5VRQJi7sI70Lm7JUf8z64cYsrynd+fdEldPczRgG9UbAus23As9R/VW
 rPK8+Aqw==;
Received: from [95.111.54.43] (port=41438 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1o1NUS-000FH7-84; Wed, 15 Jun 2022 07:31:00 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 10:30:53 +0300
Message-Id: <20220615073053.40347-1-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.0078310698843)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/YehIg0KAYRFncO3wwLEHnPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAd3PpjrfnLvLyzzwNFf10/KjAYDVlct9sYLZH
 EViT9sywCXIejVo79y6rKA+KisHBWmuNA8WTybi1JN85FSnfKeArhF8DDAnLuef2eQjE15wBe/9T
 PWtESFxgCC6xwnwZq1NxFr5xr62BOHHDiiwozOZnKAyX/dmWSKKAkZMD69QuVF7xNnooC0I9FREg
 ONlGYx3aPgw+VqqMKwjqRu7K//WEQZ1uDRaTscddvLdr0QzPDWNoiICP4PAhem3nWa0O5HHYEJjr
 oOvfkvm+jbvsKsqGfvAc420GDXM6y1K/8mbhCcHQv+Vda3nPaVK0EfymGFvlHOQsi9fJrQH2HB7K
 cikRseCyBjclZpv6D8yHWO2ec6cBx3r3HXymDSnwWpGuuZvJzloHvXAavZZu2bOHz0lNEHF1LSWF
 /K4qKVXG9aOiuE2WsMQKCIxVc/Bl0gEhwVT9QLcFEqMOHs14qjRwSeexcQEBokpimN+IpZsSCXdU
 3Zc+tbQZZW2CB9MAVZ7m17NirEYyqwqMBGrw8ELiqJ2Lnubrt6xFfUVlzWE+fUwE/Xy9bqh2t87x
 wDNJ1ZQnkG4rgMcOadSlmA4Mg6UQtNxCHahZfsjvoDKdqQReE7opol7/zxbDwFIVzeFgpWdBcxw3
 qqhc+N6cuEg4XWh5FtyOJ22t24VloPyX9BGeStBd481vQ49sUMywqNFSpiibBuOhcflXZsFbKFow
 GHweK3+V9p5Yms+BdRuRNxZgAvBqsgbDV2HxC6hTAaNRtelLABMII+MZt9lccg21Qbt2rvmiIpIf
 ET3DKy6eOfDTAmMFq60D0IrCERjnDPsHGlH62P/Q5P2avsXwIHCKRpn8mumteFnRQMgdmmdZ3dtr
 tujKIUYgVyT6o21tYpM07HZGbs0NTgtesw0xUL/OpWcYf+C1LXbNjyFcag1clVEejgaVTJXUyRYZ
 QAqUcyeNZ9Pw647lNwN4qOsSZg+fYhVZGweUF86gi0+ssgYHyuRMdamM1/vGHv5niZSzvePQswR9
 tAMyBK/fwHR0ICrRwpT/yWWLX2ZbQb3UJKihEmoDuwiHHKC85zpKzjzwXMd7fKV1b1JM50deWtJl
 +ohOvCmYEc6Ya55kz6ATxdSh2h2ztUM=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: [Buildroot] [PATCH 1/1] package/wolftpm: Add TPM 2.0 extra options
 and fix one bad typo
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dimitar Tomov <dimi@tpm.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dimitar Tomov <dimi@tpm.dev>

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
 package/wolftpm/Config.in  | 14 +++++++++++++-
 package/wolftpm/wolftpm.mk | 12 ++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 0b964c3d7e..df5ab37e84 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -19,10 +19,22 @@ config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
 	# not mandatory, but needed to get all features
 	select BR2_PACKAGE_WOLFSSL_ALL
 	help
-	  Enable wolfCrypt hooks for RNG, Auth Sessions and Parameter
+	  Enable wolfCrypt hooks for Authorization Sessions and Parameter
 	  encryption. Disabling this option is not recommended as it
 	  could create a security breach in most environments.
 
+config BR2_PACKAGE_WOLFTPM_ST33
+	bool "st33"
+	default n
+	help
+	  Enable support of TPM 2.0 extra functionality offered by the STMicroelectronics ST33 chip.
+
+config BR2_PACKAGE_WOLFTPM_NUVOTON
+	bool "npct750"
+	default n
+	help
+	  Enable support of TPM 2.0 extra functionality offered by the Nuvoton NPCT750 chip.
+
 comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index a4a9edce85..d0423cd06b 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -35,4 +35,16 @@ else
 WOLFTPM_CONF_OPTS += --disable-wolfcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_WOLFTPM_ST33),y)
+WOLFTPM_CONF_OPTS += --enable-st33
+else
+WOLFTPM_CONF_OPTS += --disable-st33
+endif
+
+ifeq ($(BR2_PACKAGE_WOLFTPM_NPCT750),y)
+WOLFTPM_CONF_OPTS += --enable-nuvoton
+else
+WOLFTPM_CONF_OPTS += --disable-nuvoton
+endif
+
 $(eval $(autotools-package))
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
