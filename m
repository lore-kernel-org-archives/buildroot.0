Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66BBCD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 08:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E097641FA0;
	Wed, 27 May 2026 08:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wS1ETCZulynD; Wed, 27 May 2026 08:24:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BBC341F96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779870264;
	bh=1nTur6SWmjd4D8Q6sX7P/mczAkLNjPP63LyUJAb8xE4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LSrtjf9z3teC/AWMRwCvoqjD9IOBrS4RUQyvxwthqdqY1CwW6yFbOl9eC1YQqLXr9
	 PF9jjwtTtYwhypzKEl7fSEEfPaBwUFfhjH6OB4gZO8ZQwW58pu/K8r/AuLzzAW40tc
	 9mjcttJMQXDY2MTJM7lDa5rp/m8g81Z7XxH1CZTDQO4NXHNrAScU6d9PI/htpqQDCu
	 t6w4xcoaEHOHlcR954NpGHjtSnDc6mj3NYNrbvTI4dpYaCJIo+ifi8FG+BemxsiCVp
	 mPfqcp8IrZmISgv2819kE2caZXowVbnaDQDOfVVrThgS/5+v0mqfK2IqUfrKZruHpX
	 rill/Hbf7k5eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BBC341F96;
	Wed, 27 May 2026 08:24:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF42D21F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E38C41F96
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPMuXt3PGusu for <buildroot@buildroot.org>;
 Wed, 27 May 2026 08:24:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1513A41F92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1513A41F92
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1513A41F92
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49041e84237so41507315e9.1
 for <buildroot@buildroot.org>; Wed, 27 May 2026 01:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779870260; x=1780475060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NvZbCfGAx9ZJcOdZezA67yxkJZZlLW29ijWu1qpqF+I=;
 b=Enduu/LsjSBT3AvCoHhFhW46ut/f2fO/uNkOin1Flx3NL9E4MDJQs8yDs28eR17FBI
 K9aXS0oziRQ3gHelfPo9HLsykFAucvmZlwvuH01lx14F3xSHw7t+/hCDi151ElmzB8fR
 +c8lL8X4vBlG63xvOveKphfUHKwQWqpEhXvgKSon9l44k1J9qFDsGawifgu+/MWj3W8t
 azeoJTerl9apqodPAbh5RWPYu24QOgHgsbFxb1AhbQ4lF/oAdc0O+lEwZKKmJmcyj7P/
 Ako09mnMgz9xNP2tS2Hj+QHmb3BsU13xWwuox380D4yf4fKJqri80TkRnEgQxwQ/UI19
 kytg==
X-Gm-Message-State: AOJu0Yzg8c3YGQ7T+ZuEgBzslQd8UC/qReJKCDfkwKXkobUsYU56JQOc
 SGUeA6GZZfTANpDPhP6G9E1gPQ1OaWmUdYSAdzqs6E4VlOJshz2o8nuo40pihxIQINu9jliKwRe
 rsgYZ
X-Gm-Gg: Acq92OF7k67Xxxx5Uq8Yafr05mmsUUj7dUbADzAlZnE5DFeWJqb4cbVox9h4mMqxOuY
 TXFWdMf2zHNof+zC9wBl3puYHDpURQex/+NQssFZNUVy9PQvp2nd4DzBKWpsY9I7afGzUm89iTY
 Wzu6CEIv2SUYLC23qcb+ctRY1VVJRs3UQvr+CE94zbnxMkFXQeN/xg+Fn+RH5KGo5xKtmh4qPy9
 rBOJbtnji4HWNZHQH01SWnyIebYJRnPTlVMSXrTRiy6iz7sSLFJm2+9gnbOlF+tKPLMum6xE7by
 yPBI5UvGEULHdGTBDejWwkqvM1FDW8emnYXD+BBLAXSN5Pufl4k2VPdhPtNx49ipX07Iri0M6u+
 wPf1cLUUQFEkhjbogUN/wqAVM8Z+o9SYfUg5P4+MsTdTt1JYrtM9enGeln/fVofX9jbD7wM5cCb
 NwBOiXqBtxAIPEnwP+CltAbVQTeN1idke6DO6AKYvrq4w8wQINrIwgZaXbcA==
X-Received: by 2002:a05:600c:8b08:b0:490:5443:621e with SMTP id
 5b1f17b1804b1-49054436375mr255111865e9.12.1779870259997; 
 Wed, 27 May 2026 01:24:19 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a160sm437803495e9.9.2026.05.27.01.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 01:24:19 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Wed, 27 May 2026 10:24:11 +0200
Message-ID: <20260527082418.151980-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527082418.151980-1-thomas.perale@mind.be>
References: <20260527082418.151980-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779870260; x=1780475060; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvZbCfGAx9ZJcOdZezA67yxkJZZlLW29ijWu1qpqF+I=;
 b=eqWLwaYfCjUXPOH8irsFFC26eW0qqDoT/maCstA8QQlXB1hIF6qKkTnFbftZYsbbw6
 HeN2ZwZ2Up1n9+qatOtehyEqxiGhAu5nXEI123hSUJvw/defI7zDeBKGtJg+RUCTh7hK
 YqlGNBlRd9MotDmk1uC9ezuQ45UyS2TFSOzJgvBbTED2RqWMhWBQXJO9CM/UytYOtTk8
 ExP1eQ+4MdMed1DhJsbACic245lR2Zy00A6peatONmcuPIDz6880kK2YwxKugB1ZyIrH
 6GKUmnImnatw4+zwZjo/Mk04OrTFdeDbqSeAPO2pC9E28wXJT9kOhNXMjk4xAJG2ObJk
 NOig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eqWLwaYf
Subject: [Buildroot] [PATCH 2025.02.x 2/9] package/go: security bump to
 version 1.25.3
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Korsgaard <peter@korsgaard.com>

For relase notes, see:
https://go.dev/doc/devel/release#go1.25.0

go1.25.2 (released 2025-10-07) includes security fixes to the archive/tar,
crypto/tls, crypto/x509, encoding/asn1, encoding/pem, net/http, net/mail,
net/textproto, and net/url packages, as well as bug fixes to the compiler,
the runtime, and the context, debug/pe, net/http, os, and sync/atomic
packages. See release announce:
https://groups.google.com/g/golang-announce/c/4Emdl2iQ_bI

go1.25.3 (released 2025-10-13) includes fixes to the crypto/x509 package.
See release announce:
https://groups.google.com/g/golang-announce/c/YEyj6FUNbik

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add links to release notes and announces]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c55714aeb9e9bb32b0674b93c4a4cd4b6fa4eb52)
Signed-off-by: Thomas Perale <perale.thomas@gmail.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 60d61433fc..1dc1b99756 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  d010c109cee94d80efe681eab46bdea491ac906bf46583c32e9f0dbb0bd1a594  go1.25.1.src.tar.gz
-sha256  d03cdcbc9bd8baf5cf028de390478e9e2b3e4d0afe5a6582dedc19bfe6a263b2  go1.25.1.linux-386.tar.gz
-sha256  7716a0d940a0f6ae8e1f3b3f4f36299dc53e31b16840dbd171254312c41ca12e  go1.25.1.linux-amd64.tar.gz
-sha256  65a3e34fb2126f55b34e1edfc709121660e1be2dee6bdf405fc399a63a95a87d  go1.25.1.linux-arm64.tar.gz
-sha256  eb949be683e82a99e9861dafd7057e31ea40b161eae6c4cd18fdc0e8c4ae6225  go1.25.1.linux-armv6l.tar.gz
-sha256  8b0c8d3ee5b1b5c28b6bd63dc4438792012e01d03b4bf7a61d985c87edab7d1f  go1.25.1.linux-ppc64le.tar.gz
-sha256  9cfe517ba423f59f3738ca5c3d907c103253cffbbcc2987142f79c5de8c1bf93  go1.25.1.linux-s390x.tar.gz
+sha256  a81a4ba593d0015e10c51e267de3ff07c7ac914dfca037d9517d029517097795  go1.25.3.src.tar.gz
+sha256  acb585c13e7acb10e3b53743c39a7996640c745dffd7d828758786bde92f44ca  go1.25.3.linux-386.tar.gz
+sha256  0335f314b6e7bfe08c3d0cfaa7c19db961b7b99fb20be62b0a826c992ad14e0f  go1.25.3.linux-amd64.tar.gz
+sha256  1d42ebc84999b5e2069f5e31b67d6fc5d67308adad3e178d5a2ee2c9ff2001f5  go1.25.3.linux-arm64.tar.gz
+sha256  3992bd28316484be0af36494124588581aa27e0659a436d607b11d534045bc1f  go1.25.3.linux-armv6l.tar.gz
+sha256  68d1a08bf3567f330717d821b266a0be1c5080bd05dc238b5a43a24ca0c47d7c  go1.25.3.linux-ppc64le.tar.gz
+sha256  a0b5ccd631743f01230030412fdc9252b18d96b4e63d44ba1c4e9469e79cfcb1  go1.25.3.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 535787c92a..85a40d4d36 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.25.1
+GO_VERSION = 1.25.3
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
