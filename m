Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E58D5CC8D
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8EFB60F90;
	Tue, 16 Dec 2025 09:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPLZaMPnRnYn; Tue, 16 Dec 2025 09:35:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41FB7608EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765877749;
	bh=SJ4f7tjr3ycUzj55A6Le16cGAisdNmPQl5aWeVKyEpQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCZ4pulVRaUTojcEqAZQ+l+6bHRFOew/zM0YVtBgyLJQ+AMqppjkSS910fLVOf9O6
	 l9tInwGl2t6MjftUd3rNyz1TxIRHASGneBpK801vodmjAb70wk+4DV2qTgzlV7G1X+
	 ZS1YI5nUD1pwgvoXq95UO5QYxXHR9TJKe4lDAEOHvTChTSVg8LMpiVCpxAQmXYckUP
	 hKneoKhCphI7Zxrg1ccxSH4GYRkCMZ1Cu7YeSSocx5VociUzrxBje4lpxk+BC0P5Gn
	 OnJ1cSOnCH6AvQdXavE7IqvDaX4/K9SSRqSnmEKO8OJWTjjiJbyRKr3Bg1085asHH3
	 fZevNWlYbJoiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41FB7608EA;
	Tue, 16 Dec 2025 09:35:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2979372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B988340936
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bliKYltnTEal for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:35:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D005F4087E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D005F4087E
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D005F4087E
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:35:44 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-595819064cdso7153128e87.0
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 01:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765877742; x=1766482542;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RYoq78RmXnngUoNBga/xOjyJxHMhTBkAfBrpq73O2IM=;
 b=N6sw1XKepQuWl9aBWe027YnIIWPOyduOV3wRJgARdOoxI6yvryLJ3GjK3esEq44J48
 7CKNJSvShNlSJEH9w8JQ/Os+DufhJZDIPMPlMLN8ZhcccipKxQVdfiExmwGlqSWMdH5a
 PgO/J4RObb/xwL0vREPJ86mpPnESJg0H+DbLJQg/g/TDpX9Np92RHPaK9aExmFYcNuwS
 3eiFszpLozdzmrTfloHG+FwRpzua9dfXFBneU5XrA4ayMJwsfAbxmqLPFONh42iyOqjF
 +uTxo9bRlFtZWKWolQvEqFCCdw6Hjo0eqJxshPNk+qehiXNtWq6ttCXV7Jb6Z45fIs1K
 uSrg==
X-Gm-Message-State: AOJu0Yyx33DqoozYweTEnNof+HBbo5gLcBZ79CkB4In3R/LUfqRkE27E
 HrQotrW9v6vQeepC0DuEOksdiX16RMf+kMX0BuRq6Nb6Igz4k6rC+kvjSeN1aA==
X-Gm-Gg: AY/fxX44oyaQLa1xo7/4dFd+qKgqJP/U6IooYPmP7kXuRNUJ2SACQP5niT49kcRGjTy
 4o9Pf4OkoKLDzD0ql/oGtcDBNzPzQGnxBlyWCMFjNPr0Qmqyvi3V3DHLiYv5BtAo/r44Du/4/ip
 Ftk5kXzu87f0f+5sY6VorB+FR0uTdXL4MHifTXoblhSPl5J0N9deGciPSCmHWg98SjP5aQEJwdg
 /DrkeunX0sSdFdxQzX79lUNFjP8lzM58fo6O2Z9LIkMaDiecVS5MZ+q3h4YyWBGM3poDbsKiPcV
 A+0AooeOttrMz7ffNeScUDKsPxZGMmDjh0BNOsrjrCLJVN7geVzHQaO8YHhyP9e1OA6stEKff5f
 YKPgwaYd0Rv1hSRSh0jDDkQl8iw0qqC3kPLKc0GBn0u/E7d9eYvRrFJI65+0QNG9L7B8hOVcKwR
 NifvwZNat2DoeD1VSc13Aqs51mVotq/5/TAi2Fafe1+qRiXfvY
X-Google-Smtp-Source: AGHT+IHbSwoiRAjQO1xO3he9LJbc5HQdeXI/AqIB3mcKxarfEVzvIJAsWZRnHUJc2vxdr0SfLm6eaw==
X-Received: by 2002:a05:6512:3195:b0:594:39c3:b210 with SMTP id
 2adb3069b0e04-598f3de3711mr6789749e87.18.1765877742024; 
 Tue, 16 Dec 2025 01:35:42 -0800 (PST)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da11bd1sm740828e87.3.2025.12.16.01.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 01:35:41 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Tue, 16 Dec 2025 10:35:34 +0100
Message-ID: <20251216093534.2558659-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216093534.2558659-1-troglobit@gmail.com>
References: <20251216093534.2558659-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765877742; x=1766482542; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RYoq78RmXnngUoNBga/xOjyJxHMhTBkAfBrpq73O2IM=;
 b=LHeTAPMaKgUVM9lEv/HSYaafltgZurRcAdc74Ar0Vq1h9wTuPaZMY4g6zr01CMK3+t
 mbKGmTIoZurGALVkdJhPsnTs1dYZbECIfh2lsOHNed6ZIotCjYlHSHoPQ4Dop/sQp8qF
 G6Mx4+ZuyrSXtT7NT+rHjre1QcQ+FKJH1aaLAzk0jN7kLhHAu2xFp/c5aEjYIRvlyekQ
 xxFlxMroIiKsb2bsaM4K82HJUlJVU5Mw8DyMXsCs6unLmmlgM7gxCzCq0mKQFcaEDsK9
 1TmVK72lqipUHdiVHnqR+gCQ7F9k82DybOZIrU0tVnB1N9xGVavcismId+HwBi+F5ZX5
 ExdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LHeTAPMa
Subject: [Buildroot] [PATCH v2 2/2] package/libite: bump to v2.6.2
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

Changes:
- Fix memory leak in which() on realloc() failure
- Fix pidfile() to handle missing trailing slash in prefix path

https://github.com/troglobit/libite/releases/tag/v2.6.2

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/libite/libite.hash | 4 ++--
 package/libite/libite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 3abad09b0a..c593f7a66d 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,7 +1,7 @@
 # Upstream .sha256 from GitHub
-sha256  0185c3e76874c5821825deaf17cd45e81ce49aaa424e09de5f3665243c59026b  libite-2.6.1.tar.xz
+sha256  0550ac5670836db85569786e00860d1d6999df8f74005307c290371c990e1dbd  libite-2.6.2.tar.xz
 
 # Locally calculated
 sha256  3a2b964c1772d03ab17b73a389ecce9151e0b190a9247817a2c009b16d356422  LICENSE
 sha256  c2882adb51555b836f35babc59f618d9ddceadcaa2d1dc80bbd4699614d2cd14  src/chomp.c
-sha256  bff7fa7b74324f13a24d56ebb8b49bc9c63ea01836a1c8b5a6afcbbabed62918  src/pidfile.c
+sha256  b6cc7074a27b26ee4e1ccda8d634d485d0f6f819e564c663c28ed61f4cc2b451  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index e4bd845487..beb8c27ba7 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.6.1
+LIBITE_VERSION = 2.6.2
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
