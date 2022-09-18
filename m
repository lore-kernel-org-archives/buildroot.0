Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF27EECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 16:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B69F60E3F;
	Sun, 18 Sep 2022 16:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B69F60E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XlCx8L77IAqh; Sun, 18 Sep 2022 16:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC2E60E25;
	Sun, 18 Sep 2022 16:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC2E60E25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE8671BF5B5
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A97E983E6E
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A97E983E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t9-1NNXOb6Fz for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 16:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4932683E51
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4932683E51
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 16:29:37 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id l14so59443505eja.7
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QTqCX6UJ46GOsNlP/PDbxETpXvi4Wo4g5jlSS4zUlaE=;
 b=cHchdJlOyuaDcxzi3WTijXNpCvEV+soyxNfT1+FSLljQ02c31ggqzv+SoQoENrHd5M
 tbRrTbeO830ZFCSuhZLIYN14AlNtBNZ0V9vusUZmbcn6aHAG741t1ec+pSB5YMP6Ng6u
 vGOIlbC/+lbwjNq+Ch/JbNiqJKi/neySOru7WtqSjZCAvGeRDat7tPKOSlgLWJkb3yjx
 eMyIAnCheYQ++NpFRIlPlBDffIPaZ2fYHVZWphwXXEYF8xaeI2Dy9SZzsrPv/v/FdkNP
 Qegzewisc6GK2DCerqvC17aYxApLT+tgMXPv5XiQpVS6TnhqDVYjlkjoJbO7i+ZsFhOs
 lDLA==
X-Gm-Message-State: ACrzQf3vNwnDFTjZ0o5JEUDyH8PK5d0Uncas4q1QKUlC/ZhaPG2Tw8ke
 OZTK/qAETsrHas75uBUfyslbYQ==
X-Google-Smtp-Source: AMsMyM7lFyQ3/7BqBCL+b6J59Aw0GH3WrgINoqAF5IOjANkMOtnjY2qBymRhRtSR9IvH58uam7M39Q==
X-Received: by 2002:a17:907:d19:b0:77b:2fb5:43ec with SMTP id
 gn25-20020a1709070d1900b0077b2fb543ecmr9786941ejc.608.1663518575303; 
 Sun, 18 Sep 2022 09:29:35 -0700 (PDT)
Received: from [192.168.43.18] ([109.139.7.201])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0073dcdf9b0bcsm14370642ejc.17.2022.09.18.09.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 09:29:34 -0700 (PDT)
Message-ID: <af421cc0-9596-04c0-d1fb-971f8427e456@mind.be>
Date: Sun, 18 Sep 2022 18:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220215124619.563502-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220215124619.563502-1-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=QTqCX6UJ46GOsNlP/PDbxETpXvi4Wo4g5jlSS4zUlaE=;
 b=TrpotJezAQls5IT9EJX2zOv6Rbnr3dOFtHzCzVoOkaGorSLDnTc9c8IiQ7kgwYorqI
 RXlH2Zx4fKVX4zGknTXxI9zRPToKzkP4lDoSHHMZLa58bHj4Oa1s13Y+Iyc90IZUAwe3
 rH/mVBV2+1o8ieTgjhhOzKIYOPkFYhs6sAdQ+HG5792lYzobXwq/42kUbTLLTy9ljlvG
 V09Dl27xz0AVxPGDQETS5UINg9U4+kqdoPS9bW/l9liX6tvs0GwNCpcCqfTwtBJ3zIZ1
 cv5i1FfvqAHRoBmqujzau8JqibL1DDdqU+MqLcitiV43sHIuAiZxi6FC5ijDJm7O2Nwy
 QPDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TrpotJez
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: support mismatched merged usr
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Norbert,

  Sorry that this has been laying around so long without reaction. The thing is 
that this external toolchain sysroot stuff is incredibly fragile and even worse, 
difficult to understand. So there isn't much motivation to accept patches. We 
probably should have some tests for it...

On 15/02/2022 13:46, Norbert Lange wrote:
> Look at the case where the source toolchain has non-merged usr,
> yet the target will have merged usr.
> 
> sysroot/lib/ld-musl-x86_64.so.1 -> ../usr/lib/libc.so
> sysroot/usr/lib/libc.so
> 
> What happens is that buildroot copies the ld-*so* symlink
> into usr/lib, at which point it becomes broken.
> 
> We now detect these broken symlinks, then try to find the target
> binary in the library directories and fix the link.
> 
> Fix the case where the lib directory is a symlink, and no ld-*so*
> is installed by adding -H to find.

  I don't understand what's the issue there. $(STAGING_DIR)/lib is always a 
symlink in merged usr, and never a symlink in non-merged usr. Also, the -H 
parameter has no effect on the paths supplied in the command line (i.e. 
$(STAGING_DIR)/lib itself), only on the symlinks within it. So I don't 
understand what you're trying to fix here. Maybe you have a tuple->. symlink 
inside the lib directory? But even that won't be followed by find because it 
sees that it's a directory it already encountered. Or maybe it's a 
tuple->../usr/lib/tuple symlink? That also won't be followed by find because 
it's a broken symlink.

  So, can you explain better (in the commit message) in which situation this is 
needed?

> Also use `cp -t` instead of some rarely used xargs tricks.

  That's pretty much in the eye of the beholder. I regularly use xargs -I, I 
never used cp -t. We use neither of these constructs anywhere else in Buildroot. 
So if anything, it should probably be changed into find -exec which we do use 
elsewhere (though I honestly find it much more annoying to use than xargs -I).

  Anyway, such an unrelated change should be a separate patch, so we can easily 
skip it if we don't agree (or apply it if we don't agree with the rest).

> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>   toolchain/helpers.mk | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index ef8e9a5f64..aaf2aecd80 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -135,8 +135,17 @@ copy_toolchain_sysroot = \

  There's a huge comment above copy_toolchain_sysroot that explains in detail 
what it does. It should really be interspersed with the code itself, but due to 
make limitations that's not possible. Anyway, that comment should be extended 
with an explanation of the why and the how of the new block.

>   			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
>   		done ; \
>   	fi ; \
> -	if [[ ! $$(find $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
> -		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
> +	for i in $$(find -H $(STAGING_DIR)/lib -name 'ld*.so.*' -xtype l); do \

  Should there ever be more than one? IOW shouldn't there be a -quit?

  Also, we usually use backticks instead of $$()

> +		LINKTARGET=`readlink $$i`; \
> +		rm $$i; \
> +		NEWLINKTARGET=$$(find -H $(STAGING_DIR)/$${ARCH_LIB_DIR} $(STAGING_DIR)/lib $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} $(STAGING_DIR)/usr/lib -name "`basename $${LINKTARGET}`" -print -quit); \

  What you actually want here is to take the first one that matches, right? 
Also, it should always be in one of those directories themselves, and not in one 
of the subdirectories I think? In that case, I think it's more clear if it's a 
loop rather than find. So something like:

	for libdir in $(STAGING_DIR)/$${ARCH_LIB_DIR} $(STAGING_DIR)/lib 
$(STAGING_DIR)/usr/$${ARCH_LIB_DIR} $(STAGING_DIR)/usr/lib; do \
		NEWLINKTARGET="$${libdir}/`basename $${LINKTARGET}`"; \
		if [ -n "$${NEWLINKTARGET}" -a -e "$${NEWLINKTARGET}" ]; then \
			echo "Symlinking $$i -> `readlink $$i`" ; \
			ln -sr $${NEWLINKTARGET} $$i; \
			break;
		fi; \
	done; \

(this was just some quick coding, I probably missed a lot of things).

> +		if [ -n "$${NEWLINKTARGET}" -a -e "$${NEWLINKTARGET}" ]; then \

  If this is not true, was it a good idea to delete the symlink? Or maybe we 
should even error out in that case?

> +			ln -sr $${NEWLINKTARGET} $$i; \
> +			echo "Symlinking $$i -> `readlink $$i`" ; \
> +		fi; \
> +	done; \
> +	if [[ ! $$(find -H $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
> +		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 cp -t $(STAGING_DIR)/lib/; \

  I wonder if this bit couldn't be merged with the above (skipping the -xtype in 
the find of course).


  Regards,
  Arnout

>   	fi ; \
>   	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
>   		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
