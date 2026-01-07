Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B07D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3176B409D8;
	Wed,  7 Jan 2026 17:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4YHWFV2Gj1Z; Wed,  7 Jan 2026 17:50:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AFEB40D9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808204;
	bh=ue1XR5MVd4XSbicZghTZQ7e5eAZKhQlg9ESiCeqVudo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YiB12iCfkwHkzgCFVFoHB2g2OuQtaYtBjvRCWodqgRe0OSqrRP/iToeoB27JED+jJ
	 EFO4gAiMTfQkacdtjCAkewWNRVd6LBkpjX0t9jNo0IxqwdCZvfRczEjEXreHFQqHG6
	 N0eBla4CLY0VCrmXOhmd+ANHghN+NN07I7zhlBLyzMPA/AkC6f04vIHrnl79IpyUr1
	 uC8Tf/x/CpXg95j0QzP6xzZsr878GXhAiezqd3o/C+hYjdS8X9XCDUJtrdBUhIAsR3
	 ncyXPW/89P/mXQGZDKaM/jWonrfU+CYjIpuo/TVOzkFC0SyMX3qJnhs/MdOZI/sO/y
	 UcjATGfwefC9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AFEB40D9F;
	Wed,  7 Jan 2026 17:50:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8444925B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ACD86083D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6BwoOqiJ4ek for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6548607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6548607D9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6548607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 29535B97A192; Wed,  7 Jan 2026 18:50:00 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:58 +0100
Message-ID: <20260107174958.225764-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-5-bernd@kuhls.net>
References: <20251221223441.185169-5-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808200; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=2vRL0YM8u2RjxkcQu+Vd4xw26xiaNpN6pMcmKASC7Ig=;
 b=LpJtVHLNzrnab6kec1MaBVhK+0tS+m7atIFUtUr8M/UA7izUGcBNMoL/I/t9iQ0OvryGuc
 LRjL2a5/ea5vRadXWrZvsOf77/Qys/2Wf45geaY1f7JctlDfInzXuBYnGMJsAL1HTR7P/y
 7p0fxGMYsnsSu2mZ5vLJ3HrgQLKJoYYtGT8nj2Nly7zM6xDNRvIJuKJFubmKvByyTAj5G+
 DFr6LIgibrdq4V2/xYO7C7s5ilNMPOe433ZkK4VHogr0E44bEzCSvtVyJqNQ7r0cqVgTsp
 9nTJvRcgwGEFBcTE64DgC7KkH5qf9BLy8cLEueau0sitqEcsHMbMZAVVAczr/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=LpJtVHLN
Subject: Re: [Buildroot] [PATCH v2 05/23] package/python-crcmod: update
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
>  package/python-crcmod/python-crcmod.hash | 4 ++--
>  package/python-crcmod/python-crcmod.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-crcmod/python-crcmod.hash b/package/python-crcmod/python-crcmod.hash
> index 43ef7dd8e7..81a7f34614 100644
> --- a/package/python-crcmod/python-crcmod.hash
> +++ b/package/python-crcmod/python-crcmod.hash
> @@ -1,5 +1,5 @@
> -# md5 from https://pypi.python.org/pypi/crcmod/json
> +# md5, sha256 from https://pypi.org/pypi/crcmod/json
>  md5  2d5b92117d958dcead94f9e17f54cd32  crcmod-1.7.tar.gz
> -# Locally computed
>  sha256  dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e  crcmod-1.7.tar.gz
> +# Locally computed sha256 checksums
>  sha256  89480768826f408daea1f3caff0509c2cc9606e10f6bb0ccfd12a3d604842c35  LICENSE
> diff --git a/package/python-crcmod/python-crcmod.mk b/package/python-crcmod/python-crcmod.mk
> index c97f8808c1..a8f2e86be6 100644
> --- a/package/python-crcmod/python-crcmod.mk
> +++ b/package/python-crcmod/python-crcmod.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_CRCMOD_VERSION = 1.7
>  PYTHON_CRCMOD_SOURCE = crcmod-$(PYTHON_CRCMOD_VERSION).tar.gz
> -PYTHON_CRCMOD_SITE = https://pypi.python.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
> +PYTHON_CRCMOD_SITE = https://files.pythonhosted.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
>  PYTHON_CRCMOD_SETUP_TYPE = setuptools
>  PYTHON_CRCMOD_LICENSE = MIT
>  PYTHON_CRCMOD_LICENSE_FILES = LICENSE
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
