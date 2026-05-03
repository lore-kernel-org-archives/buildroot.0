Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FD2CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 15:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A1861271;
	Sun,  3 May 2026 15:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mS0xm0kmO5qQ; Sun,  3 May 2026 15:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47BC46127E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777822390;
	bh=RHYBZfE2jzeIzlFfPlFGCJPwuhuctoBnboEksFI3aRY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hyE6J4MwM/rzI6Hg8f7ezAwj9gcZEOvFMiVslV6Vv1a8VtmJgBfSn0YSJoYcQkZVW
	 yOwieWiLGhTKj0yQw/xcPE+6t7LYNu3vx2LGQTmSStzdIgf5vWUn3cifeFhyazXVka
	 lORQ+jW1dHu05XFfgOfiNUw7zsACc9GkSg+Hm/RUv8+rI+cGn9rmI2ob4uOkcM9ljp
	 1EwlzRenChTWlOfir8h9TnTuQwUCdRKIe3XGC4lZAbPFQYhf/GqavplyOfimqQyju6
	 w9uwXDlce6mA7CgSHNJyb0ZmoU4Utw+dwys1Mg5v5xbug9f5kMjol/pTdJStX0ftcG
	 KbgGYkeUCyP3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47BC46127E;
	Sun,  3 May 2026 15:33:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 819D2190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 15:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72F836127E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 15:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HU-oX4Rmpf3m for <buildroot@buildroot.org>;
 Sun,  3 May 2026 15:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D1D761271
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D1D761271
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D1D761271
 for <buildroot@buildroot.org>; Sun,  3 May 2026 15:33:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 3834E20039C;
 Sun,  3 May 2026 17:33:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 17:33:05 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 17:33:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260503054654.489631-1-bernd@kuhls.net>
References: <20260503054654.489631-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <b74cb4eca6e1caa6325a3c6dcfbf6e05@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777822386;
 bh=5W/YzttMqom+ijLBmL2N0oEix8b9csJYXyQkEkn2DvM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KnwczFR+z6H94015NJe8ZMUaJ9N3G2OvJe0yXV5J0a8+uzbt/j69RH6xv87Uyc6W9
 6hEP8AWneFmHWmAzRl85QtVA+3JFxdXNpy69z3ocO/GEby0nxJAOWtxAupxdoSf/za
 /75uTx3naVxWGU5R99LiIvPMELchwi1ovoynd7ZWORRb/qbz4GRrbrCJNWcmBhImEG
 Eceqil4aXwtDStfLPRW4waQnRIFBFZY1WIVM/Ji93GhW535UjS+XDOLAxSg5lK2ucx
 YGOfXgg1eQyGvQfjhSD7CMwMm1Fig1ltvu+W+/J5i+X+kpaKd3ZIMkwL9424frUiBt
 +d0ZfsLvFtAZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KnwczFR+
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: security bump to
 version 2026.90
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

On 03/05/2026 07:46, Bernd Kuhls wrote:
> https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2026.90
> https://matt.ucc.asn.au/dropbear/CHANGES
> 
> Fixes CVE-2019-6111 & CVE-2026-35385.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
