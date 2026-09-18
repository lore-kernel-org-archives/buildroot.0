Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA700C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 21:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D73140CF2;
	Fri, 18 Sep 2026 21:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPj1yWJLBgqi; Fri, 18 Sep 2026 21:29:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2DBA140CDC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789766978;
	b=rTeudxe/1hqfCe9aXJgIX+LK3vxClM3Kfo1nPuoZQxu7duf4+mydlIuuk8NhBApmlAnF
	 5X09MOUowZ0rCPNPKU01kt/+TKXxAF1vJMvUQbxh8lyuUYcnZr3tulmI1Xbb1RzGSWVBZ
	 ZiEyvNcmiSTy1UOdPbRrK+Igz8C8JBNS0ZGfX87aojvFLETSTlGgWzxtwfmZ13Pl/z5vH
	 EPbwTBil/F4WAf12O5nMlun8jy3nH5kTkpd6puellflZW3PF+oiMQOkoLzofY+ahPw9me
	 scHxBKim4m1Tnv0Y0qQu0GgI8mrbt1g7HTzFX6tGb/8f4XZ1ba+jx1eZ98NeBXh2CXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789766978;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CuoMN1OAXLt2wna9V+bCWwKHelkAyBdnaxJjXmOFfgk=;
	b=lnZpFOy7kHYXO+i3e/u3hcxqB/ZifMYbriJZC4upN+foz/dj/IHOJdEyS1dJA3/YbhQM
	 NQLyItZihegQsL7vt8rxTlH7kIydTNBNAH8UJG7HLgcVspS34Efm7aKsvarDVmsIfX4uX
	 9nwJbXJK/z6sVVOgkR37RUT0LDzX6WfZMok2fa8+XNRBk4mVRZ88ImPhc8j6qg5fN33Ge
	 SvJr5tJ8sJqRpy525pzn7D2hMon1z73FtBJwMe5I6Omq5zIZjeD/8aq/0NnyfYqUs7dIs
	 38PzpkwNJn2xD9rOXOX49IeEy4dn7OS1DgfqOIuQQAt0Wk5m5YNOl8gKAJD7K5Dwsfw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789766978;
	bh=CuoMN1OAXLt2wna9V+bCWwKHelkAyBdnaxJjXmOFfgk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bizK8Ncp9sXWu7RqbSH7LCa7fHzhKd7mKmoEswnKegh+d6vtMdFX9Nac972c2uUWz
	 Go0U7VRXGIEdg2CYQi9M11BjCpkgArcw7imP9zarttQNe3zjxqqel3uBaK5RWwNzC6
	 6wBY+fV2YnVciQZUVvXWWC2e9eoTYgGvsc8a+WE9vOKbk5XUpUIJZUwJrmWH+080Rr
	 E7HIAW44PKP01QDwAQ34iXyaEyRryEqEE0jaHahZ+W2KjJ1NH+uKHgAltK5qt1GXew
	 wxDUVlhyrogGjR/aqrDvxuURaQjkszcgHZSgonNNAwfqhqodl/C7GDZSqVVceUPOYQ
	 qFE6/pIAp3iVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DBA140CDC;
	Fri, 18 Sep 2026 21:29:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BE06224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DA7C60DEC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKjij8r5OzZv for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 21:29:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0516160DCF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789766975;
 b=iM6YbhSeTkvGUTv8NHeERV3WpgZx2az4rL+0xwggSv7QFsQWJNnw2wr1PKXgPLoPHYTK
 tRmRE5SJHv39m5nz+t8arX62B/LTaF6SCjh3pxvJUWMRIKDh3aT2NWok7UBwDrGJqyA0y
 kltFB1x+0F3A/ZI7YuWE6DHZwaC0dedb4SuVUHaH8+/XFhS8y+SqA36uYHMMcNR9doEqb
 YXx1FJ0+3PvRSFrPVAlMgMni77u9IUiSQ2ms7JzF1ML/N2v+ykxmEdCSFKE6zv2xyy4dV
 +xhxeopfRniD5MKOMRjxnMR7vGy96qRyPeUPecovQtsguzYAlwL3qrTulSaryuoPaiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789766975;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rm7zENRpP9jKbp3JZQqSLesnI3SaNQs2pJH0hThl8S0=;
 b=spGSOlyFHldndFdgk45f17IGgWNfu/pRoGm3SdtlQTSTe3cMqUowdb9loBEDR6eiYlqd
 PjKwijqgpLeKUJpyavNAmfMAD5tCaLv2BhPaX3NjtHT6qztSSrPjOw7BLsulVE/lQ9LA4
 +ioQxJP/pw5N+X+S4cAzEHGmHULeMmsLAa+fB6ldoGdFH7bPR9HCtwQp+n+av51+6Tmet
 2rgNMQlIUHHfDKaSRPOAR4tzzdxtR/qCjDwNpfUnfTJp9MbSwbKEROPNoQ0we8R4pmQYb
 Hy+iuBzgkwhRjNWtDvuLBjtVvZ6gheUItuiaY/3vYL8zIngNvzOEtPKTE4w+Obxj81w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=g35OwyO5; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0516160DCF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:29:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 04089C5847C;
 Fri, 18 Sep 2026 21:30:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C782560649;
 Fri, 18 Sep 2026 21:29:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 55AF110329075; 
 Fri, 18 Sep 2026 23:29:23 +0200 (CEST)
Date: Fri, 18 Sep 2026 23:29:23 +0200
To: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <aq2tL1wYn-bszveD@windsurf>
References: <20260916074218.29706-1-andrea.ricchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916074218.29706-1-andrea.ricchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/cutekeyboard: bump version to
 1.7.0
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

On Wed, Sep 16, 2026 at 09:42:18AM +0200, Andrea Ricchi wrote:
> Release notes: https://github.com/amarula/cutekeyboard/releases/tag/v1.7.0
> 
> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>

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
