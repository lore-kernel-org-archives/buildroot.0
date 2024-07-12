Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F508C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B41424327E;
	Fri, 12 Jul 2024 15:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWfztZLBHiQZ; Fri, 12 Jul 2024 15:15:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4643643268
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4643643268;
	Fri, 12 Jul 2024 15:15:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 639F61BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E28D4097F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uloGFmHFVZbA for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:15:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C69141DD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C69141DD5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C69141DD5
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:15:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6138F1BF203;
 Fri, 12 Jul 2024 15:15:42 +0000 (UTC)
Date: Fri, 12 Jul 2024 17:15:41 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240712171541.07e8b250@windsurf>
In-Reply-To: <20240518091707.267692-1-fontaine.fabrice@gmail.com>
References: <20240518091707.267692-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720797342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/VGzgllIpOEw3zVcfI5n0I3XVE4yGE2ZeqzM4m5eRE=;
 b=SnKcFo58/9HLI1l2OOUvL1zrw44e1kbjaR/Kx9JKeAV8JH2agOQCcggKQVO6XygT8anKpu
 ckWlsg8Yy7WMC7IZGvtUYuj0CDvOLIZi5OX1vFJBowQ6W5lv2bz/39ejnsEfxTwlM+O65b
 R85GZcWdNyfcZcXv+ynoEeYpfZ65KwPvwE3vNmDyPCA53R3T9aDWQ91IGhLkYDu8bsXIrN
 oxWG7ZQif5FXF0ISdCaNDC09QpK+eslURInIqLbJzH2oOOl9WkoMYuDlYwXgQdUPyGYdkf
 BeQS10LsVYHfMj3mJA2WBCTp7xfotDNic6FQbxOuQ8pXvMlKBuNZYmbQrtEvmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SnKcFo58
Subject: Re: [Buildroot] [PATCH 1/1] package/gpm: fix musl build with gcc 14
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
Cc: Julien Boibessot <julien.boibessot@armadeus.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 18 May 2024 11:17:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following musl build failure with gcc 14:
> 
> daemon/old_main.c: In function 'old_main':
> daemon/old_main.c:56:11: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
>    56 |       if(!strcmp((which_mouse->opt_dev),"-")) fd=0; /* use stdin */
>       |           ^~~~~~
> daemon/old_main.c:35:1: note: include '<string.h>' or provide a declaration of 'strcmp'
>    34 | #include "headers/gpmInt.h"         /* daemon internals */
>   +++ |+#include <string.h>
>    35 |
> 
> While at it, add Upstream tags to other patches
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3192740863d57e72e90e622683e7b9fcc057fa8b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  6 -----
>  ...usl-support-to-libgpm-and-the-daemon.patch |  4 +--
>  .../0002-Install-unversioned-solibrary.patch  |  4 +--
>  ...Really-install-unversioned-solibrary.patch |  3 +--
>  ...mptyset-API-instead-of-__sigemptyset.patch |  1 +
>  .../gpm/0005-fix-building-w-newer-glibc.patch |  1 +
>  ...on.h-avoid-redefinition-of-last_sele.patch |  1 +
>  package/gpm/0007-Add-include-string-h.patch   | 27 +++++++++++++++++++
>  8 files changed, 33 insertions(+), 14 deletions(-)
>  create mode 100644 package/gpm/0007-Add-include-string-h.patch

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
