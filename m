Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287D4C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:35:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFFCA60EE6
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFFCA60EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7684F60692;
	Wed, 28 Jul 2021 21:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3Qi6uVXtDfV; Wed, 28 Jul 2021 21:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 895296063E;
	Wed, 28 Jul 2021 21:35:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15B391BF5B4
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03EB34026B
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvVqxbiw2d-k for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 21:35:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCEDF400EB
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 21:35:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 624D920005;
 Wed, 28 Jul 2021 21:35:15 +0000 (UTC)
Date: Wed, 28 Jul 2021 23:35:13 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Frank Hunleth <fhunleth@troodon-software.com>
Message-ID: <20210728233513.4097848b@windsurf>
In-Reply-To: <20210508222419.586915-1-fhunleth@troodon-software.com>
References: <20210508222419.586915-1-fhunleth@troodon-software.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] erlang: support builds when gcc
 __atomic_* exist
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
Cc: Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat,  8 May 2021 18:24:19 -0400
Frank Hunleth <fhunleth@troodon-software.com> wrote:

> While Erlang will use it's own atomic operations, it can also use gcc
> __atomic_* builtins. This is now listed in Erlang's HOWTO/INSTALL.md.
> 
> This change was necessary on RISC-V, since Erlang didn't have a built-in
> implementation, but it was able to use gcc's __atomic_* functions.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/erlang/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Thanks Frank for the patch. I have applied to master. However, I think
the patch may be incomplete. Indeed, on some CPU architectures, the
atomic intrinsics are implemented in a separate library provided by
gcc, called libatomic, and one need to link against it to use those
intrinsics.

Could you try to do a build of Erlang on SPARCv8 for example ?

I suppose it will fail, and if it does, could you add some logic in
erlang.mk to link against libatomic when BR2_TOOLCHAIN_HAS_LIBATOMIC=y
(of course assuming the Erlang build system doesn't do that by itself,
of course).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
