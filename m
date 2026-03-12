Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D38106ACE5
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 20:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E6854081F;
	Thu, 12 Mar 2026 20:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63sc3MKXvPGd; Thu, 12 Mar 2026 20:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4F14407E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773347173;
	bh=frIOGV4y/sv+NiHSAH7k993YAwsYU2dziUDa0xlC31Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cAa8cC6qkUEzaxt2rCZdBOIhfX9mSqm2kFdJS4WNFlAB7wDHnMd/ryBApZQrDTzO4
	 301lb6umnL76lsYC0xKxxOelzQoG3fHS3ER935z7GdYr2DonXCYMU+/Q9jkYB4MXaj
	 lrwBf1JUD2rlBCHkexZ2q1BPNpLlLT82M5sbWF56FHakyg4fY108apaErTu6RoppZg
	 fi4/uYa3FA4ookZs9VBXN9tLMLa0W66Y0e6urrHWxbD8GFR4qg4tohkdELiPvONHkd
	 ACvB+2XjENgL5TyZaNEO1BoHNlOBl9HMMW+spit9Il8Bh2Zu9QSjw9nsupOIdQkuew
	 yz5nuYzrr+8Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F14407E1;
	Thu, 12 Mar 2026 20:26:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3848282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C99A240180
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ww1fAkj-7-d2 for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 20:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E688440071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E688440071
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E688440071
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:26:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D47642003AE;
 Thu, 12 Mar 2026 21:26:07 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Mar 2026 21:26:07 +0100
MIME-Version: 1.0
Date: Thu, 12 Mar 2026 21:26:07 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260312163958.3178536-1-bernd@kuhls.net>
References: <20260312163958.3178536-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <9e9310269a7b10690c938e7d8ae3879e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773347170;
 bh=3dJgoACKGI/SPswBv7bH4EJb6XW8MCbCtfLFYRytC2s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m9PvF9b61ygDy3lvJ/V4WtqF+/dZPHRcHLWWYBn9s0GQtdSrba2pSNScwkofcVpzn
 ryYIfbbHRAX0DAd3vjFDrZbw5zQG2cMKn9FOLeKnwza2yTwgcl0BmjYp2NjKV9YXYQ
 Bu0KV7XkcUi18U1BVbArZFIps+ruSTCvwegqb1SegSqjB3EciS2Yc28B6fCyN8aJ+g
 QtufLYngY4h5DegMZ16lICI0pS8NiaOWan/0CmVEMUQqeA6XAflDltCunUEkf4MFcR
 S+r44jGRb0MpeBQsb2T79aWDcdya74MUb7UhEJwAzj8GDKK1dDMXjrB5ZvPT7FuhBN
 yDXd9iBti82cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m9PvF9b6
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.2
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

On 12/03/2026 17:39, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-March/000841.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
