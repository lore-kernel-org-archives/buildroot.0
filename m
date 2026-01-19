Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFF4CCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F3480615;
	Mon, 19 Jan 2026 10:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTTdhjSqDKZs; Mon, 19 Jan 2026 10:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEB1F806EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817367;
	bh=LfSAovDh+9n7vhtReiuqKg5wwa2jtTbmmPXI9IpKnR8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FZxUmjK0f0oYAzvSGBwjRrjN+7ep1DVrbpj7yYIdnAeZzNkUsnEQoStSJExDRnS3q
	 vJUsh7bRmW/xckr1ujXh5YI1wQIS9sSBP5cbhglljfugmLzcmCCdLbdWFq0QqDezfZ
	 vcHfRxlpmO4briD7LFyM8hHOHrZnJ34SmXVRp7gkKob3PIknaInFrM+j/mUBdc7qro
	 YsKqew4bFvIIyYH8M0UPjOBJMn88Fvh6dypo/PU6/d4rVJmyJ7ge4dxz4ajee9XzP8
	 xt5CUKbN4AZd3CrAejNo+FxmI2kellMF2HFLWFPhqpD4RRksnn89shkfllhUHvTnv+
	 iOEnTEmdLlXKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEB1F806EF;
	Mon, 19 Jan 2026 10:09:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 965602CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 861F160D91
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52A_i9KvolA8 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D47460D90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D47460D90
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D47460D90
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 64419B97A968; Mon, 19 Jan 2026 11:09:16 +0100 (CET)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:15 +0100
Message-ID: <20260119100915.12842-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106023341.2237312-1-james.hilliard1@gmail.com>
References: <20260106023341.2237312-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817356; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=K9QiDzWpWdlLU6tTXcoVsN0xT+PNS41ctFCcvZuq7sE=;
 b=O79c0w2rucGfEnU4HKstZ1w9UbPG10SGUVG2RqXDiCAZoit2NjbrTBMRRqnUsBYKnoJlcA
 w0UDafQpsjH4xSAbE2twvjbs+vhkZJcxiRajovlBoW4KBeWqKwGWZZo785Cz7yBaKW5DPJ
 Fqno6xeLs7K3aM8DweVh704Xx2ClmRI6dLJKHNwu1yUJB2aPid4RSxX+49ykphed2yyk4K
 gmJK06DkDYJbQRN8bT9Jx6S2bU47cV5NJt64qA0BsPdxydzll6rVZLpBXN1xj+IWkTMyaB
 N1GMXTYUE43zfOGJzdRJRHlw1Uto9DeQfxvJW2gw04tYS+WjyiLQcPI+1ay/dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=O79c0w2r
Subject: Re: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2026.1.4
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
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index cc80fa1bbe..176da86300 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  430a5fa9f18895a9b69a018d2beae67b  certifi-2025.11.12.tar.gz
> -sha256  d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316  certifi-2025.11.12.tar.gz
> +md5  d8447ad858fa15af16f91e32f182aa85  certifi-2026.1.4.tar.gz
> +sha256  ac726dd470482006e014ad384921ed6438c457018f4b3d204aea4281258b2120  certifi-2026.1.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index 1f889d425d..fe28f5878b 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CERTIFI_VERSION = 2025.11.12
> +PYTHON_CERTIFI_VERSION = 2026.1.4
>  PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a2/8c/58f469717fa48465e4a50c014a0400602d3c437d7c0c468e17ada824da3a
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/e0/2d/a891ca51311197f6ad14a7ef42e2399f36cf2f9bd44752b3dc4eab60fdc5
>  PYTHON_CERTIFI_SETUP_TYPE = setuptools
>  PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>  PYTHON_CERTIFI_LICENSE_FILES = LICENSE
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
