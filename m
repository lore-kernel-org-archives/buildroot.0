Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D38CD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F359401E4;
	Tue,  3 Sep 2024 21:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTwNf_bfgKa2; Tue,  3 Sep 2024 21:08:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A24B4028C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A24B4028C;
	Tue,  3 Sep 2024 21:08:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0397F1BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E413D80E60
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WefZ6BxwB_Jc for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:08:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE56580E5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE56580E5E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE56580E5E
 for <buildroot@busybox.net>; Tue,  3 Sep 2024 21:08:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E6FF20002;
 Tue,  3 Sep 2024 21:08:17 +0000 (UTC)
Date: Tue, 3 Sep 2024 23:08:16 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240903230816.36912f3d@windsurf>
In-Reply-To: <20240902203454.2649413-1-francois.perrad@gadz.org>
References: <20240902203454.2649413-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725397697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2eXJ3y3HEfoOB4OKLd7furMWF6ROdBD9dOGKgBahLxM=;
 b=mVxwkuYIk75e6x1nhhTMJPwGrGRaXO/sSf/ztMDm1N7dsMmVgkdA0Qj37hKEnHE6Oua1wn
 TM2PQyPavPPEKu+k32AnX5Zf8VlzLYtu2I/AYTYpZAPjlNFB5PVzfAV4mTIFnufHoazgca
 J/eIEEESHewxIdjS1a9Q6QN0WNd7+K2ZGa92dcYlE5fJAvZd59c6weaFztNWFaDDklz6q4
 OWl+E9aCaTDrBkJnBpwnxzxm3mEBTRgH/0LXuCfpIBCXTWYjpSY3yr8RvuCa+9r72/zCHQ
 neUVvS7vFYT7Zv8w4FxtcTl6QJhE/uTJIYiAXfyxPhrrg6W/ZZ7s6ZoUsR0Ulg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mVxwkuYI
Subject: Re: [Buildroot] [PATCH] package/dbus-broker: bump to version 36
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Sep 2024 22:34:54 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> diff subprojects/libcdvar-1/AUTHORS
>     +        Kostadin Shishmanov <kocelfc@tutanota.com>
> 
> diff subprojects/libcrbtree-3/README.md
>     + * **Documentation**: <https://c-rbtree.readthedocs.io>
> 
> diff subprojects/libcstdaux-1/AUTHORS
>     +        Copyright (C) 2022-2023 David Rheinsberg
>     -        David Rheinsberg <david.rheinsberg@gmail.com>
>     +        Adrian Vovk <adrianvovk@gmail.com>
>     +        David Rheinsberg <david@readahead.eu>
>     +        Nikita Popov <npopov@redhat.com>
> 
> diff subprojects/libcutf8-1/AUTHORS
>     +        Copyright (C) 2022-2023 David Rheinsberg
>     -        David Rheinsberg <david.rheinsberg@gmail.com>
>     +        David Rheinsberg <david@readahead.eu>
>     +        Jan Engelhardt <jengelh@inai.de>
> 
> diff subprojects/libcutf8-1/README.md: minor wordings
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/dbus-broker/dbus-broker.hash | 12 ++++++------
>  package/dbus-broker/dbus-broker.mk   |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
