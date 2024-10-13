Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DCFCF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5169D40A48;
	Sun, 13 Oct 2024 10:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lBCW-obTvPJ; Sun, 13 Oct 2024 10:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0387D409EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0387D409EC;
	Sun, 13 Oct 2024 10:48:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECB8E1BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6E6F40728
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xP19eOaaiEBv for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:47:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA6A340725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA6A340725
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA6A340725
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:47:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4D0EC0004;
 Sun, 13 Oct 2024 10:47:51 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:47:10 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241013124710.0bc3aacf@windsurf>
In-Reply-To: <20241011173910.2761227-1-james.hilliard1@gmail.com>
References: <20241011173910.2761227-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9/z+d8cMwzRAf7M4jr90amL8KnwFMGs0VhCy+B3Tek=;
 b=WQANrIS0nJXimPsVWTwno/C3l+5YMV9AyB13PWSM1CmldFD43HJcj4t4Kdv8BTa8cOIZdP
 ypJAgdBGemeeoVD/E0ZoBf9x2a/sn1xHlqNjyYAWT0TFUM1T2XEEUeSwJXgg/rUS3vfuVH
 FkL9hB+aWynf6zBBUg+1VIEY3Xv3eHSvxugPAW/t/A+R73UpaVdiI8ztkG3dficPSI/xdU
 OTbRcqWDaOsNHJTSVPBzc4+Z1UQ9jxOPYBKe37FE72aGXZxEZMAcQaTsbiPLYJD8lugMSn
 GO6gIVaLBzwlNxv6SM6W6N4uT2mWLQVhmJgpWuorL4zUJaR6SB0HafbGWs6mYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WQANrIS0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bitarray: bump to
 version 2.9.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Oct 2024 11:39:10 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-bitarray/python-bitarray.hash | 4 ++--
>  package/python-bitarray/python-bitarray.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
