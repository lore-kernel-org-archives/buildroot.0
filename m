Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C30CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4123584D72;
	Sat, 30 May 2026 08:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jy7ZdH96GT1R; Sat, 30 May 2026 08:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CA2184D75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780129416;
	bh=q2jFPhPvrX001RlobbTiOnAKQTXhQ55f66R0fBlztL8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ITzIpNZgeHxp2Sr3M3UXXPWmVxQrbx1JXRsU+iCi5+czfY5uGLebDA3hUfZ0LMMR1
	 9MZFe2r3jzjGSFfn0JgiJd3ox9Cj10SnBNeDRQw6OEtyR1daMFkcjPQfRw2Tsf365Y
	 qP1fDpBmsIYlvqP/WYoZbUjRfHbB1OehcH/ANRWQGxA1Yne94v2y5Qr1pDHUV6k7MX
	 Jx9+sMHJZgWJw0QDcqvJIsggA+OkjaSbkexOl8RZesoIIeehGSrfFGp15qQOLC7UcG
	 aW0IvR4hIK754srzajgX3v50FOFrvw9RMwPBNfRnGCfQfnU2aEb8M5d0xbP6e8uqNf
	 CykzV2qdVBA0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA2184D75;
	Sat, 30 May 2026 08:23:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C40BF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89B3C60EAC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qwtyfTL5M7d for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A630A60650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A630A60650
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A630A60650
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:23:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4D258B97C44C; Sat, 30 May 2026 10:23:32 +0200 (CEST)
Message-ID: <4b23ff7d-35d8-4b76-84fb-855ff41077e1@rnout.be>
Date: Sat, 30 May 2026 10:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
References: <20260529220219.2526204-1-titouan.christophe@mind.be>
 <20260529220219.2526204-2-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529220219.2526204-2-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780129412; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=dGvfxlz//L/0Gy4MFQHXxzv/8mEmRfNxRr9fQ0KdLPE=;
 b=DTWawvZ86QXYKgwawIP61Odmv9V4/mcMGzQmlyfIRKKyh46BT0Gpigcd9SbF2AyKEbJcGI
 oJ2QhAAuvPwgc4dJdbJB+qh3n5fZs79IVPyqJoIWCAy4lHp7qRc7uMitC5k0k28k8aTYDo
 lSfpktWkkyJpPR0NxypCAsXeuJd3uitWUKl6NNVRvs0brQw7seE67YFfQR4XbJVLwOnfW9
 4TOe86VtEkiIPiycYQVR8m1MXwyvWTxxjqJjkkzlE/AyjB9wQTnHlT9qRUITAR2Fn7pUId
 84n9x/KjDO27VQavRaIkDV6CQbavlJtdSndwDDciF1QaYpMeFcdazTvPytK3hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DTWawvZ8
Subject: Re: [Buildroot] [PATCH 2/2] utils/bump-stable-kernel-versions:
 automatically commit result
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



On 30/05/2026 00:02, Titouan Christophe via buildroot wrote:
> Since this script is often used to bump kernel versions in multiple
> Buildroot branches, it makes sense to simply commit changes directly
> rather than letting the developer do it by hand.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   utils/bump-stable-kernel-versions | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
> index 6303bf4010..8da0c756df 100755
> --- a/utils/bump-stable-kernel-versions
> +++ b/utils/bump-stable-kernel-versions
> @@ -25,6 +25,7 @@ latest_version=$(sed -rn 's|^\tdefault "(.+)" if BR2_LINUX_KERNEL_LATEST_VERSION
>   latest_release_version=$(echo "${latest_version}" | cut -f 1-2 -d .)
>   echo "${latest_version} -> ${latest_release_version}"
>   
> +updated_files_list=()
>   updated_releases_list=''
>   updated_versions='Update the latest kernel releases to:'
>   
> @@ -94,6 +95,7 @@ update_linux_hash() {
>   
>       # We were iterating over this file so we could not edit in-place.
>       mv "$HASHFILE.new" "$HASHFILE"
> +    updated_files_list+=("$HASHFILE")
>   }
>   
>   while IFS= read -r -d '' hashfile; do
> @@ -101,7 +103,9 @@ while IFS= read -r -d '' hashfile; do
>   done < <(find linux/ -name '*.hash' -type f -print0)
>   
>   if [ -n "${updated_releases_list}" ]; then
> -    echo ">>> Suggested subject: {linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
> +    git add "${updated_files_list[@]}" linux/Config.in package/linux-headers/Config.in.host
> +    echo -e "{linux, linux-headers}: bump${updated_releases_list//.x /.x, } series\n\n${updated_versions}" \

  Nitpick: prefer `printf` to `echo -e`.

> +        | git commit --signoff --file=-

  I think it's better to get confirmation from the user, e.g. by adding --edit 
to the command line (then you can break off by removing the commit message 
text). It could also be useful to add --verbose --verbose so the editor shows 
the patch and the user can easily review this.

  I marked this patch as Changes Requested.

  Regards,
  Arnout

>   else
>       echo '>>> Nothing happened.'
>   fi

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
