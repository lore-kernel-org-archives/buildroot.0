Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A0DCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 16:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2BE583E0F;
	Wed,  1 Oct 2025 16:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nc3s7xNzIHd3; Wed,  1 Oct 2025 16:13:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F272A83DF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F272A83DF1;
	Wed,  1 Oct 2025 16:13:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF027E26
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0CBC6134D
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cS0aKf65wcx1 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 16:13:52 +0000 (UTC)
X-Greylist: delayed 566 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 01 Oct 2025 16:13:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B79C76128D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B79C76128D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B79C76128D
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:13:52 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:a14e:ad95:d6a9:3433] (unknown
 [IPv6:2a01:e0a:12:eba0:a14e:ad95:d6a9:3433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 0320EC3AD6;
 Wed,  1 Oct 2025 18:04:24 +0200 (CEST)
Message-ID: <15f12d6e-87b8-4faf-bbe7-8da6bc440015@grenoble.cnrs.fr>
Date: Wed, 1 Oct 2025 18:04:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dylan <ohitsdylan@outlook.com>, buildroot@buildroot.org
References: <36eaf2d2-2da7-f000-4851-c1129a701b13@heine.tech>
 <PH3PPFC54E34861A59B7681B6056310CB5ACBE6A@PH3PPFC54E34861.namprd19.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <PH3PPFC54E34861A59B7681B6056310CB5ACBE6A@PH3PPFC54E34861.namprd19.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1759334665;
 bh=gagaVEprowy0v9sNqM+dY6DtmLaZOCW1LNG9gkD+XSc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=eZMbqj2OCMZ3M9Dq7ITs6k2tuYv5+L6ltznLXv7gO/dnq2ARymyyNrNx6Q72IocTH
 mAxTyRdg1gbTFg2gIvjINxWQSR147q3Uf7V9byZo5nW0IDxzOVDDYWgI/hsvCOP/Q6
 7dFiV49Njfs3KWkZjeFDsoISTQFrwtSgSV/5t3r1mugWJuLgdxad9WfdxbAFOnVDkW
 CgbSbTjLIRC/vCGQNqSJR8nFQlZdBvY7WNADiluZuFxzX7SAh57ozNZhh7ms1FdupT
 1r+D/Do9+chr5xLPX+NDDAcut3wTu0/Nj6UnpSBBfFAUAdxVEfmtCRvTjLef9quiVF
 FAv8yS6vMg2GQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=eZMbqj2O
Subject: Re: [Buildroot] Issue Applying Patches to Package
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

Dylan wrote a patch that starts with:
> --- psplash-config.h   2025-09-03 15:01:21.282531766 -0400
> +++ psplash-config.h   2025-09-03 15:10:18.445116066 -0400 

and results in the error:
> can't find file to patch at input line 3
> Perhaps you used the wrong -p or --strip option?

I think this is a good hint. The script support/scripts/apply-patches.sh
invokes the `patch' command with the option `-p 1', which is arguably
the most common way to invoke it. Try starting the patch with:

    --- a/psplash-config.h
    +++ b/psplash-config.h

Note that this is what `git format-patch' does.

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
