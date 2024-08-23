Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B16C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 15:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6C9381E73;
	Fri, 23 Aug 2024 15:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0EutFrwFgXZ; Fri, 23 Aug 2024 15:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC89D840E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC89D840E0;
	Fri, 23 Aug 2024 15:33:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E396D1BF4E6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D02A240277
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jl01n__xrNen for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 15:32:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BF08401D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BF08401D8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BF08401D8
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 15:32:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4918C60004;
 Fri, 23 Aug 2024 15:32:56 +0000 (UTC)
Date: Fri, 23 Aug 2024 17:32:55 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240823173255.32943822@windsurf>
In-Reply-To: <ZsiGkIy9Mygzoexq@waldemar-brodkorb.de>
References: <ZsiGkIy9Mygzoexq@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724427176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xqXuYeDnBZiCWUZfd0ulB6YdVrUBu4G9BwXSdqACQTc=;
 b=TZ7sk6G4DshX/HmYZ2mxIgT3tQjRF9opXLffN3ZKbMT7mmf744q4av7jDGDvCS0at5lvAL
 hyCOE78kiMdY5YmutQRRE5ssskxhoSMNxN8r2GMjBlzo0rL2uKmMNJe/xUebYH8soc7kIU
 fZGWplZziDfSelUtjOvtF4Vl03fe+FTPexCEg62TTc5GS17q8Fdn7Mb+h6CvyowAa0UihV
 MiGPOW3hbeKcTDv9PySTnEiOtTqxim+bLtfAaEMbCwG5ekSnXQkHvCfvY+lWglnqxY5mm7
 kvasDQP4B6ualOxNmeAWuHAtOpSPhiO1EnlJs06AHFW58HgGHi8b3tLupL66KA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TZ7sk6G4
Subject: Re: [Buildroot] [PATCH v2 next] package/fbv: update package
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

On Fri, 23 Aug 2024 14:54:40 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> After the official fbv download page is no longer available
> switch to an hopefully active github fork.
> 
> Changes made to the Buildroot package:
> - new active upstream fork (6 month old commits)
> - use autoreconf to create configure
> - remove all patches because they are no longer required
> - upstream removed GIF support, so remove it here too
> - license is unchanged, but full COPYING file is now included
> 
> Tested on a RPI5 with a PNG, BMP and JPEG picture.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to next, thanks. You had forgotten to drop the entries in
.checkpackageignore. Make sure to run "make check-package" prior to
sending patches, or add https://paste.ack.tf/f4de07 as a post-commit
hook in your Buildroot git repository to have automatic checking :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
