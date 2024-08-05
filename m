Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6146DC3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 13:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0932F401BC;
	Mon,  5 Aug 2024 13:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zfV6r9NfTBy; Mon,  5 Aug 2024 13:46:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5524401F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5524401F7;
	Mon,  5 Aug 2024 13:46:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5FE1BF334
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6933C605F7
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 13:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPuEQ-aJLzdm for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 13:46:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45F116059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F116059D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45F116059D
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 13:46:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0EE0E0002;
 Mon,  5 Aug 2024 13:46:52 +0000 (UTC)
Date: Mon, 5 Aug 2024 15:46:49 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240805154646.669e829c@windsurf>
In-Reply-To: <20240805162439.GD3474121@igalia.com>
References: <20240627220223.6687-1-aperez@igalia.com>
 <20240627220223.6687-3-aperez@igalia.com>
 <20240712173734.30592e67@windsurf>
 <20240805162439.GD3474121@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722865613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXSwJoW0/1wpLGRmLgJCkpwxPk7lfo4YgfSG+nluV+g=;
 b=FgdDril9t55nyExCtm2fCRl7tWPEw30j5VZtV06C+E7qOGb+9W6Ow4Z/4HURvDy1SeeD2s
 vLdi35ib9qII5AhGDm0evETwGPKx9vXeg8K8f5vITjrz8ektKVKak8c2yeosAjblnZtjc+
 2541o5CEVKvYwar+fhBf2gt/knRoe9w7A5UWwpeyYBx5OtzoyHHUrQ/uDIYMcv1ENboqwU
 X05eKDuxqb4+qznu97Yh88bBzgNvdNlJO+fa/5XSkUUCTkTAITjGY+jHHxD1BmrA54yqgL
 Cqmx2HSfTkfW4xGFwq9O9Yx4kKIN0EXBwhqPVM9Gz+R2drhgbSRAGiDSC/CB6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FgdDril9
Subject: Re: [Buildroot] [PATCH 2/2] package/sysprof: update to version 46.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adrian,

On Mon, 5 Aug 2024 16:24:39 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> > Would you want to be added in the DEVELOPERS file for this package? You
> > just did a big bump, it would make sense if you helped fixing the build
> > failures that might results for this bump :-)  
> 
> I suppose it makes sense, I will send a patch adding myself as maintainer
> for the package later :-)

Perfect!

> > BTW, pretty mind-blowing that sysprof absolutely requires polkit...  
> 
> Yeah, I was hoping that there would be a way of configuring the build to
> disable the polkit dependency, but not at the moment. We're in contact with
> Christian Hergert (the current sysprof maintainer) and he is open to have a
> patch upstreamed to make polkit optional at build time. I don't have an ETA
> but I might be able to work on that in the coming weeks. Once we have that
> done, I plan to bring the patch into Buildroot =)

Nice, looking forward to it, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
