Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A153CC02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6181B607B3;
	Fri, 17 Jan 2025 10:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CuIWytl1G9M; Fri, 17 Jan 2025 10:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2238660872
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2238660872;
	Fri, 17 Jan 2025 10:54:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F85894B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B43F4013C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZG8i6g1g7OuP for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDCC240173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDCC240173
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDCC240173
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:08 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-540215984f0so2121666e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111246; x=1737716046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8uRxN81AAxpif9qu0gvhSOWSCdb+h6TFm0Pwax5Wjg=;
 b=CYvccqqa4RuvllARlKZwE0vMeMtpD4RPp+EHWec+7VHxkNr0R3hgjlEtO9VmBHg+wU
 kXoicAb2UaGO5Ot5so/EYElhikkewEYMgtYs/9+mWqlljjJgttvhZcHE+Av9jeZGR2Ej
 Pfq7CMHtJ84TXCGxuwnx027EAiPNvEtEm8HIPRBMmR3SnjNatP0wSS2F0RVY303qTmAt
 KA9jx0etH8a4QW1IvxmuL8DJtjkbHeHzPFGxbdzfZCpFM2fKeqJPqrtqwSldRq4K4pUR
 pZcrFuUP0HVIGqSJEp9GeS2K5aOMv5ag5xkHBuucxJpnCs7KYkI626sanMmrun/h/p93
 syvQ==
X-Gm-Message-State: AOJu0Yw/+WX2S8iGS2BMVuaf922x7TQNEvY0pad/7QqbCf4SkDuwwWSx
 W+l1kUeE42+XNre4JLGK9ZdjTtGoZjSelAQGQ6jixbCYPjBniCpcmbzlnw==
X-Gm-Gg: ASbGnctabmD2aHSsagubMaa/sCPTYQh7We9IWaO2RStkIsof2YkIxdQ/+PAFu0lr8R9
 O6n4a8i61QeCAA5u7IQHR7d1LCD5xYajyu9RuP5/CpX1rXdD839DFhRbByxy2cR8BKNIRrWNJmo
 Ea+6ILDuwjhxLpu29wF0ddk86d9hTQATkRxUQdf1zn15PIhNLO5D7LEmAiQAdFXwHtH1+yu5SyY
 uKDtIhVtqvOHRM6zS/U9LQBr/oxbyzyZwkipb5+Q+izWj8qd1R2rIlbS+GCVvsK+iC2mzn/ex0k
 QHJfB/Odg+Y=
X-Google-Smtp-Source: AGHT+IGUqaEWd45UF1jXN99NmlG7ChvvLB5Zn47DYOUndQwk9Jei5RGDRvp0mssd4CrLhBy5g4rTwg==
X-Received: by 2002:ac2:5211:0:b0:542:87c5:66da with SMTP id
 2adb3069b0e04-5439c282b5amr557210e87.37.1737111246373; 
 Fri, 17 Jan 2025 02:54:06 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:04 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:26 +0100
Message-ID: <20250117105354.618220-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111246; x=1737716046; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8uRxN81AAxpif9qu0gvhSOWSCdb+h6TFm0Pwax5Wjg=;
 b=h8CQ7wgAGGfBhJzIT5UtXcYBkCDmFUu4nHiWmC6KQ8QCYfOZOjV0CA0TlZ7NNHkx8f
 ebliBGv4dg61uwNm4zHfN6lS5u6FUzeQKrPyLPLFYWtFWbVkYHUBHghVpQ/1Nj3wpSFD
 9eallXD2QhwGDSkeaZeYtYhgAtAcme3FVCNN6u4AvtT0R3ud8wp1U2OVNG8KwGD+U0Mp
 UIbycNo2h32dVdLgJQjtFVqhJ3Sc1DL81uuttzg+o/ZREFmngjcFG0c7wiRDwWcyTQ14
 WuKFRtQ8Vjh/ePq4WVJtv48j7CJREG1Yh4AuCrLKdiXNFEOcK5QTpukyzi/ZlCc5Ez2J
 Pm0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h8CQ7wgA
Subject: [Buildroot] [PATCH 03/19] package/qt6/qt6multimedia: bump version
 to 6.8.1
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index b63aedc1d9..434a9d9700 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256
-sha256  8ef835115acb9a1d3d2c9f23cfacb43f2c537e3786a8ab822299a2a7765651d3  qtmultimedia-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtmultimedia-everywhere-src-6.8.1.tar.xz.sha256
+sha256  75fa87134f9afab7f0a62c55a4744799ac79519560d19c8e1d4c32bdd173f953  qtmultimedia-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files
 sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df  LICENSES/BSD-2-Clause.txt
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
