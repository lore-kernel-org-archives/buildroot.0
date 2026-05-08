Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B305CD342F
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 19:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9781F61B47;
	Fri,  8 May 2026 19:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAkj7LuQ_4iC; Fri,  8 May 2026 19:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2198461B40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778269099;
	bh=cya0p5/wNzZnJHpiwUW5qAJ3/DV+UrI0Rg9qY2FTPOQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=USLP22BxewHO/XGRwNtkkzA/urHcOzHhDmgZwhevFI30V2KS56SR28k43Y5LmhPcm
	 Wmh1hQJsKkupKujP6diaez+DcxOkczpiddX3dUwXGaDa0tj0Ri2zESESKBmuFlznbj
	 dVkxpWWSeb7tVVVQCzJfQMv/rDiaKo0ry7OCYMqcy4DLrIrtoMu4SITG/JtHqhazDX
	 3CoNnic8f986qpSGqRDJ/weQ64OG7vbGydwyWTAKTSUd0hKtsWTnAeLCUKwS1G8qSf
	 Dp4F/6JDUyCZcuiOLdvme7XR7KwPuHL6iQ3l4Cro7dhU/Fhcpn7j4czT+fSWMq3ghK
	 OluWUHpQekDHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2198461B40;
	Fri,  8 May 2026 19:38:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42E13272
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22E6441F85
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbqoCuOsHDhU for <buildroot@buildroot.org>;
 Fri,  8 May 2026 19:38:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C08C541F7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C08C541F7F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C08C541F7F
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:38:16 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 2675F2C88F1A;
 Fri, 08 May 2026 21:38:14 +0200 (CEST)
Message-ID: <c7946090-e38a-4eae-9b93-e8054058aeea@bubu1.eu>
Date: Fri, 8 May 2026 21:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20260507101111.40390-1-andrea.ricchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20260507101111.40390-1-andrea.ricchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778269094; bh=t7crpktiDQYY41hoOTRCvtuS/VnMfr3shsKvvcncoxw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VvCocWwC1sF1UkyX3V0aVRFcfSjB3stjT95kAVuOLaQiYRQft+MBPNk/GsS+FhCu0
 3MxautBp7WrKrrrfBmaAhKIQlFd3RhOjXZgoAMFQWY0rl31KU77pxQMNt6KMEetNMG
 vPwhblamu0t0HZ5QrElaXMM47+DlXyoGQmU3xqoD674Vt7PaJGSxFd54g1aFqdDndS
 JGtxlM3Q8QkUu1AK0rKt8Zp/hf9NPT/lUneJRfXeYHcTrmNhmKTPUonbWSW/6E8bia
 AE7+6yJc3S8KokNYo6XMooqVuA8CrpI2k/T5cKprZOhfdTmeg7CNkH4hhbcFanxZdb
 qN0dSJIwR7Tpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=VvCocWwC
Subject: Re: [Buildroot] [PATCH RESEND 1/1] package/cutekeyboard: bump
 version to 1.6.0
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

Hi Andrea,

On 5/7/26 12:11, Andrea Ricchi wrote:
> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
> ---
>   Resending this patch as it has been a couple of months since the original submission.
>   No changes have been made.

Comitted to master, after adding a link to the release notes in the 
commit message, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
