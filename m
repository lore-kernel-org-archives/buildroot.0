Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FEEC54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F9D541564;
	Wed, 13 Mar 2024 09:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4nuLh1TFh-HZ; Wed, 13 Mar 2024 09:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE2C41557
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAE2C41557;
	Wed, 13 Mar 2024 09:14:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25B081BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4431681346
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 489U53Fnz0Nd for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A008D81375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A008D81375
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A008D81375
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4132e548343so15674195e9.1
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321265; x=1710926065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k6mo7vLfhWCph9udaPM8/JFPpDFqLrVBonIxwL8LUfQ=;
 b=otyChbOESBue7XqiwsnR7it1uvU7XXXtKd6fJuO3WFhoV2YO8fzxHO/vkGVI8TuILI
 3/0fVc3gGHRQJFd9KCEkHq94N8xncAWsA8ILE1cNPGQZt1L2LGUcmAvaKt4hfO0aFAz1
 T5Fcil4dG/JiY0+VoUrG8jV5F3FBbXKzHp1zAjWIrB1tPmR1tkXOBVoRqKiN+XzUxHfi
 kFA/jfteNgq3EoRd4bfNOMujiytXwA0UWCmmlnpoAKR2qUN9scw1+AUhoLT/INnUeDYL
 kYJjTTu9QhGkRNZErrany4A+BdmlftaAX/Es6cdxM1CVqsqr0dC7Tr256ekNAjp4v4Kp
 M13g==
X-Gm-Message-State: AOJu0YwEbPQJ10nUIEZy1FA9SobnvsFxRUGTjnQh9DrowJUNbY/bdaz9
 EughnEkd0pZcgM6Jw0er0I7aDa+WeFmoMiJCy1pkJw23oV5ixNW+dJjvM+hOFrc=
X-Google-Smtp-Source: AGHT+IEUMgYMN92QFfnLqMya5x9As5GBlp7QPu5T5O4pOvue9lzcbY+y2WeTNlHUSXKcBwF5XSok/A==
X-Received: by 2002:a05:600c:c17:b0:413:e926:73fa with SMTP id
 fm23-20020a05600c0c1700b00413e92673famr1050245wmb.15.1710321265711; 
 Wed, 13 Mar 2024 02:14:25 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:25 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:49 +0100
Message-Id: <20240313091412.20865-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321265; x=1710926065; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6mo7vLfhWCph9udaPM8/JFPpDFqLrVBonIxwL8LUfQ=;
 b=INyDfbAXPkfBYISE43geZURttszW9aOvcvdllliJKKc5qRricGx89a9YbgK8plDw2u
 qxjro9uqJdtvkBktldbDJbxpxCu/G4Gaa6hv72/FBUc5ZL+E4mHAhF/aQjf9R1kDzto7
 MuoOaz6l7DSKGqwBQ1+nk09wrHqw8ofAOTsog3W1TjokRDVzXtm/TKwj23N4ovcg2WNF
 3S1P3SM7mIH3m5Lv/TRFsk2SuH2svVWQAOTwJ61iNWv7Z+2rQrJw6EbGbHCi7oYDS9m5
 zRt6nfS4ZuOns1AZbn9c3Ki0DuSdMhwCO5Wm/9mgF80mHJqnrm2H3Fb3Sy1R+pWwKDdi
 OUHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=INyDfbAX
Subject: [Buildroot] [PATCH 08/31] package/gawk: disable busybox awk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gawk/gawk.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index ff1b9920a..b4261d767 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -31,6 +31,10 @@ else
 GAWK_CONF_OPTS += --without-readline
 endif
 
+define GAWK_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_AWK)
+endef
+
 HOST_GAWK_CONF_OPTS = --without-readline --without-mpfr
 
 define GAWK_CREATE_SYMLINK
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
