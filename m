Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2AEC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 15:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3098281410;
	Mon,  6 Mar 2023 15:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3098281410
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wM9xLh-C4V8k; Mon,  6 Mar 2023 15:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82D848140B;
	Mon,  6 Mar 2023 15:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82D848140B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C9561BF399
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 15:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 465AA60A9F
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 15:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 465AA60A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njBa6s9hCe1K for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 15:53:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D3B60A98
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77D3B60A98
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 15:53:16 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id k10so16636074edk.13
 for <buildroot@buildroot.org>; Mon, 06 Mar 2023 07:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qSA2e1Qq1++3DuLJm2lY3Xx5IVeJtETNyhMkbf4DGO4=;
 b=Lj4gpo2yvf+v9LcJJC37+rV34RYzH/N+miwCECBxTGFoyzWYZjT/Y3TaFj7qRpxRuT
 EhqrKrjvapNr3SdXlnl6/gOf1astJfTAiW6lz+fTW4s/2hSzM8fKCmbrRg1aJsxeRccN
 P+5s1CACzaZRnzFDRgHTbxgHHc8h09bKgywtw/YAI7vRKHEbD4LpIZfwIKrtaH/FG3ZC
 pm/OaAfcDzkLUrWs/2qRT3H7XW1piv/TXNhjLM0CTyI+0XTUx5lZdy90wyqyovmqIuoy
 rWlpdvfePgru4+RgQCjns/5hIZ0cd1s0TL3q78yarcdnlOC9dZtqLya8cvDShgzBAi6a
 OL8w==
X-Gm-Message-State: AO0yUKWZcsKvOmfbF0NZ3fcn/zQpkeHz99VhaHNisQhKKB0acDoIsO5I
 eGpIWRVHmSiBdAMz0WG6NfFVhJx8gcqgdg==
X-Google-Smtp-Source: AK7set9JG1iWyEdcgfUK8+yv9VCpeC5gU2C2H3ZZ+7W9cK+/+mZ+nr/Vf7M/mz5DOTnRNk/6IabyCg==
X-Received: by 2002:aa7:c7d9:0:b0:4ea:b218:f7d3 with SMTP id
 o25-20020aa7c7d9000000b004eab218f7d3mr1109525eds.10.1678117994229; 
 Mon, 06 Mar 2023 07:53:14 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 6-20020a508e06000000b004bf7905559asm5312877edw.44.2023.03.06.07.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:53:13 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Mar 2023 16:53:09 +0100
Message-Id: <20230306155308.477063-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678117994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qSA2e1Qq1++3DuLJm2lY3Xx5IVeJtETNyhMkbf4DGO4=;
 b=E/3lKvIwAAeBVMGRrM9Ows0wCCLDOXV+lQcCdSEtn1Um4y9eWKtnmiMcPxeyIFlJSq
 O/RROTnbvKW5LaO1iwvR1Nicf6V4sxwSmCYVyxSFVrhYqbQbaL0g2y+zN4ylGcBF1DnX
 +gnTM69eabepMrrPHjBKJr8I07to6+u1hJkKEDD9VDmBlKbU9MyabAR9aQaU5F0UPAU4
 oN+AVtRDSxhEhd/T4YqfDstCo1Hd/9vX0YHcoE2p1o386FLNxKa+XKV48Ka6WiS3C2U0
 AYw9nfRfZ7Sbb11vWwd0Z6+lCoO/D4C37640zr9Uq9PXH70zUG1mxY+NU8YO2cJpNgHZ
 2dXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E/3lKvIw
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: add Heiko Thiery for
 package/rauc
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgotLS0K
IERFVkVMT1BFUlMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDYyNTY1NzZlMDIuLjk2NzAzMDJh
NzggMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTI1Myw2ICsx
MjUzLDcgQEAgRjoJcGFja2FnZS9saWJuZXRjb25mMi8KIEY6CXBhY2thZ2UvbGlieWFuZy8KIEY6
CXBhY2thZ2UvbGludXhwdHAvCiBGOglwYWNrYWdlL25ldG9wZWVyMi8KK0Y6CXBhY2thZ2UvcmF1
Yy8KIEY6CXBhY2thZ2Uvc3lzcmVwby8KIAogTjoJSGVydsOpIENvZGluYSA8aGVydmUuY29kaW5h
QGJvb3RsaW4uY29tPgotLSAKMi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
