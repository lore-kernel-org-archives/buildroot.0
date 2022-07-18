Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAACEC43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 13:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 726CE61008;
	Mon, 18 Jul 2022 13:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 726CE61008
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYLgOfY9xKpX; Mon, 18 Jul 2022 13:01:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89DC660FF9;
	Mon, 18 Jul 2022 13:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89DC660FF9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07E781BF317
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 13:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E429260FF9
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 13:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E429260FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x48HiysAegb8 for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 13:01:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A0D360FE6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A0D360FE6
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 13:01:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D6FA54000B;
 Mon, 18 Jul 2022 13:01:46 +0000 (UTC)
Date: Mon, 18 Jul 2022 15:01:45 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20220718150145.4867a519@windsurf>
In-Reply-To: <20220706210621.284257-1-f.fainelli@gmail.com>
References: <20220706210621.284257-1-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658149308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aaOHnoYnVgm5Qvr1DTjuac4WUl5JO0v7QvfLnSXAglM=;
 b=TV/qTiD6JpfTg960xPGqyQP54+wtCIWTeIrWfc22NLs2PHtRNH89RPXrLw2TE9F6aiXHcV
 diP6RPo2uN+SyG/E5hCwLhGSZHZKfto9Io5dFckWk3e04/rYADGyKWNQ1gvVyW/QufMnQn
 MrMZaoO5lN/LWNiznJVl8I/HLm366bucHTRNHA2+jSZN93kAgXxVNtmRXugf36ChYsvry3
 ULbSRQohuAp7+jqYloSunCoSgfrD8/tRaxhSYIz0FlBpcwm2+uJfoSAnQgx+F4gwhipi/6
 qZwODnB+OLU1KUujWTv2D70pVAD3vnx60u54QLSW0Uo7NudpvRXmWTPRw11TMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TV/qTiD6
Subject: Re: [Buildroot] [RFC] linux: Make CONFIG_LOCALVERSION_AUTO work
 with OVERRIDE_SRCDIR
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
Cc: yann.morin.1998@free.fr, mmayer@broadcom.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Florian,

On Wed,  6 Jul 2022 14:06:21 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> Linux is able to generate an automic version based upon the git tree
> that is being used which is very useful for making sure that the kernel
> being used is truly the one that we intend to be using.
> 
> When using LINUX_OVERRIDE_SRCDIR however, since we do not rsync the .git
> folder, all of the necessary information for scripts/setlocalversion to
> compute the exact version and git commit id is lost.
> 
> Add a post rsync hook that copies it over in order to allow 'git
> rev-parse' to work and produce an usable version.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks for your patch. What bothers me is that it is a Linux-specific
solution for a problem that isn't Linux-specific. Many other packages
also use Git commands to generate a version string that they embed in
their binaries. So this problem really is global and I'm not sure we
want a Linux-specific fixup for it.

To me the long term solution is to enable out of tree build of
packages. This way, instead of rsync'ing the code, we would directly
build it from its original location. Some initial work was done in this
area, but it's obviously a much larger endeavor than the fixup you are
proposing. A more immediate alternative would be to also rsync the .git
folder instead of excluding it, but do that globally for all packages
that use override-srcdir. The .git directory was explicitly excluded to
reduce the amount of data to rsync.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
