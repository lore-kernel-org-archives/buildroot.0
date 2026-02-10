Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BFBEB26E0
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 16:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D03A740565;
	Tue, 10 Feb 2026 16:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjsKSS-MWb7v; Tue, 10 Feb 2026 16:46:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B8E74043A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770741980;
	bh=doLGlfu+5BrNkafqSLVYF+niPTdL65k9lpmoh8A/Ql0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ge5OP9emg7ZzqoXUZXckZpPQac2pF/51gx5ZvSKVXPwQqzi898ImJW1kOqdmLjbY2
	 f/XrviBCSLM2xWcoQJvg0OFTMBjJvRle2xU5xaOf1Dx1maZEWhkOvgx8PcBcnXMBTc
	 xkIMcUao7G7FpCK0T2eLtJYwvANnCoc1f1Er1pDM/3r7iZL+GNzOtjL1HTDGKnRUIA
	 BGT8EW0XyoJIRia461t5A9Wc4CJO65xx4mFip6vECGB2KbuGsngPTs55linsl7nQkf
	 Fv/en4rFum0lsb1BB73YTwp1n2ZG0HPQy3vK0E5OSew2YB8+WlD+R8oO+qacpEW9Vp
	 whdAvK9Efiidg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B8E74043A;
	Tue, 10 Feb 2026 16:46:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E3EF2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB32D83D7B
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSeompGN8utq for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 16:46:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF1FD8121C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF1FD8121C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF1FD8121C
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:46:17 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 935C22C801B0;
 Tue, 10 Feb 2026 17:46:15 +0100 (CET)
Message-ID: <8f34f44b-d1de-43b9-bec6-2f162dedb076@bubu1.eu>
Date: Tue, 10 Feb 2026 17:46:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260209195320.368734-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260209195320.368734-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770741975; bh=Ewuko0s1xUk3rGeQdz2ccL7WuuB5pha40lswfQVGLTM=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=jms0D84tbP2fwhiCWsqQt6f4j+HBbf+CGkeZEEDuVtlPzY+NlVxxI/bO+7C7EksSO
 DbCe3XB3gmpE+hzG0NGi3U2aqBhji3P8xzMpgSS5GuHAT+kKP+q0Ysg3OwaO3cqz6c
 K/xiJg+c+yv+wS7xvTYUidv3wZzq5TAIxt2zXpBTx1oS+GtUhRujms4G77Y+WUiUXm
 LnB7+vCvywk4Hy7FBtulPy5bHp4xylsiS09n79kWPz+uXM6kN8IGmD1971pantAnE3
 ecrTzyz83waAVi6mC7Z/Vqnp5PvrvhUa0MdFhYRXSgnI0GyEEOGxjab3UUSvflWhAa
 gmYhKmAQI9wZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=jms0D84t
Subject: Re: [Buildroot] [PATCH 1/1] package/make: fix build with gcc 15.x
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

Hi Bernd,

On 2/9/26 20:53, Bernd Kuhls wrote:
> https://www.mail-archive.com/bug-make@gnu.org/msg16254.html
> "GNU Make avoids importing Gnulib modules, since it will make
>   bootstrapping harder.

I don't think this part is relevant at all to your patch, right?

>   [...]
>   So, you should be able to compile with -std=gnu99."
> 
> Fixes:
> https://autobuild.buildroot.net/results/e92/e9250f1bdbbd7c65a8bd108f32ad9eef73a3eacf/

I can confirm that, but I'd ideally like to understand what's going on 
here a bit more. The failure seems to only occur with gcc 15 and musl 
libc. It builds fine with gcc 15 and both glibc and uclib-ng.

Could you try to find out more why this is specifically a musl problem?

Alpine has a patch that looks relevant as well, but unfortunately 
without any details: 
https://github.com/alpinelinux/aports/blob/master/main/make/getopt-gcc15.patch

But maybe a version of this could be submitted to make upstream to have 
it fixed on all C libraries?

Or maybe this is the correct fix for now, but still we should find out 
more why this is only happening with musl.


 > [...]

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
