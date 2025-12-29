Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09B3E92FE2
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 748034071F;
	Mon, 29 Dec 2025 21:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVForO5buEk2; Mon, 29 Dec 2025 21:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04CA640822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043346;
	bh=nWYVgdHIZWq25lPpJuX2MD68JFyR+jjiyK5PHIGFtc8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=cei6KnuBPrJsRzXj7j/IwFfkoZqoKKwsmkCqEjdu4QfwVjGyBWQ+65rvpzctqu7mY
	 YH9Dga3nkHsjNBOt3JzfS61zqh7XeQn9v2/KEg6rlqJ8H1oQ0acknP8+3Kt4M7rS74
	 em6/WqNxfA7iINelN4liCwi1VSWNRHVwAGtGc15NKIbUj0f0GUx1MQUeZgvey9cOy9
	 FWrx3GXDSiRFncIcfWpkktVZrpdFD7hsnPzfsTc4EdNtXWBPqrqa3VX4D5IhGtQ9bO
	 r8dag/S2n45t9+5YE8QNJu1uTbLVe1p3lEJHM3wnh82OjUxu11WFznpYZdxlU93Mvq
	 fn4LxM3ntp9yQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04CA640822;
	Mon, 29 Dec 2025 21:22:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25CA135B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 180D04005B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7oanCugXSkER for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E18854002C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E18854002C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E18854002C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47755de027eso56008285e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:22:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043341; x=1767648141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ISkOy+uDhedGMVU6hwGRHJ2C0ahvMofrs/jcAHDsV1c=;
 b=E7mJ/KoLD3yLmEXbnAl0frma9DwBh67h7YT0EUL5wOIPWi3iEiyvuVjqf8R8QSVB/J
 S7yb7quJAGyC9LReUgh5cxwSHmde6hCb6P+KzfajvTRGJmF9DwhSNfLZP7rIZVbV7iVz
 +1is8M+MwHFsFT1y6sjVLRLu2urMiBT5/niGC70dAsVXSkq1SnAJKKjbzhgDgGv5HE97
 wEAkpsM58sOFpRQw47IBv66e9KRYecJcm3U55Nbdq8pZ41cnRWf8/eSOVkfFc7IgyKbk
 yIT3tkB5+DDbMnHpdUSJ0T/1VnYpsWQTK9V7FlA+6g4Au7h1t5R+9Iu/9mC8g0IEqw4Q
 n8nw==
X-Gm-Message-State: AOJu0YwZmgqsb/U4cuCOnk/IZoAR5NNh6lsZ1IlEO9IOcghhmrwb2oO7
 uuMHpTACf3LrAlQ7gP/oGbP05AJ8fwcQO0BllX8wDggtTXT79L0m0tP31mRpBJ5JLK8k5RgUKOl
 EKg7Vm2c=
X-Gm-Gg: AY/fxX6DV3cttznfxAa8tEsLnBJmUWf7laXVJ7J3Z5a+z3ne31zlPOHnR1ZgHIjqHI3
 oRELF9u53CEj1rKd6lMZenE43ycKRWuYLyeH3/oo0+GcFhgweqVIPI9qcycmsHBKZL9u6u7RVrz
 bSeUk+t9g8Fz1ZoF1uFy49GXeQJfJ0RNn59CXl1Vvw1p7YZI2YasFxm7aJgq+BXVsRMtENNDoxB
 AeuQ+8XZ4oIgAJt4DkEGh6mhkzI0XuVci6bpepJshRMkGAddTK8P2g73z5cmO/k5mZmZuYwK6wF
 YiwMSsxWafLVRLsZUEE36qlGsSdufOvftuQ4VoCOTRNWcAN9h7vahXGH4kN6wCs97SVMxf4UE8H
 ArkxX+BRfaoW2QzsRyuuNs5U4MEekTSB4XLDzwr35D3nmEm/MGvWW3h1Gmw9k3TlVL9jwu6rgOR
 bV034=
X-Google-Smtp-Source: AGHT+IHWSo/bRJuPmrO/ryLqL/ayNy9W2XUgPCji22Ku9JtFqk/UlyZWe7tCoxkq34BgJeIZoiwljw==
X-Received: by 2002:a05:600c:4447:b0:47a:9560:ec22 with SMTP id
 5b1f17b1804b1-47d1954a2fdmr330743625e9.14.1767043340660; 
 Mon, 29 Dec 2025 13:22:20 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:22:19 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:48 +0100
Message-ID: <20251229212149.167902-16-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043341; x=1767648141; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISkOy+uDhedGMVU6hwGRHJ2C0ahvMofrs/jcAHDsV1c=;
 b=QzrL5NoE4O7NB73hLSOFG8Jpu3WFVObF4L+dYDpIX+tvpBaSLzMlG3skbkZL7ZW/DP
 wMyyqU7fqvAFUrFj/95RVNEqc+/IdsYfx42f9AGXkEqIa2Z8k0pzkUsF2Lr0hosNwzL3
 va6+d5XAlvI9u7zFoY9cRI7Cqe/bP8Zd3mCn7iLuwJfXn7pTOasQNMYAaYs485A3h96Z
 eG2G5HVSN5ien/+uUlZ16FAOPOvUtksLKdJd84ZxTT9Ofucdq3mK6nal9HkLgVyUgrOX
 5WXwC337CPytzIArVkdejx6ezoOr8wBcxb8bjqj+Ts32aCEzGM/6Ijlx73N/ikoy95CK
 3VDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QzrL5NoE
Subject: [Buildroot] [PATCH 15/15] package/cmake: remove stale IGNORE_CVES
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entry introduced in [2] is then no longer matched to
the cmake package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 5ce1e773b9 package/cmake: ignore CVE-2016-10642

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cmake/cmake.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e9752640e5..ef4f6aa98e 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -11,8 +11,6 @@ CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
 CMAKE_CPE_ID_VALID = YES
-# Tool download MITM attack warning if using npm package to install cmake
-CMAKE_IGNORE_CVES = CVE-2016-10642
 
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_CMAKE_ADD_CCACHE_DEPENDENCY = NO
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
