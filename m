Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CEACA6002
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 11:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9003808C4;
	Tue,  6 Oct 2026 11:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dg4tY7Osdvn4; Tue,  6 Oct 2026 11:07:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BFE6580989
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791284874;
	b=Sw2cB8PEMnvdrvWj9s0eFlGz2iA46ZjQKJt+V5N7mEkGy2JoFH+n4QsvGgwrF5ggqoYD
	 P9FI/t9musLZ3bWIGdbThmpdd66KxFPST6s5EnW+waeBXD9VtZHaOCgieurNDjbuoE+oN
	 QAlx09XI9w+YZtaqu4Q+fL/hTooyiCNZuLSEOgjLNDQ8QwGP8YdGndBGVN3nWnOkpNdUj
	 bMwWUgcXQp5K2Fsp2OAMHYiVhxAKdUsrqmrerVlMiy5iC+hokMn3CpPCFZb+QwCJw7rEk
	 N2GY4GBV9QKhQ7/drRCMl7sTxEwhK7OXpMWjpAS+GgVfsRRKkIMyTVFIN5aHlpj3edA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791284874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0iwK9utjeaJwuoFPhZVnA+hqCOJZphHmkVg1tpWSa08=;
	b=OxXMI9nQJNUX04O1Mc+KpVhw1OtJ38JBnMvinY5kilaMBp5MQYnWPzp0LZtdJmZXGSj1
	 znoFuLSSkzYlZ6iEKrra1Cnh3TvwRqYtZgijoZ3w9PeKQIoWwIF0UPwVKv98basdFjzAX
	 YxoyvsnsAA5F2ebJkMV+C6xdaHP5a01u5VJQU3rvceVhaQxVspoFDCcGcMcGgCEsHpLqq
	 XWREDzovk8ziUF2pF/Xw8cHuCEQCUDUkqQ1n/vnEQiI2CZrDIUD2RhtLk3gh1zPlL2g14
	 wSftSgafA0ZA5GpwVVJl9/+CjHvydYPlQiBcraSZILa0RnWUgnYrxY+gGsTQluNsClg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791284874;
	bh=0iwK9utjeaJwuoFPhZVnA+hqCOJZphHmkVg1tpWSa08=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Z1SI/JPIOYDQLTooTTHFo2u7SoM4f6zg6hstRBUj7V9SsK9heiPda5rRxue9y1wrT
	 JGWD+6WHMT645/4PuRXFF6RMHHVQ9uuNfFOHi3t+yMtYrCaGHSS+cS3mNC5oaGPb3I
	 twvwt6I9KG+z+7gZRtcUQtJR2G7B8InEb/IDeeWAS4sY78jbxtawF+ZCtYWOAFLjSf
	 zF9Zp8zkSNNO5WmlLew983Bn+/kkygY/U3U4CvfwxZRcsiasLcszciDfmPsFiAIVCK
	 6X1NXltqUKZANwImcHIE4MdOKeSwXqPls86qBMn0W6J0JkKSHWBzyfL4T1k1orhfyc
	 c2V1cRPbIzRZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFE6580989;
	Tue,  6 Oct 2026 11:07:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B17A341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 11:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CC02807DC
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 11:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KefcxtdEbYyY for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 11:07:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E992C80807
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791284840;
 b=P4ih7jU5ylyjHSpcRn+C2NMilrT3CYCFH37YjQHdDnWFsv+a5U/pmVPC6ANQYl6s/zup
 ugIQZnbHpM3WA1NzuzlS9TLg5SqaOzuObcp/NDuVb7IDxRnChVq1sQybG+HR4fRcShQIt
 oWkKnJywj5I88eceT3AiW2q/X50AkMUpO4nyK+alI4yGUToStOf1V8UmNudXJl+R9qu+E
 X7WItbhjMLil0m3eCGpRuZSO/ld2XB4Uuhbt5sgCqGj+vFoA5f2Kxt2KBlj1fNLLAgY9h
 QPSBVfGLrnnCIW41/RJwkmHyW+ADyubqxDj2+bci/XLvmSqhOL5o/bZ2jeMey0YeEXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791284840;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=24A4XnzEAs1vDjr2ZHqi8GFkfVXrx3XGA1F1q0dnB9o=;
 b=LUvs98dwUZvx5GcGXUXXxRkyc2aHiAfOaDikgqXxQ7idY3p1eOp3h+SQu+Y4ZIo56f3A
 L9yTxitGWYvVGa3THbinb9xBvF4bomC8a/8U+ms8Hrh+BAUW+LOZiBtvh1drVEY/cblIz
 eTirqzazYUB5zHQ6q7KWR0ORU5i33Edig1O73yoTWA2eOkPU83Dq/LPlegaT2ktLNKV/f
 hOFQxAVxOFNwpjonp1pQsU5WXl7Dihany9mcyP8wSgQG/hytdY8CqHm3j6Ogd6e/V6xWy
 RrGGy3BVysIkGOegCnNZJ87UShLWbp8FxEImb6xkAPZVb/I+TxUYry7lwsYEVV+JGOQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZPZ+Oome; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E992C80807
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 11:07:19 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c2dc63f8d8aso68460066b.0
 for <buildroot@buildroot.org>; Tue, 06 Oct 2026 04:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791284837; x=1791889637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=24A4XnzEAs1vDjr2ZHqi8GFkfVXrx3XGA1F1q0dnB9o=;
 b=vwDK6To5T5xByl0YtZZ3ENlaMEjDZm614KQwhjGbh1Kf/+w+BKgLx5KG+Zi6i5kB69
 9RVE8ggGqf9LYilQWehDcm0oCdZJ0jfhhSkEzeOCGRTApLwWOaTtKUD4oWLxG6Oj6Q0n
 MmzlYsLjHaQnChtyoV9jOAJT2JQfrflN+1cMCIlGDNTa7uNQh/oueZ1FT3YQdFHpeDdx
 35/v4LpKQmw/4qGDrc1fUbTjRlV6YRlakq72u5B+zcNlwIWLbtA0IDZGZgUW/bGSpWyV
 vsfaa0N0lc043aHncbbIMufo7Jvjsv9vBxPlgBZf3LuR8RCORy9W274y5rUxiV84XLDK
 KMhQ==
X-Gm-Message-State: AFuF++mtG0KjnYqxMlRChXLqBMSEFlJFHZO7w+iSAdqw1zQwZh6Wf5ma
 DSCHWsYJNe0MwucY0moPHtIVsB55KpLoE6nxhD+RTTjPjNoX0yHHpydYiYKqbw==
X-Gm-Gg: AYBFou33/+OHLhWkATIfwCvQn/BZ/wxgv8SneAiMwP7DiI40FSyTqI/ycyKMJckuTk1
 KfQWc/Qt9gfLM2fUeStVHd86b65yXcXVkZi2/Rvp7uygDsAVaANYOYzaPwRunJvhwRh2SjYgq8d
 aD4OEmeBGX95VR/YP778g50b/gakzRnn52T3eV2ljfJupPUqlP+mMf/yrPmFnlrbAQoquFJpVyF
 pekxw3JmsblLukugE3TNGfnJvKJpCMoHMcgOzhx9h4+oFJmWSSxSQwBGODGP3wKXePf70Xp2P9V
 Fk7YIAdGlJZ0/yKAr58Vg5WSuiRmE/GyQcUrAwZQPSDbZQRVLxrlC5LR039Lw9dj+glQwvJOHKg
 kYBGFkkhSU+ecTodGlI9FTuZcttaLwTNCw8f/GsONnwx+7LIpa09056JOT/jyvL1eQiBKCnNgvM
 Us3CYxaiuFhjIpl4U2NdnBXxLudTS96PC1LP46WITGe0Cdr31r39jBJDAOzdDX5DS0bMIdKxAnA
 KEQb3+/yN2yA+fqnaVI1IPMlan3ho7ydbB7JgRbDTsRKcc=
X-Received: by 2002:a17:907:868b:b0:c2e:7fe7:288e with SMTP id
 a640c23a62f3a-c316a0dea82mr119452266b.32.1791284837130; 
 Tue, 06 Oct 2026 04:07:17 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c3156ec7b8asm189536066b.25.2026.10.06.04.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 04:07:16 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 13:07:14 +0200
Message-Id: <20261006110714.3242851-3-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006110714.3242851-1-yegorslists@gmail.com>
References: <20261006110714.3242851-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/szip: remove package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 "Ernesto L . Williams Jr" <realcontrols@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

szip is not maintained upstream anymore: 2.1.1 is the last release,
there is no public repository, and the source is only available from
the HDF Group archive. Its license is not a standard open source one,
and the HDF Group itself recommends libaec as a replacement.

The package also fails to build with GCC >= 15 on non-glibc
toolchains, as only linux-gnu hosts get -ansi from szip's configure
and the code relies on pre-C23 empty parameter lists:

  rice.c:1323:15: error: too many arguments to function 'winner_ref_function'; expected 0, have 2

libaec provides libsz, a drop-in replacement with the same API and
soname, so select it through the legacy option.

Fixes:
  https://autobuild.buildroot.org/results/5e400d0e13480c58e8b1b0178bf7e5537dd31751

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 Config.in.legacy       |  9 +++++++++
 DEVELOPERS             |  3 ---
 package/Config.in      |  1 -
 package/szip/Config.in | 16 ----------------
 package/szip/szip.hash |  3 ---
 package/szip/szip.mk   | 13 -------------
 6 files changed, 9 insertions(+), 36 deletions(-)
 delete mode 100644 package/szip/Config.in
 delete mode 100644 package/szip/szip.hash
 delete mode 100644 package/szip/szip.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 9ba6ab243e..07d6a7b2f1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_SZIP
+	bool "szip has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBAEC
+	help
+	  The szip package has been removed, as it is no longer
+	  maintained upstream. libaec, which provides a drop-in
+	  replacement libsz library, has been selected instead.
+
 config BR2_PACKAGE_PYTHON3_2TO3
 	bool "python module 2to3 has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index bde955ec6a..d96fb11051 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -974,9 +974,6 @@ F:	package/imx-mkimage/
 N:	Erik Stromdahl <erik.stromdahl@gmail.com>
 F:	package/mxsldr/
 
-N:	Ernesto L. Williams Jr <realcontrols@gmail.com>
-F:	package/szip/
-
 N:	Esben Haabendal <esben@haabendal.dk>
 F:	package/python-kiwisolver/
 
diff --git a/package/Config.in b/package/Config.in
index 0585bacccf..2a0c59b90f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1630,7 +1630,6 @@ menu "Compression and decompression"
 	source "package/minizip/Config.in"
 	source "package/minizip-zlib/Config.in"
 	source "package/snappy/Config.in"
-	source "package/szip/Config.in"
 	source "package/zchunk/Config.in"
 	source "package/zlib/Config.in"
 	source "package/zziplib/Config.in"
diff --git a/package/szip/Config.in b/package/szip/Config.in
deleted file mode 100644
index 5a24362f29..0000000000
--- a/package/szip/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_SZIP
-	bool "szip"
-	help
-	  Szip is an implementation of the extended-Rice lossless
-	  compression algorithm.
-
-	  The Consultative Committee on Space Data Systems (CCSDS) has
-	  adopted the extended-Rice algorithm for international
-	  standards for space applications[1,6,7]. Szip is reported to
-	  provide fast and effective compression, specifically for the
-	  EOS data generated by the NASA Earth Observatory System
-	  (EOS)[1]. It was originally developed at University of New
-	  Mexico (UNM) and integrated with HDF4 by UNM researchers and
-	  developers.
-
-	  http://www.hdfgroup.org/doc_resource/SZIP
diff --git a/package/szip/szip.hash b/package/szip/szip.hash
deleted file mode 100644
index 5d3ee042f9..0000000000
--- a/package/szip/szip.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  21ee958b4f2d4be2c9cabfa5e1a94877043609ce86fde5f286f105f7ff84d412  szip-2.1.1.tar.gz
-sha256  98cc66747133b26563fefc4630ad4c8c7848c722c7b8a60ecd4afbc4c7d7eb01  COPYING
diff --git a/package/szip/szip.mk b/package/szip/szip.mk
deleted file mode 100644
index 869fc9c358..0000000000
--- a/package/szip/szip.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# szip
-#
-################################################################################
-
-SZIP_VERSION = 2.1.1
-SZIP_SITE = https://docs.hdfgroup.org/archive/support/ftp/lib-external/szip/$(SZIP_VERSION)/src
-SZIP_LICENSE = szip license
-SZIP_LICENSE_FILES = COPYING
-SZIP_INSTALL_STAGING = YES
-
-$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
