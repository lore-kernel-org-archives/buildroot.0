Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17729D3398C
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 16:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D8B584A31;
	Fri,  5 Dec 2025 16:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HL9XfRU9gq6; Fri,  5 Dec 2025 16:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D80AE84A25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764951713;
	bh=J0ADkO5KzgI0Kda1pz8dxEtvxVgM8OAtg71Ftj4LsE4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IhefE+3XHO/aGaSXtwF5tsSW54L0UMzKOkeGn0b3JZzcdwIjF1DyuaJxxWfu/Ip1P
	 Mss+wMvwTp5rmfdQWf3GxePMszwkc9I0vGjY2LI6TSqzvM+bqBgYp4MA1VFquq9MYa
	 swTXcwXglxJu7gDJ5u9FNiWyy4IFKajMRc7ZaLlByw1H/ZUbE0vzPZ5v4ecDBBbOel
	 /SAm3BlRBOYBgIqRsShyUCwRHI/m5pnt28PMRu4p56Z2XGlDepNS/BFYuhrb7IvTE/
	 EAlQAkDCLk+9L/U+lgx3ajn1RhHumfUYoodXrsPK4TdQQVKQpCwSWWZL2KPoEu6DoY
	 vLQwC/SupURWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D80AE84A25;
	Fri,  5 Dec 2025 16:21:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4391C199
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36BFE405C9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_B5cn9vyVEA for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 16:21:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34F1F405C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34F1F405C8
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34F1F405C8
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 16:21:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so26490445e9.3
 for <buildroot@buildroot.org>; Fri, 05 Dec 2025 08:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764951709; x=1765556509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PjRnv634LlC3DRcqAiYVIPgY5eGTO1+REt170oUJDmY=;
 b=mS+obzClYO6N4fLHsSz3A3NfCvt7A0d2mvb+a4NwtXv8kVzIbaXdrB0JF+PgeuoWM3
 nixbTg7oeVtXDyyOvKJRrkzuN35vnjHbHKDZQeKH1/4OsTedDuCVSEeTVS6ZdpwHs9eW
 QCqZ7yWEBooV5T0FsHTaL4X0KgmnhOG+sJDNP3WKbHmXSkSAv/T+E/pF3RcDX/oFIHUa
 +5p71dosOh7TQ7Td8UeNoWlD7s7cf0EgI+2E+uOyijgMuRAPbLx/4bcFcDtOZg9Eu3h8
 uCvnAUe4yt/14bZjY5IWRJih4WTiZ+l8Rz8HvOnKc5lM4WWYc310aKKDKtaupA6n8/Q3
 0Uwg==
X-Gm-Message-State: AOJu0Yzd3eGY0gKymOHr72FwYBPOeK4dZuOOr0nQfyPFe55kUqZuf5Vo
 6k4Bi0tsFc4B8fekkf4i34sQd+mvRX3W8cKXBatVhFI9qjs6J0oDZDXu9Lgq/A==
X-Gm-Gg: ASbGncun7SD8GRDq2WrKLv1XEWyYxBcMg6PsXvF9OYaLAvMZNvLJY/qtOh8OaVIzhAT
 Ck/LYoZTJ7kIZQBFCWYQzeTTNwC9IY4sVF7YFH1QoYZdxjZtmJI8xChmL1qhrh0bh9EOyBBnvVe
 OOYeZ3h8+Hw4R5b9NYj481aIxaeypK4crHWMItTGqKFJuzgcSPwiB9U5LxYQ/ZM3jVF70y0p3la
 T9NF6j1D1ARSOam7BfjDujt75uF6CThim5N+/1m3LNBdhplch0yP0M/CKsYGtC97FNQvR90A7W6
 wg8YIwk/nb3LorKQzAt+zuiAWbh7ofqsnqDNw4Mfe+el4/9PfAGsv1Mehz/6prYfdkCwutVV98m
 GKbly0A3hCn8U8t2uGke/m+lNJ/YX+AvDfgVt5h3zWURiQgVuUi/gmhqML+ciii3W20nilqQz+e
 xh
X-Google-Smtp-Source: AGHT+IFxsSsWK2C3K+YzUyBVevs0ol2rx+h7MtqFi8wwciyzz9/UThHLjYLDFgslH8Tc5NHZfyPHIw==
X-Received: by 2002:a05:600c:4e8c:b0:477:55ce:f3c2 with SMTP id
 5b1f17b1804b1-4792aee385bmr112083695e9.14.1764951708808; 
 Fri, 05 Dec 2025 08:21:48 -0800 (PST)
Received: from LinkMed ([2a02:8070:2483:7e00::daa5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47930c7473bsm147449955e9.10.2025.12.05.08.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 08:21:48 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri,  5 Dec 2025 17:18:37 +0000
Message-ID: <20251205171837.22075-2-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205171837.22075-1-raphael.pavlidis@gmail.com>
References: <20251205171837.22075-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764951709; x=1765556509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PjRnv634LlC3DRcqAiYVIPgY5eGTO1+REt170oUJDmY=;
 b=I52YVUKAQ5/K74yRLwTRWbYZKtKYjrhwlf3K5l3Gw6PriVJrnE0vKp9jcpiI2KUzdu
 MLQKU8/ZzvTxVW2LH6uIMT5KAH76nchBOMsjyvamU11zMuKrLHYJhk6gwhV5Wml4URnU
 Tj8Xt+HXK8SUi7r04ObJH2LP/4k/UT5xGuxAXTqKQN4Gx5856Y97e574rGdfrY/IBWmS
 z6pXowu/pP+fUzFNccniZssp7J9pAXvwe/3Jj+V9vWfVFcG7AE6/oie1sWPntn4Wwkqm
 LapOxd2AUeeanzHMXplQ8Y7T4HWNuMJYpRsymaHpOvt9OSaL2EUAJaUyHR3y57Lp6yab
 3luQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=I52YVUKA
Subject: [Buildroot] [PATCH v1 2/2] package/xwayland: bump to version 24.1.9
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

Changelog:
https://lists.x.org/archives/xorg/2025-October/062148.html
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 6cbbea8af5..717189734b 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg/2025-June/062066.html
-sha256  c8908d57c8ed9ceb8293c16ba7ad5af522efaf1ba7e51f9e4cf3c0774d199907  xwayland-24.1.8.tar.xz
-sha512  b6dcc87f5c4d880cb23216518171a704c2a501803ac2efd9d01760895d755a617cd82313c6516f27a888b0581c64d74e3f8db5c238e1ae0d13da6cc1a547c02f  xwayland-24.1.6.tar.xz
+# From https://lists.x.org/archives/xorg/2025-October/062148.html
+sha256  f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0  xwayland-24.1.9.tar.xz
+sha512  7438a572651dc77c1fd749879abccdc9a245c7b75143668d5561a8e99d41063f042a8eb3f9b931a2a12be1fc3cb9d197eee6794d0702a19e56c20f55acb35a26  xwayland-24.1.9.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index b0cb893ea1..62bed673eb 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.8
+XWAYLAND_VERSION = 24.1.9
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
