Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE469C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 882124040A;
	Fri, 10 May 2024 21:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6V_9moYw1ux; Fri, 10 May 2024 21:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97A8A40643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97A8A40643;
	Fri, 10 May 2024 21:02:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1534B1BF295
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01A9740643
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SoIzExNnxtrX for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAEB64040A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAEB64040A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAEB64040A
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:02:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 526DB60003;
 Fri, 10 May 2024 21:02:03 +0000 (UTC)
Date: Fri, 10 May 2024 23:02:02 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510230202.5da6375e@windsurf>
In-Reply-To: <20240307171610.47962-1-fontaine.fabrice@gmail.com>
References: <20240307171610.47962-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715374923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fg/MOzstuG2oe2+Ayn8wR1P6AX450XHJHVY6BsKuUNw=;
 b=jrZMDyltNe6xfqsHVAKb717snSIL1lGqK3B0JenR/vhGslEg1J2O6xyTVlvVOrcpr3okdm
 oCJVGuV14gazWQMUtUU9wr8UT10fW+snoqIBy1Ez3pGQd6GK07Omrhv6kma8Rv/VFp5Tgz
 SZBqoShuPDXhKwVk2J1JA5Yjo/38PChdFP9vtseoCfIFCML/jMgwyfUQcDEoPgpFMjouab
 2ydBtRC0Ndy8nuAYcVAmO9WTFsZQjklsKEvrIRg1MQHMY5ZKXRPOrIdgiejosgA8sE6UpJ
 rXj5kOzEtm6fMkGERQyP/8fDkRU+ejY6SLrO7tb0D8DzxfWROtWzt1L6tLzaLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jrZMDylt
Subject: Re: [Buildroot] [PATCH 1/1] package/crucible: fix license
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  7 Mar 2024 18:16:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> crucible is licensed under BSD-3-Clause since bump to version 2023.11.02
> in commit be3f95ed14559f8a9739a12cff604add622b0416 and
> https://github.com/usbarmory/crucible/commit/7fe0bb96da655b4e83031a99115d37f88a171e9f
> 
> Fixes: be3f95ed14559f8a9739a12cff604add622b0416
>  - http://autobuild.buildroot.org/results/6183b11f1564bc07adfff2b02cb0607d0b1de54e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/crucible/crucible.hash | 2 +-
>  package/crucible/crucible.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Sorry, I'm only noticing this patch now, and this has already been
fixed by a different patch from Fabio, in commit
9f4cae383a061b52424bf37900aaa221e3a2f3c5. Sorry about that: your patch
came in earlier, so it should have been the one that got applied.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
