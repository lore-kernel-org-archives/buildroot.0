Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8410ACD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 12:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81DD960E1E;
	Wed,  6 May 2026 12:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAFX0IXLJ2BJ; Wed,  6 May 2026 12:43:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D287260E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778071410;
	bh=Zti5m9/nrlwfUz1ViP1BJoPD9cH7sqbLHHXVqseCelg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Wicn5R9GUXPan4kfax+InWAgT1aLuBXUnp989a2YKRHoROqXCgTlvwffIMIb446BZ
	 b1jiLDoEUwW68FZusaslKi7X9wmR/MpVlxUWm6uIDtgav/b1o7CKalZKN/leO5G49R
	 6I95Wirc639k+Dr4tlyAiSTJRPrU7K0peAQXncZf0vkJSItYBZnkx2AFRU63tnECbo
	 +hCRv2LsnYiZq//AYpeINtyCsML/nrgN1vfVGRgibJGCzJc80eEJ4kbq0qAca+yrn/
	 ApxC5EeVyLs0s6KJVMcFgXL7bcJ/eBhreG8QSqEHR5Rjw7txcTMPz1qfZsZgrGkhMh
	 aaPcKsLScEIdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D287260E0E;
	Wed,  6 May 2026 12:43:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F398511B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F10CC60E0E
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJeqE_GC_l0x for <buildroot@buildroot.org>;
 Wed,  6 May 2026 12:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 264BE60E0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 264BE60E0C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 264BE60E0C
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:43:29 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 0E4D92C84123;
 Wed, 06 May 2026 14:43:27 +0200 (CEST)
Message-ID: <81e78054-aabb-4ec5-8a17-ec9f544f91bb@bubu1.eu>
Date: Wed, 6 May 2026 14:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260418160953.958739-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260418160953.958739-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778071407; bh=2R6bDs0CuddK8icqw/QdHT7IGUbh+ChlbFM4QBaogr4=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=dyoET6YTvYcgsIU32qpfsPYRYcaVZKRyJCD1ZWp4bIEEqAz0ppgJ1VKTxiOuSnK/u
 UXz3e7lbkV0nzt4VqqXwRtL2GHYG2zVlluYtpbr+qhA/w5L7ZRbGawsd/9d/9TcvHT
 3ifiBVzHyDtQq3vkQlEZlW/yL5+JM90Anf8hM5eUg/lpI7lzUlc8GZjhrHzqlIZJgn
 J6TGWq5YFxtxe6yOGp8oBSwOeF5pquRrMxpQEtfgDZcFr6/c6gZVBb6Ueth9v8mJ5z
 gVHrLIcfU1GuSnZPAn54ecsAuldQYccCG7Qf4knegqK9X/H1DDd23HqQ+uF1cZBMD0
 AjdqStE4bKnAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=dyoET6YT
Subject: Re: [Buildroot] [PATCH 1/1] package/opencsd: bump to version 1.8.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/18/26 18:09, Julien Olivain via buildroot wrote:
> For change log since 1.6.1, see:
> https://github.com/Linaro/OpenCSD/blob/v1.8.1/README.md?plain=1#L365
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
