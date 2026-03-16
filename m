Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AE5F53D6C
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 21:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E679040A72;
	Mon, 16 Mar 2026 21:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLlUuVdOXdbE; Mon, 16 Mar 2026 21:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16AEA40A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773697508;
	bh=M8HUps2ayZV+vNCIQsrKUOqoGiw5ejs3y3Fh1sp1p5w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jhPuUx7m397EwoYTCBQ7i+KveBmwoNYrmgU/6/octARlcqdH/MJ2NV9VC17codEl7
	 PQtTYbEIH7Qei1Vw6V2FZJ0oBdgFqMtiEI6aqzFfL+ZvZvyPGhr4nGHEAspPgP0w35
	 mcWAgUjPopf3nq1WPkppMu/8F4ng47vul3UzgAvc3lw1XbKsZU9kjdmZbSwDrjQUQ9
	 BQtWyml0+PDfVHrsn4aD0NHt+M+K67EOmgoMmsPLJv0GheFsVhTOZaNsbbNsG8O6Sy
	 9kkbbqlHOjV4T4F9Hx6TWslGalGTdqzB/NWL2NxvVNbBqR2/8Aom5n11RKK6Tu1cnE
	 s3wN767cbLDFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16AEA40A74;
	Mon, 16 Mar 2026 21:45:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FB36D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84DF84080A
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QTzka9m4Ala for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 21:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 991E440488
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 991E440488
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 991E440488
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:45:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 83A10B0054E;
 Mon, 16 Mar 2026 22:44:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Mar 2026 22:44:58 +0100
MIME-Version: 1.0
Date: Mon, 16 Mar 2026 22:44:58 +0100
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>, James
 Hilliard <james.hilliard1@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <3bfde226697ff5b0d34d1f4620a98e6b60a63288.1773648533.git.yann.morin@orange.com>
References: <3bfde226697ff5b0d34d1f4620a98e6b60a63288.1773648533.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <33c1ec4f90b02c847bec97bc80d48174@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773697502;
 bh=k+CUzf6J6Vs4ECY1dI8pVQcoqD7FWZXH55u8Is+cOio=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U41H/Qa6z6Zo6kDAMOin8LYtHLytiHWfKGLJolqRVpM85IcK1kpzug0M4gSgDdT7r
 sDF594bjL3bo+SQi8pVV5/ERxMUk6bnBgpJXFOuGL0c9++NkI5YN99U69l29MXfT5X
 vLAURodn/TC20oviEzZpTuWNyqRStiX2H1rabdPwpvrumQ+zt2Mf3Lg0OBBTopIrMD
 By5/bfuELIVRUnEFOLAwA8Aee6EyOXXZmB4bs/19sk0zCkHM0Gv835B3HqnEki776N
 J2zOfYJYK+namE75e47qkyLpseydAXRe2F/2/TRO79Udujwt6k99RAUWDXuQ3Qbl7V
 Nme+6NM347jug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U41H/Qa6
Subject: Re: [Buildroot] [PATCH v2] package/python-humanfriendly: new package
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

On 16/03/2026 09:08, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Romain Naour <romain.naour@smile.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.

I also added the DEVELOPERS entry, since you said in [1] you
forgot to add it. I also fixed the test class name. See [2].

Best regards,

Julien.

[1] https://lore.kernel.org/buildroot/abe8BzQSq4cxvEw1@yd-6wlzhs3/
[2] 
https://gitlab.com/buildroot.org/buildroot/-/commit/e190962f3e7d27e6831e3c2e5e81d66fb4e55b40
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
