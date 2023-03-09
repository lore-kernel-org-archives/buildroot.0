Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B885C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 875C382151;
	Thu,  9 Mar 2023 21:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 875C382151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ls31EDJSNgF5; Thu,  9 Mar 2023 21:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE3EE82095;
	Thu,  9 Mar 2023 21:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE3EE82095
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60B451BF366
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38857408A7
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38857408A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BvIstFigORov for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF1DF40278
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF1DF40278
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:34:02 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id cw28so12682789edb.5
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 13:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678397641;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vHUiqnwnBzvlDjTVy2GmnAz/TGpuFNJo8iAoXyrgvaM=;
 b=Ttfq0bvfLEnv4Hq3IQpfh2rsnB1JNFWwKwl305xLOeX+S3yEyRNcBu6W5lvr4MdmcZ
 469AONGRSxruDW8dfbHEI5M4xOHLkFXSwkvDMKsJi/n3Qv8QkyyyOZwLkjYy/3XKcKlx
 aclZvyIJNfZSuAw5gwcKQmJTZ6unHaY7vigMQ3QaM7VGAFjgnm2yHtyYAnQEZis2kYhD
 Z38nmXiNAbhKNJScWQ8LJOgt4Qvzg+JotqgvsV5KUJWWhijkAvC+gXPnhDx42Axr0ffk
 73rcSbJgllOPB2nmJMnZ1vSfEEF27afh1wO0x+6yqCS2Z3uXAZrPGsq5gqRxmGX4vSza
 ZKWw==
X-Gm-Message-State: AO0yUKXu+jim2yXByCbRB5zSSqAvPokpDYK2EPQKxtt6CJJMWfuZHLHC
 25yM05arpeLifUorkPmiUHx8A8/VqwyKD3WjDnE=
X-Google-Smtp-Source: AK7set/O02dubydhPTgSpdCtJWoNETZaZe6PcdrJX6e7F28S++KjzirVeyG0uLBABXG5R8Co3VdQjg==
X-Received: by 2002:a17:906:2189:b0:87b:1be:a8c2 with SMTP id
 9-20020a170906218900b0087b01bea8c2mr22959332eju.73.1678397641053; 
 Thu, 09 Mar 2023 13:34:01 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 tq8-20020a170907c50800b008b17b0f5d07sm26163ejc.217.2023.03.09.13.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 13:34:00 -0800 (PST)
Message-ID: <9bbc578a-1b1d-c342-9ff0-27282735b582@mind.be>
Date: Thu, 9 Mar 2023 22:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230223222539.294264-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230223222539.294264-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678397641;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vHUiqnwnBzvlDjTVy2GmnAz/TGpuFNJo8iAoXyrgvaM=;
 b=ieOxx7wlzbEcwzLgK/VVc5BqGcEAB5FI3KWxQvDGld5LljH/AGe1OIfe0nqWw2yFB8
 azkXSsnlikOEmnpP7YFSnO5IB1uPfh1wjtZLdZNY/GFplTeWT+RDLFzXfbDuHZmmxX1l
 ZDV9/KwK5DUW02Y7BfFZhRTmS7ZJ9XQ4AeDdH0/g4V21fz8bHAMPxoneW1hqSzGO2NIH
 l8V9Cl6KkaeMMkYZljD55rqlOVnrkzdjQVWOLQfVltBUS8uySTE5FasluS6Dkl6OoWL6
 rpY8xUvv3Bg3L5cH03LEC8sUeMwws4dyViSekRQ6/ChWBioZygl3m3OKAfVh1F/fsb4J
 s/7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ieOxx7wl
Subject: Re: [Buildroot] [PATCH 1/1] package/libmad: force arm mode instead
 of Thumb mode
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/02/2023 23:25, Fabrice Fontaine wrote:
> Fix the following build failure:
> 
> /tmp/ccv8mDeW.s:93: Error: selected processor does not support `smull r6,r7,r3,r1' in Thumb mode
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/92a3f19b4fa12a7724f9e3d99284da4ad2beecb2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/libmad/libmad.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
> index 684b8a2261..5555bf5a36 100644
> --- a/package/libmad/libmad.mk
> +++ b/package/libmad/libmad.mk
> @@ -32,6 +32,13 @@ LIBMAD_IGNORE_CVES += CVE-2017-8374
>   # is able to properly behave in the face of a missing C++ compiler.
>   LIBMAD_AUTORECONF = YES
>   
> +# libmad has some assembly function that is not present in Thumb mode:
> +# Error: selected processor does not support `smull r6,r7,r3,r1' in Thumb mode
> +# so, we desactivate Thumb mode
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +LIBMAD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
> +endif

  Applied to master, thanks.

  Regards,
  Arnout

> +
>   define LIBMAD_INSTALL_STAGING_PC
>   	$(INSTALL) -D package/libmad/mad.pc \
>   		$(STAGING_DIR)/usr/lib/pkgconfig/mad.pc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
