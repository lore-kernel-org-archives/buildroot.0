Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1F1EA71AA
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 21:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3895E6100D;
	Sun, 19 Apr 2026 21:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcWC6km5muuw; Sun, 19 Apr 2026 21:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83AA061002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776635286;
	bh=IodClfVXpy9Ce0NhJ26kfAGKo9meLM654yfZnw9a8Ws=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VG2dvhlFRMMlHmCuGJfpypz9DDH55VsWgtKDnQ+9wT/bH84qBPQwey9EUpKvjeiqw
	 EWpY+MhkNdSbAxbPeOiYnQR4t90P3sQ9wHUqNF+h4Jvwvm9MBKllgk0/rNX6XJQeKL
	 KGzbeb18dlbe30gsTix+/g2UVQWpkhAFHOkiysybgaazrLlV4UzNAuEXuNi0DmEuYl
	 PabN8FNiiSNCfRNa3jRZKv+hkG8TBnv3Q3ftJAPopKVYmvicyyzIbo29faW+2zkoK6
	 qQOY8p5Z+ILJBOd1GMO3gtHw4C89ypJrcXBfqXcTJFtA4o1In83385/1WJHv6DyXsH
	 F/NmGBruE6ZSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83AA061002;
	Sun, 19 Apr 2026 21:48:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45C802B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36E25404A6
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8HTPnp5MCzX for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 21:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65DF74041C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65DF74041C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65DF74041C
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:48:04 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 651432C80C2A;
 Sun, 19 Apr 2026 23:48:02 +0200 (CEST)
Message-ID: <b21a1d77-873d-499a-b476-5db5916d29d3@bubu1.eu>
Date: Sun, 19 Apr 2026 23:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20260418135007.558260-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260418135007.558260-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776635282; bh=94EFWVf5bmdMLmqpiDtbcjBlMjcXgdue+Ji2MomDf6g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZY+uVjymEio6xZTgT72S9dE0ZvWEtsVkHi/Q3c6T79H08r4Lg6Z4rkqHm7Eh1OSDh
 uJWu552XjX0OF8nwaFMZxlPIZ9ANf50TmXIN0+ZYiNHT6s20ez/ItrB+XdvE0JPciU
 cotC8g0J4g1nm+9DGAGVsVSYKFuf83YjtgGD/1hgms4IyicXb4/xNDHqOFY8SysSaa
 oQZABFF/ctBsuHYSjjULW+77T8BAuZNj6Jgb4kXM86vjqxXNiszgeFKr5GSRAxoWgV
 Ah2E5UimmVIzqrmwjXRnMfB4eYChvp8eBi8nGLJJWa4abGoq1OvEoUhIUWyiIiGxif
 aJTx2OO8vp8+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ZY+uVjym
Subject: Re: [Buildroot] [PATCH 1/1] package/stress-ng: bump to 0.21.00
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

Hi Julien

On 4/18/26 15:50, Julien Olivain via buildroot wrote:
> Changelog:
> https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.00

I noticed there's a new BUILD_SMALL option in this release[1] and 
wondered if we should set this when we have the optimize for size build 
option enabled... but enabling it (on aarch64) I only managed to 
increase the final binary size a bit:

BUILD_SMALL=0, -O2:
2867800 19. Apr 22:57 output/target/usr/bin/stress-ng

BUILD_SMALL=1, -O2:
2912856 19. Apr 23:07 output/target/usr/bin/stress-ng

BUILD_SMALL=0, -Os:
2642432 19. Apr 23:05 output/target/usr/bin/stress-ng

BUILD_SMALL=1, -Os:
2671192 19. Apr 23:31 output/target/usr/bin/stress-ng

I stopped investigating at this point as this doesn't
seem to help.

[1] 
https://github.com/ColinIanKing/stress-ng/commit/8e6aad2731d746e1903f0d34104bb2d369cc2fc9

> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>


Applied to master, thanks!

Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
