Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0CDCCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 07:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEA8960732;
	Mon, 19 Oct 2026 07:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbGe8-7A8CZs; Mon, 19 Oct 2026 07:42:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 078B760659
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792395779;
	b=p2GHANyLGUlfju6+iIvxeMHp19mHFduRitcPfalM6Th3MjHhxIYEE8dUwxq05q9CYZCI
	 7880POTptHekxxAIrLZbHlyxARypmtwAJJ5E1oUleuKCbPtJVYWTZQoCutvASvDH4Z09v
	 qKhGbSw8P4TzpLJj2keLV/0r3esCiCnZBycqteR8ID+P/K3yNLBBdpIKj8aBw6Q9X2VdH
	 DK29sLXqNnmvqI3IjqHUxPBkebwVi+MEfRmoy/URDS5KUPfXS4rHwZr9geR4QgfOmgE5N
	 5PMVpBq9SdW0wkRsinbDTD7vxQyMdizmQO1CK+neqJZcCCYGGjdIhwSA6cTSCHx7vVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792395779;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1eYN6JJrXLgG/MZIf/xiGoRK4Lbb6JNdNoA4NQuaJRg=;
	b=MJ/HbfjIFtqrVB50Eb1HFH2rYGPAPxEojzngddHbJHDTnzQEYMDEzMFoa9JrMjXVz7z/
	 NEzNUVZXsBXPKrybiCoYItfk8otmgGQ17FLm0JEjssiLYJnUGc1AZ8FdVA3kEn/QwkwQI
	 Iv5kN+MtfSt23w3sPuVgeAn5zcrXeQfWpA+9gmthvTzs2+QhdWnBSHPxbQlTAdL/eHzu2
	 Lr2d+wkdx6k3Icyi1snoc/8KHC84eflges7Mz1bQqxTbWZYKm3r7v2tVEOWXzRcwV7AzP
	 jfL7QOr/73678Zyw6lsdUZrzmggGxisHCWwEu7D8KDNRfpgS6NaLQzLjx+lEIytEtfw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792395779;
	bh=1eYN6JJrXLgG/MZIf/xiGoRK4Lbb6JNdNoA4NQuaJRg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=BuU+gXQEEmksjFy6G+u8WEczlQUoFB3oneLWF9yJ4zxDI3QeZqeJ0FWikrsAlQtkK
	 ZaGQRu0dq0lCmfKnEQlKSssY9t9oiCN/upKqiApKJICnijiGi6UNfQPGhot+G2A+0G
	 8ML4TXEG3CPWGHmzwYKJqLeOnW3sjOqz03gUq2TcZE8Jia31J2ynYr8XYISR/kh7g/
	 NdyVreTt7HS2X+SsQw51pOzzIkbC+edieACQS+pbGATOH3lJLavsosbur6kxWUN0/N
	 QKRhLeW7p9QJNk3xaQmFBaky7LB5j+mCu27EHJKhO7a1Uraudv/qAwjMknuOf6oq9R
	 IDUp/6YHXROtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 078B760659;
	Mon, 19 Oct 2026 07:42:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33054769
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 187F3406BF
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4GV0Is914Gv for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 07:42:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 082AE406AC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792395776;
 b=SjR6R+nSruN7MC6VfzQBqehFx6ABzxjUrqT7jf3IkjYet/omKDfSHzkqhn5LV6+oGwsG
 dQeDiW8VCakGP5Yi1qgGbLd0UBFJyjFazRsf4EcmZrzW2KLK+ChpPWWQppCnD3CxUb7O3
 6L+LzcO0AVGBXBdeelzHYDOSHTjW8VrduxVhMMyxsOU5cOcSt+oZMdoUGMqfBF/E+NYUw
 za0/7d0gvEuj+u1+n0b0gFEgLVLr1Kd28r3HNRGeUeFUBtcvzYxjInXdSwoJm/OFWFdNK
 QPgE70BZ6IEy9sS6lDBxqA+U2cxihAicfMotTKo3Rp2WFa3A8ZgRQsEpqJg8B5S5gLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792395776;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=xTJmIBCZ2VIzfpMIvB3ew2Hgnd8C2RLG3kYF335B438=;
 b=DTMdC7ZASV65/WJhHmPsxaBcmOrAEA0j3SUdQTBEHHxUzI/erCSqmkZEHtOuR1uRO0Iy
 JPr6Xv3th+z0UTfl+kkW03Wh94P2MPZL/8k/KsQX6q905yeYIuhcawxCjdS1WCcoo+Gmc
 mJPe+wQYc/6ZcRhgHZYwb354IwliyFbSPZHi+IX/ZvgaEerC/MMHpbd888dg7dFBrxUnS
 reXSE6Up57liYRnR5a15JGAnGP5V6e91x8aJlTMXZkZawoJvgLY9zAvuxwQmfaW4lkX68
 mWJhY5Hq4CAJZkGT+afSM2rg5d8Pw6CHmjfKkvF4sq+0qYnS90EsxHLHuCwag7MFWfw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SjeU8eck; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 082AE406AC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:42:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 30705C5CD45;
 Mon, 19 Oct 2026 07:43:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3200760582;
 Mon, 19 Oct 2026 07:42:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA3B510328429; 
 Mon, 19 Oct 2026 09:42:50 +0200 (CEST)
Date: Mon, 19 Oct 2026 09:42:49 +0200
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Message-ID: <atXJ5ikWcKB2ouMm@windsurf>
References: <20261003210614.1376879-1-alexander.sverdlin@gmail.com>
 <atUeDroTYvzii7To@windsurf>
 <c5aca2bcccb4018ee1d1923ce3262177977003eb.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5aca2bcccb4018ee1d1923ce3262177977003eb.camel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3] boot/uboot: support custom DTS with
 CONFIG_OF_UPSTREAM
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
Cc: Vincent Jardin <vjardin@free.fr>, Romain Naour <romain.naour@smile.fr>,
 arnout@rnout.be, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 18, 2026 at 09:45:45PM +0200, Alexander Sverdlin wrote:

> > Could you clarify why we would want this change? I'm kind of missing
> > the point.
> 
> This is indeed a valid point!
> I've been looking into it from the point of implementing a BSP for a board
> which have been already merged into upstream Linux, but not into U-Boot
> yet, but you are right, for this intermediate step I'm not forced to
> use CONFIG_OF_UPSTREAM even if it would be used for the same board at
> some point in future (when the DTs will be merged into U-Boot as well).
> 
> Sorry for the noise, let's ignore the patch for now!

Thanks for your feedback! I'll mark the patch as Rejected then.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
