Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BD0C43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 03:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 238BF607EF;
	Tue, 30 Jun 2026 03:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnCmnBe0uYcq; Tue, 30 Jun 2026 03:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 293C260880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782789977;
	bh=dTDNH/MjckDj2zkHMmU6F009GoM4iloDY7RWdArn1zk=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jnYabFdsUasE8SuWRokrECifagoSlWXRS65iMQHY+LmJIaL0VN4+FEIrnu7C7sOEl
	 T60OqN2lWlZLmCSe4794WSCjrqik4S9E33o2nDx84KoCNxl7c4YdlnK/UedERMk9Py
	 wOsh7H8IcqxX1jRz5Wwqyz3wIefzEUMeXLnp+b4xRcB8r+cYx8YRBZsHhVTTF2pc6o
	 Fe340/n6uapn6phQEq86Z2BEGucJq+FV211c13Nwb4TlmXuaWpITO3iM5pS8YncNH9
	 pfp47e+5+dbI9jnJIiUU5V3OmqKtHTape/fu54HHXy+Xej5rW57orP4BVANgQdhawj
	 YJbAQeCiaIUOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 293C260880;
	Tue, 30 Jun 2026 03:26:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4DB21338
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AE3840127
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O90QP4oTnOJ0 for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 03:26:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=jms@tenstorrent.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDA9540111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDA9540111
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDA9540111
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:26:14 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-847968ca62fso839522b3a.2
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782789974; x=1783394774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tjgezf4DmAukAgjn1JS9AqVh3b+js08d7H9TK3AHLVw=;
 b=b3XSXkK8S+XopMmHDAUsMC7VQ81E3fvy+2J15X6Eyx8JFI2D3enSYp4oMReRmWnMie
 3XDvbDLEzH5UScEMHdZhv01KlOgIiFFGmkfIcG7HWSEZv0CDGsylohf3IteDTYr4XOMK
 yjhY4bDvkRWzm2df8b/1cc/2Uhi6ybqkmerW8VdsbT1W9hX795soOvE6ywwHPq9LDo9V
 bT3uZk5f+6WYG/0BAjSIzPub7XNaSkibOUZRqm/GqFgVCe08fAU+/z8i+ZIUfEIo7UKv
 OvFw0KvVkR7i5MCBPjiVI8X2+sMcZH/hdRgDvP6DaUVk7+5L01rCVcODMoIDqunr5ykU
 XUqA==
X-Gm-Message-State: AOJu0YzAZzcCXEcOV3p/3dip77T9529ebGOo92lheE6XWMFP83fU+gxL
 7AonKA6lTHGq+SyQs4xDits7iu/h3MdMF+GAtvBScuFbj4TOQwiQM5+q5mOeZc3YQDCkeXDkABl
 aWWP+7V0=
X-Gm-Gg: AfdE7cny7LxXobZoKJIatr1A1yRYXVbO7smvfFWwKrPe4LEpGCXm+ecZ2OLVF0cpdLQ
 Pd0Su5lHEi2tagDg6Z8Emo5JeLJKdQB1/yYqC0ICPPwxUG7UhomUTjqR3Nd4jvfTzczrjHsa4cP
 ZwKRgpNa6ZH0ZD1gfP6GUoY8LSuI1cH5noil9PsQrIv4dTRtdi/EHIKph0/OrJUHPf8DMjMr6Nb
 k/KnCxHK5XHO5+xAnqbqmTXgr5P+uPdVH8hGxmi0cSzBrDeEsci6CoCqNmalrk7bojvlGTPB6H5
 gDKEXWqLignVPVmkx0B6ANCDilOC1hIrG4JqvuXr2XvOOBV1ues7NgNqUOaHiiKFsvrWtt2VvXI
 5OE91+Fp0I8w61sNsnVmQBHOXmJ6ON5dpNU+M9YLThbL4GtS0D7reTRPAhe243RyZjkLmL7Wy4Q
 GiUReuOOX6W+2zRV1OxBlqvBlU3lWbrEQckQ==
X-Received: by 2002:a05:6a00:1253:b0:845:e2da:91a3 with SMTP id
 d2e1a72fcca58-8479f27b323mr1403555b3a.30.1782789974013; 
 Mon, 29 Jun 2026 20:26:14 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8479fcfacafsm859733b3a.0.2026.06.29.20.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 20:26:13 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Cyril Bur <cyrilbur@gmail.com>,
	Thomas Huth <th.huth+br@posteo.eu>
Date: Tue, 30 Jun 2026 12:56:00 +0930
Message-ID: <20260630032600.1521428-1-jms@oss.tenstorrent.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1782789974; x=1783394774; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tjgezf4DmAukAgjn1JS9AqVh3b+js08d7H9TK3AHLVw=;
 b=CUZUQOy6uKzu18KJqiVj8GOnhFjBEwYcJUUEy6hC39d8jNZoF4BmCRNdEWJupnRbov
 yqvUgoToAnp2jSy/N5W3EgZdTSxi7BYPAQTTfvvDWLJsaIIvdxEw4xHYYGrD0ym2uVMW
 AkWWZlVZh/cIUdO/cK3ZcHSBlSh/BzYuQ8suH5NG/H7qqBmWvwp0vSb3zBEaAUB+ioff
 KJpYSgeg4d0zmQVznHenQcmPq8K9PvPmy6rVsMni9KHaLjsQNs8yYhXyHJ+lobLVNS8o
 N5gkHs9c45lI/aaXnZLo0XwqEtHQPmpSiJbETyhIeT1+2z2YF5t1VHBiP8Kl7JQh6cBm
 2d8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.tenstorrent.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com
 header.a=rsa-sha256 header.s=google header.b=CUZUQOy6
Subject: [Buildroot] [PATCH] package: kvm-unit-tests: Update to latest
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
From: Joel Stanley via buildroot <buildroot@buildroot.org>
Reply-To: Joel Stanley <jms@oss.tenstorrent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This resolves the risc-v build failure [1].

[1] https://autobuild.buildroot.org/results/234eee7f3439fd78434bace87ba2390b74f038ae/

Signed-off-by: Joel Stanley <jms@oss.tenstorrent.com>
---
 package/kvm-unit-tests/kvm-unit-tests.hash | 2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index ad0922df5904..f2f07a0731aa 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  60015b023f34261c134d714f4670926ac81483e286a16475eb4a5cedab00eefa  kvm-unit-tests-v2025-06-05.tar.bz2
+sha256  0d3b588163064be2188b668abdebb4183ac211eab83d0a3cdc9a93f463686bc3  kvm-unit-tests-v2026-04-17.tar.bz2
 sha256  b3c9ca9e257f2eaae070cf0ccdf8770764f05a947a39a835e633413750a5777b  COPYRIGHT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 1ed902b1a006..b5b141574435 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 2025-06-05
+KVM_UNIT_TESTS_VERSION = 2026-04-17
 KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
 KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
 KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
