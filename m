Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0121BC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 12:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6D79402C8;
	Sun, 21 Jul 2024 12:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESpH_nuD7fLe; Sun, 21 Jul 2024 12:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E9E8402DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E9E8402DC;
	Sun, 21 Jul 2024 12:11:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0DE71BF319
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 12:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF1BD81162
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 12:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTUOuUnFvinA for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 12:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC0A080C6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC0A080C6C
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC0A080C6C
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 12:11:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3687ea0521cso1975410f8f.1
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 05:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721563870; x=1722168670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=67yv0aQaj2nGPY1yT58y7FlBSlOQXAeb6RsJAcXmHIw=;
 b=coMKiTCuv8bQdbxid34Cc+PPKDGJav+KMOIHz9y0t1bWZVBe0/xOLuPTCMqpeSLXEZ
 6w8C5W/VvWXXMfMmBlISRFAuBQErbXUQiPH2uTneMEw212zgMegjI9J0Z0R4Zp5qobHq
 d3sK6hEnh+OphrgLNiBOLYS2JkhGxOowm2qaGg0/ONx+mxierO4jS+qo1zWBbvlNUocm
 F80Xs///U5ByO3hk+lFYKnlymTwDk/AAfl4tsrzPXjeIst43a6cwSsmONyxCxXaMdwN+
 OGR0fOI6YK3GnSxkKNtYwAOQplyfjkIQTh7oNkd78JedgO33cmyug4EWthHThvTyox0d
 T+sQ==
X-Gm-Message-State: AOJu0YzxK68qL4I4DruPj+Xnphzquv7bkb1KzSaqz/JCjutRuK8dNMAv
 NXavlMMc2LPzTXvxEeV075rNIVZNTLyv8isnowgilcI8aX5ppboJL/WIpQ==
X-Google-Smtp-Source: AGHT+IHX1Gm/dzeFQOZbWtawQRc2szVYKqGiwjVI1P6n+OURCW6fof82ZEZuvkuHgjolhSfsm1gepg==
X-Received: by 2002:a5d:67c7:0:b0:368:6694:b4b9 with SMTP id
 ffacd0b85a97d-369bb2d54damr2912247f8f.58.1721563869839; 
 Sun, 21 Jul 2024 05:11:09 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-265b-b2a3-bdc4-dd7f.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:265b:b2a3:bdc4:dd7f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c922b5fsm288211166b.178.2024.07.21.05.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 05:11:09 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 14:11:07 +0200
Message-Id: <20240721121107.2125187-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721563870; x=1722168670; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=67yv0aQaj2nGPY1yT58y7FlBSlOQXAeb6RsJAcXmHIw=;
 b=ItHpUQSyIrvkq6Y5rPgui70dwPrLg0KPP2NJdByPJDsV/iJzb7JjAHTPlhxwiuKGxn
 UPdfeXuNX+d3U6qXeiWQXuuBxWhOh3breVhiAKjCWwsrzvsJO0oOrOamJZr3MWryCkpv
 b0QArb3dRwZVZOEZ9sSkn60u7gNryjUpZrQ7cexE0TuKAIHOJH4cHjaxLLwweKRuHOc7
 +7ra8KhPgHrnG2gCwmn1CZFYIXKb/9beYDh26Dqe/AY6z3+rPCwwaTsk78KpPBx+kaEQ
 6vm7iONId7IJjKIXu1W//ZA9fLGvXgHm2VN1UZqm60+avJ4li7jYUFqwYxUIEB7PqQsj
 aTsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ItHpUQSy
Subject: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.18.22
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/eza-community/eza/releases/tag/v0.18.22

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/eza/eza.hash | 2 +-
 package/eza/eza.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 3bc55b26ef..18d437abd1 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c01f11ba19956108e42244f0b094bbb6bc74c13ea2c68feecf6f0ff2f127df97  eza-0.18.17-cargo2.tar.gz
+sha256  4ecb6221b28aaae309043b8403555eb6835de671c519c224a3807cea50f48001  eza-0.18.22-cargo2.tar.gz
 sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index 5a44fd7826..79fd2d3633 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.18.17
+EZA_VERSION = 0.18.22
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
 EZA_LICENSE = MIT
 EZA_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
