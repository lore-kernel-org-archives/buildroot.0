Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CA8C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 07:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 101D6606E9;
	Sat, 11 May 2024 07:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVugmAu4-eYq; Sat, 11 May 2024 07:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2605160782
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2605160782;
	Sat, 11 May 2024 07:01:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFEE81BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC26742482
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIJrZf07sH2h for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 07:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C32C4247C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C32C4247C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C32C4247C
 for <buildroot@buildroot.org>; Sat, 11 May 2024 07:01:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EA1F40003;
 Sat, 11 May 2024 07:01:01 +0000 (UTC)
Date: Sat, 11 May 2024 09:01:00 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240511090100.7c97e100@windsurf>
In-Reply-To: <20240221182304.647302-1-james.hilliard1@gmail.com>
References: <20240221182304.647302-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715410861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjmDCgWIEspxc3eMh47cpWTk/iKS9XR9JtqmZ4Ld7Jo=;
 b=MCdFgvynSXtwLVSqBJzmsaYjaCEDFXK5IrlFd1JBv0GFqqpGZkHiuBnqjPV271uvbtVld9
 SZQZaDXirY3akqBpfEq/A9hdpckSzFscZoim//Def6Mx36kG6wmlrznh6w0UumoZlcYij4
 tcCsjg4C5jeR42cHviCLduhQqF+BG+kDGK4aMATkRZjFUw70usUuaoXs+/04p8vRDAqprF
 PuqFE7uNVnieNtmrnYnvlmsrhjXGJ6dfgnh9sMtuUwkuMNdxf6iUEoJx6/7clUDcKqBSZ9
 v1MhWQEz4kpkKOnScvn7QeKPega91+kNBp4QCXXRkJZ04ni1L2DU3wsCmJZc3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MCdFgvyn
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2023.12.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 21 Feb 2024 11:23:04 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/swupdate/swupdate.hash | 2 +-
>  package/swupdate/swupdate.mk   | 2 +-
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
