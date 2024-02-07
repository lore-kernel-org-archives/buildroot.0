Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B32AC48297
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 02:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34870401DF;
	Wed,  7 Feb 2024 02:32:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JOxLowL7cRKx; Wed,  7 Feb 2024 02:32:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6EED40332
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6EED40332;
	Wed,  7 Feb 2024 02:32:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95A0A1BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 841AC81F21
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_qy8xUSUYYB for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 02:32:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8ACD481F1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ACD481F1E
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ACD481F1E
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 02:32:01 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-219452bdf81so124331fac.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 18:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707273120; x=1707877920;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H2v/NzsD9bLX4v/MvTetjR09lIawymyFRhCMa8WfyEU=;
 b=iDpfbVpWFmBMtbrBhRItYEUcIS3/iHetSBKxuP+8ZfKzzLzSE+0FSQzDtzkPQzu5PN
 VB7kvuAxCEzKvqY3R41YKJcIhjZtLT3ryhzIehj3qt/aqnZa6ZhC6ajVu5diD/QIUepG
 atatQCPkPnBaZJYJH+KfDMxmNAHnvfiaTd4dvabKLuAprgvHj+5xlPEKa1FvARMc+2/r
 eCyq7YHwNGNMFxzrLAUBCHPzeTdzsIvZiL5vhQ7YdG24FbI3E1375cskmeHMwoTrvBhk
 8EBjv9BgF7ei2UwGV6Wn5R02NIu24Ag9obmO7afqrSGaASeUYnRWxIHEXrGHznFWJeKH
 UnYA==
X-Gm-Message-State: AOJu0YxDTZjrT/+/rKyTvgSAjdCPOyEDjW9T17IJSm2HealKDqNsTybW
 4qenHNO/bM5GBASNxMGY/O9ZQna/TTJEds6QKvVlDLl4hw+d+dFuMT27Ykmg71YdpECRfN6e7VJ
 z
X-Google-Smtp-Source: AGHT+IEPKOHllDuOk24oQ7+Kgb+76nQKbM7okeZ30WmKelCe/8MUprdyVkDSFrYwISJViMR05kj66w==
X-Received: by 2002:a05:6870:5253:b0:206:9d93:8972 with SMTP id
 o19-20020a056870525300b002069d938972mr4638510oai.50.1707273120204; 
 Tue, 06 Feb 2024 18:32:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXIlukiJMRvcvZV5OyiBKyI5pJAkJi760XVoLCL2/KiXtUBao3tC2SKnqgOCVyAAcuRiMXY7woWPpq2v0Ep+0PJaz+zaIrAdcujKvw3JOgzIQFAQIVTEZ7dcz8OGLlXxzHtxd3ILAvUML+YdZcEVBj71ziKNMa53FigLZu8l8j3hKBcHr5T2THr7iHWEO9Dhp9+YQ==
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 e26-20020a63745a000000b005d64d09acffsm192866pgn.72.2024.02.06.18.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:31:59 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 18:31:58 -0800
Message-ID: <20240207023158.2572044-1-christian@aperture.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1707273120; x=1707877920; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H2v/NzsD9bLX4v/MvTetjR09lIawymyFRhCMa8WfyEU=;
 b=bUtadHUVvdVQWwsA/Sqt10A+afbLIjNMqHGTaGW7VB8DRipp2/WLyLaNjYNE77zX4I
 9ewR4Fr0Qx3nS3jV/1jki//IgHmDS06Zr+NzO9p68qDk5F4pGVYSu09GKxB5S0t4EEw+
 JIHp2PpcvIqwVKzts6X91LBTzGTyioCOkC6YzM2kelbeWeIg7RkWyrjcQxn330HEGNuZ
 DX1ffE6p0uMog6eZCYzxrRj0fRX05sdSrIXONjbCC8IcOefeLV3X1EkePIhuqN9EPd00
 6inmxuk6ToTXDkfR/2EN3ljiXXvSq2lVu+RCYWnRZrY36HzdMhTjB44zCu5wrzIt2Qbh
 Cjwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=bUtadHUV
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.7.13
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containerd/containerd/releases/tag/v1.7.13

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 5524a1a44e..25dc7ff55d 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  891b84e614b491ab1d3bd5c8f4fb119e4929c24762e149e83e181e72d687f706  containerd-1.7.8.tar.gz
+sha256  ae2b914bff0ddbb9b29d5fc689a51e1ce89ea4edfc4df9ae10517c6f5d2d5aaf  containerd-1.7.13.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index d3ca102797..50c2965b87 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.7.8
+CONTAINERD_VERSION = 1.7.13
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
