Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C036FD78797
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 11:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79DF0821CD;
	Sat, 20 Dec 2025 11:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6vbAHK55QZm; Sat, 20 Dec 2025 11:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E73781EAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766231021;
	bh=xDWR6esjVLx0cw49Sgz32wkVVJlh9ZiTPl1ggxCQwyw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VVSjmeBOfWbJwnODKWGJZPhbwRh392Ba9NC29zr0QRwfh0BkQ0PVE9XqNH5IOt8D9
	 FVOEmKwyCOEfbgx2jKeUmY2oOc7dpaBSGe7bEeTO0F1daXwF1Q33og4W7it5u3ni0m
	 btI+OTtf/a/uuwbWm2AmXsURHIPltuFH2HSP/vDwuwCF7QvhKlVXQlGx/1Huwhm3WO
	 PaQF1octU2zgLrPHg7rFvzT2vbf+NGQtQJtIvPZ3BHeMHIPoIdwcrUgCKT5PEHSt81
	 vMEYTn56btWZRc+WcwcgQAy2QIutaJLwt6lRECSWiedj03Oi2fUzUZwI6eBRubOUIi
	 vmsMu59BkZV+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E73781EAC;
	Sat, 20 Dec 2025 11:43:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 642191A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61DEA4099A
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHxsbAM-mLYR for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 11:43:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58AF740926
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58AF740926
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58AF740926
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:43:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 466BE780389;
 Sat, 20 Dec 2025 12:43:36 +0100 (CET)
Received: from 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9
 via 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 12:43:36 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 12:43:36 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251218191608.74534-1-bernd@kuhls.net>
References: <20251218191608.74534-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <f77b27c1fe5495e717c1e82df787fe2c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766231017;
 bh=MuXD6LIRzN6xTl4soYcjKdTPXSjwJp01IcpsprLWsyk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A4VSy45Y7Lm24QUsYn8RDYzKTs1VkNW673L0i7OnPdLvGhI1CJhdOB2YRYKj6vrbu
 U2CDPZ1XzfYAyUeynp1hjiwkeKz5KRYAZHdqS0qpJe1FZYb4+7/IHshr3cIfxGRAg7
 byT1za+VLEaHihLlhraDJ5vZXZnE5SJlY02CB6MtGkhT3DbcOMjVXDrgIhW7rB+4un
 jq6qi6UbbktnjhcYFUMSgn3wUmGecZPlK2B4vbCThhprkV/sdNQ39YvIh8QaYyPpUu
 7ByO5OwQMg+R/XxAye/17RFhhdPrtfPXwFvz8obawRHLd+gplj5JJ2jNN87uwG0Ak7
 yGsXX1JUEG+Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A4VSy45Y
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version
 to 21.2.2-Omega
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

On 18/12/2025 20:16, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
