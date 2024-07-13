Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BC7C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF0C24068B;
	Sat, 13 Jul 2024 14:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkQVD7CcEip8; Sat, 13 Jul 2024 14:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 950CE40725
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950CE40725;
	Sat, 13 Jul 2024 14:39:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5391BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3598840725
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8uBpfOtgW2P for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E96344068B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E96344068B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E96344068B
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:39:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3100740002;
 Sat, 13 Jul 2024 14:39:41 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:39:40 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240713163940.6bce2ae6@windsurf>
In-Reply-To: <20240713133104.126090-1-ju.o@free.fr>
References: <20240713133104.126090-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720881581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1zUroMvfmAlzASzhg4N1d1/+oDiRmXKJHO99M8qVxw=;
 b=Bho8A9iuW1gmrh12MIB6y6YADNAwbh2r8D5S9jrdk4fN0RczrtZ0BCOMx4wUmYsonYwEjB
 NA/SOBDgXS92EfpgLo/HDiqq1KgTFWlyOhXq13AEKTFb146rwS6oPx8QxLBs5Uj53gxEoO
 XEDCIMX3TbzEKVFFMSgh9JKDmnhq7ZJUKSeFsrd+q2X+RtrZkmjsO4IWriPhV9jLfKpMYa
 7dvV2y9PKYkhFBqs3jli5rb2D8L3uRMtyo8y32oXiiy1x/ZCvuNMVxcovH63kFFObi54Lo
 eA3XlRJOMb8YTrqyhe8rjwtpZTScfGw56IlQTABRAm0lAjbU1ee77QCpEbIqmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bho8A9iu
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenmpt: new package
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

On Sat, 13 Jul 2024 15:31:04 +0200
Julien Olivain <ju.o@free.fr> wrote:

> libopenmpt is a cross-platform C++ and C library to decode
> tracked music files (modules) into a raw PCM audio stream.
> 
> openmpt123 is a cross-platform command-line or terminal
> based module file player.
> 
> https://lib.openmpt.org/libopenmpt
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 42eae73 with commands:

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
