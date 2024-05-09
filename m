Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B64C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C343D40242;
	Thu,  9 May 2024 20:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9nR3xS7-cH4; Thu,  9 May 2024 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AA2B40F48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AA2B40F48;
	Thu,  9 May 2024 20:12:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB00A1BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B71EA41DEA
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHEOTDlC7IAh for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:12:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 977A8402C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 977A8402C3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 977A8402C3
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:12:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0DD51BF203;
 Thu,  9 May 2024 20:12:23 +0000 (UTC)
Date: Thu, 9 May 2024 22:12:22 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240509221222.29cb5cd8@windsurf>
In-Reply-To: <20240427134748.700804-1-thomas@devoogdt.com>
References: <20240427134748.700804-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715285544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkEHW4j9LPUE9Nq+2Nf7TBOKXgimKIxfx0eMTdeyHRM=;
 b=bJWtUB2ckczV25Pling7lFyFgB0EjPNMGx3gv+n8+G5da9Ml31QRojMiAK2PTe4tysZLse
 S5jCipCGPhTvn33Xvf4rIkpqLzsTeSuH+f0XvfgWTNp02ncF7ykIEyK55m5eQmIadW212p
 lTwxv6vLFY3+Xs+lDdysYJsvij2SFg8qvcmUk4eCmHqAk66zS+egI85NH3ksO3i/JtT3uI
 GR2dAlxuhCDVSbDaJmHEHXbn92MwVS17s8Ipe0fx76KfzXaS1eZlbpIqoGtIf4N439Iggf
 mvxY4Xjn8D4i2qzhr7f7x6phGP4JPfgDFEUZTbCp6EwKd7IDKg9i4/wOJnlnyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bJWtUB2c
Subject: Re: [Buildroot] [PATCH v1 1/2] package/weston: bump to 13.0.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Apr 2024 15:47:47 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> Announce:
>   https://lists.freedesktop.org/archives/wayland-devel/2024-April/043575.html
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>  package/weston/weston.hash | 6 +++---
>  package/weston/weston.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Thanks, both applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
