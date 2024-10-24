Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538ABD1036C
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092E441061;
	Thu, 24 Oct 2024 20:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8OsSpvN8Ib4; Thu, 24 Oct 2024 20:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBAE6410A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBAE6410A0;
	Thu, 24 Oct 2024 20:39:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A4794960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 673B440BE2
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJAAkzKI-5NG for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:39:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BB6540BDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BB6540BDA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BB6540BDA
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:39:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72FA9C0002;
 Thu, 24 Oct 2024 20:39:49 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:39:48 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Buildroot ML <buildroot@buildroot.org>
Message-ID: <20241024223948.09d9dd11@windsurf>
In-Reply-To: <ZwuMDPcgFOLNVRqn@landeda>
References: <ZwuMDPcgFOLNVRqn@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729802389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxIWOv3ZnwB8vEQWvMonYO6MCZHfoUYthc0AW92zGtA=;
 b=dFEmNVSZEfTliDOdasPDRxRii9uqIu1ZSM9AudQuvg38uEVoTmmvvywFnIy/fdT9SsxJSF
 yNega9WkR74ujQSrqwAQrIlog6CNBGbvHNVCGIeG0TM6s72cAG7lw6Vr1y1khuO83bJxsO
 yFmKzVmJClV+UOS6S1E5pa35J6X6mrfhuKqzX+pgNEs4+OVOIaAFIfKzFuekTeog/V2J7f
 ZRe/tdaqcs03EE7jVV+GPPL2O1m7yTRjw7LzzeKjhV3GojoLL5Lpvl9Yq3Cr+gAD23Lv1w
 25ey5/lujFsvLAmYYFfTl8V/Udx/nKjaJuMqi7QTUmvAMbHqPvEKh7XJRmH94A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dFEmNVSZ
Subject: Re: [Buildroot] Resigning as a maintainer
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

Hello Yann,

On Sun, 13 Oct 2024 10:59:56 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> As a consequence, I have resigned from my position as a maintainer. The
> other maintainers have been informed of my decision a few days ago now.

I am obviously sad to see you go. You started contributing to Buildroot
not long after I started contributing myself, so we spent quite some
time together as active contributors, and I must say I've very much
enjoyed your technical expertise, dedication and persistence. Of
course, we've had disagreements, but I believe the kind of
disagreements that help make things better, by finding better
trade-offs and more balanced solutions, and simply by making everyone
think about things from a different angle.

For all of that (and much more!): thanks a lot, for what you brought to
the Buildroot project, but also for what you brought to me personally.

I wish you all the best in your next adventures, and hope that another
open-source project will have the chance of counting you as one of its
contributors.

Cheers!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
