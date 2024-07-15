Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4073FC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE6B540586;
	Mon, 15 Jul 2024 14:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpY6lgHovVIp; Mon, 15 Jul 2024 14:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77D6940607
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77D6940607;
	Mon, 15 Jul 2024 14:07:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE8961BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A664D60822
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0Mu-qV1UYEQ for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76ED960815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76ED960815
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76ED960815
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:07:34 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so33713095e9.2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721052452; x=1721657252;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tmYmCtc1PAx3mVQonYnBYO46KxGl/9fchBwESI1cZ5g=;
 b=J/ILCzEoJ9HL7N7YcwYiLu+ePBCkimP8zdv3pgP+n5VGamcafwwNAUgxcm5PvOZaus
 pc/G8wLIt97JQ+ftGiAWtXIXpaG0OV0c8JQDz/ZYqKIAnwcgs2XlpZ/5PQLuHJXiD717
 Nh1M91UQgEGDeo2yNTiAoUjpIAERrUIwVrXl2n+xLEBMksQVN5dVP14WtbkkPPAlcO1G
 Boc3k0ivhZ3NWoPlo9fMxkWMMXss7pBKeZdeF6/R8TWmXrwj6tO5+8XLdSWojF5tS7Iq
 +BKo0U8c2kN1SyOcJhzETvoT+fDHO1pdLDMn5ufnBkK5uA38uB7YoxcuINwfoKMhEtCz
 p2AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvqbLV0zV1TtjnBnXZFEa3wMcJiqqdWcTyc7igzqDfgkveNJHpaV5qvj81aKEl7jI+Zb1t3BL3kpb8LJAYcIcaOOKbLbHkxA==
X-Gm-Message-State: AOJu0YwZgpCcJM11pRtO1yIXJBe0026IOc9AdksBQrKOQd2ePwDiRuOP
 wse8s5EkMu3vBW6wCeA16OMFbdz55EQX01LJ0KrRxzbEWLIr0nc574zaF4z0Ux4t86SN1VNskTk
 +kIs=
X-Google-Smtp-Source: AGHT+IGKppGkUjiqkZWvE/9btG2+4gzkkc04cSp8IMvzVL4Z0O4QgPKuIRB6WwanwwlM8Bm49mnGMg==
X-Received: by 2002:a05:600c:8a9:b0:426:59d3:8cae with SMTP id
 5b1f17b1804b1-426707cf7aemr149988345e9.13.1721052452197; 
 Mon, 15 Jul 2024 07:07:32 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2cc306sm125323845e9.30.2024.07.15.07.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:07:31 -0700 (PDT)
Message-ID: <d9fcfe9b-7b11-42ee-9773-b9620d720135@mind.be>
Date: Mon, 15 Jul 2024 16:07:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20240710152941.334195-1-kory.maincent@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20240710152941.334195-1-kory.maincent@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721052452; x=1721657252; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tmYmCtc1PAx3mVQonYnBYO46KxGl/9fchBwESI1cZ5g=;
 b=VpcR9b2WFbt9D9TA2BgxHFz8kQyy+dIgK7cs3VR7uq0q/AWRxKlGOsGrbf98wYCdGh
 HAuv2xOhcXhnC0p9M1+J5/phQS4gdXttpCd5pvq0Gz2pBHa2VwQDJRxxbbzmxfcwIh89
 BYrAsItduPDvQD95HJEi/NQZ+OaO1BoN5OdOpPBlP/y5YUyT2lLfaAs6wc8MTmY35qsf
 JZdI8BeLSVmw5OeBafPkbaMSqp/Hg4GVjT9LQNaHb5b+WVbUG66xvHEV0GOz12paOA5D
 iuIdqBnubjlJNJt8nEHVhF/+y9Z2WiLYf3OXaoou73Fp7c4mfY5XyHeNHPXR6dbHIAXt
 DNgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VpcR9b2W
Subject: Re: [Buildroot] [PATCH] linux: Add support for vendor directory in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/07/2024 17:29, Kory Maincent via buildroot wrote:
> Linux organizes devicetree files under vendor subdirectories for arm and
> arm64 architectures, such as arch/<arch>/boot/dts/<vendor>/. The
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH was only copying devicetree files to
> arch/<arch>/boot/dts/, which is incompatible with the vendor
> subdirectory structure.

  I don't see what the problem is though? If a DT is put in 
arch/<arch>/boot/dts, it can still be built with the current Buildroot.

  The only thing you need to do is to make sure to do

#include "vendor/cpu.dtsi"

instead of

#include "cpu.dtsi"

  The in-tree DTSes don't have the vendor/ part in the include, of course, but 
for custom DTSes you can do what you want, right?

  I'm going to mark it as Rejected for now, but feel free to resubmit if there 
is a good reason to have this feature.


> This patch adds support for using a directory in
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH that matches the vendor subdirectory name.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>   linux/Config.in |  4 +++-
>   linux/linux.mk  | 14 +++++++++++---
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 34057a4893..6ca615cae3 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -423,7 +423,9 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
>   	  Paths to out-of-tree Device Tree Source (.dts) and Device Tree
>   	  Source Include (.dtsi) files, separated by spaces. These files
>   	  will be copied to the kernel sources and the .dts files will
> -	  be compiled from there.
> +	  be compiled from there. You can also use a directory which
> +	  name match the vendor name as in
> +	  arch/<arch>/boot/dts/<vendor>/

  I think the explanation could be better:

	  Starting from Linux 6.5, the device trees are put in a <vendor>
	  subdirectory. To emulate this, you can put custom device trees
	  in a directory with that same <vendor> name, and specify the
	  path to that directory here instead of to individual dts files.

  I feel this is pretty complicated for a user to understand though...

>   
>   config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
>   	bool "Keep the directory name of the Device Tree"
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 16d9f19470..07d4ddf7f3 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -198,7 +198,15 @@ LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
>   # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
>   # copied to arch/<arch>/boot/dts, but only the .dts files will
>   # actually be generated as .dtb.
> -LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
> +# In case we are copying a vendor dts subdirectory as in
> +# arch/<arch>/boot/dts/<vendor>/ we have to append the wildcard to the
> +# folder to list the devicetree.
> +LINUX_KERNEL_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
> +ifneq ($(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)/.*),)

  You don't actually need the * here.

  Also, better use positive logic (ifeq instead of ifneq, and swap the branches).

> +LINUX_DTS_NAME += $(addprefix $(notdir $(LINUX_KERNEL_CUSTOM_DTS_PATH))/,$(basename $(filter %.dts,$(notdir $(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)/*)))))
> +else
> +LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)))))

  This is also getting pretty complicated, could it be refactored so there are a 
bit more common parts? Something like:

ifeq ($(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)/.),)
LINUX_CUSTOM_DTS_FILES = $(wildcard $(LINUX_KERNEL_CUSTOM_DTS_PATH)/*))
LINUX_CUSTOM_DTS_PREFIX = $(notdir $(LINUX_KERNEL_CUSTOM_DTS_PATH))/
else
LINUX_CUSTOM_DTS_FILES = $(LINUX_KERNEL_CUSTOM_DTS_PATH)
endif
LINUX_DTS_NAME += $(addprefix $(LINUX_CUSTOM_DTS_PREFIX),$(basename $(filter 
%.dts,$(LINUX_CUSTOM_DTS_FILES))))

(parenthesis added in an email editor so probably unbalanced :-)

  Regards,
  Arnout

> +endif
>   
>   LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
>   
> @@ -505,8 +513,8 @@ endif
>   #   http://lists.busybox.net/pipermail/buildroot/2020-May/282727.html
>   define LINUX_BUILD_CMDS
>   	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
> -	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
> -		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
> +	$(foreach dts,$(LINUX_KERNEL_CUSTOM_DTS_PATH), \
> +		cp -rf $(dts) $(LINUX_ARCH_PATH)/boot/dts/
>   	)
>   	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
>   	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
