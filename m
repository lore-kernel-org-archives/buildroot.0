Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4262BC4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 15:58:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A4C96120D
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 15:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A4C96120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B06840317;
	Sun, 15 Aug 2021 15:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FzOXgVvo-aoc; Sun, 15 Aug 2021 15:57:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8105F40318;
	Sun, 15 Aug 2021 15:57:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E50C91BF3F0
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 15:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAB5C401B4
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 15:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYaAjylAwKgN for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 15:57:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D74D6400AF
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 15:57:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id E2F99100004;
 Sun, 15 Aug 2021 15:57:44 +0000 (UTC)
Date: Sun, 15 Aug 2021 17:57:43 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210815175743.012d125f@windsurf>
In-Reply-To: <20210813142626.2941588-1-fontaine.fabrice@gmail.com>
References: <20210813142626.2941588-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: fix build of gdb on riscv
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Fri, 13 Aug 2021 16:26:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +# recent gdb versions (>= 10) have gdbserver moved at the top-level,
> +# which requires a different build logic.
> +ifeq ($(BR2_PACKAGE_HOST_GDB):$(BR2_riscv),:y)
> +GDB_GDBSERVER_TOPLEVEL = y
> +endif
> +
>  GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
>  GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
>  GDB_CPE_ID_VENDOR = gnu


While I understand the idea, I'm not entirely sure it's the most
logical way. What about instead changing the current:

ifeq ($(BR2_GDB_VERSION_10),y)
GDB_GDBSERVER_TOPLEVEL = y
endif

by:

ifeq ($(GDB_VERSION_10),10.1)
GDB_GDBSERVER_TOPLEVEL = y
endif

This way, it really expresses what we want: gdb version 10.x require a
different build logic.

Alternatively, we could do a hidden Config.in boolean:

config BR2_PACKAGE_GDB_TOPLEVEL
	bool
	default y if BR2_GDB_VERSION_10
	default y if !BR2_PACKAGE_HOST_GDB && BR2_riscv

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
