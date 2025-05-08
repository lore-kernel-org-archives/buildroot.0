Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE971C3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 17:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C18B40DD8;
	Thu,  8 May 2025 17:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNOUBfOuqWfD; Thu,  8 May 2025 17:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8CA741444
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8CA741444;
	Thu,  8 May 2025 17:09:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EDAB15A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FD6640B30
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gf1j0aE_pXEg for <buildroot@buildroot.org>;
 Thu,  8 May 2025 17:09:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C777440F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C777440F58
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C777440F58
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:09:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 520BF78050A;
 Thu,  8 May 2025 19:09:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 May 2025 19:09:04 +0200
MIME-Version: 1.0
Date: Thu, 08 May 2025 19:09:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250507212111.748688-1-romain.naour@smile.fr>
References: <20250507212111.748688-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <96bcdbbaf05f38efea2c4b18e721453b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746724145;
 bh=6GDu01roYUotTQ6z4CBHtxegXx8X33YHt/g8Wz+R8q4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SBQLoHovYJj90reL+UxcQqBRcZC6tmBH/gZ+1zxj1P3M1BMSwBBw1GtvTZ3MuaMrV
 74iyrhE6CosKIC+qjZHDwD2UsYNvnbqx+alQJJlnRrt0ncgARJFaj/4sZxgrcKOi8R
 7HyuXs3bFDxiqgAMe9V18fExDVI21VcpvcSr9+INjtacxvEWzjcqgNABpL9/+8i0x0
 Zyx/z0Z9O8pV+YuDU5zUHYNpHNfvAYjbupAHRSpZcvDs59gP6XxfitAr7DfR2eb0by
 pcAV3/6BcjnHx04Hwfoy7L4mb3/g7zNPpFt0H3sjZyOhSY4R5tStAxzCeQOUM7zMOm
 vQQIvPkua3WSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SBQLoHov
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu: update defconfigs to
 Linux 6.12.27
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/05/2025 23:21, Romain Naour via buildroot wrote:
> Update all qemu defconfigs to the latest Kernel LTS version
> where first patches fixing gcc 15 builds were backported [1][2].
> 
> Fixing kernel builds with gcc 15 is a prerequisite to build
> and test new Bootlin bleeding-edge toolchains [3].
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=247abefeb50d56c83ce7abda5a378e395ee8af72
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=593d852f7fe21a225df4866799b6b539de6b8255
> [3] https://toolchains.bootlin.com
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
