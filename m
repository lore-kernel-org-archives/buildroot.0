Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD71C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D929240394;
	Sun, 14 Jul 2024 20:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-VmseF9ULIX; Sun, 14 Jul 2024 20:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD4F4039B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD4F4039B;
	Sun, 14 Jul 2024 20:48:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA34D1BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2697403B0
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2xg2bzbTpxu for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:48:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7571C4039B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7571C4039B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7571C4039B
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:48:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 655411C0003;
 Sun, 14 Jul 2024 20:48:16 +0000 (UTC)
Date: Sun, 14 Jul 2024 22:48:15 +0200
To: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>
Message-ID: <20240714224815.428ed5d1@windsurf>
In-Reply-To: <20240408013859.732937-2-matt.stav.taylor@gmail.com>
References: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
 <20240408013859.732937-2-matt.stav.taylor@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720990096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5EvJ5LlCvlm2aGFY/qkGlvbTzXtgo68WCZ0xfWjW5k=;
 b=DQ0n1xVYkHiqzrNuqYBI9RjrFqHCC8QEdHCKvjOoBCicmCt25OndjPg5IIJLD/FValxxpy
 2gI29UjCDNqjKiRz0b4o1S6fgF5zKKn6robUpP4S5mnOZrKf5wS6xOhwx52JPTHKCc8gSb
 LTFkeED2TBS/gZR2qzvvZOB7lN+uvrzAHIxLJZdnxdgR61yTeHonZuadNt6imhtgU/MX4d
 glIjR9ytjTVGE9Ps2WTHIEcaP79uwBKQ/wjqj1TbMSsw/mNprQOlpFuBQQwLiQ5ZnrV1tb
 K2dI0/o7crTwBzEnVr+nh4vbkrG5IZvzU/fdi+XmaxTOiw/CbndrHhARSaeq/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DQ0n1xVY
Subject: Re: [Buildroot] [PATCH 1/2] package: add support for extracting
 zstd archives
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

On Mon,  8 Apr 2024 02:38:44 +0100
Matt Staveley-Taylor <matt.stav.taylor@gmail.com> wrote:

> Teach the generic package handling code how to extract zstd (.tar.zst)
> archives. When zstd is not installed on the host, host-zstd gets built
> automatically.
> 
> Signed-off-by: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>
> ---
>  Config.in                               |  7 +++++++
>  Makefile                                |  1 +
>  package/pkg-utils.mk                    |  2 ++
>  support/dependencies/check-host-zstd.mk |  4 ++++
>  support/dependencies/check-host-zstd.sh | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 support/dependencies/check-host-zstd.mk
>  create mode 100755 support/dependencies/check-host-zstd.sh

Sorry for the long delay in getting back to you. I have now applied
this patch, after fixing the "shellcheck" issues reported on the shell
script. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
