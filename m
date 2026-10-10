Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C28BCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B305608E0;
	Sat, 10 Oct 2026 09:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoyhBufiH6Z9; Sat, 10 Oct 2026 09:22:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 488BF60AA9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624163;
	b=BTxTAYr8YonIAITzUiH0W98wfbd/U9/LNU+d6oh1ZH6EvUWuPb2KN/hze5MW499BnR/j
	 G3To2zvJ/nvffzTH3thRPl4jBHxP3HhIt3eRJS0X+wHEMOu8a/9+hS9nDheYb/y0Gt4ln
	 cIUl8xkrA9DNs6i41256kMbd+FJFzxtMAz1C4OfUoJ4hMEKvDyhvWszNHgIwdiG5ybP0g
	 PsTrLvVCMuBDFuWMOMNyvBCI+i2i17B4TAf6hrAZAgfkLHliR1rWVZCJ7rzcXoiAXVJSf
	 N3U18MpY9tbGJ1zLytMItSX8sh1oaYVyTcl8ygNTtdvr0cBrYGGtgPanN1eBfJVjdWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624163;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eSF5YnGdcylANlYrBnnI/bhLz0Mbhxf9E6zQTzHQ9xQ=;
	b=LxGJejIxN17cDtL5pv515uq3nPT73/RsqNkwbgbw50Nhu6f41lYalfrIbAkpqqIgvQrm
	 x0nK7SwC9PXI63CaFMOF5Lh7oybxsjpQCYo0GO4a6IyyWSEiJeAxkKCXe8ympfji5IiOZ
	 OhBVpcF98vvOvKy26scS5WnLTDealQpUhrOL1L1FJ7thThX3KHvuv2KHql9N7Cp+f7mFo
	 xSmkqbK4qPj431LAA8ui9sm5KCEFjMh6qKzmBRG+Ss+Dkx4+npUTfVOti2vwAunQdCeI9
	 CNcfqNabb45k2rlRpv55/oUav52D1LiO0XZo7v+p1QErXQ8+XZw+F4oGt3cJnHkKLdw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624163;
	bh=eSF5YnGdcylANlYrBnnI/bhLz0Mbhxf9E6zQTzHQ9xQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N/brJcI3FkmjbEdM+FIjPMqQ58+6VNdhcxdYbNNQ5csfhxyIIfrO1LGW1m+qQoSpY
	 JTpoZQLzTETBHIA1ONrNX/XMS5zQQ4TjUXRzHAxI8nS+5mVHwevJr1LGExQXrJ1va0
	 lxZ2KUnoPr28D0eraTUyIAsswYnCJlG/XzXwp+E/2vzZtsoFvPbyUOVaLSIE/tOKHe
	 lXGpyolDiv5ST+jmJ375p8kyqCQBAl4geMSrbwb4xfn6PCkkDuHGutICcSgtuQKEnE
	 t3mYwTC8TvGxce1eNjrlvqfh22HRub66Qg+wHrtLYn/vauEL59XKkLGv4jao7FFPqD
	 D2Au0aGmW453A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 488BF60AA9;
	Sat, 10 Oct 2026 09:22:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F20BA64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CC6A405E9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gp1P707hldKI for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:22:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7E1FC4087B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624145;
 b=iF2DCaDmHzihfDAshhbCrPRIb/ihQkd1sSq+4kfA9pEWH5aUywSkjUXtRDxxjSyPFU39
 zPaZN7lImD7ZioaDbtczB9m+iMFBDpLM4UHsWV5UQS5l0MxEq457BnMPJ/fCknEHJ1P4o
 kQqImbt4AMmDRZNcsNuZtj9JBX8lMh2O52C2ydz6w1eDZnFN2KHxXV2mM36i4D3yWe4Eh
 5ndYKXxoms6VRVbcxP6cxp3fpQUj3RIj1ztoWVvwdgqi3jsnAH4CmsCsZMJrSMRjbSMcM
 Rv+oPvb6Ajyjyzw3SIlZh4aKb+yHqag1kvL5YjAbSLTBNZKi9pzxQHEepu7EoJ9m/lA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624145;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=+uuFm2Jx9TqR45yuD74vymjz67WJPzSc9ldEoJj9qwo=;
 b=KYOY3/tJWR2gtCS0ZIF0c08D/tHHsAkNa86lbqW4uDPX/4J47G2JZ1M8nRcQg9iUM2Zq
 GuT0s5FMr98WCATDAi3r92+AlM6uxqZ3Pc3mmOzhfDSZNH4pGTOoi4+Ce3UJWfy5IwGjo
 9MyrXLhCyfWDradywJeoLiafqgQ0H463k7X1dYI9TesyHztWDh6I4B+HfcNopFMGdpcUg
 GgCW106y8bWKgnEDxC4mbqJ1Yh8x9Ty6Nd/A8pL4uU3whFrDm6U/IAqGZnXt+TbPueL/5
 tdeWWLZOeElU5ZFFjyP5pZFvewtKfR903EOKva48Cm8o7WcIkOS+imLtxboDuo4FerA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IwZhwbFQ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E1FC4087B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:21 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a17baef589so3566875e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624140; x=1792228940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+uuFm2Jx9TqR45yuD74vymjz67WJPzSc9ldEoJj9qwo=;
 b=V/zW14oA2TdybAAqq/0Cf4WoQdrhn14yZR8EO3UY8w0iteH3ThiEan4mEb4YqBdRmu
 vrKlQZGIIyHpMWszbnmXInILFtejcarluSXGOZuOSOLKXAs5wZ8pAuNwea+pHzlor48s
 79lw9ugTjtGWvwbIrI+tb5fOTHh2b4u7a2lfVlqUQj07Eh8px/jRoP2maepzU/mbBU9w
 J4QcD3uWpxgJS25f35+bqZz+lpJ8Yj9tenK9uHD5npTV+1RmcP/F/yidD5x8Wwx/+s04
 Flt9C/o9gYuAWgdmss3LIaAt0hiTK6i0dzzJhQmG6FhDKVdIhAv095YX8wD6sXb476M/
 0tQw==
X-Forwarded-Encrypted: i=1;
 AKwUvByEoM6/EvVJRdcyzHznG56yQ1WWN/AV33tWew6ZC4EX1JpYvLC/VZlx9TfaQI29LUMBZ/nJBczz5vI=@buildroot.org
X-Gm-Message-State: AFq9FYI4gnGbYusa+tzNBr7GJrRnQKr+ZfDKyMCpKJ19JwvmpSbSbjcQ
 5MG25DGmDgya726+p0u/48uSf8FpmoYKRlfOFczxzur31V89HEySXPmBPYkMs0Qo4C8=
X-Gm-Gg: AYBFou3N6OpFh2nkbLbo41V1849o/PU3dIFrSqSSL5cznv/eyCIrrZdCxvNdJEqV3oz
 +FiJiJ1YkZWuPQASTdAHX18iT6yZ0t9u/LoJyBl5rc1PdlGWBOG9RYL9Co0ITCJrPFXWcyvjo5o
 QL9opuQHAaBHHvHGX2W71OWGtB9SQBunJBSYY0UOk6Y/eFWHhZyKCL7Arq96rJGx+f1nkGajS8q
 YMA2yblwmtpsJ4ZGrBE2YL329ie4JAsOjrazCf2nXrPFk9G1Dazhr1pmcUCY0eqh+ksWeRYS5AS
 a21LTkPFLLt+0WfO9efUPDD5fG6m01fXf8ZHZA8hGEV7CAAJSMWVlikdPXgY/PfHE0E/KzHKN2I
 cmac9g3vYcGrGd0M2q9QaVcJEeQM399bpxzbvenKvHDQRhGDvlR36ul1PeS8527cEScPJhDstJG
 XwyxIdYQbPtEuyHWjZs170mU+o+IBsi7k3I+Je/wfJhMPHck2k7Ndyc9TT7PFxWcT+YDo7O02YP
 iK4G3acRxsQGcpF5IJV/xSylnVD1/TIMPmT/ZqF9o+rMdoACGt/1byW
X-Received: by 2002:a05:600c:4fd5:b0:4a0:5b:7bc0 with SMTP id
 5b1f17b1804b1-4a18e49a7e3mr89654575e9.21.1791624139893; 
 Sat, 10 Oct 2026 02:22:19 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm164798945e9.6.2026.10.10.02.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:22:19 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:18 +0200
Message-ID: <20261010092218.138353-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001070846.1275054-1-bernd@kuhls.net>
References: <20261001070846.1275054-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.8
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
> https://www.python.org/downloads/release/python-3148/
> https://docs.python.org/release/3.14.8/whatsnew/changelog.html
> 
> Security content in this releases
> 
> CVE-2026-19445 gh-156293
> Use-after-free of a server-side SSLContext when sni_callback switches
> contexts
> 
> CVE-2026-19553 gh-156793
> SSLContext.wrap_bio() missing validation of server_hostname parameter
> 
> CVE-2026-82049 gh-157190
> tarfile extraction filters allow file modification and content
> disclosure via hard link to symlink
> 
> CVE-2026-15310 gh-156002
> Memory exhaustion in zipfile in bzip2/LZMA/Zstandard decompression
> 
> CVE-2026-19672 gh-155999
> tarfile extraction filter bypass allows creation of directories outside
> the destination
> 
> CVE-2026-15806 gh-155694
> urllib.request.HTTPPasswordMgr credentials for one URL scheme sent over
> another scheme
> 
> CVE-2026-17084 gh-155292
> StringPrep algorithm considered Unicode codepoint attributes outside
> Unicode 3.2.0
> 
> gh-158446
> Reject float format precision near INT_MAX
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/76546945dacf6721d513c30cc57db9e172c83c33
> 
>  package/python3/python3.hash | 4 ++--
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index 97302bc750..ae4a00c319 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,4 +1,4 @@
> -# From https://www.python.org/downloads/release/python-3147/
> -sha256  3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81  Python-3.14.7.tar.xz
> +# From https://www.python.org/downloads/release/python-3148/
> +sha256  c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73  Python-3.14.8.tar.xz
>  # Locally computed
>  sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index cb5e1a4b85..788d993d75 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.14
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
