Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBA1FEFB6E
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 17:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBDA540C85;
	Fri, 27 Feb 2026 17:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mn69MuxlecL; Fri, 27 Feb 2026 17:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C50EA40C96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772215189;
	bh=inMwDa0Wxpih1veHNgR94ihqKCHbun9aks9zuntQU5Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MynU21svVGe1n+tMUxDUFRGDLNeewFN8hLp3iY7djxJ0OCAMDu1cTWEUYjrMaOmh5
	 d/Pr44F0vp9A8lBELgYGUqhhSxf2y8EDrA0h84k0kViOsOJNVQJTUQBXcqNRoDFsXb
	 R3orm0sN8AzzioXEqjemL49tt4SfxwzlD1zYNxz64TzUfAgA+730y2bwUZqV0HQRd+
	 6kBeNjpFlj9612KN7Tpll+CpdGIcEJFAokzaErfA7ovSXFnzRC40q4ecN1A2rFi2iY
	 8XHm9K9muEzQeFml+SR2dvHoAipbj6D0eBQbwD+oKopMpsrXMGXPVeqdymXrNOJuR0
	 s5blylWhn6NHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C50EA40C96;
	Fri, 27 Feb 2026 17:59:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F068C131
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5B1C82DD9
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guQ6I4uK4Aks for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 17:59:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A1A182D57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A1A182D57
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A1A182D57
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:59:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DE86C19F733;
 Fri, 27 Feb 2026 18:59:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Feb 2026 18:59:38 +0100
MIME-Version: 1.0
Date: Fri, 27 Feb 2026 18:59:38 +0100
To: Joseph Kogut <joseph@anodize.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Bernd
 Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260225-mesa3d-vulkan-amd-v1-1-2a91cfb594a5@anodize.com>
References: <20260225-mesa3d-vulkan-amd-v1-1-2a91cfb594a5@anodize.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <6c6ce00dae243b3ab3e9ec21ce0f1537@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772215184;
 bh=INFvzwkOVkpXtnoSBGNiihOSKbwTxETUfZKHI9fZyLY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aI3ZAAcglImnW7XVQ1dYqdohgI3IeoqbTUHSG/2B60nuMKov+ua+IjX59haX3bQWt
 KiSYU4wEnc6F1gzw0Eywg23Nk0L97w9L2dAVH0sX3Lrd2f7NssnVDauyCI/ocs+WcU
 aDsL8MsTVQnUtLGM2s5+8tUz8+7nOmS3/RGVsICiFPMbKvTa30xXO91iuTfSMu6EjS
 dEZHf3buJCbBnXYMvTn+vBHaU69aiQLbU7Ae2TbJKeUgqu2bLW8u3ChnB3CFxPFxwq
 hFRRydg6jSxq9cnmiaNsswYvwLXS5vk06GDLrMEO1PS1Lyp5FKPvkBkFCk5CahOapY
 hsLRjZrSiZhWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aI3ZAAcg
Subject: Re: [Buildroot] [PATCH] package/mesa3d: add amd vulkan driver config
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

On 25/02/2026 22:22, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph@anodize.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
