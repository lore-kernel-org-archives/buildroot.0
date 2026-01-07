Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952AFD0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C13240E28;
	Wed,  7 Jan 2026 17:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6I9TdUjYBAd; Wed,  7 Jan 2026 17:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4651B40E1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808237;
	bh=T+kw3rtklEDn0dd6P5dqFbrXkmstWw45NyyOOOwuUQw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f5osqZxCoiLP1wn8y8sdvnRkJnFUnHccx7yVNY3SlS4GOFfDKyknCAGG7oKvUgbE0
	 ydxciFYjKpMqlOX61ueoUjTE0fIAa1soikw1Hi0MrD3E00sjXn4GZP0KNG4dAzq6nO
	 WTHLt8FSUTuJeQhvEnYrKgDyAWAxgTM5ztegkJrJxI+G1DRpth4iSz/mr3OJYCoRd3
	 I/a84afwVdQqXlpEiGMjDO6Jr86r8qwsdGeSRhEUIV3Xgo63QIbzXo4S8xOxGEbjgu
	 wVVlH5OJbdprH8b8Y95s1T7ZHn9Eb7RGXJlqTg/w2r8sjv1a08ZP5O1ncPydse/82q
	 PhzsOkl7I+KQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4651B40E1B;
	Wed,  7 Jan 2026 17:50:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ABA59ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CB1440A03
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bk7C7vYnmcZO for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F8E940E17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F8E940E17
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F8E940E17
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9C5BB97A192; Wed,  7 Jan 2026 18:50:33 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:32 +0100
Message-ID: <20260107175032.226612-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-21-bernd@kuhls.net>
References: <20251221223441.185169-21-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808233; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=xEglvncYbIjsI3pP4xGdNw2DB05NtdDdKdbKqWVtcds=;
 b=glaoyhgXqSccvvvsariCsiVL3StpNHMOBkgYxxdxnmEEPGAwJykJZHfmuhkQTTyAH7OkLT
 mGrJ6/z7Pgi2UP4Ih+eIynkCmSmr8apmffA461xk59YKwbt7XV4YSrJavt7htbocoVHyGj
 6EjqCRWAz0BSHb+MSX0x+OVujQSB2nfv0XiJGCPfyIhaPlFd/x+7dpYybSqd1d+xiS5Fp+
 SrOYSFoJsuxq8RqFU9yOfUw1b3okuB09VoZzdeVhE0oSEktAG7COp5kG9+eVZiUjyI0+uG
 OYmRDi8vG4H472kV7N7EJ/QkNKJQW5Dk7NTR/KdNnwTFVeDswv8AlAwbMo2uSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=glaoyhgX
Subject: Re: [Buildroot] [PATCH v2 21/23] package/python-pyqrcode: update
 tarball URL
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
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-pyqrcode/python-pyqrcode.hash | 4 ++--
>  package/python-pyqrcode/python-pyqrcode.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-pyqrcode/python-pyqrcode.hash b/package/python-pyqrcode/python-pyqrcode.hash
> index c946ba9d9b..9c1dfce294 100644
> --- a/package/python-pyqrcode/python-pyqrcode.hash
> +++ b/package/python-pyqrcode/python-pyqrcode.hash
> @@ -1,5 +1,5 @@
> -# md5 from https://pypi.python.org/pypi/pyqrcode/json
> +# md5, sha256 from https://pypi.org/pypi/pyqrcode/json
>  md5  371f29f4b03bd2830c6e0319258b1259  PyQRCode-1.2.1.tar.gz
> -# Locally computed
>  sha256  fdbf7634733e56b72e27f9bce46e4550b75a3a2c420414035cae9d9d26b234d5  PyQRCode-1.2.1.tar.gz
> +# Locally computed
>  sha256  bef0c3595451da5132dea99e288fb5dafcbc469e0643f993a4ba0a69980f5ec9  setup.py
> diff --git a/package/python-pyqrcode/python-pyqrcode.mk b/package/python-pyqrcode/python-pyqrcode.mk
> index f3eac5a3c0..6dfe1afa6d 100644
> --- a/package/python-pyqrcode/python-pyqrcode.mk
> +++ b/package/python-pyqrcode/python-pyqrcode.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_PYQRCODE_VERSION = 1.2.1
>  PYTHON_PYQRCODE_SOURCE = PyQRCode-$(PYTHON_PYQRCODE_VERSION).tar.gz
> -PYTHON_PYQRCODE_SITE = https://pypi.python.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316
> +PYTHON_PYQRCODE_SITE = https://files.pythonhosted.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316
>  PYTHON_PYQRCODE_SETUP_TYPE = setuptools
>  PYTHON_PYQRCODE_LICENSE = BSD-3-Clause
>  PYTHON_PYQRCODE_LICENSE_FILES = setup.py
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
