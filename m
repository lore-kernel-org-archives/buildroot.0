Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177C2D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E539182306;
	Wed,  7 Jan 2026 17:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdYgevLAemzS; Wed,  7 Jan 2026 17:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C32182357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808220;
	bh=P4CmQZ+eJM9wQCcbPEIoM5CXkK2slAN2kGfL6VxVdfU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RfmnXK4Xq7EnJQYgAV7pWK8mrQvwU9sXYAHsIEGgYCYeT/Vu1e63UaSGW7z7uTWwZ
	 SKP2J1npgzoS9bUddV1X6kt1u32vn3Pj+kkuS/EC1iy9mzvQ2twIozQgYni0q5Hl6I
	 o+i4gW6QLFAywKktx1XyYqQTLxMPw1777q+jciQiRam8PEhD6vpcNhetDdPNA2AvZg
	 CHXTue4zNL3JBZcFyBKZjRi2oRUYGAY6FRvnJB//tyI6s7m7R+UMJILTw0sANFn9H9
	 Wc0KTzwKeetEOtmKVyXcBkCjc7uskXa+x2za3e4TwuHjdLft87o/apwDRV4I/7Nf+s
	 pmkFZVm1l5/6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C32182357;
	Wed,  7 Jan 2026 17:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25BCE25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21A7140DBD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrcfQlvX1ESN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D273E40DAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D273E40DAF
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D273E40DAF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DF397B97A192; Wed,  7 Jan 2026 18:50:14 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:13 +0100
Message-ID: <20260107175013.226092-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-11-bernd@kuhls.net>
References: <20251221223441.185169-11-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808215; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=il3/VVyiRrklCLmPnTElruFpjIzYEKMfwF7wGlUmhEQ=;
 b=UWw69vIA5cvmSH2d+xnRPYZut9+fT4XROY9HUKC+/HYoU5iXAmJuArAA8t3auPb1ByBLCN
 on8aZUUIW+MIF43FmEFC4FxPNLn7TQ7n7MP0U791pn1NM259A4xu7zsCRJHhtaMvhyT3ol
 KXhNxvBJ82mB7yfjJI+g71XYK9E6AMabXpOFOSevMrANvv5bSW3v3bXWILiNuaRSSPBh8m
 MzrB1M1yIQpfWliKn5G6tulAeV2ZDSbpR5E5Rxhnk0nWQaidSM8WzOZrg6jfBIDq8V/WyW
 wLbCfMjMBOYUPjGpSbW12yGT+DUz1C88pV2FqR3u9dDq62q936wWfQMyfAmwoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UWw69vIA
Subject: Re: [Buildroot] [PATCH v2 11/23] package/python-ipython-genutils:
 update tarball URL
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
>  package/python-ipython-genutils/python-ipython-genutils.hash | 4 ++--
>  package/python-ipython-genutils/python-ipython-genutils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-ipython-genutils/python-ipython-genutils.hash b/package/python-ipython-genutils/python-ipython-genutils.hash
> index fd719c93a0..c368272f07 100644
> --- a/package/python-ipython-genutils/python-ipython-genutils.hash
> +++ b/package/python-ipython-genutils/python-ipython-genutils.hash
> @@ -1,5 +1,5 @@
> -# md5 from https://pypi.python.org/pypi/ipython_genutils/json
> +# md5, sha256 from https://pypi.org/pypi/ipython-genutils/json
>  md5  5a4f9781f78466da0ea1a648f3e1f79f  ipython_genutils-0.2.0.tar.gz
> -# Locally computed
>  sha256  eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8  ipython_genutils-0.2.0.tar.gz
> +# Locally computed
>  sha256  f09da6c0f4971485f6fbd6c630d0d6cdd012bfe128b2ebbd014de2f6c7c7e2a6  COPYING.md
> diff --git a/package/python-ipython-genutils/python-ipython-genutils.mk b/package/python-ipython-genutils/python-ipython-genutils.mk
> index 08a0b8ba9a..847279b6b4 100644
> --- a/package/python-ipython-genutils/python-ipython-genutils.mk
> +++ b/package/python-ipython-genutils/python-ipython-genutils.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_IPYTHON_GENUTILS_VERSION = 0.2.0
>  PYTHON_IPYTHON_GENUTILS_SOURCE = ipython_genutils-$(PYTHON_IPYTHON_GENUTILS_VERSION).tar.gz
> -PYTHON_IPYTHON_GENUTILS_SITE = https://pypi.python.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
> +PYTHON_IPYTHON_GENUTILS_SITE = https://files.pythonhosted.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
>  PYTHON_IPYTHON_GENUTILS_LICENSE = BSD-3-Clause
>  PYTHON_IPYTHON_GENUTILS_LICENSE_FILES = COPYING.md
>  PYTHON_IPYTHON_GENUTILS_SETUP_TYPE = setuptools
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
