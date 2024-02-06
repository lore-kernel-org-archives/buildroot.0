Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646DDC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 20:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1722E60B90;
	Tue,  6 Feb 2024 20:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTi9NiE89LFV; Tue,  6 Feb 2024 20:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41E9A60D59
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41E9A60D59;
	Tue,  6 Feb 2024 20:47:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E43E51BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB7884011D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOQpFWh3YBAh for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 20:47:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94F914012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94F914012F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94F914012F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 20:47:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03CDE40002;
 Tue,  6 Feb 2024 20:47:35 +0000 (UTC)
Date: Tue, 6 Feb 2024 21:47:35 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206214735.7d69db1e@windsurf>
In-Reply-To: <20240206193048.658003-1-james.hilliard1@gmail.com>
References: <20240206193048.658003-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707252456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8YkX5KOk/6NwaEfqnk/vbyLLBbQ/aM/bJy6EqaLyIQ=;
 b=MZusMvUOmtI8RJeo9kc/nGmki7G6E7/QRNdwTDhIk7dihin39mSVT/cZYQyiCUw8TYmozp
 up7OXuHBfiJq28ElSQm/6rmtDhxKycicbCVZAdSrDJOgwOYKQZ/WbPcK5MWKyO2aI1TOVF
 etTGN+h2whBvqLbLAbFXd9N2YUOcPcuTqR6foSib4E7mf4im52+rhU6cDw+c3NJyhUY+5A
 Eys9PStiDTCCaHUtHEvGd7xwMvcwDWrmISlDUox4ynMCkVuO2YgTWvG68Hle47RwZ0gKyT
 EJxhSt1JkVW6NKJsfv4ofLoZjUSNf0OnBgfFxh5x/DIDtPhhzaJQAQmUgfYYZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MZusMvUO
Subject: Re: [Buildroot] [PATCH v3 1/3] package/python-poetry-core: new host
 package
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

On Tue,  6 Feb 2024 12:30:46 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> +PYTHON_POETRY_CORE_LICENSE = \
> +	Apache-2.0 or BSD-2-Clause (packaging), \
> +	BSD-3-Clause (fastjsonschema), \
> +	GPL-2.0-or-later (lark), \

Didn't review the licensing, but in Buildroot we diverge from SPDX on
this point, and we encode GPL-2.0-or-later as GPL-2.0+.

No need to resend just for that, it can be fixed when applying.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
