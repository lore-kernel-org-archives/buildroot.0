Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA06C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 630D440AF4;
	Sat, 23 Jul 2022 12:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 630D440AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVIHvuqp66jh; Sat, 23 Jul 2022 12:01:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 445DE40AE8;
	Sat, 23 Jul 2022 12:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 445DE40AE8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45D461BF2F2
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 202AB848F6
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 202AB848F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRPfuTlnQkm1 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:01:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5CE3848D5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5CE3848D5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:01:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id n185so4152552wmn.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gJEkq/+l6ekFnoskfsBZm8tNq/FpG0lbGkh5VhE6Jbo=;
 b=yhYGrVrEoaOM+S10Ho2BCihvHfRYzi/ZqIZbvqE3z7wLbXgULCnyVKhforBtac195W
 Eg6fEWNnR/tmaF7YKqIAOJMokKGg5QmgRR3RDOPIrPxbGZiuCLlkufqTy7BuBfPKZXGo
 QYJoqPDFrfJvcipLd4PX/6noZHva56Nunjp/2KVhQaN7RZrgv+A/XLNQEce9ReCfAXss
 c3aDiH/cLDqijaodFfKmYo+ut3Rdx46K1rd+h8m5rfZMvdqaaEgKxsmr7Y1FF/FkjwhV
 YQ0PX0QPa7eYT1Ch/9UjGHC1/IgwbWUzvsGBOORWuccun8nFWwvj7tlJ4dn1pk8FyFtd
 ve0g==
X-Gm-Message-State: AJIora/l0QEN4Yu4zySP4Sg7on07ee64e6Tpt/5yK6ggRRjj8pODO3Bc
 4o/gsVKbsbuphvSDb3M+Eve0d5Pww9Fb7g==
X-Google-Smtp-Source: AGRyM1sNA7EBNnPktlQCvo8Taha3A16fTYzmA68gm3unSybJoPScO8Iov0ioffb7mga7AZlJe3Y6Hg==
X-Received: by 2002:a05:600c:3044:b0:3a3:f60:c907 with SMTP id
 n4-20020a05600c304400b003a30f60c907mr14823713wmh.19.1658577674474; 
 Sat, 23 Jul 2022 05:01:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adff2d0000000b0021b9585276dsm6947391wrp.101.2022.07.23.05.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 05:01:13 -0700 (PDT)
Message-ID: <a96703d8-83e8-fc44-0d89-0d5e7e0ba395@mind.be>
Date: Sat, 23 Jul 2022 14:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
References: <20220721183503.369200-1-paul@crapouillou.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220721183503.369200-1-paul@crapouillou.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=gJEkq/+l6ekFnoskfsBZm8tNq/FpG0lbGkh5VhE6Jbo=;
 b=bFvSeUBN9NKs64w7uoYt4Rgjpn1I+YAhmwIR/oCdWdY3PJ0zvleSQTNQzVKf3PsFYw
 O5heEDdi5t0MxP8B6t5PodWvjcGpuRJpipf/t2s4CtvWVoFCIvVJqqSJE3t4S0SCElqk
 TXlJWcYtq6whxqre/OlZDss+GiJDjIqLm/n2NTU3e6LNQlrof0ePt6UwxGON0CzWLyrP
 +2T8dJBuFU7R6E2nCDCf3ndk42mLBAX+FllHM9uBIbREAdYQ1fKrrxvd+0sVZ4xFwvxT
 CZ+oKSZUOTLwTLLwpRGwQhb926A1zscOSsmTnJtdjGGw//5aOqtDCllFNMYDHX61s1he
 kfrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bFvSeUBN
Subject: Re: [Buildroot] [PATCH 1/1] linux: allow modules install path to be
 overriden
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



On 21/07/2022 20:35, Paul Cercueil wrote:
> On my system the modules are not installed in the root filesystem
> directly, but in a separate squashfs image that is then shipped
> alongside the kernel.

  That use case is way too specific to add support for it...

> Support this setup by allowing board files to override the install path
> for the kernel modules.

  This works for in-tree modules, but it stops working if you have any 
out-of-tree modules.

  The proper way to do this would be to add a post-build script that moves 
TARGET_DIR/lib/modules to where you want it - or probably just run mksquashfs on 
it and remove it afterwards.


  Therefore, I've marked this patch as Rejected in patchwork.

  Regards,
  Arnout

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   linux/linux.mk | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 322ccabbd9..36896a3b4d 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -145,6 +145,8 @@ LINUX_POST_EXTRACT_HOOKS += LINUX_XTENSA_OVERLAY_EXTRACT
>   LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
>   endif
>   
> +INSTALL_MOD_PATH = $(TARGET_DIR)
> +
>   # We don't want to run depmod after installing the kernel. It's done in a
>   # target-finalize hook, to encompass modules installed by packages.
>   # Disable building host tools with -Werror: newer gcc versions can be
> @@ -152,7 +154,7 @@ endif
>   LINUX_MAKE_FLAGS = \
>   	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
>   	ARCH=$(KERNEL_ARCH) \
> -	INSTALL_MOD_PATH=$(TARGET_DIR) \
> +	INSTALL_MOD_PATH=$(INSTALL_MOD_PATH) \
>   	CROSS_COMPILE="$(TARGET_CROSS)" \
>   	WERROR=0 \
>   	DEPMOD=$(HOST_DIR)/sbin/depmod
> @@ -519,8 +521,8 @@ define LINUX_INSTALL_TARGET_CMDS
>   	# directories, not relevant on the target
>   	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
>   		$(LINUX_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
> -		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ; \
> -		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ; \
> +		rm -f $(INSTALL_MOD_PATH)/lib/modules/$(LINUX_VERSION_PROBED)/build ; \
> +		rm -f $(INSTALL_MOD_PATH)/lib/modules/$(LINUX_VERSION_PROBED)/source ; \
>   	fi
>   	$(LINUX_INSTALL_HOST_TOOLS)
>   endef
> @@ -528,9 +530,9 @@ endef
>   # Run depmod in a target-finalize hook, to encompass modules installed by
>   # packages.
>   define LINUX_RUN_DEPMOD
> -	if test -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \
> +	if test -d $(INSTALL_MOD_PATH)/lib/modules/$(LINUX_VERSION_PROBED) \
>   		&& grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
> -		$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED); \
> +		$(HOST_DIR)/sbin/depmod -a -b $(INSTALL_MOD_PATH) $(LINUX_VERSION_PROBED); \
>   	fi
>   endef
>   LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
