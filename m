Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E39E9D410
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E0A340586;
	Wed,  4 Feb 2026 16:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bgC8p3zk9HX; Wed,  4 Feb 2026 16:35:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D3240977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770222902;
	bh=d/NfYXqdq20EPjLOL88ERvqigWXU8UYm4qsNLoXXBW0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UZfHbM5QFbGNlK/3eMFMWB0ZX6cOCXogvX35OhwVJeBSRp68v396xlJjgt2ZH1Etu
	 tWM7Pycm+RIBZ2PTf/d+SCNzZ9EwZ/GUzWjlG5SWs0V8HDPfx8TNSdCJx8vpiAl/vG
	 FG3phHehsU/mTDbVL5n68ol2n73vFvg6arsjG01VRup8bV4deSqq4vD1IzpiwkRnLm
	 zm0mfGgoRgJlrvhOcS175hcU0WuuraIHFntbROWVtIs5gjiI2cnrUm3n7dY7wZVRsS
	 AqFD/hfy61nQVvI5CLvIaf94KoEGrs6hW1UH+9w7zk7sD21RZV2UFW7rgPQUEqS3Jj
	 bsaeRPlbKpd7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1D3240977;
	Wed,  4 Feb 2026 16:35:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDFDA173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B985B81387
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CBUIjc9j5Wu for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:35:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A497E8136B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A497E8136B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A497E8136B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:35:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA2E7B97ADDF; Wed,  4 Feb 2026 17:34:56 +0100 (CET)
Message-ID: <961e39e7-8a98-4780-b847-c799dac04442@rnout.be>
Date: Wed, 4 Feb 2026 17:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <john.ernberg@actia.se>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: Jonas Blixt <jonas.blixt@actia.se>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jacob Chen <chenhao37@lixiang.com>
References: <20241227160622.1654822-1-john.ernberg@actia.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20241227160622.1654822-1-john.ernberg@actia.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1770222898; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Hlu4Jq2aMcpWv5FZJ4s9nurhwWGlXeOoy1WjGroSOMs=;
 b=oX+wZWxIKIJZ8Ux1t/eoKLHBmjgNWSYzOAuJple9Q9WR8dA98z7NKIK/q08/V/DAGVDQNF
 tIKOjmCRB5QtskkQAUc0N6776br59wOmOJ+5Sw+D/CufmloIfwg6T9mHGXRlf4NvbEKItX
 yLZUyiUdFtTX2La5NdhZtEvMUoaYQfbQmfvKhGHay5PkfpPoxyYShOcLteycFc+svp9kEs
 J7R671MThKEnX089tTrtulFvp7iDJcLCatxcDkD/5zSSIduW7zPiQbWfg6b6z8H/OfNKzU
 LReDzSwmd5J4T95a92OshRubmOYT56wjEslNp9zD70m4Y45lMBNQXxfwJT4BxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=oX+wZWxI
Subject: Re: [Buildroot] [PATCH v2] package/pkg-utils: Prevent per-package
 syncing stale deps
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi John, Jonas,

On 27/12/2024 17:06, John Ernberg wrote:
> From: Jonas Blixt <jonas.blixt@actia.se>
> 
> From: Jonas Blixt <jonas.blixt@actia.se>
> 
> This filters out the dependency inputs when syncing the per-package
> target directory to only include 'skeleton' and its dependencies, if
> they exist. Since other dependencies are not needed in the target dir
> for successful building they can be ignored and depend on the ppd-merge
> to populate the files from the other packages, unlike the staging dir
> which is untouched here.

  I may be missing something, but doesn't this break the combination of busybox 
with e.g. attr? The busybox install script checks if the file already exists and 
does not create the symlink when it does. busybox depends on attr (and dozens of 
other packages) for exactly that reason.

  There are other packages as well that rely on the presence of something in the 
target directory.

> This solves the problem where stale files from dependencies will
> linger in the per-package target directories and may up in the final
> target directory after the ppd-merge, overwriting the fresh ones,
> causing unecessarly many rebuild steps to ensure that the latest
> version of a dependency is included in the final target directory.

  Yep, we're aware of this problem, and haven't found a solution :-)

  Regards,
  Arnout

> 
> Example:
> 
> Package A, containing liba
> Package B, depends on liba
> 
> If liba receives a bug fix that does not require a rebuild of Package B
> Pacckage B target directory will still contain the previous version
> of liba from Package A. During the final rsync the Package B target
> dir will be rsync'ed after Package A's target dir  to the final target
> directory which now will contain the stale version of liba.
> 
> For our particular configuration the build time was not notably affected:
> Before: 12m4
> After: 11m43
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Jacob Chen <chenhao37@lixiang.com>
> Signed-off-by: Jonas Blixt <jonas.blixt@actia.se>
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> 
> ---
> 
> Changes since v1: https://lore.kernel.org/buildroot/20240801115712.1458767-1-jonas.blixt@actia.se/
>   - Rework diff to be a bit more digestiable
>   - Rework commit message to attempt to contain a bit more information and clarity
> 
> We sent this patch back in August and it didn't get any feedback.
> 
> Since this is a bit of a tricky matter I reworked the commit message a
> bit to try to clarify the problem further to make review easier.
> 
> The issue has been brought up a few times on the list before:
> https://lore.kernel.org/buildroot/tencent_7A5A407C574E45921E432385B01446CC4506@qq.com/
> https://lore.kernel.org/buildroot/20231110141242.3796161-1-john.ernberg@actia.se/
> https://lore.kernel.org/buildroot/20191212130253.2cb543ba@windsurf/
> ---
>   package/pkg-utils.mk | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index a0dbeac18e..65234ea7f6 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -237,10 +237,18 @@ endef
>   # argument, so that this function can be used to prepare with
>   # different set of dependencies (download, extract, configure, etc.)
>   #
> +# The per-package sync of target is filtered to only sync skeleton
> +# and the skeletons dependencies when they exist. This prevents stale
> +# copies of dependencies in the per-package target directory and thus
> +# prevents stale files from propagating to the final target directory
> +# during rebuilds of packages.
> +#
>   # $1: space-separated list of packages to rsync from
>   define prepare-per-package-directory
>   	$(call per-package-rsync,$(1),host,$(HOST_DIR),hardlink)
> -	$(call per-package-rsync,$(1),target,$(TARGET_DIR),hardlink)
> +	$(call per-package-rsync,\
> +		$(filter $(SKELETON_FINAL_RECURSIVE_DEPENDENCIES) skeleton, $(1)),\
> +		target,$(TARGET_DIR),hardlink)
>   endef
>   
>   # Ensure files like .la, .pc, .pri, .cmake, and so on, point to the

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
