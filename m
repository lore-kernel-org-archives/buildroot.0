Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26758C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 13:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE18407AA;
	Thu, 15 Aug 2024 13:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2o78n5Bk_hrQ; Thu, 15 Aug 2024 13:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AD7340824
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AD7340824;
	Thu, 15 Aug 2024 13:33:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCA041BF2A2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B763660605
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W37dDEbVvRGZ for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 13:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BEE960765
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BEE960765
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BEE960765
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 13:33:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52906240003;
 Thu, 15 Aug 2024 13:33:25 +0000 (UTC)
Date: Thu, 15 Aug 2024 15:33:24 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240815153324.4df7662e@windsurf>
In-Reply-To: <20240813121904.248928-1-buildroot@bubu1.eu>
References: <20240813121904.248928-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723728805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rH966E6DWA63YfO2ucn4YsJU/4ZkIBft7cVQa9DJd7Q=;
 b=GYym1iBFLFudUs2mNyPdNW14jB8mBeQw5yBgM1Uqx8hYosIE8nAFzskXygft2RLHhgSlpU
 EoFKlo/lf27JgYDLWuT0s85UAOl2Yw/NSPwtxBp8bN03jrvSf7fkmaDqgbbUad4TX0Ably
 XybSyIR7YwCOv0yh/Otlu6PhMVBGZxvLQw4sZ1RHFueafsPT5W6OyfblK5s3DJmpolQZUq
 o5/7/BThyUXx3Q10cUFvvuVXi4kfvu58nwGFdwr8/Jef8rhOmNDXICC6wDd8CTEXfC4eUy
 r5nS00fXqPV8rtYkeSs/CpMfOl1XOx27iX1yDnTmyhFKzLC5dEJqUi9OXfj8gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GYym1iBF
Subject: Re: [Buildroot] [PATCH] package/python-immutabledict: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Aug 2024 14:19:04 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/Config.in                                 |  1 +
>  package/python-immutabledict/Config.in            |  7 +++++++
>  .../python-immutabledict.hash                     |  5 +++++
>  .../python-immutabledict/python-immutabledict.mk  | 15 +++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-immutabledict/Config.in
>  create mode 100644 package/python-immutabledict/python-immutabledict.hash
>  create mode 100644 package/python-immutabledict/python-immutabledict.mk

You had forgotten to add an entry in the DEVELOPERS file, so I did that
and applied to next, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
