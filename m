Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF51BFD9E11
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97EF560788;
	Thu, 26 Feb 2026 20:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4t3DLVXx3bd9; Thu, 26 Feb 2026 20:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 001DB60810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138847;
	bh=zfeHejrVQGhWBZqQDWmplMAaP6oV+n5wh0/tMegjK5Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c4XKXzSw/plWfHan99zsVXQCL97pYxnuGiUacCLtdYRwb52XqQwosNfuih+cq3Iu3
	 gj5HLUhfkIj/yHBdr3mZnaGwO+6iimge5ygtnm+fAEXn/OO7hzGIczHMIHiXy3VnwV
	 EhsrfFNJ5Tzsi54DPmxN+xMHx8Kz6JPz2h3Y2DH1ZMqKemhkhRpQDEiPZYGhOX7uru
	 7IXxMy9hl0FM0SlqkSFjUV9OHOaVS5LCPlPn6DM7bdBtRIoZHBqZBMbUcNTqfTVUrW
	 sXX0suGLfvxdCtkkxFEJLBGK2Vv0ANvdOLChn946IV2FahXKCwxQUFZUN/3janwfve
	 kn42Ay1wODcUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001DB60810;
	Thu, 26 Feb 2026 20:47:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0B51F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF25460723
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngNcL8ZrEpqb for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E0D8607EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E0D8607EB
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E0D8607EB
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48375f10628so8794035e9.1
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138834; x=1772743634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wQGMxJ0j82WerpLS2eNZgcUoISTwHrO1HAkvJ2iUJac=;
 b=bcSgE8lrpYTLH+aj2/mvXbrxoJn1cnlHeoVKuznbfCZ6ugpncCBnhUYkEqp8DbL6dn
 NOEnGUvS3cNtIcrxBdh7jqrU9yVYX8gBCdG37DWOAYoKpRlNd4niqXoWVMEqKyghOW8s
 ZmEZvrLE8aA3qiHqFRnc62kmqnODJ+dAZhlBKNTz2pqUEGbkZgwtKoTEY1L2tX7t4PHx
 ieLA2g3egTLZVMRUJUXA4oft6V7gpkpOEllMHqkv+zY+UpY1flbrwlo2uCo/LmO/7PQy
 e7bAB7F12RZshe3id0JcHVjttkmtku16idseKEWMT+q3UR1BjwzQiZ+8mK2SVJ6De8G0
 uCJQ==
X-Gm-Message-State: AOJu0Yyip9azB8sBENAuiaJA1ZzDIeFDgC6ccILsKYLFdfTa+JafkHjy
 zHxpBP2cbE/3ORWcnXGfAEhRe8s4EWyaY9TxjCxPbzLMhzNp2yrfupJB+gHiRG5A/ulKFuHt1mo
 jFjRD
X-Gm-Gg: ATEYQzxn9kiX9/BsHdura2voNxhRyOqq6lapSmHJPDxX9xCSQL1P8+j/YCtJKcVMkv+
 CZUXSWXrbEgwWJGOSEuiayzx7glUmBwHvjAsSNxYroNFqFR53H3c6PmzuOpVahA74ahyYQ3yIuK
 S9N7stCUbOQaVoMDHS+u3C0BF+5CFeZOqVorLvWdHJpdkFDWA1/GNnS3OZg0wt5WUxasjfOYJA4
 URD567m1Jz447Yt+LIjzBujDRB+e7+4+hnl93MV1SBHaIG1DKMHmcPQtE73Ltw6jep3haIVemJj
 YYqyG6noMuIlZ9GitQTPEwusxXRhoqCPgyATkgdViArduAOdoWFykjXpxwu6qX3c48Kujb2Onx1
 sp1Khz6h99cS8p/wO44TQvSYPMg+cvPtezeLuFdOBj+e3kGZDTwDCnZoxAhyZkUtJr6+/f1X/de
 6dLuIDZuJ5YCH/OMQ=
X-Received: by 2002:a05:600c:4ed1:b0:480:3ad0:93bf with SMTP id
 5b1f17b1804b1-483c9beda26mr2538975e9.24.1772138834545; 
 Thu, 26 Feb 2026 12:47:14 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfec46dbsm42513895e9.30.2026.02.26.12.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:14 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:13 +0100
Message-ID: <20260226204713.254155-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224211448.287963-1-thomas.perale@mind.be>
References: <20260224211448.287963-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138834; x=1772743634; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQGMxJ0j82WerpLS2eNZgcUoISTwHrO1HAkvJ2iUJac=;
 b=hlukIRISiILikJLcos38GOCURAMoU6X+eOLlugqGY8WzDud0VOSup5BONfBD9QoAO2
 cIeYYlF42X0yfBmnD+Xw1Sq4wgNU6C36tsUe4zlMKQdEqZL6jHC24EFvE/ItFrSSf+hm
 KAKeuw0ogvcmpu+ZYrAut6W8fXTFe/r4JWRcC31jlwdi84WvJx30ICLy7YgPIEUf9odp
 2Sd703pGuISkKZ7abs2LvYW0zcgFCxwgiPfobpCs+JHxfA7l79/o9R0l2MlB2Vr8kF3N
 8XzLnNVbBqOTaWafv9LcrkL7+CeN3GfK7xXrPwcqrF/LqEvhe9S/c5+RZiUH5yvzxA5Q
 4MxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hlukIRIS
Subject: Re: [Buildroot] [2025.02.x,
 PATCH 1/2] package/jasper: add patch for CVE-2025-8836
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerability:
> 
> - CVE-2025-8836:
>     A vulnerability was determined in JasPer up to 4.2.5. Affected by this
>     issue is the function jpc_floorlog2 of the file
>     src/libjasper/jpc/jpc_enc.c of the component JPEG2000 Encoder. The
>     manipulation leads to reachable assertion. The attack needs to be
>     approached locally. The exploit has been disclosed to the public and
>     may be used.
> 
> For more information, see:
>     https://www.cve.org/CVERecord?id=CVE-2025-8836
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/jasper/0003-Fixes-401.patch | 80 +++++++++++++++++++++++++++++
>  package/jasper/jasper.mk            |  3 ++
>  2 files changed, 83 insertions(+)
>  create mode 100644 package/jasper/0003-Fixes-401.patch
> 
> diff --git a/package/jasper/0003-Fixes-401.patch b/package/jasper/0003-Fixes-401.patch
> new file mode 100644
> index 0000000000..9741d90eee
> --- /dev/null
> +++ b/package/jasper/0003-Fixes-401.patch
> @@ -0,0 +1,80 @@
> +From 79185d32d7a444abae441935b20ae4676b3513d4 Mon Sep 17 00:00:00 2001
> +From: Michael Adams <mdadams@ece.uvic.ca>
> +Date: Sat, 2 Aug 2025 18:00:39 -0700
> +Subject: [PATCH] Fixes #401.
> +
> +JPEG-2000 (JPC) Encoder:
> +- Added some missing range checking on several coding parameters
> +  (e.g., precint width/height and codeblock width/height).
> +
> +CVE: CVE-2025-8836
> +Upstream: https://github.com/jasper-software/jasper/commit/79185d32d7a444abae441935b20ae4676b3513d4.patch
> +[thomas: removed the binary blob, backport, adapt lines]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/libjasper/jpc/jpc_enc.c   |  30 ++++++++++++++++++++++++------
> + src/libjasper/jpc/jpc_t2dec.c |   3 ++-
> + 3 files changed, 26 insertions(+), 7 deletions(-)
> + create mode 100644 data/test/other/poc_401.pnm
> +
> +diff --git a/src/libjasper/jpc/jpc_enc.c b/src/libjasper/jpc/jpc_enc.c
> +index 041c030a..e910a863 100644
> +--- a/src/libjasper/jpc/jpc_enc.c
> ++++ b/src/libjasper/jpc/jpc_enc.c
> +@@ -474,18 +474,36 @@ static jpc_enc_cp_t *cp_create(const char *optstr, jas_image_t *image)
> + 			cp->tileheight = atoi(jas_tvparser_getval(tvp));
> + 			break;
> + 		case OPT_PRCWIDTH:
> +-			prcwidthexpn = jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
> ++			i = atoi(jas_tvparser_getval(tvp));
> ++			if (i <= 0) {
> ++				jas_eprintf("invalid precinct width (%d)\n", i);
> ++				goto error;
> ++			}
> ++			prcwidthexpn = jpc_floorlog2(i);
> + 			break;
> + 		case OPT_PRCHEIGHT:
> +-			prcheightexpn = jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
> ++			i = atoi(jas_tvparser_getval(tvp));
> ++			if (i <= 0) {
> ++				jas_eprintf("invalid precinct height (%d)\n", i);
> ++				goto error;
> ++			}
> ++			prcheightexpn = jpc_floorlog2(i);
> + 			break;
> + 		case OPT_CBLKWIDTH:
> +-			tccp->cblkwidthexpn =
> +-			  jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
> ++			i = atoi(jas_tvparser_getval(tvp));
> ++			if (i <= 0) {
> ++				jas_eprintf("invalid code block width (%d)\n", i);
> ++				goto error;
> ++			}
> ++			tccp->cblkwidthexpn = jpc_floorlog2(i);
> + 			break;
> + 		case OPT_CBLKHEIGHT:
> +-			tccp->cblkheightexpn =
> +-			  jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
> ++			i = atoi(jas_tvparser_getval(tvp));
> ++			if (i <= 0) {
> ++				jas_eprintf("invalid code block height (%d)\n", i);
> ++				goto error;
> ++			}
> ++			tccp->cblkheightexpn = jpc_floorlog2(i);
> + 			break;
> + 		case OPT_MODE:
> + 			if ((tagid = jas_taginfo_nonull(jas_taginfos_lookup(modetab,
> +diff --git a/src/libjasper/jpc/jpc_t2dec.c b/src/libjasper/jpc/jpc_t2dec.c
> +index de77623a..1eff88a0 100644
> +--- a/src/libjasper/jpc/jpc_t2dec.c
> ++++ b/src/libjasper/jpc/jpc_t2dec.c
> +@@ -337,7 +337,8 @@ static int jpc_dec_decodepkt(jpc_dec_t *dec, jas_stream_t *pkthdrstream, jas_str
> + 						const unsigned n = JAS_MIN((unsigned)numnewpasses, maxpasses);
> + 						mycounter += n;
> + 						numnewpasses -= n;
> +-						if ((len = jpc_bitstream_getbits(inb, cblk->numlenbits + jpc_floorlog2(n))) < 0) {
> ++						if ((len = jpc_bitstream_getbits(inb,
> ++						  cblk->numlenbits + jpc_floorlog2(n))) < 0) {
> + 							jpc_bitstream_close(inb);
> + 							return -1;
> + 						}
> diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
> index 527ad6fa8c..d499c8a7c2 100644
> --- a/package/jasper/jasper.mk
> +++ b/package/jasper/jasper.mk
> @@ -21,6 +21,9 @@ JASPER_IGNORE_CVES += CVE-2023-51257
>  # 0002-Fixes-400.patch
>  JASPER_IGNORE_CVES += CVE-2025-8835
>  
> +# 0003-Fixes-401.patch
> +JASPER_IGNORE_CVES += CVE-2025-8836
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
>  endif
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
