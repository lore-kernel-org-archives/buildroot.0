Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAF6C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C16A413E5;
	Sat, 13 Jul 2024 14:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNAL6Q0HNtKJ; Sat, 13 Jul 2024 14:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9779C41482
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9779C41482;
	Sat, 13 Jul 2024 14:37:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7E9E1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5BFC8208F
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGlH_4fzTTNS for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85CA480F6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85CA480F6D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85CA480F6D
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:36:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85CEFFF803;
 Sat, 13 Jul 2024 14:36:57 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:36:56 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240713163656.0b7b5978@windsurf>
In-Reply-To: <20240713130847.4097389-1-dario.binacchi@amarulasolutions.com>
References: <20240713130847.4097389-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720881417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLQE0JvgCjhMBGk1sokSeRQaSJVFfO+wnA8H2lZceUU=;
 b=DO2PbRny8iBZqTP5tYnlWCMgMbxFwDoIF8lH688izYCQin+eReT3HxESrM0z2A8lK+md5L
 G+bmybrUXMZQU+0tKkuD6lc/ztfiFNazFjKhGTlb13h89/cHZwwJ6Wkp/kB9H/gz3TfPdL
 NO9ApD/ygHN0FtyhWvePX9a/kyxKAP6e3gcCNCRotqoPlS0itoMTKxvlnE8huaC9szm/tR
 ixybjAe0zpkk9e4QaCvcR2L8U0yknpaC1jWUdizwNeDctykGqDhpYUTcAXtpG7snrNDe+E
 dq7/zWTvDuKnurInotUOVZWnef6GldICVm2tbO5ObICQqEZ9ihBnANmABC73Ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DO2PbRny
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32mp157a_dk1: bump Linux to
 6.6.39 and U-Boot to 2024.07
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
Cc: Marleen Vos <marleen.vos@mind.be>, Bartosz Bilas <b.bilas@grinn-global.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Sat, 13 Jul 2024 15:08:47 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps the Linux kernel to version 6.6.39 and U-Boot to version
> 2024.07.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Could you also have a look at bumping TF-A to version 2.9 ?

Ideally, we should try to align with the DK2 configuration, which is
being updated
by https://patchwork.ozlabs.org/project/buildroot/patch/20240712221333.909756-1-rgallaispou@gmail.com/
that I will apply soon.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
