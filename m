Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E30E85388
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0871A810F8;
	Fri,  3 Apr 2026 17:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6a03I4rd09ep; Fri,  3 Apr 2026 17:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 326A98114B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775237460;
	bh=32tyGD8ZGleE3oLYqV6Dv2/idc2CTNQLHNYg/2wP/fA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DdxAeBCy5na0wVxVDTT3dQ8E+9GdbSJviaUQabZ88WGLXv81daIrOVyIYx7cLjEe6
	 bNxuyaERccYvBdpBAXm/83oRaMEZ8S0IW82/VyyoYeZiQaQ3CcvTUkyKnQHtwBYMk8
	 xR3yHLGaO+SonUV4HpfrKhUQpM/6brAPenR/ZAYCBLY5r9ObWQksNxyzpRG0d5LpE3
	 /HOR2vUQ0Wt01tHIDr4Xv3BAQUo3rf5enL87hW09hmpJ7vb/cCBAtIX4GLL9s854hM
	 2JgrmMmk4huq8jP8LYY1JazTC8PqQkbrLzFSimOUITrfSLzgfQEy+fvaibxjpOsucY
	 X1K2I7MmD+L4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 326A98114B;
	Fri,  3 Apr 2026 17:31:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 513C22CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 432D08114B
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-u1SFQQrxRs for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:30:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C806810F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C806810F8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C806810F8
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:30:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4A1D919F57E;
 Fri,  3 Apr 2026 19:30:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 19:30:55 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 19:30:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260402175830.2779562-1-bernd@kuhls.net>
References: <20260402175830.2779562-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <e8a7af277e36aba729494577fc552163@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775237456;
 bh=CdbFUSMAJXsgoOxRg+GP+i9hRUfy+nDqUHThpw/VKz0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mVLidSV7MwJCdWI5uECNm/g7FBOFkZGZZQHZaQnqfLjuy2Tw6VngzYWiCk4BoaE6R
 xGnsFz21rrdFLPDYMzSPlMk2q3MLG7m1GlDstEbNrOm64viC0gGwjPARLvZzp9tBiX
 9EdgMH7eTSGWbl1kpXBRZ9yl4eE2j/S/YEkn3N17KLzFy9niMdb8tYG/+I2Ao5FQzV
 dL/bYAQXB0ZMFzTZLmNYy7ts4rRRteIte/SeW/OdTnD3bYYw1x0HOSy0xWMJHkFdze
 JfR1zNzWMpdfPR1E9Lbx4AD7bS8ERGrD+8NX/nbCp/22H/GBv3GN2Fr7ciTQmJVO2P
 5TGb09lbiYVZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mVLidSV7
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.3
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

On 02/04/2026 19:58, Bernd Kuhls wrote:
> https://sourceforge.net/p/fetchmail/mailman/message/59316921/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
