Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD63AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 815DF40259;
	Mon, 16 May 2022 13:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykCSnb2V9sZX; Mon, 16 May 2022 13:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5552740232;
	Mon, 16 May 2022 13:17:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 851731BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74B8282C9C
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxmwkS-vtu0s for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3C0482C8E
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:12 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u3so20507930wrg.3
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GOm2iHKwUbo0D4M7e9PWQeUNMlEu8ik+KRelrz24F2A=;
 b=CjLbZIWZw+QJ7cG5DKZnIlOwrf1+7j2ZKCkABFf22LoWuHF+sTDPTcpNaZY0Hpxedc
 CLcK1ogYx+r1fqT9dddD4o+WK0mwp0rd5IOk01WkUjF7peHAlk1cZyJyjLfpDYCyfPo5
 JSt7iq3pzhiDl6uyfNG/pgteHo5qEucAorfgHXP3iZ7iB51mfDZRFctoWIHcQScXP75M
 UQix0NnkgeUsv1SiFBZfdb2YrYuxRHfC1Rjv+fY4fvrMSm+QH0uJ6gbAlZoe+DH9v2RG
 IqPnajakRrgkf5+n44jTfJ7Xf84HWRWLx1/6ZAll3zPFXzBwEc58uy+Dtdj9ED9zQFI1
 Cf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GOm2iHKwUbo0D4M7e9PWQeUNMlEu8ik+KRelrz24F2A=;
 b=WPw9mvBBYDt8Zj6aUA3xIkpXcNcTvKImr8cv4wvEUDIwVtxxmhu71kkQlfxmZWBoHn
 EAwb9kcRr7OPFzcTFUi63fobLAkCF+NK4OZBhI4MHymiGDd66DKAk3Yz42s6xw75jc8I
 3WTTNREfXMxiGh3wbZduPq3fCERIGTqxuJnEOvaPzJsOVUA3Lj1bFaU7e8SHXo4ka8W6
 9qFDabnj4HnLZ/MLfnmSHTs18M2Tv4NiXcpW69RNMv1cmloma73bYpFIh1Br74Xt9Nt8
 SHQNmgorJioiiuoGsEokzpfLfcoFuR/7EaWNlhjBISZtx3IPZoUktVYLH/DbZ3B7+FbB
 g1FQ==
X-Gm-Message-State: AOAM533PmdSgNimG4weBztvqYOEhLF7iq6v/wtK1KyfmdXQeVqgktsx5
 Go8+VgeHypXNY4svABWzo3tPQG0THz8=
X-Google-Smtp-Source: ABdhPJxitALXm53kQU+gm4HWnxysgBMqH2R9EwHZdXqgm0ioOwPHh8Ee3NMXWMgvOm6YdF52vVQs3g==
X-Received: by 2002:a5d:4d8a:0:b0:20d:2ba:7db8 with SMTP id
 b10-20020a5d4d8a000000b0020d02ba7db8mr7363112wru.624.1652706852055; 
 Mon, 16 May 2022 06:14:12 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:11 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:31 +0200
Message-Id: <20220516131334.1910858-18-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 17/20] package/erlang-p1-stun: bump version to
 1.0.47
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-stun/erlang-p1-stun.hash | 2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-p1-stun/erlang-p1-stun.hash
index fb56b8f4e6..aef122b4a6 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-p1-stun/erlang-p1-stun.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  05d2f31f172883d2301a93cd141e6b930dfdd01e10b6aacf806becc3674973d8  erlang-p1-stun-1.0.39.tar.gz
+sha256  f9b82949b54778a4b766dca5509eef4475e1dbc165a449974dbd0cc54c6f84a2  erlang-p1-stun-1.0.47.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
index f762e7f45c..ce117e20b5 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STUN_VERSION = 1.0.39
+ERLANG_P1_STUN_VERSION = 1.0.47
 ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
 ERLANG_P1_STUN_LICENSE = Apache-2.0
 ERLANG_P1_STUN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
