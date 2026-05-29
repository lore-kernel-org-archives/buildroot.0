Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F4BCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7CC8422F5;
	Fri, 29 May 2026 09:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15puS7-1kfn4; Fri, 29 May 2026 09:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E83F5422BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780047929;
	bh=1OA+jRtxX2F42QfKP4ImSW3ZeqA1OQNuG8YUqgE/g3w=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Fqvu0vE/Lj0RL/7NU+nMat3dRi70BiGrbJVV7VMzLgY/RvoDHf5QTLHM8ddITET0K
	 buLecz0pI58cyc5b5yNt2abBiv66Yryt6q62J7pl6PlLCT6efDk+litVBOH7M2hDiz
	 Aj/Qexz0smMQ3Zzp+74SaxYj/vdmdhu5fvIgg5ury6Hkd0zS4EpUi3u38bY8YURBx8
	 V4rFtJczBa/pbp0a8vsJY9hPi1tInd/8IxxknwYyMYVKjE6qkKxpRlYHnlV9Qty8CC
	 V5n+r9isp50PWl4jcBO6+y4NXea05NnF/gpJqPnXHnhJ02CmtbkK24D2Reos0HN4Sv
	 njHI6P9xFyDOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E83F5422BB;
	Fri, 29 May 2026 09:45:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 722C9D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B549083B58
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCwrw5YQqUvx for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD30483B43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD30483B43
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD30483B43
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4905e190c71so63537835e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 02:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780047919; x=1780652719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qCCR1vXxanc9SXw4lTRUkjylIwRGtSTg6gpBWaYfzZ8=;
 b=RsGREqLkGxYpW8BIrYWJfHt4tcg9cCvmLBc3/e2ad/fwGFCeCi6r+FYXeyCNdV0Nqh
 TWIbq2oCXnNK0J1oMt3LxoB0T2E6UyjbkkSdjJ4dYeTGcYWaNymuBgK9lHOdQXSFwQhX
 c7LvjXSiH9rrK+jk8xOp7QBMJrQ/gNZOhrXsY5oUQtfTyCDkMZB/R6YLUilMpU7ZIEXW
 E0j7ceN1P0SPyivfCX6w5Idc9EWqAqgk78AQCCgFozVSioj9WjCsQB/pRXJ6m862JOx0
 BYNUhhJOlPwQ6EDf4H/aj75djihFD0+Q6WNdgeQvr7ZsxWLHqKO6SJjBCA277HM2m3Ie
 l1lA==
X-Gm-Message-State: AOJu0YzuJFmK5lr7m0o4cLvQRbNw51Dx0+xcAdUJzvleDLIRu8RByWJ+
 8zLgMeJ+TBLaSxIAVn5wdRkJlo+nCfSBAmBqhYP1zZem3XRShWVTVK2AJ+ZJXAtxvxiP5JYw2Md
 +1N3e
X-Gm-Gg: Acq92OEU7YWN3pVHdAYsWh3VClW3lt87wEZTTVYmHD5o7BwE2tSCPYJMzHZXV2DoS60
 usYE72gx+18YNcJ4jwU1wrVPRf1Hvm66WUxkgAv4n2xELzHG6OQH1Roo1jAMg/7o4zQ1//INoqK
 ObIITHI93NoYweQ172rAl/xx5XgtATvpwaQWHieWQhGZRfNqOELu6M+30GcAVPyehIJBtrEuvaA
 RPSx/djAEPUmHVyYZ1DarFS9WEF6pJAtwMJq9PNhOVNMaPDOnprZPEFvgQRhMYuySCWBpxzdMHs
 60U0NE3jS+LUZIYbkianfiyGO3tu9y6of1A5Bdk/RBhFcUHCknGkrSMHojBwvln8EkIBGaaL3QH
 xiQ1ZUr8N1lo6D3Ho7QVpajL3f/8NjEoiRVe+VW0FHyZJidIa4aYMb6zqXZnlT8bx5IdlJpWzX0
 2zJCy3noIYjp26LUzbHJvnPS91n9HlHfhaaftW9PMwrqFXKJXgGc/BKOThkg==
X-Received: by 2002:a05:600c:430c:b0:490:6237:521d with SMTP id
 5b1f17b1804b1-4909c0875a4mr23690655e9.13.1780047918867; 
 Fri, 29 May 2026 02:45:18 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c1035ebsm14349985e9.5.2026.05.29.02.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 02:45:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 11:45:14 +0200
Message-ID: <20260529094514.178266-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-1-thomas.perale@mind.be>
References: <20260529094514.178266-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780047919; x=1780652719; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qCCR1vXxanc9SXw4lTRUkjylIwRGtSTg6gpBWaYfzZ8=;
 b=WJ4Hau0YfXxmbjoXIppRKc3aa4qC9THCFwiGYfjAlE8Q5xfiO4knicFKHe2QHc3GrN
 0UxFPA6QvaDwi4dxBC5EtXhxnZ+wkQjaFqM2pIxlY0HeZiXDuAIyuVH2gGkNTIBgNhvK
 CSh08GlhDdtRbcZ495hOMifwXHC3z/8g80AkYrO28UQfUMQzdGiSXdnJFKyAV8ZOJhyl
 Arxy2RFxV97V78TDUEmNuzQ7mq+HTkI6oplUgSCdWiDYJICE6wpV228m4PRREzIy8uYm
 XpGrH5ts+N9AVc5gCtpLx0uJXOqlYuBMpRtzceHk5u7PU3QZycd/z1VNVe6DYPLMmrv+
 cevw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WJ4Hau0Y
Subject: [Buildroot] [PATCH] package/gstreamer1: update CPE vendor
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE "cpe:2.3:a:gstreamer:gstreamer:*:*:*:*:*:*:*:*" is valid for
this package.

The previous vendor `gstreamer_project` has no CVE assigned to it except
"gstreamer_project:gst-rtsp-server" which target another package.

See the CVEs [1][2] ...

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-3085
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-3086

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index e9299e9e93..535272ed25 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -10,7 +10,7 @@ GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
 GSTREAMER1_LICENSE = LGPL-2.1+
-GSTREAMER1_CPE_ID_VENDOR = gstreamer_project
+GSTREAMER1_CPE_ID_VENDOR = gstreamer
 GSTREAMER1_CPE_ID_PRODUCT = gstreamer
 
 GSTREAMER1_CONF_OPTS = \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
