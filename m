Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D7DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 08:31:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D03A560EB4
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 08:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D03A560EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B71608EE;
	Wed,  3 Nov 2021 08:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_AsQyq0auRs; Wed,  3 Nov 2021 08:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB66D6081D;
	Wed,  3 Nov 2021 08:31:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4D361BF315
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 08:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D122040439
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 08:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GM7UUYKxADO for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 08:31:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58FE440437
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 08:31:18 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id
 x1-20020a17090a530100b001a1efa4ebe6so1257955pjh.0
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=opLy7RMwD4vgwkkcUNKvBVmweQhI4xLxfMEiaiGa3rg=;
 b=O+7SQKiVvBG7ZC547axh09wlweV9lqJwPVtvvjU9mNQG+nFu7zNehxQ9tI776GNvuu
 29BYyHCeSXIOIkMlrh1sk2m5mdT/LLhRpdjf+QpJFBFvlFW5GuubMTL7Fx1DyIeg7ICr
 MAKy08wiKE6KFZHDtYJDtoMD8kd90FxrT/HSEaRsp4OQBkVAfzknpJ++VB0W9GIhYM72
 6J4vzpD7tSPkn70StTDb/oxnd04neM5Y5TG618NRbVeEMd4fa9AnlWbvASXkNsnvQpu1
 /+3S8VIRgEe7VwXXiuj3otNSMfdqiHvDE9WdVfIob05lLaivEJmLzYlkUWkI9Xi3cB6c
 4A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=opLy7RMwD4vgwkkcUNKvBVmweQhI4xLxfMEiaiGa3rg=;
 b=BH2Eqpos0r0spdq8xqItbkhCb884JEsKHtBITLo2lj6jyEB9u6xSTLvTlNyLCmlJ8e
 qywE87+cy70EyrpTwGYN9Q+4jmfwzir9nPGZh96CJuTsQwUSgvYXrzSz5XSxv1ov3GXe
 de92mgfXnEkCMeo0MBMir+GwrhwJ5XAIH3xKKI0/gGDdAmvwwm2gaP9E4SuXEG1YkPyW
 ts55FPLQO8NZEYoZWRdDAmLyag7k3nZdv36ok8hWN8p9yNyN0tGWn+cpOdKy5OYSg2tM
 NCl39cii3moDlosVUErKnls91O8LoPwTIRv5eBcSgkeL3GqlV25Tyj2aL4r03P14YeTT
 HlVQ==
X-Gm-Message-State: AOAM531srIbqoWj3DCPa9i/2B109EF6Dfnpm8ZgCxuDiQ4ZLF4b80c+R
 XMC/T4CYce++kh4qZyWrEHau8riQ7a90gcsL
X-Google-Smtp-Source: ABdhPJwMU7iSSdy0uny2QQwR1s7oUSUhP7ACTBylC8aSGeIqG+muq1NoVqA32jIy0ezA5tBOwgrNKw==
X-Received: by 2002:a17:90a:cd:: with SMTP id
 v13mr12963512pjd.81.1635928277770; 
 Wed, 03 Nov 2021 01:31:17 -0700 (PDT)
Received: from lxb-server.lan ([2403:18c0:2:7e::1926:817])
 by smtp.gmail.com with ESMTPSA id mg12sm4235822pjb.10.2021.11.03.01.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:31:17 -0700 (PDT)
From: Yunhao Tian <t123yh.xyz@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 16:31:10 +0800
Message-Id: <20211103083111.4016058-2-t123yh.xyz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103083111.4016058-1-t123yh.xyz@gmail.com>
References: <20211103083111.4016058-1-t123yh.xyz@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/bluez-alsa: add support for aptX /
 aptX HD
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Yunhao Tian <t123yh.xyz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds support for aptX (HD) decoder / encoder powered by the
libopenaptx library.

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
---
 package/bluez-alsa/bluez-alsa.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index f81720f767..7d7c9a025c 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -69,4 +69,10 @@ else
 BLUEZ_ALSA_CONF_OPTS += --disable-rfcomm
 endif
 
+ifeq ($(BR2_PACKAGE_LIBOPENAPTX),y)
+BLUEZ_ALSA_DEPENDENCIES += libopenaptx
+BLUEZ_ALSA_CONF_OPTS += --with-libopenaptx --enable-aptx --enable-aptx-hd
+endif
+
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
