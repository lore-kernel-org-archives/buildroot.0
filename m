Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C3DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 20:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3F30428F9;
	Wed,  5 Jan 2022 20:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aniuTRwu_3lG; Wed,  5 Jan 2022 20:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355F0428F7;
	Wed,  5 Jan 2022 20:36:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28A411BF407
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16EB981272
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0L5W2S1E-WeB for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 20:36:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 006C880C0F
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 20:36:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9A8ACFF805;
 Wed,  5 Jan 2022 20:36:30 +0000 (UTC)
Date: Wed, 5 Jan 2022 21:36:28 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220105213628.763562b2@windsurf>
In-Reply-To: <20220101120920.2809336-1-bernd.kuhls@t-online.de>
References: <20220101120920.2809336-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] package/vdr: enable musl/uclibc build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sat,  1 Jan 2022 13:09:20 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Re-add patch 0001 to fix uClibc build, this patch was removed 2019:
> https://git.buildroot.net/buildroot/commit/?id=573d15b0790cfd2838cf0544ded79b415e20f5a7
> 
> Add two more patches from Alpine Linux to fix musl build.
> 
> Add optional dependency to libexecinfo to provide execinfo.h.
> 
> Depend on BR2_SYSTEM_ENABLE_NLS to have gettext being added as
> dependency to provide _nl_msg_cat_cntr() needed by i18n.c.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: rework nls/gettext dependencies (Thomas)
> v2: no changes

I have applied, but after dropping the NLS dependency. Indeed, the
_nl_msg_cat_cntr symbol is an internal symbol of gettext, which only
glibc and uclibc provide in their built-in libintl implementation. Even
the stub libintl-musl from the gettext-tiny project implements
_nl_msg_cat_cntr as a dummy symbol, which really tells us that it
serves no purpose on musl toolchains. So I've just added a patch for
vdr that ensures _nl_msg_cat_cntr is only used on glibc/uclibc
toolchains, by checking __GLIBC__.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
