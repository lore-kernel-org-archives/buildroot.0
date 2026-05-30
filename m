Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A63CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFE2E6F56D;
	Sat, 30 May 2026 13:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfzc10eKKqx5; Sat, 30 May 2026 13:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 263AE6F55D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146342;
	bh=R1iNx2FfHZvz1MoVjrf0Xh0k5Xpw10Tb2q/Bw9eQnxI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HdrQEF4IQ1IvaJWRY0SF3JpPoHg+uxoPNP/lG4ERO64PYgdYcXExBF6XI1fkgK/cP
	 QX1EsaMbGX5DoGQhkvVL+WEtvhoGYqVklf2JLfVtsFyQ0x9wt9zWJ++6njSayk6brx
	 J4sUQfsm/itrsHWdlWUqEm7JijR5co4MV39Ex/ZMqxqvitceqmP0VWxNERjkG9hhuW
	 K02+l1dJYfaPUq7RbxrV1gkx6KD91x+OC/wGpzco0HEDQlqz3YKJAXjmV3tpr60oHP
	 r0+JEHqsqeS8Ni+yyMuv7lX3IhU2/N6C5qycgjzr9kHppe3MM/nKQbnJgEkJjT/Q9j
	 nEpch9NBhi80Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 263AE6F55D;
	Sat, 30 May 2026 13:05:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E165D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FC7F4025D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmXbIN-4Xl3x for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 830C2407A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 830C2407A3
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 830C2407A3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:05:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BE42B1A3753;
 Sat, 30 May 2026 13:05:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8CD486073B;
 Sat, 30 May 2026 13:05:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C914D10888054; 
 Sat, 30 May 2026 15:05:35 +0200 (CEST)
Date: Sat, 30 May 2026 15:05:35 +0200
To: Andreas Mohr <and@gmx.li>
Cc: buildroot@buildroot.org
Message-ID: <ahrgjlL9__csvW-q@windsurf>
References: <20260524085105.16377-1-and@gmx.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260524085105.16377-1-and@gmx.li>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780146336; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=2UVqlCEutFI0YIcDHcjl8rWOp61nNkzQfgpkx47t1Js=;
 b=WEm+0U+ac2aYr2AS7Q1+nz/cPtIL8AZ12CRwpDHEp8tVBSFLg/TiH93E7VET8nsEsU74wN
 +cWQ/fQjoeOKy9mSosn0QVOISQzsBLQrYZHDoJz/fY9FcLLuO07xt/pQD2tHVdmGP9KwU4
 dn4Q2SOKQ0IVYz4XYdDhoEDt88GEd3aXeZuy7nS9uK3JjAXElYCMvLjocmpnx4y1V3UzGq
 5xLT6GJEcrAD657iTAQOp53p5eRWogAtBOD0dlnOwi9+L+JB2gocPOGX2L+zSFgMU5SbC0
 VG75atUO1I0RMNeisBdJupZol/pDLnKjQwsaZWO44XJEbdIuqB4Ervsq1mvMEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=WEm+0U+a
Subject: Re: [Buildroot] [PATCH v2 1/1] package/tpm2-totp: bump version to
 0.3.0
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

On Sun, May 24, 2026 at 08:51:05AM +0000, Andreas Mohr via buildroot wrote:
> https://github.com/tpm2-software/tpm2-totp/releases/tag/v0.3.0
> 
> Signed-off-by: Andreas Mohr <and@gmx.li>

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
