Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09B1D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B83DA408A0;
	Wed,  7 Jan 2026 17:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x30ZpRsyPvPE; Wed,  7 Jan 2026 17:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFDBB40A31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808214;
	bh=zX8/ed/z0H6Uhucwx0MvklwV/ibotT5GG0NQzeA+N6k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BfyTR+scnu7LH2el+5TSdkqNM2CoTLjIfhOQ5wnoPeoSp9jBWj0DpR+POz8roXfVp
	 nmJ8NrnuPZsP140emYht666iblKfzVHl8dovv948bw3x8IHgsRuPnoUmHZFrQNii3w
	 qBdUjyu0lIX8stnIcrge9u95T9gaHoxCd55P6NkyDBvJ22Is4J8FVCWubDl7twLtgF
	 utfUstFjk0MiaZMMwfHEeXYZ9obIbk4r8RG7JP0kMIuY9cMhpVGdgNGYEk1OpQndSm
	 WHPeylFKrZ69oJP73vvpHaKI72xFjHxfjCAQOQIIuVNrXsgARJJ9x9CzaQpJgwpPW1
	 QLcSnwMzbfVeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFDBB40A31;
	Wed,  7 Jan 2026 17:50:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 160E49ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07D27607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5W4R4omYXuit for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1B6B607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1B6B607D9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1B6B607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2BFA6B97A192; Wed,  7 Jan 2026 18:50:09 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:05 +0100
Message-ID: <20260107175005.225978-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-9-bernd@kuhls.net>
References: <20251221223441.185169-9-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808209; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=eYZ+eAw6LmSSZCT7B1qRO/bFGlZJeBuM6Qc5OBXdONc=;
 b=O2xNfc1iwHSiqzLo3lK2hV+YYA8GmZEyN6ZGtQ07aa8Y/+V5Dy4mhIzYSZJSg9NZ6uzCU/
 j9byaF2cXRrKv+NzGZp6NNFTJh/RC4JXKN8Mgsu6Wf0rLb5YJEzbtJLLz1rbNvXPmWsMbQ
 VT9WFi/RgV3q1IEcmSJRdSRAk/43QDwEDjB4JlplD12fEmnG69e7Pps1U3wLu9UczwBa9n
 6ibC6CrXjfiOYRBvA2cqmjGDkPblEeyjGQLgM3/qbsBxn1Q5i3QB7LR3Oh+M8S7uM9SVnh
 ziynID7CasFFaSWlZlBuzTUuscw66FkfpzfRFsn0QNSksO+b8jxh3pGoMvyZnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=O2xNfc1i
Subject: Re: [Buildroot] [PATCH v2 09/23] package/python-iniparse: update
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
>  package/python-iniparse/python-iniparse.hash | 5 ++---
>  package/python-iniparse/python-iniparse.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
> index afcfcd2ffb..747d403965 100644
> --- a/package/python-iniparse/python-iniparse.hash
> +++ b/package/python-iniparse/python-iniparse.hash
> @@ -1,7 +1,6 @@
> -# From https://pypi.org/project/iniparse/#copy-hash-modal-5fdd923b-0592-4d2d-8b49-03472f948290
> +# md5, sha256 from https://pypi.org/pypi/iniparse/json
>  md5  2054bab923df21107652d009f2373789  iniparse-0.5.tar.gz
>  sha256  932e5239d526e7acb504017bb707be67019ac428a6932368e6851691093aa842  iniparse-0.5.tar.gz
> -
> -# sha256 locally computed
> +# Locally computed sha256 checksums
>  sha256  ff45637d8a96adc414179e502fbed40160e57205bf2e302140e79a0c71eceaa7  LICENSE
>  sha256  9b02e3dfe433ccd2bd94636ef6eb08638b5a54deafe5f87a3d9d9104356c48e0  LICENSE-PSF
> diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
> index 9f00cf7387..05c9b3930f 100644
> --- a/package/python-iniparse/python-iniparse.mk
> +++ b/package/python-iniparse/python-iniparse.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_INIPARSE_VERSION = 0.5
>  PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
> -PYTHON_INIPARSE_SITE = https://pypi.python.org/packages/source/i/iniparse
> +PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/4c/9a/02beaf11fc9ea7829d3a9041536934cd03990e09c359724f99ee6bd2b41b
>  PYTHON_INIPARSE_LICENSE = Python-2.0, MIT
>  PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
>  PYTHON_INIPARSE_SETUP_TYPE = setuptools
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
