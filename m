Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18262C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:49:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C95FE60F38
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C95FE60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8219C4043B;
	Sun, 25 Jul 2021 13:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Wql5QTanjz7; Sun, 25 Jul 2021 13:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94C9940415;
	Sun, 25 Jul 2021 13:49:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70BD11BF3C1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FFF260611
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUhdDNjbDVKB for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 13:49:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60181605C3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:49:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A7D20240002;
 Sun, 25 Jul 2021 13:49:32 +0000 (UTC)
Date: Sun, 25 Jul 2021 15:49:31 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20210725154931.53ec05fe@windsurf>
In-Reply-To: <20210612102449.8429-1-romain.naour@gmail.com>
References: <20210612102449.8429-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Config.in: disable PIC/PIE for microblaze
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

On Sat, 12 Jun 2021 12:24:49 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> As reported by Toolchain-builder project [1], the system doesn't
> boot when PIC/PIE is enabled for glibc based toolchain (the init
> process hang).
> 
> Also, hardening features may not be wanted or possible for such
> slow soft-core cpus [2].
> 
> Like for NiosII, disable BR2_PIC_PIE.
> 
> [1] https://gitlab.com/bootlin/toolchains-builder/-/pipelines/318038406
> [2] http://lists.busybox.net/pipermail/buildroot/2021-June/312416.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

I have introduced a preparation patch that adds a hidden
BR2_PIC_PIE_ARCH_SUPPORTS boolean, and then made use of it to exclude
Microblaze from PIC/PIE. It makes the whole thing a bit clearer IMO.

So, in short: applied, with those changes!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
