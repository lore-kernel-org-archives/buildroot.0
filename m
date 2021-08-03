Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E988C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:29:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 273F460F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 273F460F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC14440456;
	Tue,  3 Aug 2021 09:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 50AFeC4rwWZT; Tue,  3 Aug 2021 09:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 671EC40461;
	Tue,  3 Aug 2021 09:29:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65CA01BF2B0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 562D182862
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1w8qAF-nDiy for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 09:29:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 093B982784
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 09:29:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 55AAB20004;
 Tue,  3 Aug 2021 09:29:12 +0000 (UTC)
Date: Tue, 3 Aug 2021 11:29:11 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210803112911.1deab0c2@windsurf>
In-Reply-To: <20210803091918.2777403-1-fontaine.fabrice@gmail.com>
References: <20210803091918.2777403-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gpsd: fix workaround for gcc
 bug 68485
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
 Giulio Benetti <giulio.benetti@micronovasrl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Fabrice,

Thanks for looking into this. Adding Giulio in Cc.

On Tue,  3 Aug 2021 11:19:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

>  GPSD_LDFLAGS = $(TARGET_LDFLAGS)
> -GPSD_CFLAGS = $(TARGET_CFLAGS)
> -
> -GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
>  
>  GPSD_SCONS_OPTS = \
>  	arch=$(ARCH) \
> @@ -45,7 +42,13 @@ GPSD_SCONS_OPTS += libgpsmm=no
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> +# Filter out any optimisation flags to be sure that -O0 will be used
> +GPSD_SCONS_ENV += $(filter-out -O%,$(TARGET_CONFIGURE_OPTS))
> +GPSD_CFLAGS += $(filter-out -O%,$(TARGET_CFLAGS))

Are you sure both are needed?

Indeed, we're doing this:

GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)

GPSD_CFLAGS = ...

GPSD_SCONS_ENV += CFLAGS=$(GPSD_CFLAGS) CCFLAGS=$(GPSD_CFLAGS)

So the CFLAGS=$(GPSD_CFLAGS) should win over the CFLAGS that are
originally in $(TARGET_CONFIGURE_OPTS).

In other words, can you try to see if the simpler:

-GPSD_CFLAGS = $(TARGET_CFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
GPSD_CFLAGS = $(filter-out -O%,$(TARGET_CFLAGS)) -O0
else
GPSD_CFLAGS += $(TARGET_CFLAGS)
endif

doesn't work ?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
