Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6161CC79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 15:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06A0B40786;
	Wed,  9 Sep 2026 15:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loW-UUCaChK8; Wed,  9 Sep 2026 15:03:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2CB58406FA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788966196;
	b=ZBcCM9b13k9v+RimgVOj4Lew9fa0FKgU1Ft3i1NNNm4gwtrnzOp4XPLRecmRPwaHNWpK
	 ryd7YdAY6rRU1MX+8F3bkzPQyCQ8L4p6LiYq04/P0nwA6a0rn477QBh+hj6bIDh7Ipeaz
	 FYztgEDCobqMkqJK5SSSr+Uv1DwLxCNPZ1vdd19Lh1ppN8qJNx/wBIZRBqAeWsKrBuRHc
	 P8pYrfZ/RirdNO2uBhwQ+bunhC+eqRLCxzBEcH4OerFM3GftimqZSNNiVuCBsUwDZJk/J
	 cIGZlrpx25+o7CKekOOJ9JWVg7QSpf2t2GAxQ+oTYIpTjJ42qqUlILceLsdu8DrvLAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788966196;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dZExAZ+Fsn+DSCKBJ3aUQ224PkY/qE2EeSIxW2lR+Rk=;
	b=QT7jpwVceatjmaGFwPl5hSeQnOcEYp/h9QLQVICCRKKt2b6ZyA97waIXz7KtDpla32ID
	 nLYFYYIk0mbfHcK9T6Z2aOyL2n9cHAdDvflAkITMIBETIXrbwF+SCqkwKirDwkOd5fn5g
	 nmrdLsviNr6d3cMQyit3cwdN1HxAeFhqdqN5JCkV6LIXC6yQsImAZK2iWHJJZUUIWE9Jk
	 f4Xn0F51e/r66dvqKo2Vj9fn5jhK7Gww1NcCOB1sKlmZUapPiS/vySiCm1Otv7DwTSzBh
	 0JvrhbmV7N85xmtpDO8avCV75m+3K5XFtZBY23DOrnTfyeYL02estdWzOntUjtBqf3w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788966196;
	bh=dZExAZ+Fsn+DSCKBJ3aUQ224PkY/qE2EeSIxW2lR+Rk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LebpHtWmBHdhKQtGxOJ81I3ZiLEbBq0TOUJVFwlKgjLS2CC4yEKIOaIBT1MTmQ15D
	 fk/Mye6TQPVF/QzrMY1qi5ChMFGO0Y+wEbcJ6t5PXoRyaLJiBkep0hdRhKPIKxM/Rt
	 dcKFtDbrwnqvKbmpc8WB4ntKQvaDAzZeoucxnE/cYMPj5Kouz9Z52i0xr8LJmNZRni
	 egtMOnfUoTsEOoKwi8/IxY3e5oViuifEFN23sSjpOdCsf5pD7RHp1LYeBjoS4lOR6/
	 +HRjVf1z4jJyVrsJolQpUxJDP6MBucoWTRz14nBh9u+99Qpq3bAgLxy3bmo42/kAcg
	 iooMyJoiw6sOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CB58406FA;
	Wed,  9 Sep 2026 15:03:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 239B4432
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15390406FA
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-crTlsMwf0Y for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 15:03:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9718240663
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788966193;
 b=Vjy6zcjDwp2WXP87TPFxWakGlJ+Fu4VLmC5GFOzkqr4UKJKUvdPJ9GE7p5orWt+z+9bV
 tW49w2C2QWVBidns7GJDM6fALgpRbSOksMbn+uyXHEv4Zo7yE1UR1ilZrscq0RFvyP8TU
 FYIDP433nO95mXjXEfWWIOjv/aXCthAEngd9vdlxKQUCdsf7UUbIo+kktRuFsPHu5RknZ
 DaBw2KVo2Cib+NcR2zKAXhr5arfjah7cbINCIOwTvlgLRfdE5fuWnHJBlzd5oQSB2p+SO
 m7LSa2VOOEWJl2EK+i0LBVA/3B/VMwE0ARvkN9lga6Ml5zyd85Sig9JJTka9EicHJlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788966193;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Tkim3fUJzL7qSlmxwJOSf+kyQM2zsGUxmSZjZ6lM4pw=;
 b=d9HYdF6qeHy1eYTQ47rXchyPV+wr4bxUOUQP8DMRTfcyi5n9zW+UDi1KnXZssTCYTiWG
 ykxOUq6S/FV1U9NUtyMczy+lAUTPAGn6IMWqIWYflH7e5tZDONtO0M0UY4TOk95h0GSJI
 d6jiNM7orq0IT135n/P813w0INwlJFFY07FZ1pgN+J/U21aIz/Uyi+uMQXmIb+TV0UuY+
 h+mCewxDV4SDjD2k1STHnoLSrNgxZpUZ8WSUEuNsL10IWzR2nOcsm2cth+Bn7QkdaEBfi
 /LBQFXdCQHhih0gsftZhQYFj5Y7lddWukz0HadBoGMQvA8kNgIFM7R9qcpFm3jWbPGw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="az/lhmBm"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9718240663
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:03:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 61FAC1A1A77;
 Wed,  9 Sep 2026 15:03:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F2BE60448;
 Wed,  9 Sep 2026 15:03:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 70F9611C7AF83; 
 Wed,  9 Sep 2026 17:03:04 +0200 (CEST)
Date: Wed, 9 Sep 2026 17:03:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aqF1HKjBxc-MPCsh@windsurf>
References: <20260905060248.332445-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260905060248.332445-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.3.3
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

On Sat, Sep 05, 2026 at 08:02:47AM +0200, Bernd Kuhls wrote:
> https://github.com/intel/media-driver/releases/tag/intel-media-26.3.3
> https://github.com/intel/media-driver/releases/tag/intel-media-26.3.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Both patches applied to master, thanks!

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
