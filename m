Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134A5D6ACDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC48E60788;
	Thu, 18 Dec 2025 16:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aqlQzy1ejYY; Thu, 18 Dec 2025 16:37:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08DB260D6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075834;
	bh=5mKHl7eOkSMNHIrfbCHXvl2unAlpBGm7fbZ0UkfsPxI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LoGapBAQB4Sk8EyU73hle+iKXWIveN9Do2dYStZqp8ky90INLVO8WLspjhx9RkPHZ
	 K+H75Ry2CEMB7iOVOLV0wmgneo+KtxkqJdzeRrXMWOD3Ga5dyYOTegToJQb6SoLhO3
	 eObrmmiLs1nwXHud2HAiC+/1kU9fUNFN0R3jtCYE4ZTmoCEuOLGF2cBvP69poB6+7I
	 PWoV7DHFg/DS22wiLyQjMbG1L4omC+7HMctXXxLY0c9dB6IyugPZlXixvsOeIW5S7+
	 sXMlhZ8rMIqIl1Wrj0PzB7DF/mVNrjy4+RMuiWQzknm8CutX3iJkLrCdow5GRVOUwX
	 qqw1I8NoBIDNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08DB260D6E;
	Thu, 18 Dec 2025 16:37:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF1171A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A555860788
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_DAN0yQ1pYd for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 993D760D6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 993D760D6E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 993D760D6E
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 64581B97A32B; Thu, 18 Dec 2025 17:37:07 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:05 +0100
Message-ID: <20251218163705.379204-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209193951.1000100-24-bernd@kuhls.net>
References: <20251209193951.1000100-24-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075827; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=JpHkK85yLRAN3ym+ftu11wER1MZkYm1jOhuttM4xlfE=;
 b=fCrcENffsHgSWb5xsAdCVZYfr3hQKKRSKVBvOtIv6NhacBmGa4h7QoHdNsxBvkLW7iDATH
 ybKyd7lZ1Ih+Ca5eqzreMGkL3V0Ipuzs417FFG54SvrRANw5Eo0RVk+QbyMCuuREn1SF+H
 Op8njfa2C50YWqCpJGl/k5QqjxBE+GHJqYJxcauJrzTV6wm6PifyuSqMiEEGRf1aq4GoGc
 OVP5sG+VvoW+3ThGnaHd1k1rq6Q7dy3mgyElSbQvas4v6bezhZKc3QCexyfDNLaE1MwmrY
 Nd5jt5fffLrkrrevV0d1YUIeKE0vJywkcACktSCk0GfcOPZAEPcgkTyIiIQruQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fCrcENff
Subject: Re: [Buildroot] [PATCH/next 24/31] package/python-brotli: bump
 version to 1.2.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://github.com/google/brotli/blob/v1.2.0/CHANGELOG.md
> 
> Added dependency to host-python-pkgconfig to fix build error which would
> be introduced by this bump.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-brotli/python-brotli.hash | 4 ++--
>  package/python-brotli/python-brotli.mk   | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
> index e8036d3bb8..ed8eea72eb 100644
> --- a/package/python-brotli/python-brotli.hash
> +++ b/package/python-brotli/python-brotli.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/brotli/json
> -md5  908d109a0309c33b626d01137eb4a060  Brotli-1.1.0.tar.gz
> -sha256  81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724  Brotli-1.1.0.tar.gz
> +md5  af164f216cba527bf6f24d09c9d3576b  brotli-1.2.0.tar.gz
> +sha256  e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a  brotli-1.2.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
> diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
> index 865c4e363f..e2343a24b2 100644
> --- a/package/python-brotli/python-brotli.mk
> +++ b/package/python-brotli/python-brotli.mk
> @@ -4,12 +4,13 @@
>  #
>  ################################################################################
>  
> -PYTHON_BROTLI_VERSION = 1.1.0
> -PYTHON_BROTLI_SOURCE = Brotli-$(PYTHON_BROTLI_VERSION).tar.gz
> -PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/2f/c2/f9e977608bdf958650638c3f1e28f85a1b075f075ebbe77db8555463787b
> +PYTHON_BROTLI_VERSION = 1.2.0
> +PYTHON_BROTLI_SOURCE = brotli-$(PYTHON_BROTLI_VERSION).tar.gz
> +PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285
>  PYTHON_BROTLI_SETUP_TYPE = setuptools
>  PYTHON_BROTLI_LICENSE = MIT
>  PYTHON_BROTLI_LICENSE_FILES = LICENSE
> +PYTHON_BROTLI_DEPENDENCIES = host-python-pkgconfig
>  
>  PYTHON_BROTLI_CFLAGS = $(TARGET_CFLAGS)
>  
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
