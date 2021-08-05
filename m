Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDD0C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47BA161104
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47BA161104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11C4E40529;
	Thu,  5 Aug 2021 19:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id remYoOjjvJgv; Thu,  5 Aug 2021 19:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9E3040563;
	Thu,  5 Aug 2021 19:59:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9561BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BADD607B6
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JZKB5W7prMY for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:54:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7127860586
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:54:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3EECA20003;
 Thu,  5 Aug 2021 19:54:52 +0000 (UTC)
Date: Thu, 5 Aug 2021 21:54:50 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210805215450.78d1bc33@windsurf>
In-Reply-To: <20191229131453.327907-2-fontaine.fabrice@gmail.com>
References: <20191229131453.327907-1-fontaine.fabrice@gmail.com>
 <20191229131453.327907-2-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/mesa3d: x11 needs EGL,
 GLX or a vulkan driver
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 29 Dec 2019 14:14:53 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> As specified in meson.build, x11 platform needs EGL, GLX or a vulkan
> driver:
> 
> if with_platform_x11
>   if with_any_vk or with_egl or (with_glx == 'dri' and with_dri_platform == 'drm')
>     pre_args += '-DHAVE_X11_PLATFORM'
>   endif
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e044609e603ca68695d842d08809fdcb35bc8127
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mesa3d/Config.in | 1 +
>  1 file changed, 1 insertion(+)

It has been such a long time, and mesa3d has seen so many chnages
since, that I doubt this patch still makes sense in its current form.
Could you respin the patch if it still fixes an issue that exists
today? In fact, you never replied to the feedback I gave, see
https://patchwork.ozlabs.org/project/buildroot/patch/20191229131453.327907-2-fontaine.fabrice@gmail.com/.

So I'll mark the patch as Rejected for now, but don't hesitate to
respin if you think this patch is still needed, but taking into account
the questions I had raised.

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
