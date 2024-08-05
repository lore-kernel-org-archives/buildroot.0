Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E41C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 11:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77F8860749;
	Mon,  5 Aug 2024 11:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxvx4487JsOg; Mon,  5 Aug 2024 11:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A33160731
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A33160731;
	Mon,  5 Aug 2024 11:34:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA2001BF3AD
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 11:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D78B240253
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 11:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_cyijF7Edes for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 11:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E01E4024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E01E4024E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E01E4024E
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 11:34:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49C8960003;
 Mon,  5 Aug 2024 11:34:14 +0000 (UTC)
Date: Mon, 5 Aug 2024 13:34:13 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240805133413.6df83574@windsurf>
In-Reply-To: <20240213120452.2465425-1-buildroot@bubu1.eu>
References: <20240213120452.2465425-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722857654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sD8HWbC4QH/R+1D6Cv70+r2rHB1/vRvSP7q8pIAtCG0=;
 b=n33Z7LpmVQgTBlxv0O4sODFIY6aduX5tiI+cp8tS2J95hE4IMO+1gpJny9R0MYiFTdZ6/p
 rUm34W8PetuErxap0cqMtuxJPacsbWmm/gg6dib/Y9PEeslsnyUY+FyWDeQinuEZxtg641
 za/vVeD/GZTJrEMAqhAZX+sA1EeNPMBtqPZXMZGzC35/MWeg4uWeA41PVdQONvFEV3X99c
 u9H2qOETeGnNts8Jcl/AgLYImMK76NpDeYhXs18f7FmUBZhothPeVohBjuaK2czkxyM2Ih
 wS3elRZHguP/iScYwkjKIuPx7wC0QYY0GHlnwfm3YrTRWxFUeIFz3EdlDw8Jvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n33Z7Lpm
Subject: Re: [Buildroot] [PATCH] package/nethogs: new package
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Tue, 13 Feb 2024 13:04:51 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Thanks for the patch, which I have applied, after making a few changes.
See below.

> ---
>  package/Config.in            |  1 +
>  package/nethogs/Config.in    | 10 ++++++++++
>  package/nethogs/nethogs.hash |  3 +++
>  package/nethogs/nethogs.mk   | 21 +++++++++++++++++++++
>  4 files changed, 35 insertions(+)

Entry in the DEVELOPERS file was missing.

> diff --git a/package/Config.in b/package/Config.in
> index bf0fe078b9..2d352dd8cc 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2476,6 +2476,7 @@ endif
>  	source "package/ndisc6/Config.in"
>  	source "package/net-tools/Config.in"
>  	source "package/netatalk/Config.in"
> +	source "package/nethogs/Config.in"
>  	source "package/netcalc/Config.in"
>  	source "package/netcat/Config.in"
>  	source "package/netcat-openbsd/Config.in"

As you noted in your replied, alphabetic ordering was not correct here.

> +NETHOGS_VERSION = 0.8.7
> +NETHOGS_SITE = $(call github,raboof,nethogs,v$(NETHOGS_VERSION))
> +NETHOGS_LICENSE = GPL-2.0

License is GPL-2.0+ (they use the "or later")

> +NETHOGS_LICENSE_FILES = COPYING
> +NETHOGS_DEPENDENCIES = libpcap ncurses
> +
> +define NETHOGS_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) nethogs
> +endef
> +
> +define NETHOGS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/src/nethogs $(TARGET_DIR)/usr/sbin

$(TARGET_DIR)/usr/sbin should have been $(TARGET_DIR)/usr/sbin/nethogs,
to avoid having 'nethogs' installed as a file called 'sbin' in
$(TARGET_DIR)/usr if by lack of luck $(TARGET_DIR)/usr/sbin doesn't
already exist as a directory.

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
