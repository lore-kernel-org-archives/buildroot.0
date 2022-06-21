Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D762C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 09:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15A0E6101F;
	Tue, 21 Jun 2022 09:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A0E6101F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4DchwB35k14; Tue, 21 Jun 2022 09:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2434F60BC0;
	Tue, 21 Jun 2022 09:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2434F60BC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC3FC1BF429
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 09:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A762383E52
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 09:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A762383E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Y9yU78Jh8Tl for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 09:05:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6BCA83E19
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6BCA83E19
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 09:05:20 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id r1so11944160plo.10
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 02:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2VGltKPleiCs+ms2+GLu3fD+K5vY/4tKtNRv9gCDdjs=;
 b=I5ybIBsiPJ57ZztyS7DIhU54E+CYHkcjnrv9DUWO1qdJmHddfIR1UD4gyfoCngJIIm
 +orrGv4xupXxZmX0XpoUbdh421YUctprBeOX3D50n1AjV1HcVbkRXyRlvr0SEk0u/ETT
 xpjR5mxN3JK6/++wgxWZVQMZeUd7DaYpOLZBp5MrXs42JLm+I4ZE0HvWr/PDORDtJZZf
 oGDPYMn9hsXpaPScsFRUyw9RaW4PG70hiYVKXSrFU3+HWt8nQJ0QOSw+u+tkuv9CXyBP
 8CF9f5JVv3k3BJA9MMgYUa3RndctP8052W2kfBTEvMj6c+PCawJojRR8ulyrbcAAd4du
 kS7Q==
X-Gm-Message-State: AJIora8gZvPkEM7fuaz8i01hA9GMYd2naurlZwZGHEYmNNBCWkKMnbhH
 h4yPFpoqmwp13w8TTzVsdGG6ofvB1qJqMA==
X-Google-Smtp-Source: AGRyM1ssXWmBHUubij74Pn5DlMteH5LzsMXcPkMIzGOqmlBDy+E+XCKSONk2jyxRjGe3+kRwlz0j3g==
X-Received: by 2002:a17:902:a60a:b0:168:b5f7:4148 with SMTP id
 u10-20020a170902a60a00b00168b5f74148mr28370659plq.47.1655802320027; 
 Tue, 21 Jun 2022 02:05:20 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:e0e9:8c58:f9e2:5377])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a17090abd9800b001ec85441515sm6233690pjr.24.2022.06.21.02.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:05:19 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 21:04:53 +1200
Message-Id: <20220621090453.3078403-2-judge.packham@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621090453.3078403-1-judge.packham@gmail.com>
References: <20220621090453.3078403-1-judge.packham@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2VGltKPleiCs+ms2+GLu3fD+K5vY/4tKtNRv9gCDdjs=;
 b=qvbw5pwqKU9qIgzHKzwNQmJnMnhqMug9Trh6h88h/j4QXGz76cucDim8JHYZkQjaD/
 LHN+1GLsrjwPj+gIfKpQ9W+C6pb8pKG4FpTh7mUbFv1x2iOFHsddyMJ8+MWWH8HBXwzL
 zyqHQspIhuAd9ORS/vrKTjgK49RHe1Tcag2MqavFxnlV9DwnOoFg0dcjPQXnt8at7Fgy
 gCapRZ7QJqq7AhjVOd6678p3HLERkO93iakXIfKG3CIGAnH+PSvUceahZ9lRUv4q9FHo
 4LaLim9mnzp0qWf1LP1h4BzKtxMPxeXzI5ojPeqDNziembdYXrZL+RkOdGr6TGnfShsk
 FSRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qvbw5pwq
Subject: [Buildroot] [PATCH 2/2] package/micropython: Bump version to 1.19
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/micropython/micropython/releases/tag/v1.19

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.hash | 2 +-
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 6beea78bc7..09bc574ebc 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  d804a422872c6fe283c6e4fd392698472035b34b5a683ac26adbd5c7582267f9  micropython-1.18.tar.gz
+sha256  128b6fb13b518b4d3e75b4f0c04f175dc336c762d8c6360f647e91dc4d25e5d0  micropython-1.19.tar.gz
 sha256  0f678c2abd7fe2cfca36693630506bbcbdfc219bd04bf4a02fe3b094ae4c666f  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index d8ba5ac0c0..f7af9bfc32 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.18
+MICROPYTHON_VERSION = 1.19
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 # Micropython has a lot of code copied from other projects, and also a number
 # of submodules for various libs. However, we don't even clone the submodules,
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
