Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E44DC52D7D
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 08:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 565AE400B5;
	Thu, 15 Aug 2024 08:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OT4mNXXuIPx; Thu, 15 Aug 2024 08:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 165DB4024C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 165DB4024C;
	Thu, 15 Aug 2024 08:07:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2A71BF2B6
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB6C44024C
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTgDQI4ygAD9 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 08:07:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86AD1400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86AD1400B5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86AD1400B5
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 08:07:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1885FF804;
 Thu, 15 Aug 2024 08:07:16 +0000 (UTC)
Date: Thu, 15 Aug 2024 10:07:15 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240815100715.63a9e925@windsurf>
In-Reply-To: <Zr2s0yK7LbaHn+Uq@waldemar-brodkorb.de>
References: <Zrz+JUwTsNaKI8sK@waldemar-brodkorb.de>
 <20240814221950.458101ad@windsurf>
 <Zr2s0yK7LbaHn+Uq@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723709237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Knov8v2Juz3Cukx+heZc2IW8RB7WPUWBHQtulstqx8=;
 b=owxPfbEg7EQIm1h9rs4Hvzv6o29FNdeT32XywsnxaHv+GJQXqA3vFxUEdTS3KIFxiPF1Zi
 8GpgkHbYRzFmWmMFD7q8Anod7/e8+bNFBseuhOfmaiV66F63GF2AY2ZTWP2BCcBB758X7P
 /wI7dP9bc2j2/DwbRttH6OLzmOAHJWhLJ0+PHnvQw8ekkSC3xO8nMoX59FDMFtL8YfGSVv
 7Ik9C79q2P4YUARNGn+GDsTstDnJ+JT+PHODLqnmcMvmGuxhWdsjGUSjlO+Cu/Rpc13JG1
 Qr++EQ6lVJAl+JP97PC00OZpeH6A+1R8mk9zmKB6hhmi/ZpRSQhynWnzKaX5WQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=owxPfbEg
Subject: Re: [Buildroot] [PATCH] package/iproute2: fix musl compile errors
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Thu, 15 Aug 2024 09:22:59 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> It seems the Gentoo People already reported it upstream:
> https://marc.info/?l=linux-netdev&w=2&r=1&s=musl&q=b
> 
> Would you like to update to this link or wait until the commits are
> upstream in git?

The link above is not very relevant, as it's a list of many e-mails.
The relevant link is:

  https://marc.info/?l=linux-netdev&m=172278781323421&w=2

It is totally fine to use this link indeed for the Upstream: tag.
Basically, for the Upstream: tag we use what's available at the time we
add the patch in Buildroot: a link to the upstream commit if it's
already upstream, or a link to the mailing list, PR or issue ticket if
it's still pending upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
