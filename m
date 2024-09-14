Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBECC021A1
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 15:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBAC440179;
	Sat, 14 Sep 2024 15:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWEilckABnkY; Sat, 14 Sep 2024 15:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99AF040260
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99AF040260;
	Sat, 14 Sep 2024 15:23:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F1DD1BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DEE8840CD
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRrUL-UrX7WY for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 15:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37562840AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37562840AA
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37562840AA
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:23:37 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so234042066b.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726327415; x=1726932215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k7hfDtysFt9fYXzCoQdwK0xfjiHtTBGaaVtsx2y2jkA=;
 b=tYs0ZFQn9L3SwtWRZl53iJxh4Fcbe193VTbFiEqdQwAgkLMwGRLbwsl/YjTJRDAzhP
 5EI1vxbKV16mw4doZn9eXlcXscLRogg3yq48FbUL/LSb9AvjvUN19iruALObZuCFnRBd
 6R9/QDqkRvLYMLpTcNE3RkSI99l1loIeHedLLbB53VY4o4tfO6Y3+UXtYF77jS63KePO
 S4Td5XwgkSnIERkNCu4S+6jir1wIMIIF9yyUkR+lqD2DkmIGffW5LaVALDddm4lq9heK
 yw8GVHYALxY76YMjvcksc9e0mlSG9vyVsSJ501svK1VSAoGaRgA7fxMUZce0c59di7Cx
 8DsQ==
X-Gm-Message-State: AOJu0YynVY6e/3p7da+AdVbaTPEytkFQOaCmwd8PUiVfIpwA0szY/UHh
 mLqpXpzQuyPiPjw9uhGwIQVaS4cbHOxCm2kcLCkr0thMU6T+OyTu8fZgvEF+/qYGp0YjtNxe7O9
 4bKfMQA==
X-Google-Smtp-Source: AGHT+IHuQSY73GlGHSAchUtTTSwDCz2A96FOSthtz1pz/7PVJW5awMtM/7KZBykM21QEbNlkAzxMuw==
X-Received: by 2002:a17:907:f728:b0:a8a:91f4:fd30 with SMTP id
 a640c23a62f3a-a90480cd25fmr604864666b.56.1726327414568; 
 Sat, 14 Sep 2024 08:23:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:61:a2::872])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061116c28sm91660066b.95.2024.09.14.08.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 08:23:34 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 17:23:21 +0200
Message-ID: <20240914152323.2630539-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1726327415; x=1726932215; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k7hfDtysFt9fYXzCoQdwK0xfjiHtTBGaaVtsx2y2jkA=;
 b=LakBxC50ZzOjkOfT2nUIC/7jizVeKeUcBsx3QwxvxzraLlFwLtxHNkR1YinBjG3BIx
 rCUdeTf/vmgKpWx4bZmdZtH2iR9SewCGsMjs3lW2rtRinw4yHntBsBBk0AiVLd2sQyFE
 FnAp3dRnNiFJCVy665iSK1plk/D/Aqa3R/hNwtEA/kYis6IYWewmEpFd76BhhGMHZZ4b
 dYyzQ/7UnDgi4kEor7BhBI7hLfUNZMuYfWU60YKx6fBq2jbBRDBffGgX3tI0lhsMKOTA
 ZtlTsrhqUXm8QzDJNwHVyPNsfc0dctzVKqxnyM/vkbyVmusbGM/BGDEmREzvHa76drke
 jqIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=LakBxC50
Subject: [Buildroot] [PATCH 0/2] Add go-bin virtual package to go providers
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previous patch set adding 'go-bin' failed the tests in newer go version
because of illegal instructions.

This patch set fix the cross-compilation issue coming from the 'go-bin'
this was solved by specifically mentionning the GOARM version in
environment variable when building a go package for the target
(`HOST_GO_TARGET_ENV`).

Thomas Perale (2):
  package/go/go-bin: new host-go provider
  support/testing: add tests for Go providers

 package/go/Config.in.host                | 22 ++++++++++++++++------
 package/go/go-bin/Config.in.host         | 13 +++++++++++++
 package/go/go-bin/go-bin.hash            |  8 ++++++++
 package/go/go-bin/go-bin.mk              | 20 ++++++++++++++++++++
 package/go/go.mk                         |  2 ++
 support/testing/tests/package/test_go.py | 14 ++++++++++++++
 6 files changed, 73 insertions(+), 6 deletions(-)
 create mode 100644 package/go/go-bin/Config.in.host
 create mode 100644 package/go/go-bin/go-bin.hash
 create mode 100644 package/go/go-bin/go-bin.mk

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
