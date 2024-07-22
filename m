Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AABC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EBAB401B0;
	Mon, 22 Jul 2024 16:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PN6QL9xvLlrl; Mon, 22 Jul 2024 16:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C42954038C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C42954038C;
	Mon, 22 Jul 2024 16:30:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8763D1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 749E440320
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRmJR3BzT0CD for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:29:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FF5A4023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FF5A4023C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FF5A4023C
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:29:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8388AE0006;
 Mon, 22 Jul 2024 16:29:54 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:29:53 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240722182953.55cb98d8@windsurf>
In-Reply-To: <20240719-boot-uboot-env-select-v2-1-6abcd50db794@collins.com>
References: <20240719-boot-uboot-env-select-v2-1-6abcd50db794@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721665794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pb+0MCEOuh3uqznCk7vHNsRL2XZpPcs0WIubCj79iNg=;
 b=c9oLJDg4my+creacu1cN5QgDb+j/yvN3oPPkyf/wo8Jn9jDtibQBGM3AygN9sZqMkI0e2n
 +u2tycAGxvjK5ppwWnQDLj01GVTvQXb8QMUBPeQvA+HO8TTo8W3Mof5UZeAxNa4dYBRvtX
 /K0Ch0gMIfFyggbRYAKNLqireDRWd+sJZs06teh/OhrGGLjBjsBLgot/RPG6ZZq7Xki7Ux
 KQ0kU41yh43lbf9M2Z9ZOQ6F22jIOArH1DUBg7vTCONXzA69bOgrhlhmaUY4By8Rte2wox
 OrdJ1S9HBuoB+RuV5teMuRW2jrrmuCCdq0omo26jYNlkKIQp5h1GJAkZ+q6u9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c9oLJDg4
Subject: Re: [Buildroot] [PATCH v2] boot/uboot: fix Kconfig warning for
 DEFAULT_ENV_FILE
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 19 Jul 2024 14:50:26 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> The following warning occurs from commit "boot/uboot: allow taking the
> entire default environment from a text file".
> 
>   boot/uboot/Config.in:141:warning: config symbol
>   'BR2_TARGET_UBOOT_DEFAULT_ENV_FILE' uses select, but is not bool or
>   tristate
> 
> Add a hidden 'bool' config so we can enable dependencies.
> 
> In addition, the DEFAULT_ENV_FILE works by setting Kconfig options,
> therefore we also need to depend on
> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
> Changes in v2:
> - Use a hidden bool [Arnout, Thomas]
> - Link to v1: https://lore.kernel.org/r/20240718-boot-uboot-env-select-v1-1-e6c778e814d8@collins.com
> ---
>  boot/uboot/Config.in | 7 ++++++-
>  boot/uboot/uboot.mk  | 2 +-
>  2 files changed, 7 insertions(+), 2 deletions(-)

Applied to master after changing _HIDDEN to _ENABLED as discussed.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
