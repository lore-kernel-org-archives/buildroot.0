Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0528CCA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C09A980D1B;
	Sun,  4 Oct 2026 15:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4wsja6SIUze; Sun,  4 Oct 2026 15:55:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F24E480A49
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129351;
	b=riji7BZVydU8L7ThHqN2EvBpjJeIGRDY7KKjWsQMPaeX1Y5tLWFJKcmE1YF4Y3WeNPdr
	 1J/P0bHuzKwL92ZsymBv/Y39k1XBmB+FklFbdGrRfSvvTIKJlV/eTpvBQAG28nud2E76b
	 wngEFkbNKgY0lYdm39JLiO8UpgHqC1VYTdu0gxDdFWG/qbi/8CKSGn1E4imef2kFDUlmA
	 fEooBgug9hE52Hzb6YHzAYM61rwTCUygTx++4wboTabJraUA6KxPgFStR2Phm5Ub+zXkN
	 OTENwudlGu4PDB9PlQS3+N/t8+nb3gSkOqnxMIPT+rr54Q46MQIUTW0iibxhOSvzxGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129351;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=x/Qj2+rRTfdl9I5dIr7Nnex2ksae082pUmhO6SiF/dc=;
	b=RnivfN5JKDVU8dyHhQoBFEQxd3xGVX+p6uahSS//E7h0U4bF8H6LOs7/ESREAf2YsV4o
	 zQNIsO+tlIvWKVV7B9i3lDTllpGuNc0LKWam6lXx6ZAR0StJ0k7jcUQfvMDz67bWXHK9c
	 cYSC+jEq6HnONOmqOxYjT9NV8QKc6WsB4056tisoqchpBwuomJlL2PugYwSf3YCe1qkZK
	 YaUzE8HrzwjkZyqvibojVsA6Rs0IDrkJ4NP42xvYMgqnHZVPM9gUL/l95yIhzwKNcoPJ4
	 yJi8YqgKx5Kvuvkf+lDSQ+U30lryR35hiNyslFKvCJlf/MXPPTSdzeKLN4EA4mIgpWw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129351;
	bh=x/Qj2+rRTfdl9I5dIr7Nnex2ksae082pUmhO6SiF/dc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VfN2c7P3j6wShsfc38BW1UYWgrR+ESJiBTK8YJIUXMNr/nvuXDrzWU1/pL8SFSElV
	 aNq4OACKhplcUjPmeUXqm5hctL0AnmVVXVyeHB5XVQ5oBJO2zRJ+qxMMe1czZj9rPI
	 WTrL9WWrbpQJ0njWJki4dwC6b1AvjMi+dDrxLAOPJXT3j2jkbDoho1ZCr6uVqY7f/i
	 gXZoID02rvyjCv2PA1Njukp2TdoCAkxWwIg82lSqnR9icOqcvy1HqpXVZncThW6t0U
	 u4jcuPudC/RGseBlCuzUl0FUlyyJjK9GRW0pm/zbWjfCfKMMDGgknClUEE+v5DYVgY
	 M54TnqwSqcACw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F24E480A49;
	Sun,  4 Oct 2026 15:55:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 839FD2E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AB2140082
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKZINvRihA2F for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:55:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2840540049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129348;
 b=hrElHpVwEn26WwbEgV4Q74dxM0sGc8wVus92f6sSE9xrP9P/YERzlonf27JyKpuu/ERY
 KNE5N+otMPKSCA97jF/F4T6rdX6J/1ZJqdt+ZZ2MgR8Zi7GUBqssmHJl8pzDbP5aJSiJT
 Ncnf6USZa949BrWpIDgAezuoUePBlvFTj9mSsWWuj5cUyGs5PStXygJVRu3puoLsXaj/m
 udbMSwr+49ZlBGyYPhKFF5SLmBzhMUzVoV2bDMUDaDnMajDJZ3pKnqyi8dkLL3xTuOGkO
 RLpCrBxc97SQTpoXaoGnqSqVE4X8CZSJCArQ0BdVaCuJ2614BBO+WnvZZFuyVUoddOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129348;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=HpMtjxs4SchBw4/ItPANanTRmg//YQA+Xg1HW0rF/0k=;
 b=M7ppaWeH7MmaR/KvhKnp8mKjNuE3Fe4SsmoPjB4q5gNsNsip4SB0WLbye/f+8AG/a0tR
 q/gSxncvgDvIvB3ynG3B/5jHlnk6CZDRWXcSN/IuZwmlaBtdC7CLp57iciB2E0L3qpcwD
 x7y+fL/ujvss56RCuardfRhut2F3cCFq0gJcoze8DbE6rsyg6EF/aCzR1j9DZ/8QyykWF
 v6vLdI3HsE6mgBRirlUjJ8cfJrb5A+KYx5BOHYZYIgWzXsGtuIswvBm8u0CNz6tPwI2wt
 KGU3WEi0WHe22caXHpmMxXRFiTWupHPyXSLg0Wxv8dzMnFv6385sLWuNvnRb0lzfUlA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kg5kSGhb; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2840540049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:55:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 390914E41163;
 Sun,  4 Oct 2026 15:55:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0D0CD604FE;
 Sun,  4 Oct 2026 15:55:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 414E910328192; 
 Sun,  4 Oct 2026 17:55:44 +0200 (CEST)
Date: Sun, 4 Oct 2026 17:55:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asJ284ei-D3wiqVQ@windsurf>
References: <20261004150736.1599807-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261004150736.1599807-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/thrift: security bump version
 to 0.25.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 04, 2026 at 05:07:36PM +0200, Bernd Kuhls wrote:
> https://github.com/apache/thrift/blob/v0.25.0/CHANGES.md
> https://lists.apache.org/thread/33otcgbqd27wf6qq810q56znzbomnhg1
> 
> Removed patch 0001 which is included in this release.
> 
> Updated license hash due to upstream commit
> https://github.com/apache/thrift/commit/df376589a8a9d83a5a6082c1a358d4ad0f020434
> 
> Quoting https://seclists.org/oss-sec/2026/q4/38:

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
