Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336CEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 13:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A2DB84BB9;
	Sun, 24 Jul 2022 13:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A2DB84BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qdg-gb7WAsDn; Sun, 24 Jul 2022 13:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF0584BA3;
	Sun, 24 Jul 2022 13:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF0584BA3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA1161BF488
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B403640C2D
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B403640C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNl7na7gwblg for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 13:50:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5284C402E0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5284C402E0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 13:50:59 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h8so12496373wrw.1
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 06:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MMsDTzfivH7V+tyq+2VenJE1C/++mTegby6BaiMTHAw=;
 b=Ii+4ECcYdrDhjj97GKhgqd1j2h6Z6t/oKkb7ga0uahPT3Q9g3tDBgXpdm39qpciOdj
 5cZsQonAoJdV7AVR6wwZuhc7mzu8U0Uamc7dAf7DkGgi9LUCmUQGMrXDni5jpEXjvN8q
 LGOrDFTB6nXji9WFFXJPfaq8jnA0tuPnCK2op5ZsKCAzRncCNEbyew88y12RycfSQnUH
 +EF7qRL/1IlSsWvCgx8lbYBLwPmESqfBnfmlXyJBEIbNkWpyrxuA0NHz7lbPM8TiUnMd
 07c2d0z/XMrhfnv5OHQOYwcuU+jC1BLCEyQ7cdaX6Jzti2Pt/6C5E2wE3OcQI3SkGYCm
 eoZw==
X-Gm-Message-State: AJIora+N1Z/I4OY0JUktK7QK28jDf0u6mZPCCbGS3SDPN7v7exp8P5B4
 yHOXjLZkAYTWwKY05obmROfG7fKOfpdcvQ==
X-Google-Smtp-Source: AGRyM1sb8mq4S3fqfch1NUhnHGo34gy9CrUC8jUrbKp0ydI2X8+4+CjOi86qOhNgL+Gg1Z4/bwKNoQ==
X-Received: by 2002:a5d:40c8:0:b0:21e:611b:660e with SMTP id
 b8-20020a5d40c8000000b0021e611b660emr5277060wrq.464.1658670656865; 
 Sun, 24 Jul 2022 06:50:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a7bc3d4000000b003a3278d5cafsm14645632wmj.28.2022.07.24.06.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 06:50:56 -0700 (PDT)
Message-ID: <e54755f4-3f12-fc45-baa3-2a6661600fe4@mind.be>
Date: Sun, 24 Jul 2022 15:50:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Michael Nosthoff <michael@nosthoff.rocks>
References: <48-62dd4800-5-54f5770@160071985>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <48-62dd4800-5-54f5770@160071985>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MMsDTzfivH7V+tyq+2VenJE1C/++mTegby6BaiMTHAw=;
 b=OkBxNhi9O77/zOa93sS4C5wNTazkZ3fbyJyImFv7qW7eC11Y7BGDhVPgRPEn+WLp1G
 o8RhXIffTGz6eE8DgndVIL1YhWo4L6NucbUDopukPObSOI3UsJfNDevzzudHVLrq/5qH
 0Eb0JUEA6CmiyZF1LizYr+1y/j7Sm1Jaqh14O27u4vzmHEveRA4Ol3lYcVNhYdl67eul
 NhNOTZ5mDy9U1FiNSaqVoDTqFFzeqkluS0bODJKdB+o/164N1icp6lmOXV42HosWcvQl
 7j7GQyfSASeB+uq38u/ksmVesZNplmUkih/gdPcw2UoS6TDzVxYXEWc4BFhPeG7OEBQw
 nNkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OkBxNhi9
Subject: Re: [Buildroot] [PATCH v2] package/cog: add libgbm as dependency
 when building with DRM support
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
Cc: aperez@igalia.com, Alexandru Ardelean <ardeleanalex@gmail.com>,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 15:25, Michael Nosthoff wrote:
> Hi,
> 
> On Saturday, July 23, 2022 10:48 CEST, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>
>>
>> On 22/07/2022 09:01, Alexandru Ardelean wrote:
>>> When building with the DRM support, it can happen that the libgbm library
>>> is not yet built by the provider of this lib (specified by
>>> BR2_PACKAGE_PROVIDES_LIBGBM).
>>
>>    I've applied this one to master already, however there are two comments on v1
>> that remain unaddressed.
>>
>>>
>>> The docs in cog `docs/platform-drm.md` specify this dep-list:
>>> - **WPEBackend-fdo**:
>>> - **Wayland**:
>>> - **libdrm**:
>>> - **libgbm**:
>>> - **libinput**:
>>> - **libudev**:
>>
>>    This would imply that a dependency on udev is needed as well (both in the
>> Config.in and the .mk). It is actually implied by libinput, so we won't get
>> build failures, but it's better to have explicit dependencies.
>>
>>>
>>> libgbm needs to be added.
>>> Adding libegl as well.
>>>
>>> Updated package/cog/Config.in to define the dependencies (for DRM)
>>> according to libegl & libgbm.
>>>
>>> Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
>>> ---
>>>    package/cog/Config.in | 9 ++++++---
>>>    package/cog/cog.mk    | 2 +-
>>>    2 files changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/package/cog/Config.in b/package/cog/Config.in
>>> index d4238750f9..484eb85c70 100644
>>> --- a/package/cog/Config.in
>>> +++ b/package/cog/Config.in
>>> @@ -39,7 +39,8 @@ config BR2_PACKAGE_COG_PLATFORM_FDO
>>>    config BR2_PACKAGE_COG_PLATFORM_DRM
>>>    	bool "DRM backend"
>>>    	depends on BR2_PACKAGE_HAS_UDEV # libinput
>>> -	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
>>> +	depends on BR2_PACKAGE_HAS_LIBEGL
>>> +	depends on BR2_PACKAGE_HAS_LIBGBM
>>
>>    It apparently needs the
>> BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT feature. You can test
>> that by trying a build with rockchip-mali or ti-sgx-um as provider, since those
>> packages don't have that feature.
>>
> I'm currently maintaining an external package for the newest ti-sgx-um version which provides
> (i think) a newer/more complete version of libegl/libgbm. For this I currently have to patch
> the cog package but the output is working fine with the drm backend.
> So I would be highly interested in a patch like this.

  Since I merged this patch, you should no longer need to patch anything 
yourself, right?

> 
> Is there a way to find out which features a certain libegl/libgbm provides? 

  There are a bunch of functions related to those features. See elsewhere in 
this thread for some examples.

> Maybe I can then pick-up
> the work on bumping the ti-sgx-um/km packages again to bring them to a more recent version.

  Yes please!

  I do believe that it requires a specific TI BSP kernel version as well, so 
don't forget to document that in the Config.in help text.

  Regards,
  Arnout

> 
> Regards,
> Michael
> 
>>
>>    Regards,
>>    Arnout
>>
>>>    	select BR2_PACKAGE_LIBDRM
>>>    	select BR2_PACKAGE_LIBINPUT
>>>    	help
>>> @@ -52,7 +53,9 @@ config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
>>>    	help
>>>    	  Expose remote control interface on system bus
>>>    
>>> -comment "DRM platform needs mesa3d w/ EGL driver and GBM"
>>> -	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
>>> +comment "DRM platform needs EGL and GBM"
>>> +	depends on \
>>> +		!BR2_PACKAGE_HAS_LIBEGL || \
>>> +		!BR2_PACKAGE_HAS_LIBGBM
>>>    
>>>    endif
>>> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
>>> index f2ca0af93d..da660eb7c1 100644
>>> --- a/package/cog/cog.mk
>>> +++ b/package/cog/cog.mk
>>> @@ -28,7 +28,7 @@ endif
>>>    
>>>    ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
>>>    COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
>>> -COG_DEPENDENCIES += libdrm libinput
>>> +COG_DEPENDENCIES += libdrm libinput libgbm libegl
>>>    else
>>>    COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
>>>    endif
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
