Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9518CC4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 20:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D50C615E8;
	Wed, 13 Dec 2023 20:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D50C615E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6Y6hkkrH4qo; Wed, 13 Dec 2023 20:08:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 572FE615D9;
	Wed, 13 Dec 2023 20:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 572FE615D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 878B21BF475
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 20:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BF17419BA
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 20:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BF17419BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id liUUTm06T_qu for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 20:08:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6473D40948
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 20:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6473D40948
Received: by mail.gandi.net (Postfix) with ESMTPSA id 292E61BF208;
 Wed, 13 Dec 2023 20:08:06 +0000 (UTC)
Date: Wed, 13 Dec 2023 21:08:04 +0100
To: Michael Trimarchi <michael@amarulasolutions.com>
Message-ID: <20231213210804.39fe194f@windsurf>
In-Reply-To: <20231209214918.2071047-1-michael@amarulasolutions.com>
References: <20231209214918.2071047-1-michael@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702498086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0D92dwp3uy+baOyK1MYs6gCNBY04xfMMHVcoqLEwMk=;
 b=mBFxw38+Y539VIsLy//hB2oel3SnRIR5hhwIXXst0q0PWJvOK6pl//5Tnd60X8ZZDxKHWL
 xgKmKzfPygZMIqwe3ShKB2tDPDJBfOHkS03RcX3PsSIS/W+mDPk+e+IZtMTjShs5lPDFWu
 qarbSwIqi91uTmx/Q0WxfBZz9IlNscJqQdIYb9qtOJirKAF4UzsPQ2BtBIUYKQIcFHp9Jk
 Xb+VDHJnLkylc2uA6iDwi64GkF0tG4qsPf+E88hC0Ker4rW9XG2w2hzFlyTlRwojV2hWbQ
 qWt9FBwxaYdz6QzEutQRBYDBW2JwaVlP0c9ibF+RZ2436NjWuDXG/JKYhfvwNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mBFxw38+
Subject: Re: [Buildroot] [PATCH V2] package: gdb: Add helping kernel gdb
 functions compilation
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

I think the commit title is not very good/clear, and could be improved.
However, I have some more fundamental concern. See below.

On Sat,  9 Dec 2023 22:49:18 +0100
Michael Trimarchi <michael@amarulasolutions.com> wrote:

> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 070598b385..0ebeb08dad 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -304,5 +304,9 @@ HOST_GDB_POST_INSTALL_HOOKS += HOST_GDB_ADD_SYMLINK
>  
>  HOST_GDB_POST_INSTALL_HOOKS += gen_gdbinit_file
>  
> +define HOST_GDB_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_GDB_SCRIPTS)
> +endef

I'm not sure I like this. <pkg>_LINUX_CONFIG_FIXUPS is really meant to
be used to enable kernel options that are really/absolutely needed for
the package to work. I understand that CONFIG_GDB_SCRIPTS is not really
adding anything to the kernel image itself, but rather just to the
kernel build process, but still I believe it falls outside of the goal
of <pkg>_LINUX_CONFIG_FIXUPS.

In addition:

- Many people will want to use gdb and build a Linux kernel, but not
  necessarily want to debug the kernel. So "enabling gdb" does not
  imply "I want to debug the kernel"

- This patch does not account for the fairly common case of host gdb
  being provided by an external toolchain. In this situation, the user
  still has to enable CONFIG_GDB_SCRIPTS=y "manually" in his kernel
  configuration.

For all those reasons, and even though the change is simple and does no
harm, I believe it's not really useful and aligned with the intention
of <pkg>_LINUX_CONFIG_FIXUPS.

So I would personally be in favor of not accepting this patch.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
