Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9459EC47DA2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 15:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE5E283C5E;
	Wed, 17 Jan 2024 15:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE5E283C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbLFOzxT9aQN; Wed, 17 Jan 2024 15:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41DB083BC4;
	Wed, 17 Jan 2024 15:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41DB083BC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEC9B1BF40E
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 15:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B76A861517
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 15:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B76A861517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2nZJV9njhPQ for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 15:49:47 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 172476148E
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 15:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 172476148E
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e7065b692so39236965e9.3
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 07:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705506585; x=1706111385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KUJA+/pKX6GXPRqvHQcf3aJ72PaUYE2s2FzQMbzddMo=;
 b=ZPG1m0Gb9K5f6Qr05UT6CiTExW/cPci8ysrwVEsJCBM4pmkIBGyscFz/N5fuFPeKws
 S8gi9AgXwClyhx9QisBkXxXSz10CQJ6AhWL8AczdNpH5Xd5dSMNtPTVI9WA+XKFAvCQD
 OsbljnMLdcXx89UK/Ru4H7wdPnlgr0xx9bVpKSYeBZwyEjr/gOG8L0QLgfLPJVwE/aSz
 6CHtIh2DRl8M9amnNE45Y/tnjxzUheAevIvL7sECJU+6bq+2oYRcHfYuqYgANWcxHUWo
 8L1+28eYtVz8DpRmw7LlaqYAA+MzEnU5X/X2gVz4Fo8LiCZm2/tP7d5O5B3z58z99Tp0
 gfuA==
X-Gm-Message-State: AOJu0YxOKrjDypPK6SbliwKbr8Qq805oGNR5MpX6s7xuY2LfDIRkmXws
 sCv/dau6oX9+izeL5nwbXPyBdH9xtxTKhD7PCR5xG0TwIjU=
X-Google-Smtp-Source: AGHT+IFvmMec2r3qRezQWfePDAVeax6l0byHvs2fnqkvhxfnFG3likgbE38ZQj7o7oBuiFdMx/KXWw==
X-Received: by 2002:a05:600c:5491:b0:40e:546f:f373 with SMTP id
 iv17-20020a05600c549100b0040e546ff373mr4946389wmb.91.1705506584973; 
 Wed, 17 Jan 2024 07:49:44 -0800 (PST)
Received: from P-NTS-Evian.. ([80.215.186.76])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c359500b0040e3488f16dsm22692902wmq.12.2024.01.17.07.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 07:49:44 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 16:49:42 +0100
Message-ID: <20240117154942.35401-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705506585; x=1706111385;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KUJA+/pKX6GXPRqvHQcf3aJ72PaUYE2s2FzQMbzddMo=;
 b=Sv5TPThHtDfBV+Nkvc+cf999oM8Dh2aPIfSZ2CnSITl7Z7AFcOom1XqO06gb/8anJQ
 XAJLti91y3tBsTRoG+2wQKUaATMkfXXVzw306zuzLAzfjGEUoLt0QOvevBKRg71Nfy3S
 nb1Pc2xoR9GgTsi2XuRUr4IB8+gap1Ukh9t5uTGC+oOhZ+sLYGeEZ1X+UctR8mABrJGS
 leQ9b7c6MF36X1+RTDVdnQLX59U2nfcfakW+cXLem6V0iSHxHTokGW2llO4fHkfhpZBv
 a8zb/lDDaQb9ixR7NYm90stmNcrH028zLWJeqKuN5dzqI6dQ4wFcyLh3SMfNdFJXcDO8
 qaQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Sv5TPThH
Subject: [Buildroot] [PATCH] package/rustc: rust >= 1.73.0 needs cmake >=
 3.20
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bump to rust 1.74.1 [1] introduced a regression on host using
cmake < 3.20 since the llvm libraries used in rust compiler was
bumpted to llvm 17 [2] and now requires cmake >= 3.20 [3].

Select BR2_HOST_CMAKE_AT_LEAST_3_20 to build host-cmake when needed.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/05392a5eae61c2855bc8d94f5bf9677ebbc5462a
[2] https://github.com/rust-lang/rust/commit/8c1c7d37b29d72bad1f218798d121074918e9616
[3] https://github.com/llvm/llvm-project/commit/cbaa3597aaf6273e66b3f445ed36a6458143fe6a

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448635

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/rustc/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 6beaad0425..baa68994e6 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -149,6 +149,8 @@ config BR2_PACKAGE_HOST_RUST
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	# triggers ICE on trunc_int_for_mode, at explow.c:56
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
+	# rust uses llvm >= 17 since 1.73.0
+	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	help
 	  This package will build the compiler for the host as well as
 	  two flavors of the standard library: one for the host, another
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
