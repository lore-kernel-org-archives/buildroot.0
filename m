Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E294EC43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 07:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 977886101B;
	Wed, 15 Jun 2022 07:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7BcmFmNlUoD0; Wed, 15 Jun 2022 07:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE34961017;
	Wed, 15 Jun 2022 07:50:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1B3C1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 07:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C043240B93
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 07:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8QrUMgewi28 for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 07:50:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DACD94015A
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 07:50:43 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se19.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1o1NnO-000Gx0-Cy; Wed, 15 Jun 2022 02:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WqoQyIA/P47gsyWlX91bg6tlzAbQ07BcxZWpWI/vsPM=; b=o72X/nV6t4ZKpUFN2vkWVJruzz
 Jy3PLd7L59xnefnXNjCqoznykFuMmaeNMjy2IoCCkup8aOFqzbCq0ekCU1pVc/Akp1ta+B4wuM2Wi
 p0aBVM5/cRBzCG4VS2SA4DNwDpaT22jXfFFQx2Ixwz00AdjD2Gcjf1rVp0PTMFBcHlIOlq+M+Enls
 Y6XnJfnIuDlFMHj+/blRNz5/LNeUD4ikNrH2Nok0CESK9t9KoonB8L7GRZbZP9sm35laYED/mQDC4
 X/kOroPJP/PLeUypHMVwqijhrcmOTpAk5dmAZThjqtzfh36wwuqvw9HcfZSDdQNriy0gjq29IAsca
 KtLTQvDw==;
Received: from [95.111.54.43] (port=41506 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1o1NnM-000LAP-FX; Wed, 15 Jun 2022 07:50:32 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 10:50:28 +0300
Message-Id: <20220615075028.41612-1-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220615074543.41437-1-dimi@tpm.dev>
References: <20220615074543.41437-1-dimi@tpm.dev>
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00901318504383)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8GMRj0YfGActlznGZE4evnPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAd3PpjrfnLvLyzzwNFf10/KjAYDVlct9sYLZH
 EViT9szCNdhqKuu96XSfsfaeRlRLWmuNA8WTybi1JN85FSnfKeArhF8DDAnLuef2eQjE15wBe/9T
 PWtESFxgCC6xwnwZq1NxFr5xr62BOHHDiiwozOZnKAyX/dmWSKKAkZMD69QuVF7xNnooC0I9FREg
 ONlGYx3aPgw+VqqMKwjqRu7K//WEQZ1uDRaTscddvLdr0QzPDWNoiICP4PAhem3nWa0O5HHYEJjr
 oOvfkvm+jbvsKiuQW3c6bXX7k8uCnNwITeLhCcHQv+Vda3nPaVK0EfymGFvlHOQsi9fJrQH2HB7K
 cikRseCyBjclZpv6D8yHWO2ec6cBx3r3HXymDSnwWpGuuZvJzloHvXAavZZu2bOHz0lNEHF1LSWF
 /K4qKVXG9aOiuE2WsMQKCIxVc/Bl0gEhwVT9QLcFEqMOHs14qjRwSeexcQEBokpimN+IpZsSCXdU
 3Zc+tbQZZW2CB9MAVZ7m17NirEYyqwqMBGrw8ELiqJ2Lnubrt6xFfUVlzWE+fUwE/Xy9bqh2t87x
 wDNJ1ZQnkG4rgMcOadSlmA4Mg6UQtNxCHahZfsjvoDKdqQReE7opol7/zxbDwFIVzeFgpWdBcxw3
 qqhc+N6cuEg4XWh5FtyOJ22t24VloPyX9BGeStDFAYNNJg/XpKL5othOiFdzgSY9+n3/9sR7nx93
 SutdFn+V9p5Yms+BdRuRNxZgAvBqsgbDV2HxC6hTAaNRtelLABMII+MZt9lccg21Qbt2rvmiIpIf
 ET3DKy6eOfDTAmMFq60D0IrCERjnDPsHGlH62P/Q5P2avsXwIHCKRpn8mumteFnRQMgdmmdZ3dtr
 tujhG977gaCeYDT1BMmVSKxF+Se9jB26Aw+LBBx3XuMSFuC1LXbNjyFcag1clVEejgaVTJXUyRYZ
 QAqUcyeNZ9Pw647lNwN4qOsSZg+fYhVZGweUF86gi0+ssgYHyuRMdamM1/vGHv5niZSzvePQswR9
 tAMyBK/fwHR0ICrRwpT/yWWLX2ZbQb3UJKihEmoDuwiHHKC85zpKzjzwXMd7fKV1b1JM50deWtJl
 +ohOvCmYEc6Ya55kz6ATxdSh2h2ztUM=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: [Buildroot] [PATCH v4 1/1] package/wolftpm: Add config options for
 TPM 2.0 extra capabilities
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

Some TPM 2.0 chips offer extra capabilities. This patch adds additional
configuration options to the wolftpm package, so such capabilities can
be available to the user. For example, the STMicroelectronics ST33 and
Nuvoton NPCT750 both offer secure GPIO. Due to chip differences, wolfTPM
requires explicit configuration options to enable the extra capabilities.

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
Changes v3 -> v4:
- Fix commit message. For some reason the update was not included in patch v3.
Changes v2 -> v3:
- Better commit message
Changes v1 -> v2:
- Remove a not needed package description change
---
 package/wolftpm/Config.in  | 12 ++++++++++++
 package/wolftpm/wolftpm.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 0b964c3d7e..3027b7e33d 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -23,6 +23,18 @@ config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
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
