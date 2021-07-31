Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50442C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 10:06:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E884360E09
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 10:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E884360E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93157400D7;
	Sat, 31 Jul 2021 10:06:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7uc7n_YmSOq; Sat, 31 Jul 2021 10:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E2704026D;
	Sat, 31 Jul 2021 10:06:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75A0A1BF388
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 10:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 633E34026D
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 10:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gAOUunLvgYVg for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 10:06:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF716400D7
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 10:06:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6500420007;
 Sat, 31 Jul 2021 10:06:27 +0000 (UTC)
Date: Sat, 31 Jul 2021 12:06:25 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20210731120625.63ccb9e8@windsurf>
In-Reply-To: <20210705125139.1516789-1-fido_max@inbox.ru>
References: <20210705125139.1516789-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/gcc: fix libsanitizer in gcc
 11.1, 10.3 for linux 5.13
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
Cc: romain.naour@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Mon,  5 Jul 2021 15:51:39 +0300
Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> Starting from 5.13 Cyclades async mux support is dropped from linux kernel:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f76edd8f7ce06cdff2fe5b6b39a49644c684a161
> 
> But gcc's libsanitizer uses <linux/cyclades.h> header.
> This issue is fixed by:
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=745dae5923aba02982563481d75a21595df22ff8
> 
> Right now just gcc 9.4.0 has this commit and 8.4.0 is proposed to be deleted.
> So we need to add this patch for 10.3 and 11.1 to fix build with linux kernel 5.13.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  ...er-Remove-cyclades-from-libsanitizer.patch | 123 ++++++++++++++++++
>  ...er-Remove-cyclades-from-libsanitizer.patch | 123 ++++++++++++++++++
>  2 files changed, 246 insertions(+)
>  create mode 100644 package/gcc/10.3.0/0004-libsanitizer-Remove-cyclades-from-libsanitizer.patch
>  create mode 100644 package/gcc/11.1.0/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch

Thanks for your patch! However, it was missing the backport of this
patch for gcc 8.x, for the special ARC and C-SKY versions, so I've
added that, as well as references to the autobuilder failures. And
patch applied, of course!

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
