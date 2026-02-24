Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FE7EFB7F9
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 06:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 384A684438;
	Tue, 24 Feb 2026 06:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sVHhOn3Ku6A; Tue, 24 Feb 2026 06:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6737F8442D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771913855;
	bh=zqQl9iz2DnnuBppue50Ht4+9lnqqkVSGo21eTvOujis=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ioHW4bz42ZQ1Pf+lzg1h31f0jKdp59CrCxP+RVRN4HwDknyWmIE7DAwI0M9xn7iGB
	 bEjvYSj0UkwXolxu6jUM4lBlHzJ/Y38xVquazY0VdYgw0/+cOi4LSO9z+MEIEolk2J
	 H3Fc/bi4aYC3wjFSIb2VwzK6OXUwhGM3UTim0tVwE2rizFiMW+9SUdgyY62hXV8E4N
	 k26wJ1jTPb2w/OPl8k8xXdQtiMCfCmQfCKLKd3mprS8X/sLGam7vKWtQDW5n6oOavv
	 Vb8Ugch8j2ehw6XNx5d5JLx6Z7x5U22/sQK8GtP7OG0KujgBYhevixjHZPRj/qG/ZP
	 X4RLFzxCQvAdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6737F8442D;
	Tue, 24 Feb 2026 06:17:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08FD71B8
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 06:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE4634022D
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 06:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lp0EjHlh9Io0 for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 06:17:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C343A400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C343A400EA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C343A400EA
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 06:17:32 +0000 (UTC)
Received: from L30177.local (unknown [212.133.41.57])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E56F25FFA3;
 Tue, 24 Feb 2026 07:17:24 +0100 (CET)
Date: Tue, 24 Feb 2026 07:17:23 +0100
To: Vincent Cruz <mooz@blockos.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>,
 Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
Message-ID: <aZ1Cc77UDKkaGWsM@L30177.local>
References: <20260218124726.120001-1-mooz@blockos.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260218124726.120001-1-mooz@blockos.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771913849;
 bh=gCRdZBZ7NmCa8gQXT2EDeDU7kAYDOiseNOZBd9iOMSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CkpkBsDCuH3IHc7k6Qt+pdx7lgncnDvLGvaSDldYWfbzev1zFuWNfIDs4bBx1bPHQ
 9aSp+Q2loMByq7PUcTqTut1iWlRlr5LbFBYwsfINvI6qg+mNkCdWEiu/D6HrAfSxcD
 cvex+XyPCUCvKkJ19NerQ34QB1yc0xclBA+KgefXNrmcy6eg+smCK0SrHW1K1mAyYJ
 dqTne77PlV3AYIYgQk2FAJKonDP4j7I7DT0bCM8/EiwEdejcwH+g4j4YlU3BiVwioV
 YF3rReusAu9b9AA9qypeqTqfabpqoFiHKoFd8O0GpOIqEyCctaaDLDBE8E7RY4P5x+
 +EEBSivYrlfgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CkpkBsDC
Subject: Re: [Buildroot] [PATCH] package/sysrepo: fix build on riscv32
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

thanks for taking care of this upstream ; it was a quick acceptance by sysrepo.

@Thomas,

> 
> Upstream: https://github.com/sysrepo/sysrepo/commit/a0661b7e6a7b2f784fe3222048066c31187c6f92

It should solve your comments:
  https://lists.buildroot.org/pipermail/buildroot/2026-January/795342.html

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
