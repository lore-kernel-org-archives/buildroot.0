Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04EFCCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 19:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7542861250;
	Fri, 17 Oct 2025 19:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxtQZBOg1s96; Fri, 17 Oct 2025 19:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2BF26126A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2BF26126A;
	Fri, 17 Oct 2025 19:06:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 817E643F
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 19:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7377861250
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 19:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mFX2QfDX5-I for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 19:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62D4A6126A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62D4A6126A
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62D4A6126A
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 19:06:10 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-63c0eb94ac3so3749074a12.2
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 12:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760727968; x=1761332768;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fl+V/49XRpTFZg1lCw0bWOQBh/8EdDxPNN9hHa49sws=;
 b=KesD8hME4khZV8tS8c7JASEItvZcTgg8NTZdXbuWZDjPggMylmCO1SFhXgIGEwT/Ao
 Cu3tNr4a3ja11Hxs1p1+6aQke2Nv1ct4O4J1G0nm1v8TCOs3n//2AerJGwm+fg5/Xxxm
 lBR/h67uTWfZLqzeIYvrxx9gPsJV5/AfUtbzqGodTnUAsu3SRynuWVDgajfd7J6qgLPj
 N8klxSLMdztyDcdz+pTiAPAcwoG14fuy0uIeiyJTq5JVGwZJ/GL6cqO6egUdqC0Bc6T2
 NuD7ZN/8fqqnGH8wYUHtomZh8YpuBjr5g+J5piHEGWpn8ZvvXoPzIc8Z04GN8pPzPfV6
 ycCQ==
X-Gm-Message-State: AOJu0YyyZoLJCdPalkdlrGgS4rSwLfU/Wm0DBRIKvoQCEEaELCU+iGxt
 9TlsE0PRRzg/d3+J2orMmhgFGp4KLf3rhPca5vVtb7/8UqDmU2U/t6mZPqROYg==
X-Gm-Gg: ASbGnctm1+c5BT52RPpCCDpgbcG19LpwffydDwb7WMu22ENZFjRpl4qGc4k3DguRiHN
 XaATGsCzkAQ0TLXENZjTHND9gds6M/kM88hN9s61vkhDYwtTphu2mLV6y1Z2J4kbvBrvfYi6bCj
 ZGNeVu2dLP8QJG2c13jvia227qEce42e84euSF8UsKADEoPOgzp0/C3xlBUJJDA00qb05cbgFGk
 aaeamtS1gpQEtgqV3ZelZCiLif1Cn1vuf8z5m5bQrRPIC3kbgyUcbIojReqz1VQRSZW+Z+KCabi
 USVqa6njx3tNYOd1hqLnIolsQkfUgX5m1AB1TVxGxU6HNvACzXYHN+Q8+J/MYgyrUMASW7McYzW
 0izRIGV4zRDL9fG7zEunteubbf+F4ucCvulEJfqmofu+Q2A2uewQFVT3bN3Qhj47XC8Yk7NeP03
 PR
X-Google-Smtp-Source: AGHT+IE+uIvS/gdTqt4B8LWH+OwQTr6XfBrprQBULWIvvoJKe47ujhym59x31v/cUwCY/Zw+Wgs6Hg==
X-Received: by 2002:a17:906:c144:b0:b04:3e43:eccc with SMTP id
 a640c23a62f3a-b64739502dcmr589954666b.40.1760727967979; 
 Fri, 17 Oct 2025 12:06:07 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb036846sm42670066b.54.2025.10.17.12.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 12:06:07 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri, 17 Oct 2025 21:04:30 +0000
Message-ID: <20251017210430.496962-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760727968; x=1761332768; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fl+V/49XRpTFZg1lCw0bWOQBh/8EdDxPNN9hHa49sws=;
 b=EGV55ubRGed/HCZhLfOmvyIvRnkA8NEIH5pYeqzY1hkJA+E9yExempt/qj2SHEZdGX
 vcEDOFGTfEF68GYuSX6RG/4gLYRReQYYQtpttAlkHZNZNndV7gXYosbpqpTq2xuGLVfx
 4ufhZXLcE52x2h5FIDxZ3DNoeorn81YlC3tBLv8TzX7R77t8CvBdDqlTMp1Y3K6IHppP
 9+10k+c/q46kI43LGXvsiAu5tqXIhVquPRrk8mTJKK+8b4w2cAAr+W9p5zC0VAo/e/OL
 z5huDYNI9ZLCd7BZRyMsMclhnNqk77x+fR8z+4mnMRDms09h5dKxCk/Ok/dlylvLbX0Z
 /hTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EGV55ubR
Subject: [Buildroot] [PATCH v1 1/1] package/podman: bump to version 5.6.2
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
https://github.com/containers/podman/releases/tag/v5.6.0
https://github.com/containers/podman/releases/tag/v5.6.1
https://github.com/containers/podman/releases/tag/v5.6.2
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/podman/podman.hash | 2 +-
 package/podman/podman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/podman/podman.hash b/package/podman/podman.hash
index b5802dd305..e52a353aa7 100644
--- a/package/podman/podman.hash
+++ b/package/podman/podman.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a2cd66e33e1cabe34d11543c3fa68f9ebe7fcadbde578231d28745aa0f48a21d  podman-v5.5.2-git4-go2.tar.gz
+sha256  1a35d0030bb8dff31cf45d16d98cddfbf9ceeb2835c82d95b4eacd5a26e482af  podman-v5.6.2-git4-go2.tar.gz
 sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index fc9a989bf0..71eb26b496 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PODMAN_VERSION = v5.5.2
+PODMAN_VERSION = v5.6.2
 PODMAN_SITE = https://github.com/containers/podman
 PODMAN_SITE_METHOD = git
 
-- 
2.51.1.dirty

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
