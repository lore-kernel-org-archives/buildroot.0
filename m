Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B47BCD4F3C
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 07:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F44342C05;
	Mon, 18 May 2026 07:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKZSWkoAGbM4; Mon, 18 May 2026 07:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DA9142B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779089531;
	bh=nLNNno9u8XKF+oFpB1YwjBHqtnnuTMLGvnBKKcwXzM0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=sMsIUyA8ETnIOVG2h6ZIvkMjMtn7Ft9vSNkzhMR1h4eCgohEWMJHM2dNkneu4bBLK
	 UlMbJ7gn2d4Za1s42m5TR0ODndU86V6fHCmL+bY+YLTm9bVVOQHIjVjrsybbRtwFyP
	 BJOXINL1Y+nMHFgqlJjm9vbdye7RDrV4J7JJiL/nWDD5+pWuegq6uKxcgEEUiP1fnR
	 LBmQTtxuv36XgEUOKtFGPrx+pAhxPXcBtBM+ZQRmAVf3rf2pVXOE+rzKGvpomV26gd
	 LRNcqwDnC+hbGhf7p3MNNS7LlzM0VR4PUqXqmW9Cg8Azl3w/AY1y9V070XxtOBd2gl
	 dg+E0HUHg5FAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DA9142B7B;
	Mon, 18 May 2026 07:32:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7309E265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58891408EC
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hz9_N6Tefo3 for <buildroot@buildroot.org>;
 Mon, 18 May 2026 07:32:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49CF1408E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49CF1408E3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49CF1408E3
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:32:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1087CB97BB03; Mon, 18 May 2026 09:32:07 +0200 (CEST)
Message-ID: <bd63b2dd-bb3b-43db-a057-b7348eeb35d6@rnout.be>
Date: Mon, 18 May 2026 09:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260517213626.3730308-1-romain.naour@smile.fr>
 <20260517213626.3730308-3-romain.naour@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260517213626.3730308-3-romain.naour@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779089527; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=6BH+Sh39bfZywJwno2qb1psnszsXYnX2IlJ7wlmtioU=;
 b=Y2Cx9LxCf+L4bNwMF4kvfbbZ8IgcEvKkrxqwJ+7oan84y1vnsRN0vjWXmRukkZWw4uOpHX
 WPUXcs6mmhMVn/Nu1j+Tlj7jtQPNsFQVSIr4SGpvAAHpgdBQIi8pf5ccvVDtceD3xrolMb
 xM97ZdeVrnD7T6PVsGhCJ/geHYmgw2GWH1pSwkknvnWVHvolLPur7kYHyMli3c+lx9+83Y
 9dVfeIYki0I2NTBbzbRZTTgLawTKLPm6QRdA74T9Dkxc3HAoFi5ES6dfXI9xA0Bdwz/wzH
 hgzDfIo9hJHLGzcc8amA34O4xoPAVEu/3+aiPPcM8zfitzJlvvrOLqv+Q5fQvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Y2Cx9LxC
Subject: Re: [Buildroot] [PATCH 3/3] support/scripts/generate-gitlab-ci-yml:
 generate defconfig jobs with runner tier2 tags
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



On 17/05/2026 23:36, Romain Naour via buildroot wrote:
> Tier1 runners (saas-linux-small-amd64) are too slow to build a
> Buildroot defconfig, especially if a toolchain and a kernel is built.
> 
> Use Tier2 runners (saas-linux-medium-amd64) to not waste shared
> ressources.

  For qt5we, Tier2 is not going to be sufficient...

  Also, can you do a quick estimate of how many minutes we're going to consume? 
We have 50K per month available. Perhaps it's better to stick to 
buildroot-runner for the defconfigs and only do the runtime tests on the shared 
runners.

  Regards,
  Arnout


> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   support/scripts/generate-gitlab-ci-yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 37b927f142..3a0666798e 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -126,7 +126,7 @@ gen_tests() {
>   
>       if [ -n "${do_defconfigs}" ]; then
>           for cfg in "${defconfigs[@]}"; do
> -            printf '%s%s: { extends: .defconfig_%s }\n' \
> +            printf '%s%s: { extends: [ .defconfig_%s, .runner-tier2 ]}\n' \
>                      "${cfg}" "${defconfigs_ext}" "${do_defconfigs}"
>           done
>       fi

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
