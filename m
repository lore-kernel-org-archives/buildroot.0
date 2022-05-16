Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B53C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8594582CB7;
	Mon, 16 May 2022 13:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7kk0MyD67iUp; Mon, 16 May 2022 13:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B45482CAC;
	Mon, 16 May 2022 13:16:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85C3C1BF97F
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 709B940B4C
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryEDqwdu0kR0 for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD44540396
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 n6-20020a05600c3b8600b0039492b44ce7so8605663wms.5
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7XJOJPcjSMEEwctHtUxQIexDeWSOoXLddVhind+MkA=;
 b=Iy64amfBxrgKJ+KkPA9KOelZ/hyyiqak7S60AvvHX9o32AiVpOwXQd2cB4y/NkZd4Q
 ldWp/Ks9kcGx6rFUufOhhYgynGJHAyxBxD7quF1+pGvOewmfvmKOHe9h94YV1Yt47nf3
 pTYhrsQ6JBsJlbFhr5Jny0GsP20ax6q1N57GxjGskcSAWE5DdYrOiGiEGgcODn9/zkon
 u8eKmcfqzBAV00NjylamlMo+uVj5IuHbJ45MhZXSsQYuklHdb8dnJ9KMUrBlKhWB634H
 9foGPtBFDGRN8DOo9cjIZUVEbG6Y6tKocoHmDmjD1aKTQPNLZQNKgA2g15yflui8Y8Ud
 zeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7XJOJPcjSMEEwctHtUxQIexDeWSOoXLddVhind+MkA=;
 b=x7S5TRoh2KwfgZjJ1f4nQqajmjkAr1Pag/+M2MBimeIMPstBjHtmhznGfyDUaXcO/E
 eZU2Lio2pEldpzYaNF33b5yDY4w1r9bbYdCcIvjrmS+kG9R3ilV/WxaaI6YA1InsZt+Y
 DThTdPW0JgAaXKbhiQYxs9voHpkpZUGQR4e/y6l3yNkkxFG93KR/EqZjXGiXsBassJOm
 iRTXvAa6f/XS7hBjkjFJhIJ6B4ibGEkHFO6JfAfkKnTA48GPKCQVtAkpUJgow4JmlzYF
 rD7EhH/7v07CXdwAzdRJA48Zq0XxA12W2LyK9Fzj/uakP3pz77k7Ol87seElN2PW0IMv
 5+rg==
X-Gm-Message-State: AOAM533O2kQCkYODpV+782+7E9/mAqR4OG/ChXNSLViHAQGELzYjHIuJ
 GYiv17FvS732GSpBqIfsA1aVeVhouzc=
X-Google-Smtp-Source: ABdhPJzjkEQ89mpRUWGutq0KkiWZhcCX39QOjYaVewI7i+W/e0diWyjVQy/naVITTtfCrgqLSQllQw==
X-Received: by 2002:a1c:cc12:0:b0:397:128a:c562 with SMTP id
 h18-20020a1ccc12000000b00397128ac562mr830866wmb.9.1652706843785; 
 Mon, 16 May 2022 06:14:03 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:03 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:25 +0200
Message-Id: <20220516131334.1910858-12-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 11/20] package/erlang-p1-oauth2: bump version to
 0.6.10
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
 package/erlang-p1-oauth2/erlang-p1-oauth2.hash | 2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
index a6d00aa96e..7a0304e86a 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c5cf0d2a9f5874c289cc6044945f4771a79007bda812e5269dea3a4c92fc8811  erlang-p1-oauth2-0.6.7.tar.gz
+sha256  625e6d96a212cc2cf8a63c36ee698072791d85acbaae18e5820ba144cdaca869  erlang-p1-oauth2-0.6.10.tar.gz
 sha256  0ecddd0a5e35b7fcdab451f54c5bb688fac8365cdf6b0da0ac64b7895a0770f3  LICENSE
diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
index d7dd45b252..50ac9fbda5 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_OAUTH2_VERSION = 0.6.7
+ERLANG_P1_OAUTH2_VERSION = 0.6.10
 ERLANG_P1_OAUTH2_SITE = $(call github,processone,p1_oauth2,$(ERLANG_P1_OAUTH2_VERSION))
 ERLANG_P1_OAUTH2_LICENSE = MIT
 ERLANG_P1_OAUTH2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
