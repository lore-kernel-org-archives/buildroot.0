Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDE0CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 19:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 591C16078C;
	Mon, 18 May 2026 19:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUnMb5MF_pdo; Mon, 18 May 2026 19:16:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB84360783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779131763;
	bh=/GxE4oWJ1vwWIA/1Kep1W0r9O4cVxG0k/ahyBKtvNoM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l3eVWU9eGKO5fYLm2/tYB51MTO6FUFR3oqdxTbxVXZPfFpq/RJ68GK8mQRFc3a7tl
	 qiJf4gj6LkHFyGAMJSLSAuqNd+8eguCN9oLbB8a/HLCAVrCbJI+T1GN8mE5pRLX10e
	 QoZeip/B5wdEADFI6yp/3Rr5vU6gEmjrVZalhM4Gi737bmpwyJZG7/JlZwqtaMPZMn
	 aVQfTnFrCvqjC8ijGDClGZs8gpcSdn4W4Hg9km+H33uzXOzrxpDV/pVr1oXVZqMMB9
	 O6IgrM/goXoqV//47Rkex8eWZo7wh+Vr4szR7VzfT5ep1oLr7dAkY83gSk/zcy2V/B
	 qtSPnKxJXehBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB84360783;
	Mon, 18 May 2026 19:16:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7399E265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58BC4400D5
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id so_RLhq98FFa for <buildroot@buildroot.org>;
 Mon, 18 May 2026 19:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9D93400CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9D93400CC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9D93400CC
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:16:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 607CDB97BDDC; Mon, 18 May 2026 21:15:58 +0200 (CEST)
Message-ID: <1d340106-77c8-4ecf-bbfe-ed3bbfd13ee1@rnout.be>
Date: Mon, 18 May 2026 21:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: john.ernberg@actia.se
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-2-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260510193826.2846038-2-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779131758; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ZRhrRUKMaVl/4EerbVkiXBvKHofmSQpqbogIotitCoM=;
 b=VvVsh7pODaqiWgj2q6LgkQlpP5nqNkr5DLlBEatGh/Y1OLDn6L7xUXNt6wH7A/OTrrp++B
 PODSBoOHeL1y7f+fy8YBn9jyhmPGhLldTbqXR1HzrjuiNjf+TC7Eo6zj8BTp2e+ZkUPfWG
 e7cy7MVHrJ+aLWL40ywfdQcdait2wTT26k1f5ua6rTExHexRv4hccyTsOC+DYbvI7tUajl
 lp6ow0JGJP8UDm/ySg58DopQBVSeVSy2480NB1KSZqZeaR6OqdmPzw6LYIiTl5ML8Ll/sV
 Uj8jwP5jKtl65em/CVaLV5h4jcVYyrNcMAF7zYzynPyZJpi8movAy/k8H6GZWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VvVsh7pO
Subject: Re: [Buildroot] [RESEND PATCH 1/8] linux: Only run depmod during
 the finalize hook
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



On 10/05/2026 21:38, John Ernberg wrote:
> Commit 82e765640095 ("linux: Allow modprobe for out-of-tre modules") added
> support for running depmod as part of the target finalize hook.
> 
> However, it also originally set DEPMOD to /dev/null, a hunk that was
> removed upon apply. The kernel depmod wrapper script uses `command` to
> verify that whatever is passed into DEPMOD is known to the shell.
> These days if the DEPMOD tool is set to something incorrect the depmod
> script will just warn [1], but there are trees where the depmod script will
> stop with a hard error. [2]
> 
> Running depmod as part of out-of-tree module installations causes
> unnecessary files to be generated and installed.
> 
> Since we're already running depmod in the finalize hook, stub this call to
> `true` as it's definitely a shell callable, and it will always succeed.
> This is what is done for other packaging scripts in the kernel tree. [3]
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/depmod.sh?id=914b087ff9e0e9a399a4927fa30793064afc0178 [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/depmod.sh?id=934193a654c1f4d0643ddbf4b2529b508cae926e [2]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/package/PKGBUILD?id=8bdd53e066012bed431667393676d1b5e8cce153#n70 [3]
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> ---
> 
> RESEND:
>   - Forgot to subscribe this e-mail to the list
> 
>   linux/linux.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c61089bfe0..3c7ebe7e9a 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -164,7 +164,7 @@ LINUX_MAKE_FLAGS = \
>   	CROSS_COMPILE="$(TARGET_CROSS)" \
>   	WERROR=0 \
>   	REGENERATE_PARSERS=1 \
> -	DEPMOD=$(HOST_DIR)/sbin/depmod
> +	DEPMOD=true

  For a moment, I thought that this meant that we could remove the dependency on 
host-kmod. But of course, we still need that for the call in the finalize hook.

  Applied to next, thanks!

  Regards,
  Arnout

>   
>   ifeq ($(BR2_REPRODUCIBLE),y)
>   LINUX_MAKE_ENV += \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
