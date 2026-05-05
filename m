Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16887CD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C708881BA8;
	Tue,  5 May 2026 19:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxSPALvzwlNY; Tue,  5 May 2026 19:51:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE48381A29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778010662;
	bh=MZn1QcKK2IPwaKn5/LGXy/WuWG/x6kuV2WqiDoGQCHo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XI/0os0il1HEbCZ4DyCULgsbj2kt8PnLMPnKxHXygGmDU5bZ45FSJP36ySRhl5zt5
	 Jvjalmk+mLwdbGHBZGO0oN0Ma8NFqCWmrQPHVvQVpLf/lDxlVh7BARpexjwaU9jAYD
	 tsBJSe3GE/dVM7Vrg+SiJyvZQwCJPzguTyVG/htpJkPtm5xkoPvRwQRdWcileuoOem
	 ZO/GQwaJ+BzGJmiSl7AvnsLNbimajOAi1oFKkeGgiZXPp7xHpctV0U7kk0BYdLIk6B
	 mgI8uLTCviGJimnczRF3i81slOmM7k7hvxPb6f/NAUFkuGc4JFbmqEBiyBCdSDolQl
	 bVRBOIzc/bYBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE48381A29;
	Tue,  5 May 2026 19:51:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4150E2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 266B440A4F
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIe6pN_ozZqW for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64E8B40A43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64E8B40A43
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64E8B40A43
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:51:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F894B97C07D; Tue,  5 May 2026 21:50:58 +0200 (CEST)
Message-ID: <0120df7b-8c50-4052-abbe-e7efbfa4930c@rnout.be>
Date: Tue, 5 May 2026 21:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
 <20260426153334.1026982-5-fiona.klute@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260426153334.1026982-5-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1778010658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=q/EmQ7R6EPXL/dBYHhOoAyAcpE+zUpmdx0KR5TGlZOs=;
 b=VjGOJR0gmoUSp6TaUMoZ83d1FUD9LeYSJzqwVAe6eUs2jZiJD456JeC6OSdX34gOBas1c8
 cGAcdCwMpdUCwctrcFyAhEzW9UG3QJ3HCajmjSvMmMInm/c3p+pmMMdkpm5PqH6Peh6wKH
 3m4112j4sVDbh7LTDyUaJOkofYuznkpYMUbLHF8jEaF8Rl/jH65ELfGkie95PU/72XRZN0
 xWFjK08jsLIPjCwXTryMqngYvSAuvhBDF7JgtaYijDYJjBQs02/rd9fu53slPupfXAs0VJ
 GV8mbWg5JR0G9gQs+Rg6ag+mn63ozETwJdsxRH4ziqEn456l2JKP291QKHS6Ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VjGOJR0g
Subject: Re: [Buildroot] [PATCH v2 4/6] support/scripts/pkg-stats: fix
 host/target infra filter
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



On 26/04/2026 17:33, Fiona Klute via buildroot wrote:
> The filter is supposed to exclude host/target infra from output if the
> respective package is not built with the current
> configuration.
> 
> However, excluding host packages did not work correctly: If keep_host
> is False because the host package is not built, the next branch was
> checked and included the host infra in output with "target" type if
> the target package is built. For a package that support host and
> target build, but gets built only for the target, this leads to output
> like (Meson example):
> 
> meson (target)
> host-meson (target)
> 
> Skip host infra in the target branch instead. Also include
> Package.infra in Package.__str__() result, which was needed for
> debugging this bug.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

  Applied to master, thanks.
  Regards,
  Arnout

> ---
>   support/scripts/pkg-stats | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index a87bb23a8e..bbd1e3e6f0 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -205,7 +205,7 @@ class Package:
>                   infra = match.group(1)
>                   if infra.startswith("host-") and keep_host:
>                       self.infras.append(("host", infra[5:]))
> -                elif keep_target:
> +                elif not infra.startswith("host-") and keep_target:
>                       self.infras.append(("target", infra))
>   
>       def set_license(self):
> @@ -342,9 +342,10 @@ class Package:
>           return self.path < other.path
>   
>       def __str__(self):
> -        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
> +        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d, infras=%r)" % \
>               (self.name, self.path, self.is_status_ok('license'),
> -             self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
> +             self.is_status_ok('license-files'), self.status['hash'], self.patch_count,
> +             self.infras)
>   
>   
>   def get_pkglist(trees, npackages, package_list):

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
