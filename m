Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700EECDD0E1
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A24560833;
	Tue, 22 Oct 2024 20:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgvGSD9LHunD; Tue, 22 Oct 2024 20:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A4B60831
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A4B60831;
	Tue, 22 Oct 2024 20:29:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65F182072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B9CD405D5
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyp_9UeH1c3p for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BDC9405D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BDC9405D1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BDC9405D1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:29:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2007D1C0003;
 Tue, 22 Oct 2024 20:29:27 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:29:25 +0200
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241022222925.07c6bd2a@windsurf>
In-Reply-To: <20241021175835.466778-1-raphael.pavlidis@gmail.com>
References: <20241021175835.466778-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729628967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYgneWPMd5+IKqRk1cEDyHIhBeN48wqd49oz6JKJaiQ=;
 b=RNXjhnjq0yiWgc8sLeUxQdW1U6DiFtXRvnitdDQYv73kHbEwrl1yBDElCyZt4iQ2xxRndl
 jSEYFmG+1Mfdxl35A3S7WoaTy/dTpgibFNViQZtLukAmCqM87/UDPlpWq2gKcmiQGFh+sZ
 uOc2MGwilN+pO9fkrPYAQIgSScpBtZFKsaUTqqbS4MIh2VgTueWCoQuNF1yhrf1W8zfl7c
 yedp5HdAjKHbwcyed1yPSrzCf0mKxt1u981TD0p62BcgVvNzWgS79glbSDtktPPlxJApiq
 S16bRrViw1GhLUXAF7Ct4zgSKpn+aEUrALGMAVHo5EFa+yDjRxN1z7f2ZtlaDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RNXjhnjq
Subject: Re: [Buildroot] [PATCH v1 1/1] package/slirp4netns: bump to version
 1.3.1
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

On Mon, 21 Oct 2024 17:58:35 +0000
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>  package/slirp4netns/slirp4netns.hash | 2 +-
>  package/slirp4netns/slirp4netns.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
