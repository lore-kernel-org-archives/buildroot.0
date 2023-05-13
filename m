Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8087C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 15:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C08641C7D;
	Sat, 13 May 2023 15:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C08641C7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVmo9o8elAtk; Sat, 13 May 2023 15:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FCD9409F9;
	Sat, 13 May 2023 15:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FCD9409F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46D4A1BF5D7
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 15:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11B2D83FB9
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 15:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11B2D83FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d0PDS0jeFaz8 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 15:51:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4471983FFB
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4471983FFB
 for <buildroot@buildroot.org>; Sat, 13 May 2023 15:51:10 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f475366514so31640715e9.2
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683993067; x=1686585067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JAnJVlPfQFHcQPU4MBwbwLpBau1aw0aEhYZ5kPF61Lg=;
 b=aentwW4eMQx10KoX9lZD9MnRok5NgNZp0er4K3WeEOnrNGBGhsrCeII48D4TyeOY0H
 Lf+RY6HtrWbqp8fg5dIuan5qnhEnaWlbu5DuKlBrc88SleLpwYgQARgl6rYmKukX/QTB
 BKFWnTt/nswfVWFuiAjSkXNpnYGty0qdQnmTO0ugdYJ9kijzZ1GmqcHx3U4F9MJmvwz1
 kmgE8E24C9SLS0YNf1acj/7sZRAdN4J7YbFIT2uETWRTqkeGif37ppWVO+eq/qX4Pmut
 W8O0hR/NgVd9ql3btVuLZ6OeHjzOsOS0DVaft5SsoVbvAyT9baT/4efYQ579Z/vYanRx
 TXAw==
X-Gm-Message-State: AC+VfDwpuPA7pe24yWbr1IEaXLg7NxXdhqFdIXE1jibKIInXLgwm+2gR
 rSUFdI2E9pWSFUfVEsBU2v2hgqM44/g=
X-Google-Smtp-Source: ACHHUZ4zj0KjvOPH1Nt6Z3AGwoAkLKSh7jZGWFfo1Tp10HEbj6WldfKo+Ba/Koq8GbD4LvjAI/FaJg==
X-Received: by 2002:a5d:534e:0:b0:306:3301:b7f4 with SMTP id
 t14-20020a5d534e000000b003063301b7f4mr20861274wrv.0.1683993067360; 
 Sat, 13 May 2023 08:51:07 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a1c7513000000b003f31cb7a203sm31604737wmc.14.2023.05.13.08.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 08:51:07 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 18:50:29 +0300
Message-Id: <20230513155030.3207472-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683993067; x=1686585067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JAnJVlPfQFHcQPU4MBwbwLpBau1aw0aEhYZ5kPF61Lg=;
 b=dZr8401dW/iM/FZ91AU5OUldOda2mNQjFRadNVThrbrbAdKjk9KfnYeoQE0jJFMkP5
 fqPdhu4Em5KKnwVZDPtAOUbHpKRdxDdJAs+XjCH5yo59vTtAHZztb/gPuIjkot/V384C
 yOMT4dMSPe2Tbfg5E5yQNRBgy58jEkZmn6EgLeDASGOptowz/Baj8yuOWDX8P9Rw06FZ
 0LuIJillvHeyyUtgrDmTP8GRcEu4RAQaKt1WDZ+AMDjLPANMly8ztbi4nQuDWZiXykQh
 Ie6L9wJH58ZNyUiJdtjoVb18cZ3mmLIhPNtgJw6TCJTe47mf4jdTNGNrAvXsvR+Q7Fg9
 wzeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dZr8401d
Subject: [Buildroot] [PATCH v2 0/1] package/libdatachannel: new package
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
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new package for libdatachannel.

libdatachannel is an open-source software library implementing WebRTC Data
Channels, WebRTC Media Transport, and WebSockets. It is written in C++17
and offers C bindings.

v2:
  - bump version to 0.18.4
  - added libopenssl dependency
  - added gcc >= 9 dependency (c++ 17 requirement)
  - disabled building of tests and examples 
  - restricted builds for BR2_STATIC_LIBS configs

Maksim Kiselev (1):
  package/libdatachannel: new package

 package/Config.in                          |  1 +
 package/libdatachannel/Config.in           | 10 +++++++
 package/libdatachannel/libdatachannel.hash |  3 ++
 package/libdatachannel/libdatachannel.mk   | 34 ++++++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/libdatachannel/Config.in
 create mode 100644 package/libdatachannel/libdatachannel.hash
 create mode 100644 package/libdatachannel/libdatachannel.mk

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
