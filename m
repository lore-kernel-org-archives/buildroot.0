Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2B1E85367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 14:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C59140B5C;
	Fri,  3 Apr 2026 14:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XuwgVZ5F-Yr; Fri,  3 Apr 2026 14:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26E040AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775227835;
	bh=p9qya8AOMlP0q7QtniNsEzzwK61HwBJvrxHIC8tWTu0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mXW8Bb8uxdxS5AGNfP2hSdYq85uua/hm6ZM16Yi9AjBkOnpHjmV0BhKrBdVtPvM9z
	 fI+SRvPRNrHgdsIv+uDBGIOdZPGMsWAbf/oyPDYu2UhGMeoM0KaFdr+t6GElPDD4gw
	 qgU4QmpsKJ/rkaSsWdWDmm+6i9oqe8UkJ9oWoiDtacOEgQM1jTp8VqtN3aV2O9aXGy
	 A0X2blCvMhRWXuzcZu8q8NWlQ7zEiKKHKlAlVZ4KQkg42EZ8RA/U2eJcSfCtJbI2Ql
	 1605oPSeMRdUmTWmckfzkaS6ZOyZsHyet1nmJJdLdc8CUEOhy05ywvfybICEg8ME8P
	 Vfkhm9kv9X7uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B26E040AD6;
	Fri,  3 Apr 2026 14:50:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DFEA1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F418E811B7
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tltTqHrMSuqV for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 14:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC553811A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC553811A2
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC553811A2
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso17847195e9.3
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 07:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775227830; x=1775832630;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgHbyvdToTOFCuKSwdGloxRIYAcsUM50eUgi+7ZZkNM=;
 b=D8unbBm8oe+LYjwkLhWzD2yxK3hiGFnzpXefkzPxatm9QRWm5QKQsvgSSIijE85z3I
 ZjIOLJoj7/0mKsVwoZ6zXp+mjgnbCbi3b8D1wUNmIy7/cpbhWg8x4tdODXWltGZCLkM9
 n9wI1wGNv2Ue9IR/ZrsCAExECSVZYRZXVH2g+1aubo5SCCPQa811qKyh79jeJUW+b6MJ
 f3VHP26n2bWIhLqKzA+iWWl2z5cA41hZ4mtX+MDyB1oIPid5AX28021Izbl8KSkizKyH
 SVETTX1WnS0RfDchTSyOD9MIXpDiInAdgSiKKuAcGZTDECchz4WohfQKT1u1yLyA/+Oi
 aJdw==
X-Gm-Message-State: AOJu0YwqhuRCzQV3+t0IIvCj/1HLaNR/1fVWLu5djdrE4AzgIHDOP3+6
 z+7Rsfas/mpc87mJB0gcXKtAGd8LhO+Lc4aGnCaz+/W5dHPvzPhmgWP+NWsulS2mpYSxjVJ7FZY
 Wsd6fr+0=
X-Gm-Gg: ATEYQzx8ofvjQow14GwgVZglY011pQPDtkJJyRJXk7izHUsPsonYBI1a/Qx+q3sJS8f
 zvGUnHoVZx3zj3ihwJOPGEMGhCFFcJ/n7IjbWgAExEGAQGR6WFrYn4XQIj9p+JHYJ7M7BPSZBfO
 plsQhl/ognj0+mhLlAQ4zuKf7TMnx8oHuF1JU/osU+q36rVzi0fJ6jDbowphoNG1pv8lrfBWjzA
 4VQzSs6Q2LI2eje9Yp63rVMxfNdu9gTIne9DjnfPzYACDs7oIJAvbmtSLyJg+QVrTCSXQZSKGnX
 0APK+P2t5PP4+xcweevEot8kAU/LVNancMx8ZLJB/fr4dCATRhsIUkUDrZG8/Ld2hdDj3aIjPPv
 hu3RLKGghae9F9I4VTDlsw2ZOQXuwulVLJMDvgkbTozGyK27DFs3Gi8twOAoKPeyVXbBhj2z5WI
 ylJjM6sfSYYxSfRvO01qLQz/lKnUeSaGT2V0Bhx+Qqd5TJ2YDgahHTj0fz89un0K7lzohB2VlPK
 wJoHwV+c2BTUk6Jah1R
X-Received: by 2002:a05:600c:6385:b0:486:f8e9:add5 with SMTP id
 5b1f17b1804b1-488997a03b4mr48191635e9.19.1775227829604; 
 Fri, 03 Apr 2026 07:50:29 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488983db4fbsm22419265e9.13.2026.04.03.07.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 07:50:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri,  3 Apr 2026 16:50:19 +0200
Message-ID: <20260403145022.1532257-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1775227830; x=1775832630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sgHbyvdToTOFCuKSwdGloxRIYAcsUM50eUgi+7ZZkNM=;
 b=udV9fYmCKjqCsA/u6nBFRBNZBi1mleVoHeWwarbkSiSyFQjRSktCbNAqX6a90LuAO5
 5tm5YbMSWqEufBFELnBkS8Xl03i+RKDDCILO7r5n9H8sQkexFAHk9kGLeZe/vYNar+Hp
 6KtLQBMQfNAdKnkBjwx49fyRnFfysmv126McM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=udV9fYmC
Subject: [Buildroot] [PATCH v1 0/3] Adding reproductible builtin kernel
 configurations
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This serie adds builtin kernel configurations for ARMv5 Versatile and ARMv7 Vexpress 
platforms, and a manual trigger to generate the binaries in GitLab CI.
Those binaries can be used later by the testsuite, thus the interest to use reproductible 
and maintainable platforms, without relying on external, non-modifiable binaries.
With this patch, the binaries used can regenerated and updated by creating a manual pipeline
with the variable ARCH_NAME = all , arm5 or arm7.
Other architechtures might be added later if needed.

Those two configurations were successfully builded, and images booted on Qemu.

Dowan Gullient (3):
  support/testing: add builtin kernel configuration for ARMv5 Versatile
  support/testing: add builtin kernel configuration for ARMv7 Vexpress
  support/scripts: add manual trigger for pre-built kernels in GitLab CI

 support/misc/gitlab-ci.yml.in                 | 39 ++++++++++++++
 support/scripts/generate-gitlab-ci-yml        | 22 ++++++++
 .../buildroot_arm5_versatile.config           | 14 +++++
 .../linux_arm5_versatile.fragment             | 51 +++++++++++++++++++
 .../arm5-versatile/patches/linux/linux.hash   |  2 +
 .../buildroot_arm7_vexpress.config            | 17 +++++++
 .../linux_arm7_vexpress.fragment              | 46 +++++++++++++++++
 .../arm7-vexpress/patches/linux/linux.hash    |  2 +
 support/testing/builtin-kernels/post-image.sh | 13 +++++
 9 files changed, 206 insertions(+)
 create mode 100644 support/testing/builtin-kernels/arm5-versatile/buildroot_arm5_versatile.config
 create mode 100644 support/testing/builtin-kernels/arm5-versatile/linux_arm5_versatile.fragment
 create mode 100644 support/testing/builtin-kernels/arm5-versatile/patches/linux/linux.hash
 create mode 100644 support/testing/builtin-kernels/arm7-vexpress/buildroot_arm7_vexpress.config
 create mode 100644 support/testing/builtin-kernels/arm7-vexpress/linux_arm7_vexpress.fragment
 create mode 100644 support/testing/builtin-kernels/arm7-vexpress/patches/linux/linux.hash
 create mode 100755 support/testing/builtin-kernels/post-image.sh

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
