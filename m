Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C13CC43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 04:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F9A6084C;
	Mon,  6 Jul 2026 04:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzpIvDFJE8-K; Mon,  6 Jul 2026 04:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1183160874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783313542;
	bh=ZE7fO4gmUhRE2BtFFmNTyYDzkFCh048t/KMow2yK6r4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UW+iS2y9ZomHbxlg5HjrwebR39/Ww6rrnsiFDSm4WDInXtMfs93+td1KIx/oa8LJ3
	 /iWqGjZUHI+cStcWmrGTzXh0iKea+02nEWyhgz2B/2NDO/9Bzuk2x3MVZKg47l+5yz
	 rS6lNEOyzeiRm9Kf2fJsdiVds5T8C/IsbBlQ9w7ctVlwiqyzcXX5aj0WFErR6FuiMc
	 AH5mYClhzZBsdzn4K3hqFQBAGnwMn2OBDeyS14vikQfTI+epW+r1LOL8iQc8RAzP6e
	 XCS2ln599lgjbuJ1+9dSvUTOQBUNf6mAr9tKdjvyUTjevLyiBpKgUhzCcdRlHFuXDV
	 rCR5zBIBobGVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1183160874;
	Mon,  6 Jul 2026 04:52:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFFF1316
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D612F408F3
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDOJWu7uOBeo for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 04:52:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9F34408F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9F34408F0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9F34408F0
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 04:52:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5aeb6d00883so2113054e87.1
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 21:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783313536; x=1783918336;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9KONJVqmdtD5oa02dTzJdQTwfpfI05+w/8SC8vhoMCo=;
 b=FZggAhACzoy9Si76DVo+BFFm+N2KYnxw7GxPuS5rsv3EVRRBaaKuoa7lM24oe/Uzf4
 y3+6R4GDY+9k0Y7+sN8rdLMTJPlFOelMmimnY9xDplq2TPGC053+JbHXZx3X/1awL1Zk
 I6tIaBC2ERCn/Aw3DQV/kAMiCVsyWcjoY8HupLWZCo3JLw0Kv6psMqBcYVrSG1ynD+lS
 bhF5sSySs9fyW+6r8Bk4Um2Y3q1bebcuUSpOHMtcHr/e3qbrkK5t11wYmUDYlDvj5AU4
 XkfGz+9O9iyEs13XThfiqtZKgbFL1yxh9YvIkkE7p99bqorOK8GzROAKSj3eCHuIZqgc
 TbAQ==
X-Gm-Message-State: AOJu0YzlkyjP55zTWiZIGzhPboD7sYgPmTwPNIEgjVZlMX01RNjgdlw0
 7DlE0wqe0CeWrw6fJOZplmeN2H4fWLQuNVtq7BmUz1yuybAAscXvjSodznBALeP5hG4=
X-Gm-Gg: AfdE7cmmgxUsdrcQ5e60s1GoXHQTCSmEDh3mqdQUY/NenfNWy2APvtPWDVgKhc1tolw
 VGV+8UFCm4L7ykWIpEKOnKncXzGXWFJo9mZyHfhnxrE6fF/Y/+mmY4Rbxos4LlCicuutQaBw4pU
 uPXr78X2thY4NnTFh51ukNSAzgx1yIrjixpym8ifbse0m7jVdGnW4IistTaEWf+h/p6aH0+wv2N
 8CdxKnkmoFg4ItlczVYO3fuZZpkQns98PPUXGvxcf672GrhIkHYwbzPCqdueUNMl/f3AWG23r0B
 tzBBtpuSE/EGWj9UG3WgXALrzfTQKOzh62X1RGP73dnq0f6wjqFS1Soycru+cJGVgzeWB+7RQ3c
 M4eOMKucltA7Qheb6aJdzq1ht4g70Bv2H6CYnWqge3QDpXwBrXrFFy8vtqk2y1CrnWh4HSkFMAW
 2nwsXj/vdihi8u6OnZej7AJc7etCNbz5REV/kinwwHZRD7htMHpTU=
X-Received: by 2002:a05:6512:4021:b0:5ae:ba1e:c0ad with SMTP id
 2adb3069b0e04-5aed4f8c974mr1369886e87.6.1783313536060; 
 Sun, 05 Jul 2026 21:52:16 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39b4ad1887csm16866441fa.6.2026.07.05.21.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 21:52:14 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  6 Jul 2026 06:52:03 +0200
Message-ID: <20260706045206.2395575-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783313536; x=1783918336; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9KONJVqmdtD5oa02dTzJdQTwfpfI05+w/8SC8vhoMCo=;
 b=TFMkFA8Qv3NZkBYr2QIeLEMU0Ui3KtzRKcVq+mxapbK6kjVt1EPrUbQ1Cnh6GJ/viQ
 thlIUnIdgFIrLYscpDG30bHICe1Uqso3HWAniWr9G6CEpkRZIBTnnIy5Ral9D3Kb1Je2
 LhiVWOAImNUjFqEj8f53y6S0yqjsITga70j1ep5w7fE6uQyVK/9L9iiJWcZUqABl9lQD
 O4Nhjmth/SkU54telwN4G06SgV9uhEd8pANr+idIOLaegufb1rv0OfdslfVC0x4ym3F4
 niqQ7aY+YKOVIgD48/448zYoXQZYwt9+tqaB3cllmQ2iWcGF4ucZx+tjPuW42bOEieLs
 RCtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TFMkFA8Q
Subject: [Buildroot] [PATCH 0/3] mini-snmpd: bump and housekeeping
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

This is a major update of mini-snmpd, see below for links to upstream
relase notes.  The intermediate v1.7 release turned out to be buggy,
so we update to v2.0 directly.

For buildroot, integration with libconfuse and ethtool, as well as an
init script was added, with the benefit of also fixing use in systemd
based systems.

Best regards
 /Joachim

Joachim Wiberg (3):
  package/mini-snmpd: bump to version 2.0
  package/mini-snmpd: add sysv init script
  package/mini-snmpd: enable optional .conf and ethtool support

 .../0001-linux.c-fix-musl-build.patch         | 46 ----------------
 package/mini-snmpd/Config.in                  | 17 +++++-
 package/mini-snmpd/S60mini-snmpd              | 52 +++++++++++++++++++
 package/mini-snmpd/mini-snmpd                 |  2 +-
 package/mini-snmpd/mini-snmpd.conf            | 36 +++++++++++++
 package/mini-snmpd/mini-snmpd.hash            |  3 +-
 package/mini-snmpd/mini-snmpd.mk              | 29 +++++++++--
 7 files changed, 133 insertions(+), 52 deletions(-)
 delete mode 100644 package/mini-snmpd/0001-linux.c-fix-musl-build.patch
 create mode 100644 package/mini-snmpd/S60mini-snmpd
 create mode 100644 package/mini-snmpd/mini-snmpd.conf

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
