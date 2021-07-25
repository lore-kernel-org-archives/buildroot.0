Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896F9C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 20:17:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E66C60560
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 20:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E66C60560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C5FE40269;
	Sun, 25 Jul 2021 20:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dcm5ymc857fH; Sun, 25 Jul 2021 20:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 732E740263;
	Sun, 25 Jul 2021 20:17:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EE731BF25F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 20:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E851403B1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 20:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXlURN5AtC4S for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 20:17:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60255403AB
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 20:17:45 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id hp25so12997765ejc.11
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3zUwlyHKCSJ0rdSlBho47V8aYZico8PBjh7spU6JIQ=;
 b=X8oricjP7/dkqUYAKGX2W90nQ9teA3nwnSn9Dfmqs1pjmHUlSrbrdUzj4qAV1BRnB5
 HQ6ibEY/+5u+u4ItGuUlZ0if41AiL7j4iPM62wdbmaGMC3+wfGH2CNuFssNnEUXGFZtI
 WjTg0w27726eCq/mIlkYVDk0f5oz0jv+lAd5ZvDlMIYEJAsdZHjq8zkwd6U7TCDgtfcl
 d29IltKMJUaV7WkDxqPT/5bWdIVYzVXemaLstIA7ERwJDTP3PJlu4pmYeaUACPUkMRhw
 ukHKiPf3B2A5zyC2sMv2CO6MtZgQDykKoGfQZmhb2EERTvpW2f+uxKtF0xJToqBF6ZTm
 YKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3zUwlyHKCSJ0rdSlBho47V8aYZico8PBjh7spU6JIQ=;
 b=YDvUncTjBmogMhi6xTZM2LR7pRf/p9yfFFwqe14n0Yyln+EPJyeoJXMWKXklFfrz3Z
 w8buCazHDqCdzk1GPgsMwSs4rFOUoHD7hzEswbpzN7KaEQxxRth2/QJKAXgnxnGjpgtS
 wyZsMRZ90kxTpyPr8kEP4tUHNn2UQ7IigFseldMYOkByLLWdvTdqUvw8iyOTQ3isb9+J
 fELN9xSKsQMLsES0x+F198yzqu/teG3yEe/m8FmxAAw+PFFVkEE9hw73Ev6TUdT1jYqf
 wOg5MSJ2iDviF+hymzFFto5AlCle4Cipj/m0ra75lSLlOLcZ5hqvgZP1WRZeLeFQQ6Ik
 m/KQ==
X-Gm-Message-State: AOAM531j5IpKvpUmrbkxyAf953ip5Blip96NqI4lNr4cYe97S68rOQ/c
 EYygk84WNF8tIxR1cvc3uwp9NkXfkHo3Uw==
X-Google-Smtp-Source: ABdhPJwkFbRn0HarEcWqu6KWQW8/Jmebl/Wv86E52dTS0f3xXNYa68zBSKpyR50jTsI5JA1mnHEy7g==
X-Received: by 2002:a17:906:2cc5:: with SMTP id
 r5mr14009089ejr.454.1627244263497; 
 Sun, 25 Jul 2021 13:17:43 -0700 (PDT)
Received: from localhost.localdomain (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id i6sm13508404ejr.68.2021.07.25.13.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 13:17:43 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 22:17:36 +0200
Message-Id: <20210725201736.766489-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: Add myself as rpcbind maintainer
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

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 596670993a..f722ec9611 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2184,6 +2184,7 @@ F:	package/libtirpc/
 F:	package/linux-backports/
 F:	package/ltp-testsuite/
 F:	package/nfs-utils/
+F:	package/rpcbind/
 F:	support/kconfig/
 
 N:	Phil Eichinger <phil.eichinger@gmail.com>
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
