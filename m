Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114C9CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D60A142F79;
	Sat, 30 May 2026 20:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6KBvDg6Jn6B; Sat, 30 May 2026 20:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F6D342F7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780172752;
	bh=17gYaZGlmoILKla2jXkgUfeF0+HOJZOTm8YEtzG/XqE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wl86iBn7svOu2e/phRHda6CEC/uANBxTgXKr9/j2EjlpPG1TMiu9AYNItIFRMW+sF
	 HInJbcn0vhumDvQ7si7mirHZ3mJz09Zeer7FB88Pg8w0bxbmakjp9h1zqVz4Of2rxS
	 D1Q9ONQixQk36QNRmVtA10bz8wv23bOGl4jsa54KJmGbjoU/30Lef+170z5eG5k9Yo
	 Dj4S0PE/J+I7tlRsmevo/WbQ/DYVdF2+g0MHjcIbbX3D7k4R2g5nhxei0osBdth2Iq
	 EmExg6t5Ju+ZIO3exr71Q0yi0D/XwtyXHBwHwrIYkypLTb4wrSDozXz/Viw3urTqPt
	 RTnQJWcqdjgOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F6D342F7B;
	Sat, 30 May 2026 20:25:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 100A1D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E91F684A54
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnuc4mdV1Q_I for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:25:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78A4584A46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78A4584A46
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78A4584A46
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:25:47 +0000 (UTC)
Received: from [192.168.1.80] (82-65-127-30.subs.proxad.net [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 509AB2C89063;
 Sat, 30 May 2026 22:25:45 +0200 (CEST)
Message-ID: <37d4a188-3ac4-422d-b2cf-60f896ff803a@bubu1.eu>
Date: Sat, 30 May 2026 22:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20260530201054.2926152-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260530201054.2926152-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780172745; bh=0W3E6659/B0UrVXviNP0Gvoxv55wNUAN7Da2dKAl8k0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=aBmn4SJpx5RfkUxyO6G6AmHSSDk8VHrCryDSgo6ZaPO7VbEkYa52aTgQJd3LxyvVO
 hmPduitPrkzaahX3EiYm1TpnLkjayJam+jUEJHS/VMOaeclVnzn2UrzPLZl7yBYfZ9
 g36U4FX21JnCS5MM6OXnA74ci78iDAhlOFIuyYTuqYXLVZkRUqBy0OJrmhFP5Qu+/e
 bhM9e0WPZZ/RUYTcPrr9i0NE0+vCuFj/VX0K2HuBsDktd1vSJcUeqntuRKboAGgppY
 iP+XjGi3bhEagpr9m+e6kwvFU8iFeMQvs0SNyILeQ7/dzDrY9Tj9WGJcZj3rnn0mw2
 viMZHurjFABBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=aBmn4SJp
Subject: Re: [Buildroot] [PATCH] package/liburing: properly handle VERSION
 vs. SITE
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

On 5/30/26 22:10, Thomas Petazzoni via buildroot wrote:
> VERSION should ideally contain only the version, i.e 2.12 and not some
> additional prefix like liburing- as it prevents our logic matching
> against release-monitoring.org data to work properly.
> 
> Fixes: d2ed4565321c74772014681ca5ddcb433162e468 ("package/liburing: bump to version 2.12")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
