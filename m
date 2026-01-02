Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DC7FA3729
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF57A80B17;
	Fri,  2 Jan 2026 15:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1fW_aG2TiWC; Fri,  2 Jan 2026 15:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7BF780B2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367589;
	bh=vmmENOv/yZEDWpK60JX+U6o/yKYloTDZS3D65VtDsps=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ioXaki42102S4bUqKtfQYKIAKW26M9IM4ztpmQpSlF/aN7lJnwOpoAgoIa2s1625L
	 UWNGHId2n7x1XJUjIMnZn41nqFFTP3d/hvhs9L75IYypSw76Usq+M01G6LOhhk4wrq
	 UEbbLbOlBiW7Y84+SRExrD7UzXUoH9JYm3mAsXgn3P851fYTv6K9rqoYB39iLIK0Ze
	 Uj7ZUoIFqPrFOkBGAzaB81bgPU+MpMvlAUNdgIkC3swNEOuZzRuS+SSlxCv3c/IIFh
	 0i0TLavJr8dQUi7c7OUD5+RTVJ5wk+S6Ch6XrxXdYrjg1lNFJ4dYP1FaDb6Xef5I6A
	 7FWCazxjK+oVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7BF780B2A;
	Fri,  2 Jan 2026 15:26:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B75719D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61D5380B2A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgc3uPYoNq0E for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:26:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 597D980B17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 597D980B17
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 597D980B17
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:26:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AABE7C1C3B6;
 Fri,  2 Jan 2026 15:25:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7945F606C7;
 Fri,  2 Jan 2026 15:26:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CD3DC113B071B; Fri,  2 Jan 2026 16:26:23 +0100 (CET)
Date: Fri, 2 Jan 2026 16:26:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260102162605.32efccf5@windsurf>
In-Reply-To: <20260102141210.167234-1-bernd@kuhls.net>
References: <20260102141210.167234-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767367584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=l9nw5wuQKoOFZifx4ItCQnCojxUuL9FRYvXBjSAbFCc=;
 b=LmT4xlzL9bDEqE0uxWiebnD3zPD9F0+pn63fEygYk5sruktaBoVnNN3Hpx/iQawmshxPrx
 mD8FDhLsLaAFbcjUgk2blHQ55zuIykkyRbCu0zVjDYftze5ngOT/6UCUbyshT8THxz74c+
 BdbLPzmlfWcz98r8aC2toR67Qx0kNwqzBuYthXTmoaDXLCMqBQtWF3w/fAN0C8lnRXKp27
 zv2/n0XGD6+3w3IOiKQ+7UhS9V+3E70fqyLQtspJkoAC675ViJRvtbTG1r3jOtbyPEHGYy
 Zk0S6eJa4F3F8noiKGSAtnZQ2klgGY3L2uwzcmJelKpEWlr+FvxmJ0LCToAlpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=LmT4xlzL
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.5.3
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

On Fri,  2 Jan 2026 15:12:10 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> https://code.videolan.org/videolan/dav1d/-/blob/1.5.3/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/dav1d/dav1d.hash | 4 ++--
>  package/dav1d/dav1d.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
