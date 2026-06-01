Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1385BCD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE308605E6;
	Mon,  1 Jun 2026 19:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pA_hXakx3-I7; Mon,  1 Jun 2026 19:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB16A605E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780341577;
	bh=OKOPWKOEL1NcANu/FSVN4REsBCkiuNh1yTnAjSdtIcM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m+86w/3UFBOWQ2kB78ERF7n9n4rxB/wHYWhX5845WDOy+rXqCa/bWg8FpRRQRY4ye
	 uynl3PPRVUy/EWXMuYTSYMJWQvzFs2aTwE/tRLB7dmUoYsuk67AnN6kiK9xjc2JaJs
	 mNDCNy+UIbfkMb3bTtIRAaV+45CbHSHwomj+rF/dIZ30nqgav1KerAhkeUGxvwl+ou
	 BbmEGgzKrsLH0z3li9bwX43kaHVHtSGXXjxbhZf+oSj7x4gT+N+I8DqI80un5DXA2/
	 3yH0NSd+/IKBNkx6Md5suewC/C/Kb1xEua+gOKFOegdOY7LYJEdCW9WpjuHZhDhrH4
	 2PAkkEf2vddEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB16A605E9;
	Mon,  1 Jun 2026 19:19:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4212BF4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27117810A4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIWXWsvPN8Jh for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:19:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6070180F78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6070180F78
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6070180F78
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:19:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1FFFBB97C39F; Mon,  1 Jun 2026 21:19:32 +0200 (CEST)
Message-ID: <7c7bf9f6-5aba-4777-ac33-4b0a84d4f02f@rnout.be>
Date: Mon, 1 Jun 2026 21:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: thomas.perale@mind.be
References: <20260531120522.2310476-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260531120522.2310476-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780341572; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=dkE8aSL1cVpyea7nmKWk4jhm4k7G63ql2mdoe5iCb8Y=;
 b=MIPl8R8Z1ZNpmf5TlRK3MTXc4R9VE1ggvZkB9u+ICDqZ0FVTGk5KJZcnqkomfC7Of9RY0c
 0RwhxyfLhDzq0a12nSXHU8Xxee95P+Qaz0et9w6shpYv9PPWXphvuiX32iC7CDuIKnAOQM
 KxGuFq+MDjS4Gt4uw86ig4fbUU9piJX2l1ICGoyJICf7os9Y5r5vNgPasmPSDnGzs0ii9A
 kSUkW6jf2xBYLhaW1YYTdi/qKrcdJQDq+nAOocLUymmcRREUqom2gOZIdXiS3xvQgxvND3
 WF+N74ppLsX3BVu7O15R2GHHTq1JHbhDl56Z34YGwvUo589xUArESya0V0IT+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MIPl8R8Z
Subject: Re: [Buildroot] [PATCH v2] utils/bump-stable-kernel-versions:
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



On 31/05/2026 14:05, Titouan Christophe wrote:
> Since this script is often used to bump kernel versions in multiple
> Buildroot branches, it makes sense to simply commit changes directly
> rather than letting the developer do it by hand.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1->v2:
> - Open text editor when committing to allow the user to review changes
> - Avoid using echo -e
> ---
>   utils/bump-stable-kernel-versions | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
> index 6303bf4010..9df2debd5f 100755
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
> @@ -101,7 +103,12 @@ while IFS= read -r -d '' hashfile; do
>   done < <(find linux/ -name '*.hash' -type f -print0)
>   
>   if [ -n "${updated_releases_list}" ]; then
> -    echo ">>> Suggested subject: {linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
> +    git add "${updated_files_list[@]}" linux/Config.in package/linux-headers/Config.in.host
> +    git commit --verbose --edit --signoff --file=<( {
> +        echo "{linux, linux-headers}: bump${updated_releases_list//.x /.x, } series"
> +        echo
> +        echo "${updated_versions}"
> +    } )
>   else
>       echo '>>> Nothing happened.'
>   fi

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
