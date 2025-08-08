Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6F6C87FD3
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 13:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7594073F;
	Fri,  8 Aug 2025 13:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMaEZ-6VqRMt; Fri,  8 Aug 2025 13:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72A82406AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A82406AA;
	Fri,  8 Aug 2025 13:31:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B71E9CF
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D82960C20
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7wqSxzon_-a for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 13:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7896260BD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7896260BD7
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7896260BD7
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso14048665e9.0
 for <buildroot@buildroot.org>; Fri, 08 Aug 2025 06:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754659886; x=1755264686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LiI3nTGke9XYFXno9thlv7nXV9LGMnolynA8KOtE+A=;
 b=oNhDuvdke6zuN6lK95ENAF760ZXMuoq8DiKAUab3RI6BNuwnacr01Z/IHn/pl87Loy
 L+SPLO56Ht9U/AaySaz7+xCcT6BmFGTxTKC1qNP/vnVxxNxKuPDii2Jfg453TtnKnHof
 LQezJqRhbjkWt3AE6KQEOGtBekerSSDTR6VqPLP/4iVN34vwOyNfoUL5zqT7oN/DVYC7
 RA4aGNtSDJxICNRmuVlgSJh6qyjwy+ylgSdi2zEe/skWqYTKOVN13fNqfEYjZD2NXFKQ
 ePmvPyPACLHfzPWaB/yXZcRgumLfdCgSXBoqZl6axoJylto2uAyquNbIQKV5+YVBd5AB
 dMQQ==
X-Gm-Message-State: AOJu0YzY/lrMw440ZZpZ/KKcCI3d6fKSCnvE1uRIgYc6ACDy9ShoYgTL
 mQGfIJ75UqhWjioKuN3tq1V7LV8aAruaYn7blMe4TH6cHUFdmKV+634yIqbc8ewKbY/RWbesIzk
 JTtKW
X-Gm-Gg: ASbGncsE7VLphBi56FBYy/H4nLWg4BU1m3RftiNofeotZhdu1DudTESqHnSNQUmrkde
 wNgPY2WOPl3gAL7SS8NsedWuoGxQWFbm2N1sAHnKCUsvPJuHcnPqZNerJ2ySZIgcxYwyMrwIwbA
 iZaqHjNGHL9g0EVQL8u2bSrNXNag8J6eYylx9qlpOLmMxExGG/sbosoqeUpCy4I6MSEM4ze0Phy
 OAa85/8YufVAQnzmA5/n1XbLK86ZmkFzw2cDjT0fEXVo0WlVdJupG9QKb9rllossCcP25KTQoDM
 pA2j+UB8aQxY5fvmxFG+0GA0eSHvwv3fl4w9ws3q5RVd1esFSu5/ptJDS2rLZ81nryTLuGwdIXh
 vfEIQ8ZjJZvYk5lT78myEI34V3fTIkheratQ+pqu0i9HraNEsgFAtzhIkfb+PZ2bvJYvJF07cLI
 uVjRqfKCxrDRCcyQNz
X-Google-Smtp-Source: AGHT+IEe6QrcCNSn2v8CmNfUCXBxFORz5rI1hHU6aLoNBO5xEi+DDy8TbfIYt/vxh9Fx0OKlpZMg4Q==
X-Received: by 2002:a05:600c:1d22:b0:456:1824:4808 with SMTP id
 5b1f17b1804b1-459f4fc3e05mr21216095e9.32.1754659886188; 
 Fri, 08 Aug 2025 06:31:26 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5873c43sm149053965e9.22.2025.08.08.06.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 06:31:25 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri,  8 Aug 2025 15:31:08 +0200
Message-ID: <20250808133112.3212687-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754659886; x=1755264686; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LiI3nTGke9XYFXno9thlv7nXV9LGMnolynA8KOtE+A=;
 b=0/Wnj+bCW+d9fk7byZpDkGkZNepLq/mN+sXKR1maZC/hyfRz//NGVql1/w/RKD2FGO
 0h3pbLr9Bug9WSMqnxrYiXfRhkBRXQTucWpuCW49A+b0P12HwoDnJUgAynRrOL5Fbid7
 DrmE0lRa7/JQMlFQr9giwrGP3urFBRk6zn8ug=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=0/Wnj+bC
Subject: [Buildroot] [RFC PATCH 1/5] package/rust-bindgen: add host-clang
 dependency
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to the official requirements, bindgen needs libclang to
parse C/C++ headers. Until now the tool was used mainly by Mesa and
worked, but Rust-for-Linux explicitly relies on bindgen + libclang,
otherwise we can't activate Rust for linux.

See
https://rust-lang.github.io/rust-bindgen/requirements.html

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/rust-bindgen/rust-bindgen.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
index 349d4c3670..0ec620002a 100644
--- a/package/rust-bindgen/rust-bindgen.mk
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -9,6 +9,8 @@ RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION
 RUST_BINDGEN_LICENSE = BSD-3-clause
 RUST_BINDGEN_LICENSE_FILES = LICENSE
 
+HOST_RUST_BINDGEN_DEPENDENCIES = host-clang
+
 # The Cargo.toml at the root directory is a "virtual manifest".
 # Since we only want to build and install bindgen use the Cargo.toml
 # from the bindgen-cli subdirectory.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
