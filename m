Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47466C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:33:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1201D60F23
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1201D60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D35A783B63;
	Fri, 23 Jul 2021 20:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qb159dI9izSA; Fri, 23 Jul 2021 20:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39DCF83B5E;
	Fri, 23 Jul 2021 20:33:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CBE11BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B7E283B5E
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0T1GSOFGMWv for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:33:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4542F83B5D
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 20:33:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o3-20020a05600c5103b029024c0f9e1a5fso3956541wms.4
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Svm2ea12wnCKfhTq3VoMQzzMinYjjqXw2r+rtC+WeEg=;
 b=uPGRnaY/RxhuMU/hEs9SBEyZalbi87v4i/+Z7Hb5PY5DKV/bSnj6EE37BZhAmnHLWe
 X7Z5IhT+vkrKeOmuXTPEf8lD/haWexJhUUXS2M/nqYbC7xHLpVLAoPciETxcXTLzXgmb
 sPAzK715GWitbN2jc8Eo5wuH2a/BII/mP6bfzKeAW+ZNhZ+E6lRdtteYntAe/u616nWc
 nHr03C8JCPkUuTQQBb7QxqeVevjq9BsGY2ToW1jHQAs80Sx2TPOKJxCcD4Xq8ti/IkTx
 LWfjVEsaQhF7Jmqfp7Z7Y65Pidn4K2WgkBuobT4AQgHU0u3RuEu6r+Jl7K2RLylJAmGY
 6SOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Svm2ea12wnCKfhTq3VoMQzzMinYjjqXw2r+rtC+WeEg=;
 b=I4KtGPJwayZcX24Wx6/x/g1b6ZtzHiUrnX8vJd1SmAK41cCXNPxMvSrF0XEuzj0QiX
 BQPMYLV6ITvpKg63+Nuxar4yc271OOqp3FAMDQNTvvRPmjjzGfEK4efIvRCke/iVyV2b
 xMW7JOjpN3ygyrigoBkuZW819eGgQOuzFovYzqJ5AS3egA7wZnX/Ur80Q3PgfyMiAfkr
 B2OzGg/+kYY4IaOIRowJeSlDafyTA2g/ycc8Q44bS2cRszxo80ria0legiARkILDxjfb
 yooIjWwTIJEm/xjZv4Bq+IrYnDcxzWmpI8IMZpo/aEpZSgTzQ4IB/t+zsYMQTmUHhlI+
 Ufyw==
X-Gm-Message-State: AOAM532WnRSY7UG/1MQ3ARzZ18HDfGJzfCBB4Z8XR2iFdJT30JP/3RHB
 +hvmL5mYOVKlpKgICHK8nNiRDyseh/Q=
X-Google-Smtp-Source: ABdhPJxWjST4qETtZThFpPA1sDTnXblNMqAI87NtZOTevxOYxxjL+PNYWr60Iy4LjnZtiMXOTDhRNA==
X-Received: by 2002:a05:600c:4f08:: with SMTP id
 l8mr6189576wmq.22.1627072378523; 
 Fri, 23 Jul 2021 13:32:58 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id n17sm2128422wmo.18.2021.07.23.13.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:32:58 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:32:38 +0200
Message-Id: <20210723203242.2531909-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723203242.2531909-1-francois.perrad@gadz.org>
References: <20210723203242.2531909-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/9] package/perl-mojolicious: bump to version
 9.19
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index ee70e1d99..fbb1c7d99 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  fe7be8d6cf24a860987f72d441bec547  Mojolicious-9.17.tar.gz
-sha256  0da6e60701bdb8ac063d69616c925ff2ecc6a31c6bf5b58a0b10b6013294bd8d  Mojolicious-9.17.tar.gz
+md5  ea3861504ab25b237f124842f8765b01  Mojolicious-9.19.tar.gz
+sha256  45056d66b08e544fd77033fafe1730c1d45615e46a92892fc77fb241754a1a97  Mojolicious-9.19.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 54b5c018f..8252dc7fd 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.17
+PERL_MOJOLICIOUS_VERSION = 9.19
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
