Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0C0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 22:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A662E40287;
	Tue, 28 Dec 2021 22:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72BzrAFyfMIH; Tue, 28 Dec 2021 22:33:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D17A40258;
	Tue, 28 Dec 2021 22:33:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A12651BF3D4
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9007340258
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4HgH_jkSVzy1 for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 22:33:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 377BC40227
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 22:33:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4A30B40002;
 Tue, 28 Dec 2021 22:33:15 +0000 (UTC)
Date: Tue, 28 Dec 2021 23:33:14 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211228233314.7dfb8575@windsurf>
In-Reply-To: <20210810064547.2579380-1-james.hilliard1@gmail.com>
References: <20210810064547.2579380-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: enable host build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Tue, 10 Aug 2021 00:45:46 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This will be used for building tools that are included with the kernel,
> such as host-bpftool.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I'm sorry, but I fail to see how this can make sense, for a number of
reasons:

 * For external toolchains, package/linux-headers/Config.in.host is not
   even included, which means that no version of kernel headers are
   defined.

 * Even for internal toolchains, the kernel headers version selected
   for the target, which you re-use here for the host kernel headers,
   has no correlation with the actual kernel running on the build
   machine. If you are running an oldish 3.10 kernel on your build
   machine, install host-linux-headers 5.15, and build host-bpftool
   based on that, you'll run into issue.

So, perhaps the first thing is to figure out why the host variant of
bpftool needs kernel headers. What are these tool doing on the host?
What is the use case?

Then if we really want to build them for the host, I guess the only
solution is to ask the user to install the kernel headers matching their
build machine (so with some hidden option
BR2_NEEDS_HOST_KERNEL_HEADERS, which is selected by your package, and
then with logic in support/dependencies/ to check that).

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
