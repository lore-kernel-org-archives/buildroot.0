Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4420D41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACF1E41204;
	Thu, 11 Dec 2025 19:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Geft5dukh7N; Thu, 11 Dec 2025 19:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF897411E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481549;
	bh=rFs4xEPgNZJXUx+19a+VEFXYqgnE2fJmn2NeDUb7jZQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D4bpRFxvRLeQwHr+XwEqh861q5G9KW/q7jhYbmWpILA0jIjmH6ZbLYpcO9Qu/DWwl
	 Et01uxSowJE1e4sSKzBeHPpfe1AI80Dxrq7WXTY1cEVFDecTiRJW0IdxB8FQWHncOA
	 0Ox2QQ6e8c90VtnCgIhy8FAoAjWEQYLTHYqjax73tiXRW+cE9iZAisGK622VKuNP4n
	 Ku8VtwsHI+e1rHsEKo3pVegeprBY5fWHHnXRFm0X6PSdfMDtMdbqEPhH9RcEpAAEJC
	 TAX6cblew0qX4Fxvm7cFQJe8U7KiCmVyny7QUlDnWxaZuq0788KRFX5eaMErnjiGtp
	 tLyBlA3MyEk7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF897411E9;
	Thu, 11 Dec 2025 19:32:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20D98E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07695605D2
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVBQP0kYetK2 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:32:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE99660592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE99660592
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE99660592
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1092DB979EEF; Thu, 11 Dec 2025 20:32:25 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:32:23 +0100
Message-ID: <20251211193223.1100677-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251127194225.2405068-1-bernd@kuhls.net>
References: <20251127194225.2405068-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481545; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=JzLeVqj2pOol+ETtWLe0WXB9JbaoATumQoFuJ59Rm6w=;
 b=l1+m+X0v3eMR3wb1b4P2gjdTh+VXdxkOmG7dm2IALgTrp3BS6SV9naDdbTF+ehS+pXWJtp
 LFj62G+2JzBwAb6K/Yk2s94Wg/h1/bygdOV+FjBodycGSo2hyQm/Q3i2id9ONtkz02bS0Z
 aCWO7WOnI2ZClluVaObcpZ4PIpGxaYAcA5jR+OwpN2tPb/mnIJYEUYF1fq3KAYFytb1/XV
 EZzzKS8dBoUI4WM9vjO3cZxgwydxEynMfYydOuQfBSfmmGG1P22bKQDJPbCfDBIY8csKCu
 6c4YG7occN9MfdiFMxmppg9uhbJ50t5l1QjUqZrcBOpqzfN65A3rLF+6N6xO2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=l1+m+X0v
Subject: Re: [Buildroot] [PATCH v3 1/1] package/unzip: bump to Debian patch
 level -29 to fix GCC 15.x issues
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
> unzip currently fails to build with GCC 15.x. We're already fetching
> from Debian, using patchlevel -27, and it turns out that Debian
> patchlevel -29 has the GCC 15.x fix, and very few other fixes:
> 
> unzip (6.0-29) unstable; urgency=medium
> 
>   * Ignore invalid "Total number of disks" field on Microsoft ZIP64 files.
>     Closes: #661956, #1064000.
>   * Drop conflicting declarations of gmtime() and localtime().
>     Should fix build with gcc-15. Closes: #1098043.
>   * Fix zipgrep handling of escapes. Closes: #1054628.
>   * Stop using update-mime. Closes: #1072396.
>   * Add debian/source/lintian-overrides for *.a files.
>   * Do not trim Debian changelog.
>   * Add debian/salsa-ci.yml.
>   * Add Vcs-Git and Vcs-Browser fields.
>   * Update Standards-Version.
> 
> unzip (6.0-28) unstable; urgency=medium
> 
>   * Drop debian/source/lintian-overrides, obsolete since version 6.0-18.
>   * Update URI for Info-ZIP license in copyright file.
>   * Update standards version to 4.6.2.
>   * Run wrap-and-sort.
>   * Update Homepage.
> 
> So let's just bump to this patchlevel version.
> 
> Note that the .dsc file link in the .hash file was wrong, it was still
> referring to patchlevel -26.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/d81cb9d7c9e87dd233dde350d15cb03427ba2036/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Tested-by: Christian Stewart <christian@aperture.us>
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> [Bernd:
>  Updated _SITE from /debian-debug/ to /debian/ (Baruch)
>  Updated comment of UNZIP_IGNORE_CVES to reflect bump.]

Applied to 2025.08.x. Thanks

> ---
> v3:
> - updated _SITE from /debian-debug/ to /debian/ (Baruch)
> - updated comment of UNZIP_IGNORE_CVES to reflect bump.
> 
>  package/unzip/unzip.hash | 4 ++--
>  package/unzip/unzip.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
> index bbf4f7d71f..0b371e5454 100644
> --- a/package/unzip/unzip.hash
> +++ b/package/unzip/unzip.hash
> @@ -1,6 +1,6 @@
> -# From https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip/unzip_6.0-26.dsc
> +# From https://snapshot.debian.org/archive/debian/20250311T215724Z/pool/main/u/unzip/unzip_6.0-29.dsc
>  sha256  036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37  unzip_6.0.orig.tar.gz
> -sha256  67bde7c71d52afd61aa936d4415c8d12fd90ca26e9637a3cd67cae9b71298c12  unzip_6.0-27.debian.tar.xz
> +sha256  14043e5ea351c02b3bc8676e1e6d20d79b9a690b6d7520e8138ac629cc048417  unzip_6.0-29.debian.tar.xz
>  
>  # Locally computed:
>  sha256  7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b  LICENSE
> diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
> index 5effebee4a..8dccaf6ce3 100644
> --- a/package/unzip/unzip.mk
> +++ b/package/unzip/unzip.mk
> @@ -6,13 +6,13 @@
>  
>  UNZIP_VERSION = 6.0
>  UNZIP_SOURCE = unzip_$(UNZIP_VERSION).orig.tar.gz
> -UNZIP_PATCH = unzip_$(UNZIP_VERSION)-27.debian.tar.xz
> -UNZIP_SITE = https://snapshot.debian.org/archive/debian/20220916T090657Z/pool/main/u/unzip
> +UNZIP_PATCH = unzip_$(UNZIP_VERSION)-29.debian.tar.xz
> +UNZIP_SITE = https://snapshot.debian.org/archive/debian/20250311T215724Z/pool/main/u/unzip
>  UNZIP_LICENSE = Info-ZIP
>  UNZIP_LICENSE_FILES = LICENSE
>  UNZIP_CPE_ID_VALID = YES
>  
> -# unzip_$(UNZIP_VERSION)-27.debian.tar.xz has patches to fix:
> +# unzip_$(UNZIP_VERSION)-29.debian.tar.xz has patches to fix:
>  UNZIP_IGNORE_CVES = \
>  	CVE-2014-8139 \
>  	CVE-2014-8140 \
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
