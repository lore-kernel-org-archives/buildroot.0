Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7721C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 12:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FC0440563;
	Sat,  8 Aug 2026 12:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtrs2kewYnfT; Sat,  8 Aug 2026 12:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BC384051D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786190780;
	bh=ZaPcweHj9HPXO89MRO+bm+btz6O1Rur1ydH4pTF2HIU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=py9kRup7pGjBURz19Fs4TpachpVg3j6p+0BF7/v/JMoWZVS0IY9k3r9M36cj/Lpwp
	 De8rX6B/TKg5ZpfLlUU33ZyMHmqWJWuFqDKAxqOPOel4ExKJRdWfWKXSLp2uiiOZVf
	 2gbsTL8O5t71K+/jZFNuinbpH9TIbVU+QI1+zmx+LtyW0SKMnBp/k2qrFZ5yjaHmnL
	 h++yTTESHDgLPn+goPEip0aA9GhE8rH0z/Ie2u1XH8shYnlWA0jYyD/75jvp5OeZSG
	 8aNOf4SiN6MbsswXLYu6kknkeCFNG4kJbpckw89PY3CyULOXUrMpRG16QQWDqjXDIO
	 RgxiFmu3rMD5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BC384051D;
	Sat,  8 Aug 2026 12:06:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24F98282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 12:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AA7B4004B
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 12:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fjOSuFhKfm4 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 12:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA56F4011F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA56F4011F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA56F4011F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 12:06:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0E753780502;
 Sat,  8 Aug 2026 14:06:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 14:06:11 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 14:06:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260808103632.3547378-1-bernd@kuhls.net>
References: <20260808103632.3547378-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <4246bbad0b73af5f705076d0970abac8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786190775;
 bh=i74vPC6hLbAn5NL/1mJIIdPheFS9wzWURhNH30s+KT8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O2w627KWHoSEPq9Pr4Q0LdaIEaHQInSfiScn8TudJ1J8DsT9EgGOYeQg8QGriyUBr
 eTnL1P13g4K7AglVvrER1MjrTyMJIUAAIvmgS0Q8zvqxk711Ok983VE9DLXX5h+2pr
 TQ08oBn74074UAkfNopufC6KN0x+2KxgLquJj5sDfbW1LTW+oan9eeO+dFjF+vR1Re
 JYk19LqIQOcwhFu2s2U24Gvce5aFvKYB8O3WXIEzj5k/yPxy5gBJxHTKGEVbldeDi1
 cXSWhGaPNlcYBw7JL9wxRJXJVfxnm5l8eSAIwwy2DQ6nRvLEoSiRDeHyw6Nr3RMj38
 gxdfMUqlRe8ZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O2w627KW
Subject: Re: [Buildroot] [PATCH v2 1/2] package/{glibc,
 localedef}: move to Gitlab mirror repo
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/08/2026 12:36, Bernd Kuhls wrote:
> Downloading from sourceware.org/git/glibc.git causes many 429 errors
> these days so we switch to the upstream Gitlab mirror:
> https://sourceware.org/glibc/wiki/GlibcGit#Fetching_The_Repository
> 
> Fixes:
> https://autobuild.buildroot.net/results/09e/09e760063607b1cbf4ef687bf9bbe17b12d648b2/
> https://autobuild.buildroot.net/results/22a/22afc952e0c05648d538d13ea593e5ad8c4c03c7/
> https://autobuild.buildroot.net/results/281/28159f29e38b0475ae33fe73a9cab04ea3a8835f/
> https://autobuild.buildroot.net/results/961/9616d46c46bd2a10a6e719d76ed6e1d8e3b3d0d2/
> https://autobuild.buildroot.net/results/fd4/fd48fb96639871889fb2238dba360d1740d7962c/
> https://autobuild.buildroot.net/results/91a/91a0b7ccad116911f84281b4cbcb080309ad952e/
> https://autobuild.buildroot.net/results/17f/17ff61f0eac946b3c027a540147b2573e224dcdb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
