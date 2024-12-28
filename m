Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42817E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 22:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B284580EE1;
	Sat, 28 Dec 2024 22:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9zq889D2pnQ; Sat, 28 Dec 2024 22:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA3BA80EE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA3BA80EE2;
	Sat, 28 Dec 2024 22:00:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3110CA
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFDB540118
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2fw_6xvhIqo for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 22:00:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0482E4012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0482E4012A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0482E4012A
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:00:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADDD9FF802;
 Sat, 28 Dec 2024 22:00:07 +0000 (UTC)
Date: Sat, 28 Dec 2024 23:00:06 +0100
To: Ayoub Zaki <ayoub.zaki@embetrix.com>
Cc: buildroot@buildroot.org
Message-ID: <20241228225841.4d1fb895@windsurf>
In-Reply-To: <20241227202458.208386-1-ayoub.zaki@embetrix.com>
References: <20241227202458.208386-1-ayoub.zaki@embetrix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735423207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nSNotLlB0XN7zR2QcdgO9u/3RXrCZRgzJQ43V10RMTw=;
 b=U1LW9JcLR3yLKQ1EEm/JZgbIFu9QGVnBiVLXaSVUV4d33kX5OEnNiSdNo2OHGVx0ZHljbc
 nbTaCTG6a9I+LF5gz5oQOS23ZeUZCZYK61n5MrKaStiaKctLSoTjpdQCgc21d3VXN9R2r6
 TgetT0XeYkzgTZEFfY9VRi0n+0RC56rGAhyuTb6s/BynDhu0BlIqS1edHEEFWqVkwp9DLR
 O8AqwJ4C9trd5wOH0KTOnDvP/oGC2w/7nKdL7Iya+a3Z14z7iGvHQq1khghdTd46bN0Ymi
 DJ71KcRnRbqUSO7ugmf+L3Jdl/Kz10AjbZ/29YKp3XzNX2/jd6M1PG/P7l4iCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U1LW9JcL
Subject: Re: [Buildroot] [PATCH] package/bmap-writer: add initial package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ayoub,

Thanks a lot for this patch! A number of comments below.

On Fri, 27 Dec 2024 21:24:58 +0100
Ayoub Zaki <ayoub.zaki@embetrix.com> wrote:

> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
> ---
>  package/Config.in                    |  1 +
>  package/bmap-writer/Config.in        | 12 ++++++++++++
>  package/bmap-writer/bmap-writer.hash |  3 +++
>  package/bmap-writer/bmap-writer.mk   | 15 +++++++++++++++
>  4 files changed, 31 insertions(+)

You need to add an entry in the DEVELOPERS file for this new package.

Also, this package is only adding a target variant of bmap-writer,
which IMO isn't the most common use: one will very likely need
bmap-writer on the host to be able to flash a SD card. Do you think you
could also add a host variant of bmap-writer?

> diff --git a/package/bmap-writer/Config.in b/package/bmap-writer/Config.in
> new file mode 100644
> index 0000000000..e779aa835b
> --- /dev/null
> +++ b/package/bmap-writer/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_BMAP_WRITER
> +	bool "bmap-writer"
> +	select BR2_PACKAGE_LIBARCHIVE 
> +	select BR2_PACKAGE_LIBXML2

You need to replicate the dependencies of libarchive and libxml2, i.e:

	depends on BR2_USE_WCHAR # libarchive

Also, since bmap-writer is in C++, you need:

	depends on BR2_INSTALL_LIBSTDCPP

> +	help
> +	  bmap-writer is a command-line utility designed to efficiently write 
> +	  disk images to storage devices using block mapping (BMAP). It serves 
> +	  as a lightweight alternative to the Yocto BMAP tool, specifically for 
> +	  embedded systems. Unlike the Yocto BMAP tool, bmap-writer is C++ based, 
> +	  does not require Python, and focuses solely on writing an image.
> +
> +	  https://github.com/embetrix/bmap-writer

And add a comment:

comment "bmap-writer needs a toolchain w/ C++, wchar"
	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP

> diff --git a/package/bmap-writer/bmap-writer.hash b/package/bmap-writer/bmap-writer.hash
> new file mode 100644
> index 0000000000..e97dac11b7
> --- /dev/null
> +++ b/package/bmap-writer/bmap-writer.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  94fda8420fa82256bfd01a76dff18ae23c6be9be03cb641f9845164e9326de60  0.0.3.tar.gz
> +sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
> diff --git a/package/bmap-writer/bmap-writer.mk b/package/bmap-writer/bmap-writer.mk
> new file mode 100644
> index 0000000000..b363295850
> --- /dev/null
> +++ b/package/bmap-writer/bmap-writer.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# bmap-writer
> +#
> +################################################################################

Add an empty line here between the comment header and the first
variable.

> +BMAP_WRITER_VERSION = 0.0.3
> +BMAP_WRITER_SITE = $(call github,embetrix,bmap-writer,$(BMAP_WRITER_VERSION))
> +BMAP_WRITER_SOURCE = $(BMAP_WRITER_VERSION).tar.gz

Can you drop this line entirely? I think it should give a better name
for the tarball.

> +BMAP_WRITER_LICENSE = GPL-3.0
> +BMAP_WRITER_LICENSE_FILES = LICENSE
> +BMAP_WRITER_DEPENDENCIES = host-pkgconf libarchive libxml2
> +
> +BMAP_WRITER_CMAKE = YES

Hu, what is this doing?

Could you take into account those comments and send a v2?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
