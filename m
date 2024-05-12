Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C93C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4566A4214B;
	Sun, 12 May 2024 10:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7LVCkPCBCDV; Sun, 12 May 2024 10:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EE33421D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EE33421D2;
	Sun, 12 May 2024 10:06:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2320C1BF27A
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 181EA421D2
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lf_k64QDXsfN for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:06:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A757C4209D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A757C4209D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A757C4209D
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:06:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80EDB1BF203;
 Sun, 12 May 2024 10:06:06 +0000 (UTC)
Date: Sun, 12 May 2024 12:06:05 +0200
To: Stefan Ott via buildroot <buildroot@buildroot.org>
Message-ID: <20240512120605.60672d99@windsurf>
In-Reply-To: <20240313191736.847855-1-stefan@ott.net>
References: <20240313191736.847855-1-stefan@ott.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715508366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLi/cmbOQM56othU7cHajtDcp1zlD3U35uX1LmEJPtA=;
 b=gRtKrC07NnSQ7jSKO2gYVWvl3oGi2ocTj/ef0fyAVbR/HFMErHwq4Xwd3lL+JgcIzxa3C8
 11r5M8pGukm8hTj0xzEUhop+smD3ge7zxEEIqonW0gOkF8XeqrNWLxL7Xh2WsfDRkdhxgD
 WaiONht6KLP5TOs40xdTSvzbG80rkQjxeWg9wEQLqbab+z1a71ttDyL5fLoaVCFtO1yw5l
 awclc8/tpSJaRu8ajoVSi9Bskci2yAH+HOL1dpuEjmQdanzKu/TJiQxGgOMf7eV3stiw4s
 ZURvuST/CIw3sm/NtmLITl+fL3p5bth9GnD+9ChAQdFjNVuniSf8oqDZ45mO4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gRtKrC07
Subject: Re: [Buildroot] [PATCH] arch/Config.in.x86: enable SSE2 on Pentium M
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
Cc: Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 13 Mar 2024 20:17:36 +0100
Stefan Ott via buildroot <buildroot@buildroot.org> wrote:

> The Pentium M does support SSE2 so it would make sense to enable it.
> 
> Signed-off-by: Stefan Ott <stefan@ott.net>
> ---
>  arch/Config.in.x86 | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
