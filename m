Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B9FCD5BB7
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 12:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BBFB8133A;
	Thu,  5 Sep 2024 12:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4CRk25L3dpY; Thu,  5 Sep 2024 12:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A6558133B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A6558133B;
	Thu,  5 Sep 2024 12:18:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 779C51BF403
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 12:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A2F8133B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 12:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2CMwUxWshR2 for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 12:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 688798133A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 688798133A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 688798133A
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 12:18:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 55E4113F88E;
 Thu,  5 Sep 2024 14:18:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Sep 2024 14:18:14 +0200
Date: Thu, 5 Sep 2024 14:18:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Message-ID: <Ztmhhq922XUxjUP9@landeda>
References: <20240905094828.1313494-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240905094828.1313494-1-guillaume.chaye@zeetim.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725538700;
 bh=vLmzXw9LTfH33xg1wjnRRMMIm3y+PXIvB6m5o+RSQhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EnLfyPFKD7h/VLDIbPKGVbwnlcWQNkDUCzukq0qitO3gvUuw+1lET1BTR78OW486Q
 mpIdDqf49L7qsU/tjuS9l06o5y2+28qiOV2har5sIxp2eqQbyklNQ/oSJ3eNOptPl6
 rilommIBjsIxkoowaFZew6rOPnvFPRftarme0xVGZq6RFDCnoUAW1kwujsWw4t5tsj
 mH0uUbidLE1C8zjWqJCTtCIZa0GFvI6+Wvt+KqB21Gqcr7gKBNmOCgi8B3qZKsV9vK
 TUYD9mEy7OtulA4Oo8m/Lyq9kojbuYXKaYC+nDsl1CtMyYxd3prWlClw6EbNssNCA4
 vb40VPTqztdFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EnLfyPFK
Subject: Re: [Buildroot] [PATCH 1/2] package/perl-file-slurp: add host
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christopher McCrory <chrismcc@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Guillaume, All,

On 2024-09-05 11:48 +0200, Guillaume GC. Chaye spake thusly:
> Some project like efitools requires host version of this package to build properly.

Please wrap your commit logs t o72-char wide lines.

As is, this change will never be tested, because we have nothing in the
Buildroot tree that depends on host-perl-file-slurp. 

We ciurrently do not have efitools packaged in Buildroot. Are you
planning to do so? If so, then please include this change into a series
that adds efitools.

Also, I don't think there is a relation between this patch, and the
folowing one about systemd, so don't send tem as a series.

Regards,
Yann E. MORIN.

> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
> ---
>  package/perl-file-slurp/perl-file-slurp.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
> index 0d4ab94034..7cada58070 100644
> --- a/package/perl-file-slurp/perl-file-slurp.mk
> +++ b/package/perl-file-slurp/perl-file-slurp.mk
> @@ -12,3 +12,4 @@ PERL_FILE_SLURP_LICENSE_FILES = README.md
>  PERL_FILE_SLURP_DISTNAME = File-Slurp
>  
>  $(eval $(perl-package))
> +$(eval $(host-perl-package))
> -- 
> 2.39.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
