Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055CBFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 13:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A848457F;
	Mon,  4 May 2026 13:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFPWnMj7V6Cu; Mon,  4 May 2026 13:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E896984508
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777900678;
	bh=4VLJWV7eqh/PG4ycfSsT+Fr8cGFlKEe9qEStvu2X8TU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=BIoyT7VMmpXIOCPUloVZaFTxXl6MbjBWZVGJIGo0lz2aqKRaUcEMU1UxV/nzhUKAb
	 2CU1r/nqYa2fQi1ZZBNjA/UFCLP4FCdX+EJhB356Dqj+w3A8zsyEQ4rDOkPWiHOPQI
	 8AGHXEGSOr1IbC8FXB7gPhZ4EtO/1k1tcjR2HOU+Q2SwXsCfQ66H8yhFHRaHhZ/yOr
	 qPEyEXGdLifVhajKr4ZoyAbtBJ6oKn6Pefa2w2r1hrkUs5n1+Z7kRNok06odnCrIkg
	 SLK455M7Ibs9zFKcI88reMdM1Bhb77RbLeSMk67SMOSx5KSXbrnjFga/7spDOe2OQP
	 ZOaLecOwlhsMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E896984508;
	Mon,  4 May 2026 13:17:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 105FB190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 13:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9E1284508
 for <buildroot@buildroot.org>; Mon,  4 May 2026 13:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whRRsAWNblxy for <buildroot@buildroot.org>;
 Mon,  4 May 2026 13:17:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6F66844CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F66844CF
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6F66844CF
 for <buildroot@buildroot.org>; Mon,  4 May 2026 13:17:54 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9D0082C833E6;
 Mon, 04 May 2026 15:17:52 +0200 (CEST)
Message-ID: <7fccec77-1b27-4404-85f6-910dafd17aeb@bubu1.eu>
Date: Mon, 4 May 2026 15:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Houck <Software@DRHouck.me>, buildroot@buildroot.org
References: <20260503235637.637991-1-Software@DRHouck.me>
Content-Language: en-US
In-Reply-To: <20260503235637.637991-1-Software@DRHouck.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777900672; bh=90oCDHsl9Aj/R1S337y2Cgg3689ysiRcUNN1Z7YRYt8=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=r5+IFeo7y/wn/P3GUyvJUd6nymznvrbGALgJamHYS6tb7b/OX4uXtRcNROumssF8Q
 emR2yuONV6XL8dS0sz8Jh2YfNetpkkN9/USIcBnVFnxnQmU+MXWwmFEjvfUec88lBw
 UHbxLtZaBVtLcqxoXk0yQcRp8YUTPg+/WHLmZsTfOBgfR7rn87myXRtJuoIBvn4ELG
 v2BwiKFE7xLS1LbpA0dIdCKi7rYVmjMNWwOq54ly9Ojk5RkAQdMldTOkSl62wOfDLv
 l2Sx0LSz461N6x/cKgum7YJLo8L9Y+TVA7oEQKdm/YpzEfm9K4XscMg76I623QKjQP
 8Wm90kkEiw23w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=r5+IFeo7
Subject: Re: [Buildroot] [PATCH 1/1] package/make: fix build with musl and
 gcc-15.x
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

Hi Daniel,
thanks for the patch.

On 5/4/26 01:56, Daniel Houck wrote:
> It builds fine with glibc and gcc-15.x but conditionally includes code
> with musl that fails.  See eg. commit 999fb19d4b.

Alpine[1] and Gentoo[2][3] have a "proper" fix for this (meaning the fix 
the offending code instead of changing the std level.

There's also been a submission to the make mailing list[4], but without 
any reaction and only containing two of the three fixes the other 
patches have.

I think this is the better solution, even though it means carrying a 
patch until make eventually might fix this upstream.

I think we can just use the gentoo patch as-is I think? What do you think?

> 
> Fixes #176.  See also https://savannah.gnu.org/bugs/index.php?68302
> 
> Signed-off-by: Daniel Houck <Software@DRHouck.me>
> ---
Best,
Marcus

[1] 
https://github.com/alpinelinux/aports/blob/master/main/make/getopt-gcc15.patch
[2] https://bugs.gentoo.org/945968
[3] 
https://codeberg.org/gentoo/gentoo/src/branch/master/dev-build/make/files/make-4.4.1-c23.patch
[4] https://lists.gnu.org/archive/html/bug-make/2025-03/msg00032.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
