Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896C7C44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5019780ACC;
	Wed, 22 Jul 2026 20:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTtwqTpZ_S-6; Wed, 22 Jul 2026 20:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA8680BD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784752039;
	bh=Ww5gcDlHS0VX01i4YugFyJgFmMoGvauBXW6qASoePQI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GZhZUEwuJ7jKEB3Eb3W9SC/c2/Rv/Rku0VD8XbdogmrSlWnHY/L326jYTuIbvQwKB
	 i7Fy/W65GgS1fuXfyGFHwJYv1GentedgWeu1VzcOzGdyajja7mxfFevJciZhqwxn/R
	 DAQguNbvj4dOD2qvLUP+U2xByNLoSJec0EkpKt4i40VETvPj65C1XkYPJxCJY7pN6V
	 Sh4DZlXFswFlRvMJZWYc0RCX3uCD9W4xMvssL1pQkoDUUhTMgUtOPp83P+TKHRs8eB
	 wnOnrrSs7CAOLn6mNoSu9BGHp34zoY2ibVBauaqnjUQKfulkd/8C32sGyDGoNtPQ48
	 JhpklRZJ+6Vcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA8680BD6;
	Wed, 22 Jul 2026 20:27:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6956224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D874A400B5
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eV14S4yNAiAD for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:27:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27797400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27797400A6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27797400A6
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:27:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8708A13F880;
 Wed, 22 Jul 2026 22:27:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Jul 2026 22:27:11 +0200
MIME-Version: 1.0
Date: Wed, 22 Jul 2026 22:27:11 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, =?UTF-8?Q?Micha=C5=82_=C5=81y?=
 =?UTF-8?Q?szczek?= <michal.lyszczek@bofc.pl>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260722153224.624762-1-fiona.klute@gmx.de>
References: <20260722153224.624762-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <bec86e53ad0d3f30277381bc81265355@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784752035;
 bh=+GacNIl+eI4eKdggxkpI3cXQk6aElHjrW9GCzKmtSk4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eTRxMuT+sOr7SPrAh/7K4eys/D2SRWcX1XNFog2yGANs0DEztmISAezWMw7jgZVHB
 S7Xe9ogzjUIF1icbd0ctCzKT9V1l71rNZNc091C6ChxtMYIu6O/WSMJH4UUvstUqKs
 GqOR0f4zMVBaEdqd2FqycdBZHgXPEXCRigYa1PkgZKj1lnn9h5QclHVNx90qL21WL1
 ve9u46AQe+ldSY02XxQEMwqNwQtrZSn+ZG77tIIoMJ47nIQ/LhvCJ8pWCvgGqxbNaL
 /xaUdO2WFZlXMyJ7x1kSacsZn93HjimQ2M6npSYJqpG3zUiLj1uCIQwYgKclTq0Lrs
 87cLHnKNs5VhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eTRxMuT+
Subject: Re: [Buildroot] [PATCH 1/7] package/skeleton{,
 -init-*}: add license information
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

On 22/07/2026 17:32, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
> 
> All these packages are part of Buildroot and thus under
> GPL-2.0-or-later unless stated otherwise, as described in COPYING.
> 
> package/skeleton-custom is excluded because it provides a way to copy
> skeleton data from any location chosen by the user, the license of
> which is unknown to Buildroot.
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to master, thanks.

For info, I also noticed there is other mentions of
"BSD-0-Clause" in _LICENSE for the agec and ugetty packages,
in case you want to continue your license info cleanup ;)

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
