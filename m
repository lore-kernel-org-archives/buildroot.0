Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECA5C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 13:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BFFF600C7;
	Sun, 14 Jul 2024 13:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYipVJgc1lV9; Sun, 14 Jul 2024 13:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A21C760606
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A21C760606;
	Sun, 14 Jul 2024 13:16:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12AF71BF3D8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F357F400B5
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWOn-keatSct for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 13:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB4EA40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB4EA40010
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB4EA40010
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 13:16:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7B3E40002;
 Sun, 14 Jul 2024 13:16:53 +0000 (UTC)
Date: Sun, 14 Jul 2024 15:16:52 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240714151652.7a9b94af@windsurf>
In-Reply-To: <20240714124910.1928300-1-ju.o@free.fr>
References: <20240714124910.1928300-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720963013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMvB/3U3+SBWxmEGqPLxT9LEDCSUpcim/OfFPK5wW3I=;
 b=GwEDu41njzfKwv9AvIAqhBWVGS/L8mwo7nqwcxGAEHGZ3wmV+bQdDc52nn6BCUf/vxh38A
 /0xy1XVYMx6BqYdZr07oPZPIDbxkxWm5JgUkH4ao2xnPZi2vEpqSneMsNT/5CwfQcD8q24
 GJrwsGVWNAgOF0mQ4sc7Xq104eLouTbb+bd6nGsEhwURZ+sHY8u675dsyknTOLKeScYMYb
 t95IYmfmecc+s1XiUZBGwsSVINJFlGihn9kZalbmobGCq/wN7sTb1v+OWWqvvTCv1BlggF
 SvKQ69H3lP9bZhdXFhoLfX9txFLpaxzXxPElZlhc1KZvT6llt4EQh9GRPdwbiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GwEDu41n
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump version to
 6.9.2
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

Hello,

Thanks for the patch!

On Sun, 14 Jul 2024 14:49:10 +0200
Julien Olivain <ju.o@free.fr> wrote:

> +# btrfs-progs uses the glibc register_printf_specifier() and
> +# register_printf_modifier() functions, if the header <printf.h> is
> +# detected at configure time. uClibc has this header, but does not
> +# provide those functions. This leads to build failure. In case no
> +# header is present, btrfs-progs is providing a workaround. We disable
> +# the <printf.h> header detection for uClibc toolchains. Musl libc is
> +# not impacted, because it does not provide a <printf.h> header.
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +BTRFS_PROGS_CONF_ENV += ac_cv_header_printf_h=no
> +endif

Then what about improving the configure.ac detection logic to not check
for printf.h but rather the availability of register_printf_specifier()
and register_printf_modifier() ? This would be the right thing to do in
this situation.

Do you think you could have a look into this?

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
