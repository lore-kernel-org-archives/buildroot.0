Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F32CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 956A6409D3;
	Mon,  1 Jun 2026 19:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCeQsrdTGNFj; Mon,  1 Jun 2026 19:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5969F409BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780342287;
	bh=xKoT0msKj8fNVXetueME4cKQ/a+20eBhnDoAXcVXCnE=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fgzC/XuTx+J06bTTf+eoPTeNhPm08uutCX9jSsHAn7n8o7guHVnNzJHIoCa4IB1Ty
	 1dyC7moGySXwppv3h5tdObLg8qld94DaPZ09+9YUq8z7MgmQIx8W042opGSikc4J/S
	 UdUEdDI0gjEiLHRNaDsFF5iAZ7KW0F6JAdqaIFgTuulOkVhffuQ+Xx/CnkzwDKAzfn
	 TR/8wbU3TJoa/J5GKf5LrTfQJMNHc1hYHAOz2CjJf27KRolKfitxaaIQ0XrTd4SRb+
	 RO90ME6OcXeb+Atbclwkh8OEL9fiApUmJV7UvjOf9A39Y7h8HnHhPrHj+kqkZ8klJF
	 wHReC96O5iUng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5969F409BE;
	Mon,  1 Jun 2026 19:31:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C21F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 173DC810BA
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzXQEzaiH4_6 for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:31:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 183CC810AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 183CC810AF
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 183CC810AF
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:31:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 18AB0B97C76C; Mon,  1 Jun 2026 21:31:22 +0200 (CEST)
Message-ID: <2215c159-8dc8-4fbe-a061-315848517d6b@rnout.be>
Date: Mon, 1 Jun 2026 21:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260601192855.1901119-1-arnout@rnout.be>
Content-Language: en-GB, fr-BE
Cc: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20260601192855.1901119-1-arnout@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780342283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=lL6w/5V+a1ue5+FFq3hHHx/yJ8f8gbIP6g1CiX5rwgU=;
 b=gNBfzp91pDtJF4jNQ+FnHrC0vcwKijDtBaPTkXc/VLcQp6U5aJkQVxf3nJbYiZ7yA+padm
 PjeeVFDB5yYOfFelxtBCF7ioZm3Z5GRl1Ua8Kv3XNFDLx82SaOv+ar6QSNz/B/SZ1Aaw8B
 B5f7OLBIB03+O+O9M+dgv7pFHewo8QrUhoAJtWMg+bzURLLYcZ45r5P/1/E4+ugIXjprdL
 LlY2mceFf1TcdqBj83bPm3t+2hWngj5w9CsK62xvFKV/WV9T6BBuOVmYJn37n+peZbNk+k
 3DV4iU2z9yX+W94B9kekOx0GvomN4YRJRWP6lSmgQs2CabOgnB0MzmtD4tGdUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gNBfzp91
Subject: Re: [Buildroot] [PATCH v--cc=Romain Naour <romain.naour@smile.fr>]
 support/scripts/generate-gitlab-ci-yml: use large runners for defconfigs
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

  Looks like I'm still tired, but this time I just screwed up my git-send-email 
command line :-)

  Regards,
  Arnout

On 01/06/2026 21:28, Arnout Vandecappelle wrote:
> defconfigs are very unlikely to successfully build on a small runner
> because they build a kernel (and often a toolchain). They're also likely
> to benefit a lot from the additional parallelism on larger runners.
> 
> For now, always build them on large runners. There may be some for which
> even the large runners don't have sufficient disk space or memory, but
> we'll solve that when it happens.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
> ---
>   support/scripts/generate-gitlab-ci-yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 2a8c9be5f5..48c272e6f5 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -126,7 +126,7 @@ gen_tests() {
>   
>       if [ -n "${do_defconfigs}" ]; then
>           for cfg in "${defconfigs[@]}"; do
> -            printf '%s%s: { extends: .defconfig_%s }\n' \
> +            printf '%s%s: { extends: [ .defconfig_%s, .runner-large ] }\n' \
>                      "${cfg}" "${defconfigs_ext}" "${do_defconfigs}"
>           done
>       fi

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
