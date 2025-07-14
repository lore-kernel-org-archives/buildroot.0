Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162A1C83F17
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFF0B821FC;
	Mon, 14 Jul 2025 20:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IBQQ0Y7uBxx; Mon, 14 Jul 2025 20:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D29C820DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D29C820DA;
	Mon, 14 Jul 2025 20:26:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CAA6DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A19A582139;
 Mon, 14 Jul 2025 20:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHT4rnJggDxs; Mon, 14 Jul 2025 20:26:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8912A82119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8912A82119
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8912A82119
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:18 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a510432236so3414682f8f.0
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524776; x=1753129576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SljXcix1Tz1cqVJhC+l8BUY/0I0Sqr6O50/96BxdopU=;
 b=JAOW4hnmD/D0EDBapinttnNeQISpEEK+izAOp7vDQEe/qFVU7fFYxJ2axDOzEwl7Vt
 0aa5Stxtpkae79RdHRrZ/+wYfb1g7FFPsgU4WH3XtjrfF36LkMbJ479bw1YJJiyrOuAM
 dqQnu1tCHCXJ6Lepjo2B1D6pCuJ7KqWhU7Zf37VFBzoCxMQzpAteKtIHlzpkwGKwjZro
 8mvvrUZ/khdvG37asqUQ6KjrzLAv59bKEL9JqCh1GDEKi5mHBhH+K7XOzFE7Nt/7EFlm
 KXgic9BlkWS0KjaxezvSP8VQyBTvWDbfYBrKy1wsZ0PNhTjQFBmEyJrkKNj6H6h2Bpqq
 m9Pg==
X-Gm-Message-State: AOJu0YzgyzxXIN+2UVO86RoFHnj44vHdhwEybnd2/ZV2+8HmUiXstOeo
 Vs9RxcFD2h9WpULAwnHusO8EzQVJN0+8yNlkc4Z1iKQI8yvL6q7KSacoFbKtSw==
X-Gm-Gg: ASbGnctl7dDJvi+J56CqQate9memleGAXBcC4fY+EeM4LmG/jqE7zUiXw07pce9sImP
 o/nACZj05AfLeSJq6mwjX0Dz5aFoUxkDg8TAO3kOChrC52iKU879oybwMgZcgR4whzdSeHAgJWc
 b5Uz5hFsolMEufZp3Nefa6f1pipp0tIiC0I+hyr1tsyr/cJgvvm0kZlDKE539W6/d5rItCcVVfD
 mBqh6RBJMAfbFvySWJfmf6NFhL4LyJSLOBvV+hleasCgkPw3p+bEVb3MY1CLFUJG+3gdHVWJcrT
 sAu0bEzOtlug0yVf7MnZR5Hltt6rvKHNBIRPHomIrwYDmlkNCQG8qk1++8KP5d9pXqMqku0i2u9
 YSCOG/lhPFlHgP1kbY1Hq7UOfKr8noVjm
X-Google-Smtp-Source: AGHT+IFsNlkzgovvGxRgBECpjd4avGObdqJUJChw9gQPHiot+NxKkCDSAkdVZ92uiCUdCfT1b+tVdA==
X-Received: by 2002:a05:6000:2085:b0:3a4:e667:922e with SMTP id
 ffacd0b85a97d-3b5f2dacddamr10703325f8f.4.1752524776489; 
 Mon, 14 Jul 2025 13:26:16 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:16 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2025 22:26:05 +0200
Message-ID: <bbfc150698b24344d1fd604015a74666d8c7e955.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524776; x=1753129576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SljXcix1Tz1cqVJhC+l8BUY/0I0Sqr6O50/96BxdopU=;
 b=UZf88WH8sXfyUiOVCIJjpH9LAXpZ7W/1r8DPwb0xU1s2757b5+pavMWuwwzGAQrW+k
 uVp9ppaVMa1wt4qukB5yw+vzVCtPJ5smQ8aPRFAQCpIszEGM1VhJ2EcnDbauuU+9XzQC
 9L4RzkwWgeIjQWi+JDWwE6kHKE0oEvtwr0uHzyxLmJGnrjiGYRGhiSNKU5jz0bN5qecr
 bwHxNQAGxRVd4UZX8wYwvzw/Dft/g8kLmGH73RsBhpiCQhoPvUazKUlGYS6AI3VK5Q79
 0lfs0zaUFNEMbGXs0UMdJQgh+Lurtb10YuT5OqSvze84BRVLpnqUjWsyM2ZyRIYV1KfK
 WzmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UZf88WH8
Subject: [Buildroot] [PATCH 11/13] package/podman: bump to version 5.5.2
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/podman/podman.hash | 2 +-
 package/podman/podman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/podman/podman.hash b/package/podman/podman.hash
index 734042df95..b5802dd305 100644
--- a/package/podman/podman.hash
+++ b/package/podman/podman.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6c31845cbbc54a0b65c4afba224048c002b40e863c4ba7ca19355a8d333b3d19  podman-v5.4.1-git4-go2.tar.gz
+sha256  a2cd66e33e1cabe34d11543c3fa68f9ebe7fcadbde578231d28745aa0f48a21d  podman-v5.5.2-git4-go2.tar.gz
 sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 27d9a84712..fc9a989bf0 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PODMAN_VERSION = v5.4.1
+PODMAN_VERSION = v5.5.2
 PODMAN_SITE = https://github.com/containers/podman
 PODMAN_SITE_METHOD = git
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
