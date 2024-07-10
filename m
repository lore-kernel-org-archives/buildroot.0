Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC04C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1541C82109;
	Wed, 10 Jul 2024 20:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_BdXgJc_XjJ; Wed, 10 Jul 2024 20:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76AE181E28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76AE181E28;
	Wed, 10 Jul 2024 20:15:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 534571BF599
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FD0341392
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id himlUoKxnxb6 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:15:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 369824135F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 369824135F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 369824135F
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:15:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE9A360006;
 Wed, 10 Jul 2024 20:15:33 +0000 (UTC)
Date: Wed, 10 Jul 2024 22:15:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240710221532.384df548@windsurf>
In-Reply-To: <20240630145712.13579-1-bernd@kuhls.net>
References: <20240630145712.13579-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720642534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3syL2HC8fqoUSalqc5EfwKIwXzSNAU6TZxHefCr3m0=;
 b=hnZtJMppFAVH9sLXyi2G8rTmejzNO4S267iP6AL3lpJC3K6S8SG3QcxkMtKOJbE11VmjnO
 pPKr1ouNvCRoytfhxQdb/A/3J8lguKArgT5ZXuteM7L+oGGEy7DGD5GSUwclrsiFwK+e3V
 2t4sydZbajI7/GE/8wSvXDOYbLYHHiRUzJUocoTalar4lFB2y/4tmmhrwJiEeP+tnSsqDU
 uJwcay0mockmaCcVsyMMgtO7Fl+eSfflRQoGn960lXZc5+LZWxy/vrYJ6+00dijpFnD/CK
 3fnFxKG8buUcVDd5VMrgr8E9pD7X2AbG7SddRfhd2HmL+JrtImoJnabCxvX/Gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hnZtJMpp
Subject: Re: [Buildroot] [PATCH 1/4] package/onevpl-intel-gpu: rename
 package to intel-vpl-gpu-rt
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jun 2024 16:57:09 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Upstream renamed the package and moved the github repo:
> https://github.com/intel/vpl-gpu-rt/commit/74dbcc6240e8315ad927f642a5d733e6a515a1d4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  Config.in.legacy                                  |  8 ++++++++
>  DEVELOPERS                                        |  2 +-
>  package/Config.in                                 |  2 +-
>  .../Config.in                                     | 13 +++++++------
>  .../intel-vpl-gpu-rt.hash}                        |  2 +-
>  package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk      | 15 +++++++++++++++
>  package/onevpl-intel-gpu/onevpl-intel-gpu.mk      | 15 ---------------
>  7 files changed, 33 insertions(+), 24 deletions(-)
>  rename package/{onevpl-intel-gpu => intel-vpl-gpu-rt}/Config.in (69%)
>  rename package/{onevpl-intel-gpu/onevpl-intel-gpu.hash => intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash} (80%)
>  create mode 100644 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
>  delete mode 100644 package/onevpl-intel-gpu/onevpl-intel-gpu.mk

"Gratuitous" package renames are always a bit annoying as they break
existing configurations, but oh well, if upstream changed the name, I
guess it makes sense to follow suit. Therefore, I've applied your
series, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
