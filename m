Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EE5C3ABCB
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 05:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3A036102B;
	Wed, 14 May 2025 05:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lScz_MRZq6Kp; Wed, 14 May 2025 05:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD6C161022
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD6C161022;
	Wed, 14 May 2025 05:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16770153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 05:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF5DB61022
 for <buildroot@buildroot.org>; Wed, 14 May 2025 05:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dp-QQXlqDRWL for <buildroot@buildroot.org>;
 Wed, 14 May 2025 05:54:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2d; helo=mail-vk1-xa2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 072D960C1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 072D960C1F
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 072D960C1F
 for <buildroot@buildroot.org>; Wed, 14 May 2025 05:54:42 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-51eb1a714bfso5392803e0c.3
 for <buildroot@buildroot.org>; Tue, 13 May 2025 22:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747202082; x=1747806882;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8I53WuFJOyfrA7tsU2SgwmWH5Nca0G2MCB1hK5ugASo=;
 b=IMZJiZzpHjGAex5W1IiDv5VAufKs9ocj78GaICUccM1H1z0sGyHEGg+xpqxeIa0wtF
 jntIenNIG0AH3YMMTlORdK/fsc3tKc4XzJNLqlYEVECv1MQwxOjVIS8RV0KgvP5HJLtQ
 cgnKT+wUt5LT/AKaDHZRwMc/f6S6YnunTTjeyJv/eVPr02Bu3o55P4ABy4FXAkGRvv7W
 P9buZ+9RV0VB7FQOxpWdRV5TvNwM5esHUmGjDEJMX+ZNHyz0p5//oLNjiQD4UzWtAfd8
 unAlRroQImq9lOax/kaYfkJHAugLGIuh8nWKzgA/4pMZzv7k6B/c7g3Xo9sa5E8s14mC
 9xoQ==
X-Gm-Message-State: AOJu0YymOAtgksO28yRQNWEGp3vXAMtwZe2mRZqjyaNxuQC6IcLUUi4n
 31eb/RBQ1bFIEOj9whulgxlrqHTRlJLA7SOF6qJ+CaWjLk0h7piGuyVTL79CWMY2RgjgXPPAU1R
 G/eduysWM2n1yAW2rsbxg3SXq+A4=
X-Gm-Gg: ASbGncsyP4efEfaAp9rXI8Vg+/rI0GFh3lXfS22CtsKx+RL5ADtEMMx0/6hvuoGNMEi
 8eKNY3oAKI7+R0gG4QLOMqAlBSM/YQrX8i70xrxLKd1Wx62gy9MHcnv3zVFfSPoP1dmoiBJDflJ
 xgcQ3Z2iG5UuFtEkAJAPYFXefE/wRYnBoAMQ==
X-Google-Smtp-Source: AGHT+IGZEjmBY/rVL5yu9a25ttKhuxJwgwm5qbmVc3HtfQxahy7BN+RPrRszLSyPhM+rs8Z7XxuEb08XabgcMDo8swo=
X-Received: by 2002:a05:6102:8012:b0:4bb:e36f:6a35 with SMTP id
 ada2fe7eead31-4df7dcc656bmr2131316137.14.1747202081775; Tue, 13 May 2025
 22:54:41 -0700 (PDT)
MIME-Version: 1.0
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 May 2025 23:54:31 -0600
X-Gm-Features: AX0GCFuxLCLPzHUVeM2Wm15UG17WVJSWwLRj5zdsZCnvYZbASETp5yvxmfVSbaE
Message-ID: <CADvTj4owRO4eStPZLpQNW4_ogyNj1xSw1iD1PJeepQ10rMFWDw@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747202082; x=1747806882; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8I53WuFJOyfrA7tsU2SgwmWH5Nca0G2MCB1hK5ugASo=;
 b=G74avln6H1Hi1YGBBnsDt9cBXQeY0OOGoMNeSMrgOH1PiEujxBB10+Z/SCIvo2ixoh
 NOTdkS43HpBV962Qvy5q6H2/6t9MxIqKQ4yP9h/5pnJUVocsRZAzcjgQw59hgnMrFnCn
 0nESZSWMTppjeqLwSl+IaDiEGy5w1EA79MJsIP3VCxvMfkWXjVC5cdeO0l+xrE1GZeOA
 FQ+tWSJPtsVNhduEptQm1X4vuYwHHgS9Qx3Mp2lwmAy9HgcR5Qf4GD2dHMCVUqK/jeVi
 BqKU/E8Okz9JQej8KO89s6tWyqT+gUWzYyHp31ZJN1s8KKbaw+kYTBQeXPKkxdFHaylK
 TCGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G74avln6
Subject: [Buildroot] go-bootstrap-stage1 broken on hosts with gcc 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

I noticed go-bootstrap-stage1 is failing to build on hosts with gcc 15
toolchains like my arch linux autobuilder.

https://autobuild.buildroot.net/results/8c1/8c1f00ef09c246db58a0af8248305461238a5b0d/build-end.log

I made a quick attempt at trying to work around this but it doesn't
seem to get picked up, any idea how best to handle this?

diff --git a/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
index 3e4ee57432..009c42d1ca 100644
--- a/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
+++ b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
@@ -25,6 +25,10 @@ HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV = \
        CC=$(HOSTCC_NOCCACHE) \
        CGO_ENABLED=0

+ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
+HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV += CFLAGS="$(HOST_CFLAGS) -std=gnu17"
+endif
+
 define HOST_GO_BOOTSTRAP_STAGE1_BUILD_CMDS
        cd $(@D)/src && $(HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV) ./make.bash
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
