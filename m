Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA91C5DF6D
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 15:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FD576067E;
	Sun, 16 Aug 2026 15:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rff919qcV5ZR; Sun, 16 Aug 2026 15:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D4AA6060E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786892790;
	bh=vEBYuGx2ZQsAGa2zs2yjuRatXIGy8bQ+L4bZThn6Lso=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mBpMbZD7/vyCan8rMYdHc2je6hJ7RznMXP/NrcMwKdqNEfPLAkP3Jbj2O89IjKgiC
	 fjikBfkzj4OC0zg2lOD4zeOFw7LgWpzlS2Bhdw1ju5RIyv68uuS5qPEYCMN0BTaUIj
	 b+rg0Mntu4g6KuL5WsgN9G7z8YgphZgPYeFH+/6O9Iz0ruMQ5znpWC+BM1gZPj/j+I
	 pCca3uk8w+QvZLNFu8q9SPuohjUTIpUc1lzuNScfPdMDn0cN3lVe1ickJz1idY4DSi
	 PQksJr0NZn+4JFRR1W0afxK6FTxU8ghzh1YGOGjx4Q72LmA2khFZWPbdsucBkEl9KF
	 pK7VxgT/l2zAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D4AA6060E;
	Sun, 16 Aug 2026 15:06:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2598E147
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B5BE40077
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WY9fHwJUEHrN for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 15:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 153B34005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 153B34005C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 153B34005C
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:06:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 057601A1696;
 Sun, 16 Aug 2026 15:06:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CD95060352;
 Sun, 16 Aug 2026 15:06:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9F01611C4F994; 
 Sun, 16 Aug 2026 17:06:20 +0200 (CEST)
Date: Sun, 16 Aug 2026 17:06:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Message-ID: <aoHR4HQNkAGXZBwN@windsurf>
References: <20260708203425.2073196-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260708203425.2073196-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: add build fixes for
 host gcc 16.x
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

On Wed, Jul 08, 2026 at 10:34:25PM +0200, Bernd Kuhls wrote:
> Backport upstream patch already included in binutils 2.46 to older
> supported versions to fix build errors in gprofng with host gcc 16.x.
> 
> Fixes:
> 2.45.1: https://autobuild.buildroot.net/results/235/235c8a176dada9f9cb5541fcdd188e8f01f4cd22/
> 2.44: https://autobuild.buildroot.net/results/a53/a53c06dd61083451f9092ed1544619ca4a62211d/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
