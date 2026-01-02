Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FFDFA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3E1B8126C;
	Fri,  2 Jan 2026 20:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2ppfGq2qB06; Fri,  2 Jan 2026 20:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8205D8122F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767386364;
	bh=xhaqvOIN3Mp1yiJ65vED49SXN7B6VYjktg5KhtYwUxw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=e4wFoz5fVx1wHk29V3Kjje++9nfUwscdbhqqsDEnD2d5AHEexPzPIhT3Mcoz2U5xR
	 XI5/VXzZbroFbE86g6DFfdrXoEThVG0oW1OxFtJTKCU1uakm6Y8ooEvNjhezJBMB3K
	 drB9OEU6JdhhrvBWvtPs10s4FdKjLD6791qunOBg+sSGZ0BYf+tWZ8QiDimjkdGNXL
	 khtKE1oW1jS1E4Uo5PZ40PgE8oyRn+Jmhhc8KeeWQUQk6Sg+2gJSCrctinRn5+koea
	 HHHdhaZI4raW/H5ntrEyk80urDgVpWm6Z55v1Oc88C6mL6HXKVy8hlRo1xgur/TgNR
	 lpKXoVVsROySw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8205D8122F;
	Fri,  2 Jan 2026 20:39:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9D29202
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 903C840366
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3ovB4WdjEDl for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:39:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB46040071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB46040071
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB46040071
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:39:21 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4510974a6bbso3663859b6e.3
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 12:39:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767386360; x=1767991160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iOwglMiOmXrf1CCDKvEBSeoM3C8DEpVyDnWJOQMF0EY=;
 b=IWYesqVwnccGe2wnaBQSMeiOmh5z+FUZ1ak/znIveZ1x+dPIyS03U/SMGMqRg0yfzz
 rVdTTVdLto7178xG96A/3BACERQJBK7pXFrb0adFxeX0D5794zphHX/tTEmg//9m8DmL
 /ohqT4AhPn2W5vubFvSAaBisdXeLmbF7CFy5IS4QtmrUcK/4MjWMIMWjEXvY1NzfvEqg
 nABWZCuoAM62ofPriflSHA1mfG/gZVgoyjw6xCjDzFvRpf/9AiLF7GxNDl7GJwuDPH8T
 juwS/YAIGjTxCtcOnkVDBDCF/ZquZB9brsN2u+yO8Dg+iW9f7zxUJtp838HhaYRmHLYE
 6vfg==
X-Gm-Message-State: AOJu0YxiWoUA2MPeOX5qjcmRXz05zRSS7lX6iVPQBFJGUImOXku3By8P
 gzI4J5BVoNE1qqfSPrifB8fDyKod4XIgTpV5kl0alRfVh8pjLV047PA12vfYiMLJ0C8=
X-Gm-Gg: AY/fxX7doFh0GnKH8r8fkg8toHFT4c3ccKU/kQw1DcWhVBXA2t+fFi2FvqoJ8giowMj
 FkO24zlwzBfTsFHSilw68C5G7RKokWHmtS+bImlzg1sAfnT+tSFPVVJKrTUaloaGbaikII0Sh7p
 RIPsn5Ddf/DHKhVBbdPLAu7I0n50L9bk7DDynWDklriKytvv94XjouFV2oF2jDbgJAfenlmDIe0
 RdiZPWj34mWYu9B2VNW6uyQhLL+tG/sPqE6/7CCeQRRGoiwRSmbX9lME4/nXINeaEjs1O894B03
 o+5fY2+pPXJ9emLaQ/AviOrtznqal++1o4n6T1b1JORpQESCGVulEy1QrsIRHCC/TSeTI3H2lBp
 P9U85IpY1N9R7q2v0u7jvIFizJHSKOhWTsMRb7FI97l08mbIepUhtkO9U4pdtpHTT6CEer49jLX
 JcZgO5qsdOPe28hYHOOMcKNrE1AlhLoojN8VX7lGWXgCKHV4llXcrhOuHa07BLVYs3BfMXJX0qa
 X66CH3/7nEoy4L7IWuP9FJByYKT++C9DNa6ze+0PCxAoZKL8CEoSS+ahAtysxmMVw==
X-Google-Smtp-Source: AGHT+IF04CpxaU/pa1KQcWdljiVF49HUBZYsNZ3A70UMxOV9DPSeWY6GXCIm5wwv935gvjKH4k/50A==
X-Received: by 2002:a05:6808:1511:b0:456:9f44:da9f with SMTP id
 5614622812f47-457b1e6bcefmr19938054b6e.0.1767386360046; 
 Fri, 02 Jan 2026 12:39:20 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3f1db46sm18240184b6e.21.2026.01.02.12.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 12:39:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 13:39:17 -0700
Message-ID: <20260102203917.5271-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767386360; x=1767991160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iOwglMiOmXrf1CCDKvEBSeoM3C8DEpVyDnWJOQMF0EY=;
 b=NIJsWht4fnkzXoXvkNCEWiwFExy6Sk0p2BPc6chxxYEXmH2o0VebfcTON7ssyIGPiF
 PYUctjF9LtzjRbbQBkWnaLXTbMq81VNVh7FkJqU2g2P9TG+yrQycdVF0Sm7jcZM+CCSf
 Mwk66WjkTN6YgWikPb11wGtiTU5hK6+RtO7SfdmiXDsreJ66n6KEkDvjSeNr9vNIw3qr
 QU0AU3g5yvNMlG7cpxsFutYcBsGX4+Kvm4Xq5NnvAVyjduCvEQ12RpagLdbU59grzDX6
 75xmyLNEIn6NJ4KqI9GcCvPudM/v42zDHOL+C9jRkCIjS3B16euJ8061t3h8CvfJAe81
 8K/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NIJsWht4
Subject: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 5.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index c77915987b..321434e299 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  577c064ebf4b84fbd53890b4c0f86f5a  pycares-5.0.0.tar.gz
-sha256  62e38a6cce0f3dbfe6dfcccba10526255b3823a2a040b313afef7aa9b039ce03  pycares-5.0.0.tar.gz
+md5  36560432e7ebf6e9746080ca2ca7cf0f  pycares-5.0.1.tar.gz
+sha256  5a3c249c830432631439815f9a818463416f2a8cbdb1e988e78757de9ae75081  pycares-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 0cb1eeda6f..cb645e60f0 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 5.0.0
+PYTHON_PYCARES_VERSION = 5.0.1
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/59/5d/b50bdc30026f350f1c4b0c4fb6b7543598f2bcc370308c5148c7019d9886
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/df/a0/9c823651872e6a0face3f0311de2a40c8bbcb9c8dcb15680bd019ac56ac7
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
