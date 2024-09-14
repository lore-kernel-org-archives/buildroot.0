Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A71C0219E
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 383A6406C1;
	Sat, 14 Sep 2024 21:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGpgEUBE4zgY; Sat, 14 Sep 2024 21:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 170F9406CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 170F9406CA;
	Sat, 14 Sep 2024 21:55:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DD981BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFE1F406CA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MiXIexKWbIJ1 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:55:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC88C406C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC88C406C1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC88C406C1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:55:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0899660002;
 Sat, 14 Sep 2024 21:55:20 +0000 (UTC)
Date: Sat, 14 Sep 2024 23:55:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240914235519.73ee43cd@windsurf>
In-Reply-To: <20240906215631.1737953-1-bernd@kuhls.net>
References: <20240906215631.1737953-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726350921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=31qdivIQ/PNzhRSgI3j6NHlU4h1LB4yATrkXPOqD4V8=;
 b=JstmCG6/kovCxfKUqcb11y6gnxmdqYLUm2j/ZGjlBOUXWkOzhCxCrqyHGSxszEvqVmjAyY
 2i61QxLfHgh+YSdx88aSJCD8a39sZhp/8r36YNuOokSVpJemZvyW8ThiV8zOhHwp7ouMVi
 K+Qs9oi5EQKTvQanReR8rxWt3xrJ38IORwQHBkkXFe7GQ34S3w7dKArxbcR7xWoR6kEbId
 4zNcboFHsfRg7VbW/idrgSr3DddxzNWjgX+DnU/fR9Ap/ndsIRamA/QpkQntcAGzLQIr7m
 6vxpDMBXrIJiGuXzSGZ4B8xXIP1VLqt43mEsRS+mOrK7kIgHY1ixJAh2tftKmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JstmCG6/
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi-peripheral-xarcade: bump
 version to 21.0.1-Omega
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

On Fri,  6 Sep 2024 23:56:29 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash | 2 +-
>  package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
