Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287D9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B357160BF1;
	Mon, 29 Nov 2021 22:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1uPNJrsV7ThD; Mon, 29 Nov 2021 22:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1842B60BC5;
	Mon, 29 Nov 2021 22:10:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68AB61BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58AE14048B
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjxlyFB0RQIl for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:10:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71E5C40485
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:10:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso13372541wmr.5
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3mTZvvMMPiKdUTWZnCQtuUdxxCB53mqhOMuDy84HgDU=;
 b=mvxa9OLWbaf5sS20gmS7TLA43SEpQ9Zszkaw07e44ExMBNv4r+OLLmxVbBxVmIdxyU
 nXvahhr66cbugrwJ2U/MGev98HJX9/sMPBPBNk3jisxHgI+P0PZbTsNg1JQyUbjG6KJv
 /LV0w0FwwXyZFAUNTCM5IT0+tQR+aKwf3G9erMEMWzJSI9sJ0LHvpiP3qoE6mH/sUYcK
 iC0AncTRO03Qn1LS30GX8tpMFCHxxzERGp0zD9+IReKxCbPp8BoUpeQDTP0e9DRNqrPc
 SXK8DRiGI3D5KosFDPsrO5ELRKHHecEKYIktLL80gz2htsVGj3FxhobSs0IXnTX/AlgT
 iEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3mTZvvMMPiKdUTWZnCQtuUdxxCB53mqhOMuDy84HgDU=;
 b=0O30G9rTkjOxpxJw3vpHjZboVcax9ZVQLiCi0RWsC0i5mviHiz5z2+3vF629EnXw2l
 6NkJDOK2BYbfUDcfpWpW5x1AuQvEC5Mtoh/Mb5lNUNK0Dq4WmCaoRidHON15zJnVQZWt
 GTh5SHCUcpipHlQJUwMMY9K9zq3qStwIeeuAMW5F9oAAU1zaCiHn3Ctb0En6ZGU7/PMu
 R6pP+Pnqa5wbwoECwz5yK+TeKKP3zCvXBGob6MGk0g+aTJ2VkyfxDmqlWnm0BOxY/q7w
 paGbWndzirMZr3jlsA6B8VekROchy9qM5nzdYqsB3IGzlF4pslhw5MqaaVVyeMvbadc9
 Xreg==
X-Gm-Message-State: AOAM533VuKUD7qxef2tZITEHHS4M+7fj9ucbj2UWhzIAhOPRZo4hAb0x
 haSMcZBmxjE4Xb7uoMkzewJlyb74L0c=
X-Google-Smtp-Source: ABdhPJymA2vO36psb4s3LezVstFIUsHOjAwm50E2braakH+lIEYjNPwrp259gqiJxlHdwleSq/YU/Q==
X-Received: by 2002:a1c:a74a:: with SMTP id q71mr742691wme.105.1638223838565; 
 Mon, 29 Nov 2021 14:10:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id l5sm17925650wrs.59.2021.11.29.14.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:10:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:08:03 +0100
Message-Id: <20211129220803.2183164-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/datatables: drop spurious space
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
3995a68e2103a484f089c98b8d6ce9a81081762f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/datatables/datatables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/datatables/datatables.mk b/package/datatables/datatables.mk
index 7bd3d83ac3..c20cdf1254 100644
--- a/package/datatables/datatables.mk
+++ b/package/datatables/datatables.mk
@@ -6,7 +6,7 @@
 
 DATATABLES_VERSION = 1.10.20
 DATATABLES_SITE = https://datatables.net/releases
-DATATABLES_SOURCE =  DataTables-$(DATATABLES_VERSION).zip
+DATATABLES_SOURCE = DataTables-$(DATATABLES_VERSION).zip
 DATATABLES_LICENSE = MIT
 DATATABLES_LICENSE_FILES = license.txt
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
