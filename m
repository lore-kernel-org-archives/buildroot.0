Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BAFC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 13:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D46808329D;
	Wed,  7 May 2025 13:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lshgo0ImnqFg; Wed,  7 May 2025 13:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ADD983264
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ADD983264;
	Wed,  7 May 2025 13:24:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A97950
 for <buildroot@buildroot.org>; Wed,  7 May 2025 13:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3F584187D
 for <buildroot@buildroot.org>; Wed,  7 May 2025 13:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2mpkBudmOIS for <buildroot@buildroot.org>;
 Wed,  7 May 2025 13:24:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BB244023E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BB244023E
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BB244023E
 for <buildroot@buildroot.org>; Wed,  7 May 2025 13:24:27 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5f6fb95f431so1823171a12.0
 for <buildroot@buildroot.org>; Wed, 07 May 2025 06:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746624266; x=1747229066;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CgoMee2GaxfBiEI6p7+ieKpjdDy1LNa6749+Wqqa6wM=;
 b=elQurITPfcLx/VAkvkWkqlte4ohlUobEsry2+5bET8vOvZPz/KUSez7G/+k8X/uzIt
 tJy1fAWLtfjgr41n0yyZbSOAqnZncNhJcJ/OmDYmrm5JQgY57rmry4cEYyGFQarIJFqM
 pho6ibOnxHMsESb5ehd5REFKcAgvbcXuPz4C8htUe+Us2T3LKGBLHePP9PWTlvwVVB4z
 RVAL67oNGxpK20r9ZkkTiHo+IzQwiwM8AivBR0tq2/aVIGoIHgOX5jFVJfGVPTUk72Sb
 GYI05+ZzamLmmopRYqsr4fxno1XsvUvr6IoUl55OZ1poNtwWHDqZkUgMD/ysXOMSOhz5
 Zu5Q==
X-Gm-Message-State: AOJu0Yxq4wOE2x3jEJZhONW77AeSAsY0BHIJ6EZd+PM1nX4DGwUvvfYs
 CVft67jJEKZknryb//96B4PP5LPnzV0Mtwv79/ZvwzyYXa8WpCNGI9Tbd2Xf0na/mmFnOSOK/gl
 aKNg=
X-Gm-Gg: ASbGncvdznm+4FsnaV+TSSdbyj8g0Q+jlYGTRVLN5yLH7MkhLpUlnX4ferq8IdYdnIB
 mnQwAdqCamdZy9rz+fq3oGjnCWCpOWobRTL+BOL8g0gTqy8uxKGq6JLfPtXpNmG8fABpqLhXN+2
 oxaRjyjUrgoISD48r3TBtApYbRDRqmBjcRvLpY63323ujQd6TwQLTj1nDO19NmxVYwD4WG8APij
 mqTTMjJnsUNUb3QBvN5KNM/ClfN7pHoSrW4O2GEKhsmODM3RS0Sn1H3xVpi9gfUMi4vLosuOWuI
 i3XaJ9FZccnBY6yvAX1yoVfIvPmcH7h3NDT3ur7jzEWzHANHnIRm9w==
X-Google-Smtp-Source: AGHT+IFQaCArOF4WzsNTBLGspHVqaCv5eHahB15tftN6EQbUbt7BuMiaDpz1PkKJFLO59ZS2BBD89g==
X-Received: by 2002:a05:6402:274e:b0:5fa:e2bf:5491 with SMTP id
 4fb4d7f45d1cf-5fbe76cb376mr2956776a12.11.1746624265862; 
 Wed, 07 May 2025 06:24:25 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fbf971936fsm598765a12.33.2025.05.07.06.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:24:25 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Wed,  7 May 2025 15:24:10 +0200
Message-ID: <20250507132410.1044093-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746624266; x=1747229066; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CgoMee2GaxfBiEI6p7+ieKpjdDy1LNa6749+Wqqa6wM=;
 b=OId1nbh65nzrlTU+dDzgvxPZuwjxRLPBuEY3DoRpYiQ9mB9T7Y171EMGtL5kLe5vFW
 itdb6r+d070hCDchDMPRNEQXH+5AjtWeHcVbrQNJPodRnnxlm6jfeGi6QS+CY5DB1JCU
 gwvVLS5tycUOy4SYRn70ETw1SUny/wLlwWGFSH1PCnS95S1c6Q3lV5irJkB90M3xVMIg
 L+bpD9IKBFlydieaBGWIBfpoHNZfR//uOyRIP0dQW70JUKbPmHmGno2ksuOGnoTZRoVM
 /c/45D3uNn3zIDUr/+p0ln8Dq7mksHEeL66qfZZ48ymjo+1VVgTy7hJX7OTH9Rvj70DA
 lB4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OId1nbh6
Subject: [Buildroot] [PATCH] package/x11r7/xwayland: ignore CVEs incorrectly
 specified in the NVD database
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The whole batch CVE-2025-26594...26601 has been fixed in xwayland 24.1.6.
However, because the NVD entries do not contain any version specifier, the
package stat infrastructure matches these CVEs for xwayland even in the
latest version.

Until the NVD database is updated, let's ignore these CVEs.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/x11r7/xwayland/xwayland.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 47dc0b39e6..8052359e6c 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -30,6 +30,19 @@ XWAYLAND_CONF_OPTS = \
 	-Ddtrace=false \
 	-Ddocs=false
 
+# These CVEs are currently matched because the NVD database doesn't specify any
+# version in the CPE strings, but all have been addressed in xwayland 24.1.6.
+# See https://lists.x.org/archives/xorg-announce/2025-February/003584.html
+XWAYLAND_IGNORE_CVES = \
+	CVE-2025-26594 \
+	CVE-2025-26595 \
+	CVE-2025-26596 \
+	CVE-2025-26597 \
+	CVE-2025-26598 \
+	CVE-2025-26599 \
+	CVE-2025-26600 \
+	CVE-2025-26601
+
 ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
 XWAYLAND_CONF_OPTS += -Dglamor=true
 XWAYLAND_DEPENDENCIES += libepoxy
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
