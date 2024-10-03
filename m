Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C71CF34BA
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 16:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9E5F60628;
	Thu,  3 Oct 2024 16:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8psSHZGcFup; Thu,  3 Oct 2024 16:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C06760637
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C06760637;
	Thu,  3 Oct 2024 16:26:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85CF11BF285
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 16:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7517480AE4
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 16:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvVCeJKfDYwV for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 16:26:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0C6B80AD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C6B80AD2
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0C6B80AD2
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 16:26:43 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c42e7adbddso1336933a12.2
 for <buildroot@buildroot.org>; Thu, 03 Oct 2024 09:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727972801; x=1728577601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yljPPhBIPvhEqs2MDExScH56YHypaTe5kpzlqOUbBiw=;
 b=oPFIvUN4L0JjgCPU0AckAUUcvgi2K9yqtndA7jqYi8P505SlNmxURf4xgJcFCZxdqC
 6vW7BZ8EVWF2mQi0f+fQGy2q27vq2kECsuLQ3nQjuNc48UWRVU0EAGjt1XYiJfg2aI+q
 +7Q12/IrMY7s/Qiu7I0Ud/G7h/nfq18kDmoC4vdwLUPqdw4RQnR6X6MvaIjrFqgC2FmW
 sBonLcI7wvBP8hhtTHD4xVdbTiJQsA2YdlGMct+SD97jePinq1zz1IOat+eYhqAnhlnf
 2zLRzLlNR3Zt2+dx57Wx/tCS7AQ7fbRnYuEnjbPshZ0Fr9AoC2G0WAMmgDhuCHtB7qM0
 1m2A==
X-Gm-Message-State: AOJu0YxDfXG9Ql/JqSA45gxpKIvZiZtIP5Kt1aY5IF9p6rX28NG8zbYy
 ZkE5xFq2/clmuVq7SUMb/33r6S693uaNYiqw1mzI6We+OP8HtPkPrpi+onXL+tgw+cgn933AbTs
 eJqo=
X-Google-Smtp-Source: AGHT+IG7frkEKDzXyGBLhcBIQhluSZqDfm0SUmb2o0dPNJEva5Lxlhc/MWDW9CgpIBIKgWCNTAaWEg==
X-Received: by 2002:a17:907:97c4:b0:a86:9107:4c2f with SMTP id
 a640c23a62f3a-a98f8360b2dmr688718566b.41.1727972801326; 
 Thu, 03 Oct 2024 09:26:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.153])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99100a3200sm106996166b.4.2024.10.03.09.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:26:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 18:26:28 +0200
Message-ID: <20241003162629.470273-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727972801; x=1728577601;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yljPPhBIPvhEqs2MDExScH56YHypaTe5kpzlqOUbBiw=;
 b=lwzJw+YeUo8/feDmv+STSRPCj+O9wet8hgxVJQFbQWSPCyGUNp6rHq9ZNmJchioIky
 kCq4fJvkJilo0VHoDdGMjYSxJO85NcUksyrj4uqwP741n1IHGMRQitvbpVSi6y3Ry3Bq
 Vo86AViBJUAJBHNdkPjvil9G8t/k8KpW86Ns8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lwzJw+Ye
Subject: [Buildroot] [RFC PATCH 1/2] toolchain: add
 BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET option
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Sen Hastings <sen@hastings.org>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The build of libcap fails for ARC Targets which don't have the
ATOMICS_EXT flag set:

configure:5053: checking for cap_set_proc in -lcap

cap_proc.c:(.text+0x78): undefined reference to `__atomic_test_and_set'

configure:5086: result: no
configure:5097: error: libcap support was requested but the library was not found

The patch disables BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET for BR2_arc
without BR2_ARC_ATOMIC_EXT.

Fixes:
- http://autobuild.buildroot.net/results/66ee26677777124eafb4740a3c7437e06f704f98

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6e91ab756cd4..6e2856b38ae1 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -855,6 +855,11 @@ config BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_sparc
 	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
 
+config BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET
+	bool
+	default y
+	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
+
 # The availability of __sync for 8-byte types on ARM is somewhat
 # complicated:
 #
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
