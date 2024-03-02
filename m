Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD24C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 12:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65C0783508;
	Sat,  2 Mar 2024 12:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x5nRh5gUzEle; Sat,  2 Mar 2024 12:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77ED2835C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77ED2835C9;
	Sat,  2 Mar 2024 12:44:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 413581BF28A
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 12:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37397835C9
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 12:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2w52LdhShmo for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 12:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71B5B83508
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71B5B83508
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71B5B83508
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 12:44:03 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CEB352C83784;
 Sat,  2 Mar 2024 13:44:00 +0100 (CET)
Message-ID: <37b21157-e171-483d-9a1a-e308a8f4c04d@bubu1.eu>
Date: Sat, 2 Mar 2024 13:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org, Peter Korsgaard <peter@korsgaard.com>
References: <20240213105841.2410425-1-buildroot@bubu1.eu>
In-Reply-To: <20240213105841.2410425-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1709383441; bh=WQjP+ETKOOoFGALP9U6xtIqALGPjdJ4GIIfb2JylrwU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=MCqNQOm4PaxKn46oCFWQcSQh7moL02U8lXGfzAGykXlXipmqDnEDbJ3TjDNxVEzIK
 obRI1OLlQu80HLtWJNBZxWsCJ4gTKohI2gG/3P2PPFlruENOrFfud/v4BgihmculLD
 rBLeQHQPdGphRevoSs/0OU1a2FHdadKokVn+2J+wrWIIsM/Z5Y8dRvowqffSkKSBgz
 D6pRudthxdf8NvlH1IfcatkqZj6KgA0A5x8znuwwyPFmY2NLyFadUpBmlFtVbabRKa
 O6Texx3iDIxkiQa13RjsIqI3zOFJJ9P72torsNXKHWeP0zwh7F8aMz7Iklh0ww3J55
 7id3+yjK368qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=MCqNQOm4
Subject: Re: [Buildroot] [PATCH] package/rauc: bump to 1.11.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 13.02.24 11:58, Marcus Hoffmann via buildroot wrote:
> This fixes an incompatibility with openssl 3.2 when using codesign
> certificate purpose [1].

This fixes compatibility with openssl 3.2, so I was hoping that it can 
still make it into the 2024.02 release?

Marcus

> 
> [1] https://github.com/rauc/rauc/releases/tag/v1.11.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>   package/rauc/rauc.hash | 2 +-
>   package/rauc/rauc.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
> index 8de309f8c7..63aa4715e0 100644
> --- a/package/rauc/rauc.hash
> +++ b/package/rauc/rauc.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  a28f415c580390dd9e65016a5d90a63ee1cfd7e1b3e864cbb13cb3ac3513391f  rauc-1.11.tar.xz
> +sha256  391d13d709abb630c459e79e62e474e68224c5d07c816355784bba75a86a2507  rauc-1.11.1.tar.xz
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> index aff5ead281..fbdea4e235 100644
> --- a/package/rauc/rauc.mk
> +++ b/package/rauc/rauc.mk
> @@ -4,7 +4,7 @@
>   #

>   ################################################################################
>   
> -RAUC_VERSION = 1.11
> +RAUC_VERSION = 1.11.1
>   RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
>   RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
>   RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
