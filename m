Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9634FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C3BB405B0;
	Tue, 28 Dec 2021 21:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XebyN58b50bm; Tue, 28 Dec 2021 21:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 516DD405AE;
	Tue, 28 Dec 2021 21:58:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFDF41BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF8FC4088A
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QB-ClvuRpsFH for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:58:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C732940881
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:58:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B8ED41C0004;
 Tue, 28 Dec 2021 21:58:06 +0000 (UTC)
Date: Tue, 28 Dec 2021 22:58:05 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211228225805.47df3c46@windsurf>
In-Reply-To: <20211023050119.3293369-1-james.hilliard1@gmail.com>
References: <20211023050119.3293369-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/nodejs: expose capability to
 compile host library
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
Cc: Martin Bark <martin@barkynet.com>, Linus Kaschulla <linus@cosmos-ink.net>,
 Daniel Price <daniel.price@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 22 Oct 2021 23:01:19 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> From: Linus Kaschulla <linus@cosmos-ink.net>
> 
> To use nodejs on the host (independant of the actual system)
> to create some static files to place onto the target rootfs
> nodejs can be very helpful.
> 
> The provided nodejs package didn't show the possibility to
> create a host package. But upon further examination I noticed
> that the package does it in fact (in the .mk). It specifies
> dependencies for the package with the host prefix and also
> invokes $(host-generic-package) as well as $(generic-package)
> which is the only one assumed from the config.
> 
> With this change other packages can require BR2_PACKAGE_HOST_NODEJS
> without any problems or the buildsystem not fully knowing about this.
> Seems that someone added the capability (as a step for the cross-
> compiled nodejs) and didn't notice that this is a handy package by itself.
> 
> When installing global npm packages (with -g), the parameter
> `--prefix $(HOST_DIR)` can be used to ensure that nodejs doesn't try
> to install it onto the real host filesystem.
> 
> I already used this change to create static web files from Angular
> and place onto a target that doesn't need nodejs itself.
> 
> This patch contains fixes based on feedback from:
> - Peter Seiderer <ps.report@gmx.net>
> - Yann E. MORIN <yann.morin.1998@free.fr>
> 
> Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - move nodejs 14 dependency selection to host package
> ---
>  package/Config.in.host        |  1 +
>  package/nodejs/Config.in      |  6 +-----
>  package/nodejs/Config.in.host | 13 +++++++++++++
>  3 files changed, 15 insertions(+), 5 deletions(-)
>  create mode 100644 package/nodejs/Config.in.host

I've applied to master, after significantly simplifying the commit log,
which was a bit verbose for no good reason.

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
