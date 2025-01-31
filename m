Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678EEC02190
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 05:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A9DD60740;
	Fri, 31 Jan 2025 05:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5RXH4Rb72qjg; Fri, 31 Jan 2025 05:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3525360762
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3525360762;
	Fri, 31 Jan 2025 05:40:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26F9916E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1576E60762
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fp_HQQLgnCQ9 for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 05:40:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B6E760740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B6E760740
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B6E760740
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:40:15 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2f441791e40so2140725a91.3
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 21:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738302014; x=1738906814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H77kakV/5v0IjH3MgGVuPQo0VhKXMIsQqTzpVqy+rR0=;
 b=qNNScK+5vaEvAZOcEB5aVkgQwtyhqfLoRNe6eAyILRoDhbMgOdQ6SwxodqUo3u+1Ok
 NqyfCZITw8ufmlFO5rvRPDQaVSaLhg7AQauJFVRZIs202mT3CMMI6KtmDEKn4JVEBj7t
 JVJ9TxG5+bdkA0GKtu9rv0mQuMfa3OgHbE/5nEASXbrFaF2VwL5oxHveMkzWhlfIFpr3
 V4SvWoFyldWfgdjtLIpeIcDyRVn5vYKEb51vJQUergkyW67v8aubQgpSk/obMzFYoFDP
 T8HlUwigVlcw0dT0bDZ6exT2VN/8dIot4nmBES8WUQqEVrsqRrrtLDKSFPNlU+fk4FC0
 w6Aw==
X-Gm-Message-State: AOJu0YzGqFzvDwJ3+LNZqRdlLo9Vr/xw/NW/FAjIxBYcxb4avDX92tqz
 IDTIkitEobo9Pm44sEwWzqBR8BGTjdQZ2J3n7nLbjmLrND0Em9bAkqbTEMWnClsV546UTDCSXZz
 z
X-Gm-Gg: ASbGnct1Sbg1YuprXAuT0ZsYpBzGJ+Ti7/YTtNYYQsos+hQhrHPQ5AbbHbjrQhsNOjs
 C1/meC1zJGnahgOItsPK2s3TgJN6MN2Ut1kZnOBWT7KKOhozVzwuxoxAsiKQKbnNRuQSWL0lo+z
 8+qK5jnexg+XReZQm/PLF/s5q6unZoB9DP5nFba+XIjl12tdgoIOdbWH4Kvts8qftXPblmnXrog
 TiErLazpexqg/a+KiT9AprBsrRYF5WfUYXNcRpKXmXHMDeaXf4QM5G9wPnAp6y6DTwQeQ76CnRL
 /V1PHZYU4ToEQPi6F/m1DtuxaetcIUGPQwODE5cf3mqp72cg8sZ0t6RjNeUQISphjB/tQOqqfg0
 /dZQ=
X-Google-Smtp-Source: AGHT+IFF3jX3bHebXCcCzcVH9l8ty/XC3Qf64YlIhGQ7Uc2/ghUJIIhz+5nb0ke41rdWNbFcUwdeVg==
X-Received: by 2002:a17:90b:1f86:b0:2ee:aed2:c15c with SMTP id
 98e67ed59e1d1-2f83ac8c3famr14282639a91.28.1738302014440; 
 Thu, 30 Jan 2025 21:40:14 -0800 (PST)
Received: from localhost.localdomain (c-73-35-224-251.hsd1.wa.comcast.net.
 [73.35.224.251]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21de32eba6fsm22328905ad.107.2025.01.30.21.40.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 21:40:14 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 30 Jan 2025 21:40:01 -0800
Message-ID: <20250131054001.74407-1-christian@aperture.us>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738302014; x=1738906814; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H77kakV/5v0IjH3MgGVuPQo0VhKXMIsQqTzpVqy+rR0=;
 b=pk8cgaU7S011EwENE/lf5ZYrMGuc6KDvmEuqIF2BcohZDgh0yKx6Ep23d1MCZg1MUO
 A5bE3/w5sKHWefqhNy5VVMReltA+sELeijHEpu/JAr4eySmel4e289rr70FeLFrdnCk2
 3j21RqI5/YNGZ/Fppd/ITOmavKlIpqbNuDxSJvwxc2+jNPmFOjph+qJgZ+9nkO7B2iu2
 QbSKHXBy45a1EQEyNRp1W5NPkegBIinTo/bBdFSBmUvbAla9MJfx3fKj7bCzbBScqwk8
 GpMkzmncOz6ouA2sbO9viZyX63IsTgZG1tDPVJbGNBfb1Xvb9ELnB+3xK0v3u0zrmgah
 E09A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=pk8cgaU7
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump to version
 v2.0.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Major release v1 -> v2.

Dropped patch as it is no longer necessary:
https://github.com/containerd/containerd/pull/8924

containerd-shim and containerd-shim-runc-v1 were removed.

https://github.com/containerd/containerd/releases/tag/v2.0.2

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index e3f8434192..4ec78897d9 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  393bfde8ca1766a0bca3441e18eddc3f5a5c8d97ef676bde0d6c9903e1b0ec0c  containerd-1.7.23-go2.tar.gz
+sha256  472747a7a6b360a0864bab0ee00a8a6f51da5795171e6a60ab17aa80cbd850a2  containerd-2.0.2-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 88b53caf51..ee07c22495 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,21 +4,19 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.7.23
+CONTAINERD_VERSION = 2.0.2
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
 CONTAINERD_CPE_ID_VENDOR = linuxfoundation
 
-CONTAINERD_GOMOD = github.com/containerd/containerd
+CONTAINERD_GOMOD = github.com/containerd/containerd/v2
 
 CONTAINERD_LDFLAGS = \
 	-X $(CONTAINERD_GOMOD)/version.Version=$(CONTAINERD_VERSION)
 
 CONTAINERD_BUILD_TARGETS = \
 	cmd/containerd \
-	cmd/containerd-shim \
-	cmd/containerd-shim-runc-v1 \
 	cmd/containerd-shim-runc-v2 \
 	cmd/ctr
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
