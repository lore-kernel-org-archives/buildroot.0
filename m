Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537CDC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 08:36:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3C6A6109E
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 08:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3C6A6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB85849B0;
	Thu,  9 Sep 2021 08:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9EcuoHrQzuIH; Thu,  9 Sep 2021 08:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4975F834DE;
	Thu,  9 Sep 2021 08:36:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD3321BF873
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 08:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9DB8834DE
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 08:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQhrTwtkwTYS for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 08:36:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 925FB82D45
 for <buildroot@busybox.net>; Thu,  9 Sep 2021 08:36:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g16so1352529wrb.3
 for <buildroot@busybox.net>; Thu, 09 Sep 2021 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fzVaoZ+Yzz4kglgYBZNHf7wOoHf56+pihm5UPRC0kYY=;
 b=pKqrsz3tVifRks47RhUiZhyFmbfngQW/uDs1qqUjx/mxZz7K9pGvYkwHncdFPLpl7e
 sLSaCSCmBqqkqbOM8SqbFFTRpCR3l3TWbTo7/dcetXrAQDLKl0OOXPpXgRHYFJGApr7i
 svrN/HMyNuiZQc6+/bqiz07CgUa7PmZbWhhEz/xe7EDZqnfBcncuGL3Esoios0JcIfY9
 ctHpritAvs/8qcw0ZOX/4mWcqUcCuhp0QC1RFfaHsaZZzRF+yZbGaJVf4T2amyyVQPz+
 YEjlXgPXJJJZFrFJtLOsUlHVLWgJlBfnmnnn+GveXOaeX0qazfdAZ9UuWnfEyviJDQwU
 m8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fzVaoZ+Yzz4kglgYBZNHf7wOoHf56+pihm5UPRC0kYY=;
 b=rQ8PToHn2tr6+XCV3a++1Ere236It8PR2Fl3sRW0nItyrJ6xdL53C5XWExPvLEf3WE
 tG8Wd9itbAbmcJdhA2ItdVDK7cUqmrTux8BYj+BACvAKhayPlex5cz22aubDWX2p0jqF
 YWm/PS6wMTB1zOpX5A/lGjHryeu49pUEiFqqmaQ1qs2V8wWnSFLB+u4KY85SnDZXuAp4
 bqK58SmSfeveh5t2dcYkKwKYcs/LGIbowrww2HPFMKRwi4AR0HG0raD6w5hNjFzUQIYt
 yDtkwvKKxfjkE/63xRC38LPm9+Yz5aYTuAdIEbslCVgfNbV1vE71oAYf4/coMltvWTsQ
 EcLw==
X-Gm-Message-State: AOAM5313P8UR4f5r1m1wxJZ5l3g4GQOhKDdhRTJV1CpTpPMQFKnoC4BO
 8SEzW4MpGerashMsp8XlC+rvnpAnNZg=
X-Google-Smtp-Source: ABdhPJwm31m6+ba3jlI/XuLTrFNuJb9VZgjrfFeW7LTxtRDssLdEt4oOpRd9VM93THMsYeaehB1ayA==
X-Received: by 2002:a05:6000:22d:: with SMTP id
 l13mr2087886wrz.410.1631176587928; 
 Thu, 09 Sep 2021 01:36:27 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id x11sm1073468wro.83.2021.09.09.01.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 01:36:27 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu,  9 Sep 2021 10:36:21 +0200
Message-Id: <20210909083621.2067123-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/webp: bump to version 1.2.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index 24cec6dfa..cf7b1dc9d 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2fc8bbde9f97f2ab403c0224fb9ca62b2e6852cbc519e91ceaa7c153ffd88a0c  libwebp-1.2.0.tar.gz
+sha256  808b98d2f5b84e9b27fdef6c5372dac769c3bda4502febbfa5031bd3c4d7d018  libwebp-1.2.1.tar.gz
 sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index ecf26faa3..d1462426c 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.2.0
+WEBP_VERSION = 1.2.1
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
