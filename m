Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CFBC25B78
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 07:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60D2540137;
	Fri, 17 May 2024 07:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQBP0X7iL_ch; Fri, 17 May 2024 07:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6567E404B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6567E404B6;
	Fri, 17 May 2024 07:06:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B71A61BF45A
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 07:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B09E641EDF
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 07:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2jEpFAo6cDT for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 07:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2984741596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2984741596
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2984741596
 for <buildroot@buildroot.org>; Fri, 17 May 2024 07:06:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B8A620017;
 Fri, 17 May 2024 07:06:19 +0000 (UTC)
Date: Fri, 17 May 2024 09:06:19 +0200
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20240517090619.2469de46@windsurf>
In-Reply-To: <c79c79fb-8692-40c5-8436-25213b54102a@grenoble.cnrs.fr>
References: <c79c79fb-8692-40c5-8436-25213b54102a@grenoble.cnrs.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715929580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+Y671hbTxb+4KJ79KArClc2Ktwry4ikdXwfQwqotzg=;
 b=Fu8Epr+AJAANscdHJ1CqF6ozzp/0mkM3qmKAlm6NJVz+Yv7o6aNm/3U3yzkyJwgFLvsZtC
 J0FkMcRXQC+H8g2Ys3S/hNc4ZZ0kbSBp/tQzJzqAX1p3nqyRd97WOkGdZra9YxrDqAK+mR
 RSbw05CROh/RdRNBJILT6ufmWrOENxsiinFa8z0gG4QXoi2QucuuNS5VbelI2T+06/mdyG
 U7JUK9qx2MBrCICoH74uVis7hL3bTfN8KF/UqSX/4oOKldw78svTSLd25uWAnTKMPAt6Tk
 FuRh75J1imIdThCjwFvSjbSbLBOACmhwLC2zsFWYFDlBkohAflm0M+p6B7qTwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fu8Epr+A
Subject: Re: [Buildroot] Support external toolchains based on gcc 14
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

On Thu, 16 May 2024 17:56:41 +0200
Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> Last July, right before support for gcc 13 was added for buildroot's
> internal toolchain in 3009095ba8 (package/gcc: add support for gcc 13),
> the support was added for the external toolchain in dfbd1aae23
> (toolchain/toolchain-external/toolchain-external-custom: add gcc 13
> version selection).
> 
> Last week, support for gcc 14 has been added for the internal toolchain
> in 5eb0203cb0 (package/gcc: add version 14.x), but this is still lacking
> for the external toolchain. Is this an oversight? Should I just wait?
> Should I instead submit a patch equivalent to dfbd1aae23 for gcc 14?

You can indeed submit an equivalent patch for gcc 14, it would be very
welcome!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
