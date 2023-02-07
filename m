Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4863FC636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D938E6105B;
	Tue,  7 Feb 2023 21:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D938E6105B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yXneE__-QgIK; Tue,  7 Feb 2023 21:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E3B561059;
	Tue,  7 Feb 2023 21:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E3B561059
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 639161BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36A274057A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A274057A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzB00dY6d5qF for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:20:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A517840186
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A517840186
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:20:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E2F59240002;
 Tue,  7 Feb 2023 21:20:55 +0000 (UTC)
Date: Tue, 7 Feb 2023 22:20:54 +0100
To: James Knight via buildroot <buildroot@buildroot.org>
Message-ID: <20230207222054.39573a80@windsurf>
In-Reply-To: <20220622212045.573-1-james.knight@collins.com>
References: <20220622212045.573-1-james.knight@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675804856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQENyeSG8i/KUn61W1icJxwed82FlVAf/4TT281mPJc=;
 b=brFd/iMM3sgemGIZgBArWL08g9VjLRM6HyTOnmn7w1u0PaEtwnArWfeUJ50ipg9aHbiBVn
 AbFeFG5/IaGDI1/pLvvby6r8QLRrSI55I9QSpb33WudyGJqavLrjwYgOnWS6jNpTgdYkNB
 6nozQlgiaj20knmlziShKtS/O+OIDfHFC0Q/7Yk2WNh4iTURMCWjStLTG3hYyKdHqiUFDb
 XLQz80XAfUpfR3rXEgjsMPMTMJB7ytUffUc8Run5GpvtdaGSZR0BCz+geuTbVCf3xB37Uh
 Ro6kuGgZTgXShAYHxVtfXF+85hE0qQLdauk/JIEI9hRnd+Bbm1xZSWtcZk6m9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=brFd/iMM
Subject: Re: [Buildroot] [PATCH 1/2] package/skeleton-init-openrc: prepare
 runlevels from make over skeleton
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
Cc: James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Wed, 22 Jun 2022 17:20:44 -0400
James Knight via buildroot <buildroot@buildroot.org> wrote:

> The following commit changes the creation of an OpenRC environment's
> `/etc/runlevels/default/sysv-rcs` symbolic link from the skeleton to
> inside the package's Makefile (triggered from the
> `SKELETON_INIT_OPENRC_INSTALL_TARGET_CMDS` call). The original symlink
> to a `/etc/init.d/sysv-rcs` path may not gracefully work for all
> developer environments. For example, on a fresh checkout in a Windows
> environment, the symbolic link may be automatically updated to
> include a drive specification. For example:
> 
>     $ git diff
>     diff --git a/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs b/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
>     index ef5e00823c..e417b4bb44 120000
>     --- a/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
>     +++ b/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
>     @@ -1 +1 @@
>     -/etc/init.d/sysv-rcs
>     \ No newline at end of file
>     +G:/etc/init.d/sysv-rcs
>     \ No newline at end of file
> 
> If a developer built with fresh checkout using an example
> `qemu_x86_defconfig` tailored to target an OpenRC init system, an
> improper symlink can be observed in the target system:
> 
>     ...
>     Welcome to Buildroot
>     buildroot login: root
>     Jun 22 20:42:34 login[971]: root login on 'console'
>     # /etc/runlevels/default/sysv-rcs  --version
>     -sh: /etc/runlevels/default/sysv-rcs: not found
>     # readlink /etc/runlevels/default/sysv-rcs
>     /??/G:/etc/init.d/sysv-rcs
>     #  /etc/init.d/sysv-rcs --version
>     sysv-rcs (OpenRC) 0.43.3 (Buildroot 2022.05-225-g64390b6c42-dirty)
> 
> By switching from having the symbolic link in the skeleton file to
> building it during the package's install stage, this (1) prevents
> oddities with a Git working environment on environments like Windows,
> as well as (2) ensures a proper symlink is created in a Windows
> environment. For example:
> 
>     # readlink /etc/runlevels/default/sysv-rcs
>     /etc/init.d/sysv-rcs
>     # /etc/runlevels/default/sysv-rcs --version
>     sysv-rcs (OpenRC) 0.43.3 (Buildroot 2022.05-225-g64390b6c42-dirty)
> 
> Signed-off-by: James Knight <james.knight@collins.com>

Thanks for the patch, but the proposed solution is not really
desirable, and in fact is probably not the full explanation. Indeed,
the OpenRC skeleton in package/skeleton-init-openrc/skeleton/ has
plenty of other symlinks, and you didn't complain about them.

However, one key difference between the symlinks in
package/skeleton-init-openrc/skeleton/ and the sysv-rcs symlink your
patch is fixing is that the former symlinks have a relative path to the
target, while the latter have a relative path to the target.

Could you try instead to change this symlink to use a relative path to
its target?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
