Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61527CAC598
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 08:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B09384B58;
	Mon, 15 Sep 2025 08:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBI-h02C_nlv; Mon, 15 Sep 2025 08:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4934084B45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4934084B45;
	Mon, 15 Sep 2025 08:23:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D98AF1F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 08:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2B4784B52
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 08:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id popw-RF9-Vz5 for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 08:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B074484AF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B074484AF1
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B074484AF1
 for <buildroot@busybox.net>; Mon, 15 Sep 2025 08:23:42 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-62f0411577aso3313382a12.1
 for <buildroot@busybox.net>; Mon, 15 Sep 2025 01:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757924620; x=1758529420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bR/gRMMDr9ODu8Ydv+d2ZGyOFQDeSpoF7XXqjdp2af4=;
 b=EFE+H2qcsGuvGVYCVwE4RLArZsEU23E4teKO7ueUX9isdnrxC6ook9knUJBAk2RJyy
 lEBcXQ6odc1aqY80UFjNaz1AW8iNIBJSrSKqSRAx7+Q0+46bJCW8JyATOCw7qk1TOHDR
 7v5F4CbpvmCyDYSa29+5w9Qbzdz2OyFN5AEKhBg3EbdtjR1VlV5lwst60g2slw9TBE8a
 Zw1abN5DuZs8/1YemSgRi2YUbaDyy+jw/t5H8uIvkt/UGrN7R+rWGuNQyxb3alwUf7bd
 jGIlgNv9KCqdJBPwJmprX5T9QTyHMkxR0SWreyfeVYNd/phRLrWtMdxcjrEAVFvMED+u
 AZRg==
X-Gm-Message-State: AOJu0YwgnUgeuN4So5Wh9DbOzXzwKZaDYHD18A9PFbK2PzMu95uTU1ey
 3JC45xD3P2ASJX8L9DHZ4vWwrBfACL/oEq/Ps1brQLpsP6ca0e7GGdJW2c8L6q0wjfixQNagmRN
 C8xRyDg==
X-Gm-Gg: ASbGncvf7Y/afJ8OcIvqQRpaDKu3IYcTvGHVg8uSJ64nuXSQEte40M9/K4vq2xHatji
 iyWOTmAaJDuT0Lb0AV/niacAKye/hLWV1r6EfLf1qbWA4A6HeEQ9tL0/4uIm0OzDGo522JWQUQY
 6oOra6Bl+2Z3s5FWKhhhcYRkAdX5fVCnfME7SYZQ8jnVm0MKCIDKNJPvR8Qe3r+/bLh1eUMxw0z
 JZ/Fvi2BnNx/y2unG8kucHPwnz3flaLKGjBR32ln5YHPSyqmCClxilYmM43bpLXsr1gfugoGZoq
 ludWZPOjc0nG040hubiOOBWiF/NxV8d1dkYZnV1cJSyA1kyUagbVGo56eyP7CRq2+E0OD+8Xcfu
 jL34uSdI1Jf1gqbSvx4ILObWoFOdYOTyMn7a8QH6imrR6QVlM0n0xKLFxkoi76nXLaaY=
X-Google-Smtp-Source: AGHT+IEFEUPe1MBJjWdcP3Pw9c/hDcgcWPbybJz/mxgORtiPx46j+H+dB0mO2T6tSQhOheeuvBUDwA==
X-Received: by 2002:a17:906:6a1d:b0:b0f:a22a:4c3c with SMTP id
 a640c23a62f3a-b0fa22a5935mr353505666b.48.1757924619634; 
 Mon, 15 Sep 2025 01:23:39 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd3efsm890804266b.55.2025.09.15.01.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 01:23:39 -0700 (PDT)
To: buildroot@busybox.net
Date: Mon, 15 Sep 2025 10:23:33 +0200
Message-ID: <20250915082335.757689-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1757924620; x=1758529420; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bR/gRMMDr9ODu8Ydv+d2ZGyOFQDeSpoF7XXqjdp2af4=;
 b=MMdzCznLz8iQ7UDHmcnnuEyNv7o52eQeRM6hgCn9M5E2Qa6w1QbL/K9n7PUNycIprs
 xAR9m6tvVoHfHoAZI4vdfL3rIjuk+QfqlrYUWPPliSTqMlSMshgOT78HoFHasA9SpIwp
 p6d/xgfRHjMLZQkouPJ6uaHQW44ZLGszLDetcAe4rz8Clie87AwS2i8VEFYbyNm3HrMQ
 HiwiR6DJUz6jBrP6nXMzxZdegG+j37kgCIwkUcMpbmac6dWCxpNi1lEAgXgaJ+j5r8KX
 Rh+28biNWnnirg66t3pLNOPIXymRUZ5q3KiSCjXGF9rje8Mzp0BA9G2xNrd5/WFzvQFB
 hOCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=MMdzCznL
Subject: [Buildroot] [PATCH 1/2] package/collectl: switch to GitHub
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

development no longer on https://sourceforge.net/projects/collectl/
but documentation still on https://collectl.sourceforge.net/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/collectl/Config.in     | 2 +-
 package/collectl/collectl.hash | 2 +-
 package/collectl/collectl.mk   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/collectl/Config.in b/package/collectl/Config.in
index 28379abe2..7a62c935e 100644
--- a/package/collectl/Config.in
+++ b/package/collectl/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_COLLECTL
 	  disk, inodes, infiniband, lustre, memory, network, nfs,
 	  processes, quadrics, slabs, sockets and tcp.
 
-	  http://collectl.sourceforge.net/
+	  https://collectl.sourceforge.net/
diff --git a/package/collectl/collectl.hash b/package/collectl/collectl.hash
index 1785d25d8..6714e2afc 100644
--- a/package/collectl/collectl.hash
+++ b/package/collectl/collectl.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9fab4769441c07201748e52c7f8c7b21526ab45a05142dd2b2b1fa5c16c38750  collectl-4.3.2.src.tar.gz
+sha256  552bdbe9e97071767bf0871789e19ede7d2827b68824e75da9cd7664218ea440  collectl-4.3.2.tar.gz
 sha256  b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
 sha256  264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
diff --git a/package/collectl/collectl.mk b/package/collectl/collectl.mk
index c6cb2e149..358f8e3cb 100644
--- a/package/collectl/collectl.mk
+++ b/package/collectl/collectl.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 COLLECTL_VERSION = 4.3.2
-COLLECTL_SOURCE = collectl-$(COLLECTL_VERSION).src.tar.gz
-COLLECTL_SITE = http://downloads.sourceforge.net/collectl/collectl
+COLLECTL_SITE = $(call github,sharkcz,collectl,$(COLLECTL_VERSION))
 COLLECTL_LICENSE = Artistic or GPL-2.0
 COLLECTL_LICENSE_FILES = COPYING ARTISTIC GPL
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
