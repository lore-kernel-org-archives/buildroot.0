Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AF4FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 08:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC5886136C;
	Mon,  4 May 2026 08:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fygVzWK2P5hV; Mon,  4 May 2026 08:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BFD861348
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777884113;
	bh=0fP+VrV+X7oqQv9gR/jDA83eK3G2tBkHwuOPMoFpnCA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J1WhRmIfS9hyd55XNnOjtQc7AwkUM+wbwi+TPsUVmo/ui1mNSVxGC8XG1WOrPhSg4
	 IzhDc+iq5SLzgBC2xxsmUOUl8VhqPf74FgEBMq+fZgMybBPKE8qsMMMUA0LSfZwLUl
	 F0CF+0s3SOsL7tRe4WnW+B/CiMndZTFxfIxCCYbL8TF4o1gEiQDVbzru3laI74oOO4
	 ro6g1iEY8/XZlyX4gWeBEKA8awzEOQBrlqi4DVLZDeXFl4FElIMR9ALMjluq74Eqm3
	 Sqi9G7L2qZzgSLcig5AJdqByx/f/BUZXKggT46ckSDYsqDT7rTacUxPgV0f5IsbQMl
	 lqgZzE7HXu8jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BFD861348;
	Mon,  4 May 2026 08:41:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 726AB190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 08:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57E1E84478
 for <buildroot@buildroot.org>; Mon,  4 May 2026 08:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jjkj_hKQ8jNQ for <buildroot@buildroot.org>;
 Mon,  4 May 2026 08:41:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6994684419
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6994684419
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6994684419
 for <buildroot@buildroot.org>; Mon,  4 May 2026 08:41:50 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E867E2C833E6;
 Mon, 04 May 2026 10:41:47 +0200 (CEST)
Message-ID: <1f7507c3-beee-4243-b62f-7e6ddffa5311@bubu1.eu>
Date: Mon, 4 May 2026 10:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20260430183544.2362642-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260430183544.2362642-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777884108; bh=Jhqen6dQSUlGVmyox1j8TKfZvc3ZzrkCGplXCGrnZxA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ukuPs+TAmN3DzP48VTxImdfsPOUGyXWJFXDbhmtuJ5Ug7eUTukIiQn2OYOd8HsbYf
 LPdOVRugXB+KkhxKcLxtzLcoVQIO+9PoOKyzS/Cg2+hNL1cUmEtgKP+Pg/uZaWrkvz
 KLP3ZQH9DkfTSq+MjrtzuGJczQb68M4dQWOmijMrDoE2Dm2PDzU4bKOgtKRrKRF04J
 fyX9IMRAJg427oaDM0H+0szImXbk1OHQA5s402k/3YzYO4UEroyKb8MFWd7WN4fFxP
 jHCpRXHSYaujybTUiGBviixw+8N8N77SQKK2EIskVmPoonrucvMhyY0Ucl91i/NCbv
 qrpDKU/Tvxg9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=ukuPs+TA
Subject: Re: [Buildroot] [PATCH 1/2] package/libpjsip: enable parallel builds
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

On 4/30/26 20:35, Bernd Kuhls wrote:
> Parallel builds were disabled in 2016 by buildroot commit
> 781ce19d746efb6a5408b4d50b30626784eff324.
> 
> In 2020 upstream added two commits which fix parallel builds
> https://github.com/pjsip/pjproject/commit/ddf48e2045fa155ef5242d9d7dcec27f8c5ed873
> https://github.com/pjsip/pjproject/commit/78683646c8bc670ec730a42494e075f671a08e28
> to version 2.11 which was added to buildroot with commit
> 2c7ad667ec4a25226848baba809e492ca0ff06da.
> 
> Tested with -j100.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
Series applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
