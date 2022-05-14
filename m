Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342A9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED25760F11;
	Sat, 14 May 2022 09:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPOZlV3DBUPE; Sat, 14 May 2022 09:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FBB760F21;
	Sat, 14 May 2022 09:46:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8A5B1BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4C9A409DE
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4yjaQbRxw74 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:46:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 546AD4098D
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:46:24 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id t5so12524841edw.11
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ketYFUf6EZpyClXa0wz7Rfl5AdEJRU2GERkqZKTtUbw=;
 b=ExCTdHaYMxzrNgCReesyrKN7yn46v8ssV8hy7iJmNgtavsPXz9l9+xbWqCQ0ACt7YS
 9VKU7XCjrACkh/7KeQXmoNCFvK7CzlUkqd+NqUxNDCH4BGO77q8nnV2Xxfgby16PlVPn
 4mCul2KxN8OCp7W6WF9NAAi0ztOLXNw+cjZehx5IyLrp5FcaVlzuK0y0AmemZL78vQtg
 QcEiKSCiF4w9kdUw1BEsN95j5XpW8SNGTPgA8SuTFHdyChSYbiuhvDmN40uWKKnFGx8k
 qlRwvVfoHtftaTLZ7pWyuAASzJl/GMRS+uhLxe9/p62oEfZU1IKvK0JURfYymCD+RN5n
 WOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ketYFUf6EZpyClXa0wz7Rfl5AdEJRU2GERkqZKTtUbw=;
 b=qQ3cuusw1d5NyvuLCnqCwuG452wEwNIqtk+c7lXA0t4zl8IlBeBHrMr9bAKC9JrLNL
 E2bmm6iPHNg/29rl6BLsijDeWJo+PnDoA1kEsfTMAQJRDXGzOT2qN1W/6hSnGlQsNk2X
 ZbMj3ZhzLoAg5iSxoK47IJrBwQUzVvc3wJw2DsV0ltrGvSmA8AmRAXHkGdBlEF9Dagc4
 bR1pTBR5sIuQ2s0FWV2H0/T0315IDMknZGL64Sjx0mH708naOAs05CwcrLHZ1fae/VcB
 MsqecDxGbEyQXgmHcmOMVKEwc6mrID28tHFPGnF/i4O2vV9zj6gaM0kSSzwdN7w38431
 3xZA==
X-Gm-Message-State: AOAM532Ulgz0InrmEymKZk6RP78XoAvMA3pXKpyRaJ82xCXwt4A9BHCQ
 m30GF/9oY5qLJd9Is/mTBV147w==
X-Google-Smtp-Source: ABdhPJzav8IFYonMaoNJesI3Ey0GCqQFXZb55YcEyHUMOznq6L6fjZlC+ESjf47RfYCiOOBFvAdhaQ==
X-Received: by 2002:a05:6402:2743:b0:42a:2cee:20c4 with SMTP id
 z3-20020a056402274300b0042a2cee20c4mr2935010edd.338.1652521582530; 
 Sat, 14 May 2022 02:46:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a50d64e000000b0042617ba6380sm2079740edj.10.2022.05.14.02.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:46:22 -0700 (PDT)
Message-ID: <38adcc01-09dc-5933-d1fb-71a311282f92@mind.be>
Date: Sat, 14 May 2022 11:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20220511004007.3630-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220511004007.3630-1-christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: add symlink to target
 qemu-system
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/05/2022 02:40, Christian Stewart via buildroot wrote:
> Scripts which use the buildroot host system to execute a qemu for the compiled
> buildroot output can use the symlink at host/bin/qemu-system to execute the
> appropriate qemu-system for the target, for example qemu-system-riscv64.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qemu/qemu.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 9c2b819174..1bcffc2340 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -400,6 +400,12 @@ define HOST_QEMU_INSTALL_CMDS
>   	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
>   endef
>   
> +# install symlink to qemu-system
> +define HOST_QEMU_POST_INSTALL_SYMLINK
> +	ln -sf ./qemu-system-$(HOST_QEMU_ARCH) $(HOST_DIR)/bin/qemu-system
> +endef
> +HOST_QEMU_POST_INSTALL_HOOKS += HOST_QEMU_POST_INSTALL_SYMLINK
> +
>   $(eval $(host-generic-package))
>   
>   # variable used by other packages
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
