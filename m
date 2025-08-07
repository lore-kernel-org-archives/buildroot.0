Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0224C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8048780345;
	Thu,  7 Aug 2025 18:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKyBxImabT8k; Thu,  7 Aug 2025 18:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FBFC80DAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FBFC80DAC;
	Thu,  7 Aug 2025 18:24:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34D924C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2670B80D7B
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gW54nr0DeDx3 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0686980D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0686980D61
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0686980D61
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so7311125e9.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591040; x=1755195840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DQ3j37HoY3WuolwQoIo1TlFX4TPlmEwVtNnitTEbDaA=;
 b=fJ4UqndnlmjvAvkJPD/+lAXU5AI39w9d1Gq2wHO99iM2x7Adtor1/y9yNvD3Xy4Lwe
 TU38Swfyytp02TolGTj4dp6XRCEQIN8ZUwA4l8ytV29G7vOyiTj823mbCSMz5Lvg+58w
 pHLXaJIb0/4g4x2dDREJFnYif5hjO3RKPFF6N/JItQNKOXxP14zzz6u2JdnZs5bQq+WG
 0/vs7t/Tw64B1UWpi0b5tAf53dMTA5SYb9UAWg57cPJFFggsRtzcyUGFsL9Jt5tWqjsf
 NSXprGuVhq106OIcN68trX3R9DlshAiF1lfdnYfP6Pu49SVBWcApq9WguMJl2eqSuwLH
 fctw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFvSDt6uPQOekjE0OpiPGGEMMs/FOhnQ3NwKsQnbcqJEbTNrHvV1lmWN0+ptO8sIPGicCEon9HFds=@buildroot.org
X-Gm-Message-State: AOJu0YzxH7MvMoe8/1TxidkTacsqC3//e2Ey9sBL6Kn1Fhw8606w/7ut
 FLI1MmP6n3jCvKriHCiqUBXcI3tvnbVvFJCHi+4K4ih4vI8Kdain9RED8f3YQUAVIcPbFjrUfhy
 pT2BM
X-Gm-Gg: ASbGncsFn+ZqLjg+yQ5pz1T6+KNe3LZHNfbAElL6xMyK4oApibx+0HgLmk9bfX7TnlH
 Cze0zKGJgmf4d7fjAzRgoHYqIl3w+1jN6M5c0QQoIB21jFQ8Kms/5W0AKyyevS3By0WvN8weYWY
 atvwqRTkJtvXAkcIwoTxSu6G4Qbjqb8YFpR9gbdVKIeXrBDD8lQ9oUd/xpS7zQUcmxmJnHYzMS7
 YZ9ECbq+siKq/XLZhrA1v5SyKaMKogDiGSNk5Zk2b8m/qdi/Fv9sFLGy1GRoY/HnPHE3K4NJ+7m
 9KIPXmkgcBcKfs8GTawXhxi3GJM7Lum+eDCz2JU0/RB63Oqm3w+wLsRBbK+KdK3HrmULaFqgJTT
 twgW94FD/hsedNg==
X-Google-Smtp-Source: AGHT+IFRVyoIUOMMFF8dfAPDVR1rGk0umiK1NJgRiLJSMa5TA4CYToht1IyaQJjxHXO/xs8stO0HJQ==
X-Received: by 2002:a05:600c:4fc4:b0:458:bbed:a812 with SMTP id
 5b1f17b1804b1-459f4f055damr40915e9.17.1754591040126; 
 Thu, 07 Aug 2025 11:24:00 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3c4d02sm26861895f8f.33.2025.08.07.11.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:59 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:59 +0200
Message-ID: <20250807182359.724077-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714144618.65723-1-buildroot@bubu1.eu>
References: <20250714144618.65723-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591040; x=1755195840; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQ3j37HoY3WuolwQoIo1TlFX4TPlmEwVtNnitTEbDaA=;
 b=fSJHRciOsoRRW0++4pPLQgd+NRtVbhvx8crtnnCTwfXHXGVnq7cvCvoQoteGpWSuTp
 4jGv1hvFqosOGH+L9PrDFvkpB9ok4BhpXkjKIli/QLwcYpjt5xZ7iMpk5Et543Ya0cil
 Y0tcownwnlWHLrplZkog4cMaJEA0+FHLBKFrpnz2Fo9uJsYR31gKAiasb+622bRwMyzV
 RF5nOpWkaqXUbX+rV+RiZCa/diyNg7r8Yawv2RVDkcqvGqecLLM5KFa6/9IDPG31it38
 QUramfD9bFddAMhOBT724EZvZQjGtW+ov+GRyfG6aU9Fjr3g7N0P+AyPmiMugCEgiXwi
 nfgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fSJHRciO
Subject: Re: [Buildroot] [PATCH 1/2] package/python-fastapi: bump to 0.116.1
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
> Release notes:
> * https://github.com/fastapi/fastapi/releases/tag/0.116.0
> * https://github.com/fastapi/fastapi/releases/tag/0.116.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/python-fastapi/python-fastapi.hash | 4 ++--
>  package/python-fastapi/python-fastapi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
> index 3d0cead179..1810e81e75 100644
> --- a/package/python-fastapi/python-fastapi.hash
> +++ b/package/python-fastapi/python-fastapi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/fastapi/json
> -md5  bdb2a56a2a464ff29736d4b1c55d547c  fastapi-0.115.14.tar.gz
> -sha256  b1de15cdc1c499a4da47914db35d0e4ef8f1ce62b624e94e0e5824421df99739  fastapi-0.115.14.tar.gz
> +md5  6de51bff13da558df5f6249d7a33b888  fastapi-0.116.1.tar.gz
> +sha256  ed52cbf946abfd70c5a0dccb24673f0670deeb517a88b3544d03c2a6bf283143  fastapi-0.116.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
> diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
> index ab39fa29ab..745147dde8 100644
> --- a/package/python-fastapi/python-fastapi.mk
> +++ b/package/python-fastapi/python-fastapi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_FASTAPI_VERSION = 0.115.14
> +PYTHON_FASTAPI_VERSION = 0.116.1
>  PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
> -PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/ca/53/8c38a874844a8b0fa10dd8adf3836ac154082cf88d3f22b544e9ceea0a15
> +PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/78/d7/6c8b3bfe33eeffa208183ec037fee0cce9f7f024089ab1c5d12ef04bd27c
>  PYTHON_FASTAPI_SETUP_TYPE = pep517
>  PYTHON_FASTAPI_LICENSE = MIT
>  PYTHON_FASTAPI_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
