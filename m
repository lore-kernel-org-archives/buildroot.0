Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC399C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8457940297;
	Sat, 17 Sep 2022 20:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8457940297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_fZg07Njfxk; Sat, 17 Sep 2022 20:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A0140183;
	Sat, 17 Sep 2022 20:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2A0140183
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 506BB1BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38A0084018
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A0084018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPq8ivQHVOfq for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:17:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16EB883F65
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16EB883F65
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:17:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id g3so20300578wrq.13
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PWthIIRYzfD4bvwChxgrHr9/9alzJRfdu3gmhx5vTms=;
 b=IfLubKyDHIQfZ/b2VAs4vgsEB7/+BtgFMfA9Ti1Fx8Bn3GB3v+bLyiuuav4dfDZ5uS
 2f1hAR1siczXOaGXB3K/J77iRwyUD7lzz7xqAtlWFhLteZQgaeLsiqppg53FXj4523mj
 DL2zErQhC6QZYv/2azFSTpN5tJh2YMLCDuqYDlF9gGNQ8JwObwRDDa3E/wS7vemX1Q3+
 jWn9S7iThNnDEdzJMkrVAjbvaaFzAePDgD0MinBbaCFQSM6+i8FdBYjOjgUOJCWLBOQr
 AXU/kLTymdOlJ51nhkBe6qoITcheZyUvMiY4DftDbCuO99G3zrp+IkjqINFnbjkWw/mV
 kKJA==
X-Gm-Message-State: ACrzQf1gjUeapAZyPvy/jK/Oe8WxDQe4AGW+Lib31qvPKbMLuPnAqEJF
 I52QXRe+X35uz5D/VNtP7fbMJw==
X-Google-Smtp-Source: AMsMyM4G5OleIzbKCa3qVpRJgIMddOHG5H9E2CcEz4gCCSlEgjpGdpnvCUgyjrwafNgHVnCAe7LQjA==
X-Received: by 2002:adf:db44:0:b0:22a:56eb:927f with SMTP id
 f4-20020adfdb44000000b0022a56eb927fmr6538788wrj.627.1663445848225; 
 Sat, 17 Sep 2022 13:17:28 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a1c3502000000b003b4935f04a4sm8426684wma.5.2022.09.17.13.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 13:17:27 -0700 (PDT)
Message-ID: <d707dd32-af74-0d63-c890-7d81e29ca454@mind.be>
Date: Sat, 17 Sep 2022 22:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1660931225.git.yann.morin.1998@free.fr>
 <212daefb880a3c5e49ff4aa8278cc4c3bc67360e.1660931225.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <212daefb880a3c5e49ff4aa8278cc4c3bc67360e.1660931225.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=PWthIIRYzfD4bvwChxgrHr9/9alzJRfdu3gmhx5vTms=;
 b=B6Qbzz3Ba07FSeMcVLFui0EDRsWFrSfIx1+thh9zSmtrRwd35z4OV4ZIlk+w7oLfZE
 U3cBoG3Ngz7iJ6wiAfa69YX+AurmigfjokOrReFhHy7VoFKpKZ/dH/sSqZZrAVs2JBqA
 MTODggC7jSb/cG84X+wEaKjHHPWcF7h4Dy0/cxrL1JeUHZO9oIMhlC7mxtKB3Kknn8NR
 LBniiDFlmminyKY0rgzJZGll77NqfcazGbKVjrqg4Hs9Gh3pFj8DkdrgRAMzwc4JqWt2
 v5IYsjf91Pq89ASgNN1EoyNwMbkgJBWLIaSf9GG/xletcmThckM6poDZ6FIOXOVsf5JP
 BsYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B6Qbzz3B
Subject: Re: [Buildroot] [PATCH 2/4] package/dracut: allow users to provide
 their own modules
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/08/2022 19:50, Yann E. MORIN wrote:
> Dracut modules can only be looked for in HOST_DIR/lib/dracut/modules.d/
> and dracut does not offer the possibility to look elsewhere.
> 
> Installing files in HOST_DIR/ can do done either from a host-package, or
> via a post-built script; there is no overlay like there is for target/.
> This is a bit cumbersome.
> 
> Add an option to the host-dracut package, so users can point to a list
> of modules to install.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> ---
>   package/dracut/Config.in.host | 11 +++++++++++
>   package/dracut/dracut.mk      |  9 +++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
> index 18f562b310..5756dbd43f 100644
> --- a/package/dracut/Config.in.host
> +++ b/package/dracut/Config.in.host
> @@ -7,3 +7,14 @@ config BR2_PACKAGE_HOST_DRACUT
>   	  and combining it with the dracut framework.
>   
>   	  https://dracut.wiki.kernel.org
> +
> +if BR2_PACKAGE_HOST_DRACUT
> +
> +config BR2_PACKAGE_HOST_DRACUT_EXTRA_MODULES
> +	string "extra dracut modules"
> +	help
> +	  Space-separated list of directories containing dracut modules
> +	  to install. The modules will be installed alongside the ones
> +	  bundled with dracut.

  Although I agree that conceptually this extra modules thing belongs with the 
dracut package itself, from a user, practical point of view, you actually want 
it in the dracut option of fs/cpio. If you use host-dracut without the 
cpio-dracut fs, it means you are using it in a post-build script, so it's not so 
weird to also install the extra modules in that script. On the other hand, if 
you are using cpio-dracut and you need extra modules (which is quite likely), 
then it extremely annoying that you have to go first to filesystems->cpio and 
later to hosttools->dracut...

  In other words, I think this should be moved to cpio.

  Regards,
  Arnout

> +
> +endif
> diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
> index 2b6a144aac..96fa7db6ba 100644
> --- a/package/dracut/dracut.mk
> +++ b/package/dracut/dracut.mk
> @@ -19,6 +19,15 @@ define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
>   endef
>   HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
>   
> +HOST_DRACUT_EXTRA_MODULES = $(call qstrip,$(BR2_PACKAGE_HOST_DRACUT_EXTRA_MODULES))
> +define HOST_DRACUT_INSTALL_EXTRA_MODULES
> +	$(Q)mkdir -p $(HOST_DIR)/lib/dracut/modules.d/
> +	$(foreach m,$(HOST_DRACUT_EXTRA_MODULES), \
> +		cp -a $(m)/* $(HOST_DIR)/lib/dracut/modules.d/
> +	)
> +endef
> +HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_INSTALL_EXTRA_MODULES
> +
>   # When using uClibc or musl, there must be "ld-uClibc.so.1" or
>   # "ld-musl-x.so" symlinks, respectively - else the init process cannot
>   # start
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
