Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A01C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF58E81284;
	Thu, 30 Dec 2021 20:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u7yxoCd0f_jE; Thu, 30 Dec 2021 20:46:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3847980D0F;
	Thu, 30 Dec 2021 20:46:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A6B21BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06E5760BCB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7nEeTaPgFkkF for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:46:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5723606F9
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:46:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D20A0240002;
 Thu, 30 Dec 2021 20:46:40 +0000 (UTC)
Date: Thu, 30 Dec 2021 21:46:39 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211230214639.7d98b030@windsurf>
In-Reply-To: <d69fc234a73801620273dfcc399f2c10f13bcbb0.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
 <d69fc234a73801620273dfcc399f2c10f13bcbb0.1636810092.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 15/16 v2] core/show-info: report package
 build steps and stamp files
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
Cc: Vadim Kochan <vadim4j@gmail.com>, eeppeliteloop@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Nov 2021 14:28:26 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> People (and their scripts!) whi want to report on the progress of the
> build, will need to know what steps a package follows in what order.
> 
> This is handled internally by Buildroot itself already, by use of stamp
> files.
> 
> However, the names of those stamp files are purely an implementation
> detail (even if they are very unlikely to ever change).
> 
> Expose the build steps in a list, which is guaranteed to be ordered, ad
> for each step, its name and stamp file. The output (once filtered
> through jq, elided for bevity) will look like:
> 
>     [...]
>     "install_target": true,
>     "install_staging": false,
>     "install_images": false,
>     "build_steps": [
>       {
>         "step": "download",
>         "stamp_file": ".stamp_downloaded"
>       },
>       {
>         "step": "extract",
>         "stamp_file": ".stamp_extracted"
>       },
>       {
>         "step": "patch",
>         "stamp_file": ".stamp_patched"
>       },
>       {
>         "step": "configure",
>         "stamp_file": ".stamp_configured"
>       },
>       {
>         "step": "build",
>         "stamp_file": ".stamp_built"
>       },
>       {
>         "step": "install_target",
>         "stamp_file": ".stamp_target_installed"
>       }
>     ],
>     [...]
> 
> (Note: the first three fields already existed before this patch.)
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: eeppeliteloop@gmail.com

This one I really found excessive. There's pretty a 1:1 relationship
between the steps and the stamp files, so anything that has knowledge
of the internal steps of a package can also know about the stamp files.

As it's more controversial than the rest of the series, I left it
aside. I'll for now mark it as Rejected, but I'm also ready to revisit
that if need be.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
