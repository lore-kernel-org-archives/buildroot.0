Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE3AC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF36F41550;
	Wed, 10 Jul 2024 21:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lp_qmIopMjUX; Wed, 10 Jul 2024 21:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AD8641549
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AD8641549;
	Wed, 10 Jul 2024 21:55:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61E331BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CB8B41550
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1NQRrfgknCH for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A658E41549
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A658E41549
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A658E41549
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:55:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74905C0003;
 Wed, 10 Jul 2024 21:55:12 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:55:11 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240710235511.5b38a33c@windsurf>
In-Reply-To: <20240710213228.540715-1-ju.o@free.fr>
References: <20240710213228.540715-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720648513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIB+2sEgUwoTnD3WwB8FgTh6/Db5D0Q487ivG+rO/7c=;
 b=pUTLa+sQQLd/Qfk6E+EEsvAz4IsoR9nRNjqnTgGpF5QWoC7Tlqt9u1CqsvegN35ElRuBTU
 savCee6nEyBfsG3Nq5m5sxQZ4is+2uwLcbSPHzC2unGiEG+Db7vWtVmPjAY+zd6Lj/gFkO
 BQrb0WltV9kkT4P0rqKhHtxfO7koh3STSUFKg/tGK2tTLy3lm3eYqbB/VurXgBOCjHJ8XY
 fLjOulMQwB+OTRvFKg0Iy2gtr7X8x6Twct4ssTcBoUSrBxU0wi01HXBb9e1RPddztQBIn4
 0P8I4MgFUSJ6gLW3LvndSGlcUHZ0R7ds0uFYQNMdN+Lke4G+yEytcpYxyaiK3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pUTLa+sQ
Subject: Re: [Buildroot] [PATCH 1/1] package/tcl: bump to version 8.6.14
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

On Wed, 10 Jul 2024 23:32:28 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release note, see:
> https://sourceforge.net/projects/tcl/files/Tcl/8.6.14/tcltk-release-notes-8.6.14.txt
> 
> This commit also drops the package patch, which is no longer needed. The
> upstream commit [1] completely removed the compatibility layer. The
> entry in ".checkpackageignore" is also removed.
> 
> [1] https://github.com/tcltk/tcl/commit/04d66a25716cb7738dad3170cca4d0a4683db08a
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                           |  1 -
>  ...001-Disable-tcl-compatibility-layers.patch | 35 -------------------
>  package/tcl/tcl.hash                          |  2 +-
>  package/tcl/tcl.mk                            |  2 +-
>  4 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644 package/tcl/0001-Disable-tcl-compatibility-layers.patch

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
