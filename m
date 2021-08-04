Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB8EC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:01:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4C560295
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B4C560295
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4541E40635;
	Wed,  4 Aug 2021 13:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgRwX1W9A4Sk; Wed,  4 Aug 2021 13:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5845840641;
	Wed,  4 Aug 2021 13:01:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 180651BF2A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 118B440641
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JT3bEjiuOfS7 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 13:01:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCEC340635
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 13:01:14 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id x11so3556655ejj.8
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 06:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vh9SGo8iJipB6TuAi3GnIixzlb/fWRiSQ214YanqGbk=;
 b=cPaWsKxesY6b/ckrp0TsgqbYudhiHhBV5bTPMCLudOyP2YOh+Z4Ht5/C0LC4696g8A
 V/2vZsdtFoW476XnHIe3Pu5Nw6UQZc6kSch0leFuks+siQySCYqd/Pykg6tyD78041RW
 x42FUZaoQqeS3nAOUOhg/Z6xYuoCCcwu8Yk19h+c38iLP6Jx/lrEem5B+nXwZnr6q/bf
 MKFh1YHWZBQZwB1gxDSdoLFRtyjFQ15E1A/A/nw9xmWm71MNXABRQeP5OO//ygynFlgX
 joRPDiXgkn+BqloXPlMosm+GvE8PLKNAyFcVJymD9PA5W2TBEhSmToNdbdD121UX37q1
 Ggmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Vh9SGo8iJipB6TuAi3GnIixzlb/fWRiSQ214YanqGbk=;
 b=HE4SgCtELWPIs5ex9meeugIhwZbpxYL85NSIPk9JGp+pBBtSzvn8Ble5N7bt4eAmKR
 MIwMkIuToYikBLdcZq4QbC5Ui6V60VxvTyzZnwMpNeN4y+TEqZ1RYhdIzHl1er438Z00
 KsFY5F3k4wDNCPtou75TkWySZSFyBwiGoiBPZasnVcmCTxOMv93TIvXcxUvPRHNeBiWm
 ZmrtdaXH/y1KY2DQnPlYrtwKHXAJr7bAJ3JSsRUWSe9thG5fmCsUY32hiHev2boHyM3j
 ztuCHIKehoOrmaXsjbHS+zLBtbyuapUm59vOY36ChbdtZjuO0exIzF6HkjjXd84ofX6S
 atdg==
X-Gm-Message-State: AOAM532ng31VZjRN4aYQenxWIJ9BN7HOFHwbS8zEKNd750Ro1LVM4+HD
 U4G512HJfSk0/VfXJVOJA7rWLw==
X-Google-Smtp-Source: ABdhPJzrB4JriwP74a5BAuqOCqtGiTEujsQjcUhBkrKxjVOu28413uSYu8J8M6O6hKXb26okux18MQ==
X-Received: by 2002:a17:906:b0c8:: with SMTP id
 bk8mr25563447ejb.412.1628082072826; 
 Wed, 04 Aug 2021 06:01:12 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id w6sm914833edd.22.2021.08.04.06.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 06:01:12 -0700 (PDT)
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20210617091456.272611-1-nolange79@gmail.com>
 <20210617091456.272611-4-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <8319327f-3d70-6ce0-b478-f53ae14013f4@mind.be>
Date: Wed, 4 Aug 2021 15:01:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617091456.272611-4-nolange79@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v4 1/3] package/zstd: rework build and
 install
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

 Hi Norbert,

 Sorry for not responding earlier - I apparently mis-filed this series and it
went off my backlog. It's only by looking at Fabrice's later patch that I
discovered this one again.


On 17/06/2021 11:14, Norbert Lange wrote:
> 1.5.0 uses Threads by default for cli tool and DSO,
> so override that in case the toolchain has none.

 It helps if you include a Fixes: tag in the commit message - that way it's
visible in patchwork that this patch fixes something and it's going to be
applied faster. Also the subject line suggests that the patch is just
refactoring, not fixing anything.


> make sure that everything is built in the build step,
> and fail the install if files are missing
> instead of lazily building them.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> 
> ---
> v3->v4:
> *   revert to previous scheme of BR2_TOOLCHAIN_HAS_THREADS
>     fixing build options for both static and shared libs.
> v2->v3:
> *   use normal = for assignment
> v1->v2:
> *   rebased against upstream/master
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/zstd/zstd.mk | 45 ++++++++++++++++++++++++--------------------
>  1 file changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index 2a876376a2..5674e85bfe 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -12,11 +12,7 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
>  ZSTD_CPE_ID_VENDOR = facebook
>  ZSTD_CPE_ID_PRODUCT = zstandard
>  
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -ZSTD_OPTS += HAVE_THREAD=1
> -else
> -ZSTD_OPTS += HAVE_THREAD=0
> -endif
> +ZSTD_OPTS += PREFIX=/usr

 I think that this is not just refactoring, but is actually needed for the .pc
file which is now built during the build step instead of the install step. Is
that correct? In that case, please mention it in the commit message.

>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  ZSTD_DEPENDENCIES += zlib
> @@ -39,43 +35,52 @@ else
>  ZSTD_OPTS += HAVE_LZ4=0
>  endif
>  
> -ifeq ($(BR2_STATIC_LIBS),y)
> -ZSTD_BUILD_LIBS = libzstd.a
> -ZSTD_INSTALL_LIBS = install-static
> -else ifeq ($(BR2_SHARED_LIBS),y)
> -ZSTD_BUILD_LIBS = libzstd
> -ZSTD_INSTALL_LIBS = install-shared
> -else
> -ZSTD_BUILD_LIBS = libzstd.a libzstd
> -ZSTD_INSTALL_LIBS = install-static install-shared
> +ZSTD_BUILD_PROG_TARGET = zstd-release
> +
> +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +ZSTD_BUILD_LIBS += libzstd.a
> +ZSTD_INSTALL_LIBS += install-static
> +endif
> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +ZSTD_BUILD_LIBS += libzstd
> +ZSTD_INSTALL_LIBS += install-shared

 AFAICS this change doesn't actually change anything, it's just rewriting. You
may claim the result is better, but it's really a matter of taste. We generally
want to avoid making changes that are just "it looks nicer" if there's no real
benefit (which can be, for example, a follow-up patch makes use of the new
structure and would be more complicated in the old structure).

 For sure, such a change should be in a separate patch that doesn't do any
functional change at the same time.

>  endif
>  
> +# Since v1.5.0 the dynamic library is built for
> +# multithreading, while the static library is not.
> +#
>  # The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
>  # one. Building a multi-threaded binary with a library (which defaults to
>  # single-threaded) gives a runtime error when compressing files.
>  # The 'lib' makefile provides specific '%-mt' targets for this purpose.
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +ZSTD_OPTS += HAVE_THREAD=1
>  ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
> +else
> +ZSTD_OPTS += HAVE_THREAD=0
> +ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
>  endif
>  
>  define ZSTD_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
> +		-C $(@D)/lib $(addsuffix -release,$(ZSTD_BUILD_LIBS) libzstd.pc)

 There's no explanation about the -release suffix in the commit message.

 Since we already do override assignment to ZSTD_BUILD_LIBS, I think it would be
nicer to put

ZSTD_BUILD_LIBS := $(addsuffix -release,$(ZSTD_BUILD_LIBS))

just after the threads condition above.


>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -		-C $(@D) zstd
> +		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)

 This change of building top-level to building in the programs subdirectory is
also not clearly explained in the commit message (I mean *why* this is changed,
not simply that it is changed).

>  endef
>  
>  define ZSTD_INSTALL_STAGING_CMDS
> +	[ -e $(@D)/lib/libzstd.pc ]

 This command serves no purpose.

 I understand that it's a way for you to "assert" that the pc file is indeed
built, but because you added it in the build commands we can be pretty sure that
it's going to be there.

 We normally don't have any assert like that in our install commands. It's also
pretty pointless - you probably discovered that it was being built at
installation time by looking at the build log, and that's the only way that
you'd discover that *that* is the file that needs to be checked. If this ever
breaks again, it's more than likely due to a different file.


>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib \
> -		install-pc install-includes $(ZSTD_INSTALL_LIBS)
> +		-C $(@D)/lib DESTDIR=$(STAGING_DIR) $(ZSTD_INSTALL_LIBS) \
> +		install-pc install-includes

 Other than the PREFIX which is now part of ZSTD_OPTS, I believe nothing
actually changed here, right? Please try to keep the diff small in such a case.

>  endef
>  
>  define ZSTD_INSTALL_TARGET_CMDS
> +	[ -e $(@D)/programs/zstd ]

 Again, not needed.

>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
> +		-C $(@D)/programs DESTDIR=$(TARGET_DIR) install

 Again, spurious reordering of the options.


 Regards,
 Arnout

>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
> +		-C $(@D)/lib DESTDIR=$(TARGET_DIR) $(ZSTD_INSTALL_LIBS)
>  endef
>  
>  HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
