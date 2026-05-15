Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52E2CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9159841C29;
	Fri, 15 May 2026 13:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9ieyaR6DuvE; Fri, 15 May 2026 13:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7CC541C1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852073;
	bh=o90FAlksme3++U0+HV656sobi6MNUhlAQnc8NEe+Rpc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CjwJKl+eDCG5XOmigQfeVIjyl40vmDo90ISLaUbHTYHCOWNcfoCw43DNs3nVRdVqy
	 gtWrBEYHjfpRFYU0PE0P3ehWWZh0qpwHU6+ddP6r47GrGaVQffxYabD28y2jxIDEnu
	 psiO7EpZftt0cWoTKSo+YtuZj8HwEjIaqkitpc+Uggk4JuHF/eot1xp7NYYvsKMl6t
	 iJeDvbGtPoIs4YyT4Z3VfUyScCvBSzqQsbcQMldHGUV6pHJfQCpcfkzWlkvr2y+Liw
	 axYK9/bQcmEhvR7R6mhV4tvOcBb3mvbierpR5uoux6EZPnwdeqvvI0stZlvGuJfbKK
	 WA1pYUs9oc7ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7CC541C1F;
	Fri, 15 May 2026 13:34:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AF7636E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60E4B40E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbqWNFxFRqNw for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F70340E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F70340E23
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F70340E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488b150559bso72549255e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852061; x=1779456861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/N20gJ3gEmMH6Yj6bLXxVdYwK54Rpo1rWZL60jMJSwc=;
 b=QmQ6KNzW7K7bAxiN4s9vwxJg0uRycfwIVrB7VnArU7kPyRNdiLO5UpqO8bq1UkI9aw
 V9+sC60hHI17iRCcF6lpM4UyUOBt4AfpXPqgUSIUnV5Cq1oBD7/HShgW1kvI7BhuW7LM
 ZN8m1Si+IqiSRbc5+R5YB4NgCjpCyCJ959y8+qP6Vub2Xt2h38Se2dBtr+rG+V16SiwD
 VWHvA0vRXUfV0pOzIjflH8htufCtzoIEnvmB7k8ln+pGcChq6x5K7XISuDnjsfmZ97o5
 kre9fq50gQ2jSVBeonKqsMjN8Lzx/RlQ0gPVn0ZAt4Lzu04cwJqcalaBVAD2+o8H0EwS
 P8/Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8aSG6thCKV/CptyiPjou/li4g7USpZSHu2vtwgOhoIW1NgiHT66jzyyTsltiaNEsLlBR+KDgjaiNU=@buildroot.org
X-Gm-Message-State: AOJu0Yy1nR2d0gAJ7l7Ad0d9ZCbwKMzSuOO6EITkZBn5RJ8mHagkd9zF
 V2NpeeY5OfzmTAg/X8JWYNgS2fG4Q/xLyWSiBqNxK/5vJke1vUCuPuCtdjD5hFlE2N4=
X-Gm-Gg: Acq92OGQGB/iQgFKnyG3gOw5Z+kDfmbWnapUDwaZke3xU1Rv7uMXnGBGftpYQUxa/TI
 j8CoL0o6j42wYHw3K9HIBi9avWvDkQOY3s4qs+q34LsoBPJ4IQ1PL1vpPid7V0VAkvGF+YIep33
 r7W1sesx7WB3LyHPWKlXHDyJCrsvfKoxVcfP8uxBLORgbc+UNg1g+WunX3c5IuGnOM8gO1J22It
 9KY9HMayYZZIyac41DAFZ8F9hB/tma1gnF3tfHgI3PS3JCg3rwi2bZEBNY85K0s/KYaa9sDBOHu
 wKKPPWIvYfS8+NYeFuwzU3TkDxgeGYSzof02NE0/HatVFqZcAp/244oTxf//21lOuNomqH/ODfq
 TMtJZxZ3pcfdMRwlzRa5qT7ieFEBIwv0UY9Fwt5/1qhghch7R9w1CEEY8Gd08SFi8EwvVj7gWOr
 +REUMquorWxyNLtZfyygndOAn6UgfzCq01UlFElkBGbmzmkp401EFpcmU=
X-Received: by 2002:a05:600c:34ca:b0:48a:7676:30bc with SMTP id
 5b1f17b1804b1-48fe60ee4c7mr59131225e9.14.1778852061114; 
 Fri, 15 May 2026 06:34:21 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe7dd22sm18782115e9.7.2026.05.15.06.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:20 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:20 +0200
Message-ID: <20260515133420.316984-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501123100.1918951-10-bernd@kuhls.net>
References: <20260501123100.1918951-10-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852061; x=1779456861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/N20gJ3gEmMH6Yj6bLXxVdYwK54Rpo1rWZL60jMJSwc=;
 b=AtTWhjJeimSnZvv3bI5fBNUBhTHYB9PV2DxY9T856CNrav/KXWaiT1Szb8mxpgJ2SE
 rABSAxyL8ZDlCfGc1TCw9kK/GC1lTqBBwN1aHCaU+dGG9FD0JUJe/7GNZzp3mo0y4T+J
 gSFp4Q8TSxYuUhNkgE/O2Z0pKJar+IMvYLXTd7HvezlIv5+Fw7vtZLwbsE6jzfTuIaV0
 VfaeNL9+lIHPyvLH9AOum5oYvh49fKVkEhmvZBaaloupwh7oFrVnVmsCMa7IxegS3x5a
 a2tH372RByo9kwtv3LV+brMgd5hoEErvMdBvUiVDN4Ly5WpYSzknBhFVJmKfN22cE1Nj
 zG1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AtTWhjJe
Subject: Re: [Buildroot] [PATCH 10/75] package/python-certifi: bump version
 to 2026.4.22
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index 2a2390eb42..5f4706fd37 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  1583dc0160782da8326204a90d7f5861  certifi-2026.2.25.tar.gz
> -sha256  e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7  certifi-2026.2.25.tar.gz
> +md5  238385f505d22767cd1860661f1c5743  certifi-2026.4.22.tar.gz
> +sha256  8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580  certifi-2026.4.22.tar.gz
>  # Locally computed sha256 checksums
>  sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index be6ce924f8..474b147873 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CERTIFI_VERSION = 2026.2.25
> +PYTHON_CERTIFI_VERSION = 2026.4.22
>  PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/af/2d/7bf41579a8986e348fa033a31cdd0e4121114f6bce2457e8876010b092dd
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a
>  PYTHON_CERTIFI_SETUP_TYPE = setuptools
>  PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>  PYTHON_CERTIFI_LICENSE_FILES = LICENSE
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
