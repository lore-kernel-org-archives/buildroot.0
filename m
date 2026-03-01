Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E75FD0062
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 18:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A44B583F18;
	Sun,  1 Mar 2026 18:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id On175QqD_XpL; Sun,  1 Mar 2026 18:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 829CB8387D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772388164;
	bh=GINI5kLIzCLW7naD239Yoytp/QohEl7Gw/Usp6g1t44=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AIvvZAQxZlMuaH2s5rVRuYP/qPTcLru4LJQjODN7hH3q1PeQNWGsbJ/8IzqfvjgJt
	 6QTSPmJkw1pGasXjD7XqFaZojeLspT1cp/r90aZBv0Rb9jqyMomrwN0rLb03vkhFNk
	 i6B+azLGpKaXUAp3nyrIQ0YVWFmPM/Ar3HY7ARWYpkP4DjGyH15UNA/+sV0RKlKZOz
	 fWTjKdsnvwdWYMb8nbhmDm+uZNx5UUCIbABTPU4TIwuHiG3hRVfmuAI2zEV/ioAG0+
	 vA+k7+uig523Gle2pY3M9KmBZ+/1Q0ICIkmAAAX/LRXsNtr3Zrnm2vfMdB+EFZtn0h
	 PBIrVR9CK5PQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 829CB8387D;
	Sun,  1 Mar 2026 18:02:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BB0524E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D3E260895
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoBS-GVo1hnI for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 18:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E364260D4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E364260D4B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E364260D4B
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:02:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 481F219F57E;
 Sun,  1 Mar 2026 19:02:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Mar 2026 19:02:39 +0100
MIME-Version: 1.0
Date: Sun, 01 Mar 2026 19:02:39 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260301162954.2893222-1-bernd@kuhls.net>
References: <20260301162954.2893222-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <e40745eb0658c6d826b5de2d55312325@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772388160;
 bh=kQbZQ0Q+LuqwfQJ+lgc33EaJufdmD4oJ3FBzoyixAlA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i3JX7Y5Qr04BPezPQmmOTlBj/UDbdskRwm8TV3g5rmaX7VzkNHVfL4h9ukPjmvQgD
 o3Cj73X0T5k5hdNdde2yseTDY6HF1IAejmrGQnMAtv2deU8TGKflzNs9HD9oHZPhSn
 t1F4j5EJK7L1uOCt+UC6K0nSW7swWu0B4AJZmeAVj3Vn+Lls4eBaoGFEUzxemEWvjG
 sVEqLlcgesa5krtAwEvy7mFLn3PMuOpgNGaXMuuV8Dp+tL4UKbfo331xd3SQ266t20
 Eh1DPGt8JDvw1WzZasT7yXqf/R5iFHqCoGui1mSwlNOUtCPctDfEPKIoLwQKzL6rOA
 G6FdlyxM/EJlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i3JX7Y5Q
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/rust-bindgen: bump
 version to 0.72.1
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

On 01/03/2026 17:29, Bernd Kuhls wrote:
> https://github.com/rust-lang/rust-bindgen/releases/tag/v0.72.1
> 
> We need to add "refs/tags/" to RUST_BINDGEN_SITE because the github
> repo contains a tag and a branch with the same name:
> 
> $ wget -q 
> https://github.com/rust-lang/rust-bindgen/archive/v0.72.1/rust-bindgen-0.72.1-cargo4.tar.gz 
> -O -
> the given path has multiple possibilities: 
> #<Git::Ref:0x00007d64db1eed90>, #<Git::Ref:0x00007d64db1e7c70>
> 
> Fixes a build error with mesa3d 26.x and the upcoming llvm 22 bump:
> https://github.com/rust-lang/rust-bindgen/issues/3264#issuecomment-3218111176
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Co-authored-by: Julien Olivain <ju.o@free.fr>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
