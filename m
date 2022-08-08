Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260ADC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D89740320;
	Mon,  8 Aug 2022 21:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D89740320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPgI5dudNpcO; Mon,  8 Aug 2022 21:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6B2240180;
	Mon,  8 Aug 2022 21:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6B2240180
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2D1A1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDB2A607C7
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDB2A607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cM6pbD333Ir7 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:54:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A43E2606EB
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A43E2606EB
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:54:20 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h13so12329005wrf.6
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 14:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=jSr51MvoSv8D/30JXqSX24LjhqGj/ytpwsgTcyGWlxU=;
 b=e5RM8lmfKVok5Dz2Nzc1dKa6pwDolv2Hv3kIY71t7XX6MiimfMWxCE9sh2C9YRgFIM
 toPpHajz0q3xnZVXjTv+GieYNgQrXoyfjN7vsKdss/PEzhlNPzz/v9yZ9LMqXvnpaVGJ
 O/FBFGNTeOKyyRIEcXVm9wa0JhE6OuWtDxFCgXO79/bMQqML3xEsiYnlpO5wT/4hExF8
 wcpknrgS1UyQNlIWm3HNw9UsZ5x3bJhiCTE35XlugJrcyATdM4p/2bRWq4+6yAG6qB7N
 EYRvv+tcjYUdyqRUlg/wnj6QDLJDoFw8f6J/efBcylDH0YhaffHJLDVzVMGHyKdDA1ae
 tKfA==
X-Gm-Message-State: ACgBeo0yxpwl/8LpE8zj/05/9+wd1V5przpmSpFp+7Ji979lBJw7HUcQ
 NVBtwR8fsk5rV7cBfYTSjxcidMPMIpQ=
X-Google-Smtp-Source: AA6agR6WwF3G1ap3jUsCZnr9KVz2nbG4TAft/50GK7sgQPxwLVz9kFHPJcGXcoMta9tCF+vIfLcgKA==
X-Received: by 2002:a05:6000:1f83:b0:223:6062:124a with SMTP id
 bw3-20020a0560001f8300b002236062124amr2203595wrb.640.1659995658528; 
 Mon, 08 Aug 2022 14:54:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d684a000000b0021f0558e51asm12020149wrw.55.2022.08.08.14.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 14:54:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 23:54:04 +0200
Message-Id: <20220808215404.1804219-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=jSr51MvoSv8D/30JXqSX24LjhqGj/ytpwsgTcyGWlxU=;
 b=FZZDAoxolFyg/4k7W2GgJ6CdvE+h85J5lkEE9hyLqWCeD6NYuoY9FnqmRrPrHNC1uz
 gUHGFObkPGHT7tQZfT4Gm6uJUyDmV+3qxEG7I37v6xN7x4TlhvK+uizG8K9ccJP+J0FN
 +IFlV0MDzN23h1S4b2e140htUqpTdJZfg0LQ/GlnU8Rns/9dooqu7kzoLKCFOC+36B63
 54GY7k5othc+BTHYUb9lJRYjnppU0hC6ACll3iWkM4Sw0ZwV2GiMfPC2GbTCGDJGeDPp
 LTHSDFkGUeUlAsCjk2cMDPXJsC6iM7rT9YjL160ySSmjpvo66clfoWrzE3hKcPyK2Giy
 XxFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FZZDAoxo
Subject: [Buildroot] [PATCH 1/1] package/xenomai: always set default version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Always set a default value for BR2_PACKAGE_XENOMAI_VERSION to avoid a
build failure when BR2_PACKAGE_XENOMAI_VERSION is empty with
BR2_PACKAGE_XENOMAI_CUSTOM_{GIT,VERSION}

Fixes:
 - http://autobuild.buildroot.org/results/d80c295a848b5be69324f5dfbd269b046dc68e8c
 - http://autobuild.buildroot.org/results/4e57a499b43208e546dd962ca04b43408c0c082c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xenomai/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index ec6d9e5d29..5c179eec72 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -73,8 +73,8 @@ config BR2_PACKAGE_XENOMAI_VERSION
 	string "Custom Xenomai version" if \
 		!BR2_PACKAGE_XENOMAI_LATEST_VERSION && \
 		!BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
-	default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
 	default "custom" if BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
+	default "3.0.10"
 
 config BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL
 	string "URL of custom tarball"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
