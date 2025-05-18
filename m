Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAE6C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 15:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F9C8149D;
	Sun, 18 May 2025 15:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOp7sCZa9mYg; Sun, 18 May 2025 15:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 452D881B3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 452D881B3E;
	Sun, 18 May 2025 15:34:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 172841BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07D2A81B3E
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvfUWk5gsFe0 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 15:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com;
 envelope-from=tom5760@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F13E8154E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F13E8154E
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F13E8154E
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:34:17 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7c5ba363f1aso531795885a.0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747582456; x=1748187256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wjLGQpXHB27eU4BxKXRZZKPUgpqMNiXXiNDCg64RZaI=;
 b=EPq4zkwaSopCw9X1tNUgkAVHwRuZbqGUNMLt2qYrfRmw3GIyfzqRtHCb8ySOCm/9fe
 E48WPHlGv3dVbhoQIYJhIGW/GB8zONcVSvfuRnZpTddGEr0gmQmUifi0/gwGRQSeSNVI
 AXBAbp2mbGOB9BxOVP89/I4IR8QkptUyhLey/J5deTZZ5T6rVibb/2YjcxolotqTApVB
 +DPnZvgcr7IYcqZ/INwk6hevukkx1xPUNz93DudaIy/fLUhW5gntzdwTRE6Nx8NFcyXH
 9vz1WX+D02u7aYWMVHjBOQn20dT/O4L4RI33lhmubjVp/VMKcfn0hwjHFklESaaP50HQ
 e+lg==
X-Gm-Message-State: AOJu0YzOS/Dy/O9i9XnKsNoviZu66Xq1pwdOxIeidUDY1Kw5Iq070r7G
 BngMobnxfu6bpJ2ooFiWSizP7hJ6yn9rkoFvJ08KIIHk5aETwx5xOr+zyA8rrA==
X-Gm-Gg: ASbGncv4vOygKAqnqS4WiXpjtQK7arPSSrZq7rbOiPw1KbehBOM2mNKEOAQGfxcD6iy
 05NC65Vj01MC8OB1dqoUjHHNhkjNedxnQvySNsh7q8jcmE3DX52zeWMjkijuptjgwKNCd4vFiDz
 JmD/wQ3mdVTcTe3+K/pJvfMUqu/pH+H5/JJUJgJQY37/idknMdf/2sBqSew2UWxSoJbETExCUUT
 Ovu8Jt1SfdugoN8KWrTP3G6gvr+QJ7YUWG7eV14G9zh/Ht9JrTirnzGgAvVFwSvljCbsvpaj6T7
 Xk5HGAPlMMr+H5BPP31moEvKQtf/UsiThlPfMULRqOl6iHg9YX0KsVU3c49L2CYp5CRg
X-Google-Smtp-Source: AGHT+IHs7H/9tBAdX7nMsJ/30cbGwH8TbeNxCQf1HMUcVdB5w6s3lP/3sq8T13AdEwB3xLbDEL5LeA==
X-Received: by 2002:a05:620a:2889:b0:7ca:f3e2:92b0 with SMTP id
 af79cd13be357-7cd47ef0edcmr1310230985a.3.1747582456509; 
 Sun, 18 May 2025 08:34:16 -0700 (PDT)
Received: from lithium.cow-mirzam.ts.net
 ([2601:47:4000:119d:a134:365d:cccc:6557])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd467ef2fbsm419159585a.59.2025.05.18.08.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 08:34:16 -0700 (PDT)
From: Tom Wambold <tom5760@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tom Wambold <tom5760@gmail.com>, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Sun, 18 May 2025 11:33:56 -0400
Message-ID: <20250518153357.10003-1-tom5760@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331153438.4103-1-tom5760@gmail.com>
References: <20250331153438.4103-1-tom5760@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747582456; x=1748187256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjLGQpXHB27eU4BxKXRZZKPUgpqMNiXXiNDCg64RZaI=;
 b=IDUFc9jb44JXwtW9Dg1aSYJzYmO5+i21ZRbLqPITH3TO450vRDm/yJff7LAtRNpWOm
 IU926kCAg59VhGfCTNhXwIPyGvgBwF8VkEsTwZbdf5QXmqmK0gaz0bkz2Uz9CYPafXQo
 2P9ykeshppr2mMLZo//K60CVb7pMdhZk0LqtgJG8Pn3ljKXBKZnR7Nf05UnnO46JH4La
 xr2ee4dWoMo6+9kn49BlA9tcKWVLfWBihkbZ5ftnborRnmqJR3yJuAdPPIcxnfNcg4g1
 yNsTBaZFsBtp0oRBAXd9Lr+u2YVXeEBo6KXfFZXel2EsNf1Th6pa7gghkvhnkdBtc9Eb
 UWLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IDUFc9jb
Subject: [Buildroot] [PATCH v3] package/go: go-bin host-go provider implies
 target support
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

The BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS configuration symbol is
used to determine if we can build Go packages for the target
architecture.  Previously, this depended *only* on the
BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS symbol, which is true
only if the host system can bootstrap the Go compiler.

The go-bin package makes it unnecessary to bootstrap the Go compiler.
Also, some host architectures (i.e. arm64/aarch64) don't support
bootstrapping the compiler anyway.

Update BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS to depend on either
being able to bootstrap the compiler *OR* using the go-bin package.
This fixes being able to use the Go compiler to build target packages on
an arm64/aarch64 host system.

Signed-off-by: Tom Wambold <tom5760@gmail.com>

---
Changes v1 -> v2:
  - Added missing Signed-off-by

Changes v2 -> v3:
  - Remove new BR2_PACKAGE_HOST_GO_BIN_TARGET_ARCH_SUPPORTS symbol, and
    just re-use the HOST_ARCH_SUPPORTS symbol.  They were always the
    same value anyway.  Thanks for the feedback
    @thomas.petazzoni@bootlin.com!
---
 package/go/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 7e354b3298..a42e37f90b 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
