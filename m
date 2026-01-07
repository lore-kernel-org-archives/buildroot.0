Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D88D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EC6E40DD4;
	Wed,  7 Jan 2026 17:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zzpxgUlpgDi; Wed,  7 Jan 2026 17:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B77040DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808228;
	bh=n75GULQSAoGNdzSO+dhporNltik38OQoVIPG5PpUEd8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lrgGhiqQmyt3yElmGjj5vfXN4+CB93oT7bz3N4zRrFOjLRZVL7aQCpHNjHAGiRUyQ
	 3/cPl28eno+22i+6Zyc1HAkvyqCGDZPU27IMJRnH+YR5t+eFKj3xOMLAFzHJ4b1kV5
	 1S5oeKot58XPjSR/DXUUGcIJMS2Qy213dBmwZpiV6wijTz8xTJT1ZiAvpADxIkUbhP
	 gda3/q2I9oTzYqeuBo9MaLcGwOG2OdHyYgEpinj6k5EbvvHpnGQ23u8g9Q8gISDT20
	 zG4w44Iv9yd05Tj7650TLHvx4B7xLUpf2NWCxZj7Yg4g9Qxr827S0vkkzvC75TVj9O
	 JlChM97moMeyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B77040DEC;
	Wed,  7 Jan 2026 17:50:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5405F9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B88D40DE6
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnUWzUTK4Uaz for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 312BF40DD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 312BF40DD2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 312BF40DD2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F2EDB97A596; Wed,  7 Jan 2026 18:50:23 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:22 +0100
Message-ID: <20260107175022.226305-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-15-bernd@kuhls.net>
References: <20251221223441.185169-15-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808223; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=7xMaaJO+fCoefQdLW4FX4Zu9F8ScqYz/08T1kjH+rSo=;
 b=F/bwV2H8zpAUbxOYgBKb59D8UMP831NpBLrTkluOoCOYx71YsRb4ZCV7bB9b0NO0LxExqw
 csGdD+WZ9B0j+ezFptGgeoOs3mks+0zQ8c9o8aSf4taGvbaLuj1Y7qGTKCglS3xAB0s44A
 +DmKaelzX62J3qBnQar+cs0MiaCHNvJAxLlB4ozfjO3srguEbXCWk7rm5nZiqC3ukmwHye
 QLH28PjQiEjkvu8pDZfsGo3FEQ2UCKKeLpWEYdggtRe/BUe7HLOdazfFz252KgS6PLaqMA
 Pxts3vlDW3zWxX09cmflsS8nchK3drJNAyg2lEFuzcqbMzD9Chup0CTdtt1cKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=F/bwV2H8
Subject: Re: [Buildroot] [PATCH v2 15/23] package/python-mpmath: update
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
>  package/python-mpmath/python-mpmath.hash | 4 +++-
>  package/python-mpmath/python-mpmath.mk   | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-mpmath/python-mpmath.hash b/package/python-mpmath/python-mpmath.hash
> index 1b263c925f..e402647a59 100644
> --- a/package/python-mpmath/python-mpmath.hash
> +++ b/package/python-mpmath/python-mpmath.hash
> @@ -1,3 +1,5 @@
> -# Locally computed sha256 checksums
> +# md5, sha256 from https://pypi.org/pypi/mpmath/json
> +md5  d5d17bbefea73eeb959967351d905306  mpmath-1.3.0.tar.gz
>  sha256  7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f  mpmath-1.3.0.tar.gz
> +# Locally computed sha256 checksums
>  sha256  c26cae81da4508e5e249985777a33821f183223ebb74d7f8cfbf90fe7eef2fb7  LICENSE
> diff --git a/package/python-mpmath/python-mpmath.mk b/package/python-mpmath/python-mpmath.mk
> index cd19dd52be..86a3562d04 100644
> --- a/package/python-mpmath/python-mpmath.mk
> +++ b/package/python-mpmath/python-mpmath.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_MPMATH_VERSION = 1.3.0
>  PYTHON_MPMATH_SOURCE = mpmath-$(PYTHON_MPMATH_VERSION).tar.gz
> -PYTHON_MPMATH_SITE = https://mpmath.org/files
> +PYTHON_MPMATH_SITE = https://files.pythonhosted.org/packages/e0/47/dd32fa426cc72114383ac549964eecb20ecfd886d1e5ccf5340b55b02f57
>  PYTHON_MPMATH_SETUP_TYPE = setuptools
>  PYTHON_MPMATH_LICENSE = BSD-3-Clause
>  PYTHON_MPMATH_LICENSE_FILES = LICENSE
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
