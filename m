Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B34C36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 21:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43A05412E4;
	Tue, 25 Mar 2025 21:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxfcCU19P_xg; Tue, 25 Mar 2025 21:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A11E40D85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A11E40D85;
	Tue, 25 Mar 2025 21:47:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76749E4
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 21:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6802740B6D
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 21:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTrTr7Hso8Iw for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 21:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5CB9540969
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CB9540969
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CB9540969
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 21:47:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso32342255e9.0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 14:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742939235; x=1743544035;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1qWFAU5ZlAbT/MVGlndlvUvpBcpj24LXvozGi++xo8=;
 b=KQTMJhWxx6PV1dOzJAajQKar0TnxoZg9Br1ERDRgExfemzbjSMynTa0a5dj02/Pnnv
 0wU/FWM7/OBQ3xASeaQJR819wSROkD21ed6iWpwP7C6DXs7//0gyh7NaBa8O9KCERbqv
 VaU+7MdEaw2QXR33EH+irIuetHloOipd3uSObakLNt3/c/iaND/a8KvMFfGtV0XCqhd/
 gi8MdfwYtqVUwlZgMxj2Onc6fJ3Ja+nx08xnVAY+Uxlc9bfphXrz0MlAKuAWwQ8SLLkj
 ZiuOJFfnb704cPZKTDJw0M+W9g3kkNfc1g5eJUtj3iU8ebIeWTaE8IO7nBYqhHZrvWi3
 8MqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkjFL9lEQasRmTzKbSG0jPB3d0k3wD0WWKONiPrPDUU4HyTpPK9Q3HV3hxuszDQSI/St2hpbLQQ5U=@buildroot.org
X-Gm-Message-State: AOJu0YzsdUkzkmrD1jJzLwOHiHgdn34nHJTKX9/08zVro0xIsfar9j6c
 gZY75EvKHDaQHdPhIj4rMfGGPonpOkKpL3kDbxEZKoJMX8NhV64NbcUBtTgn/yA=
X-Gm-Gg: ASbGncvcFUzpeIqZCsRpgBtyURJPQNY/75UQTw6zHrniFHqCd/gVL01CWeqByPTPmK9
 BIqHu5MFaCtuANebB/HplrvcBun1p7I62+W3+EOFcs01hhzAaIFHRjhopGbdJZ6ZA3K8aSXuNcY
 6U/QFibMY4BzPpgPjjD3ogdcxCP9YywTjdALU+hpjpAYt6HBamhKyFd8udOMIv+J69IKtrQD/f3
 usx9X9Rq0Rg8D5I9PY0sCVyg3FvDMIo/5Vjpu00ji9RYqgRpYjLgHZXmERlSgyTv035a4G007ON
 TMuV3PG/G9uzn2x3cOVvAFYVtAQktD0mhon3m144+nhlATjcR1YNa/0KO74uYb99ZQkNM8qQ3z4
 b0GSfx9gA+83dCduLDSN7PuZa5YkvC8T9Yxym2aP3l4F66wyOYMn9D3KMcnIGCVjlG++fLMV2ad
 TzAab7168GaQ==
X-Google-Smtp-Source: AGHT+IFnop9oeB4pA5iQOCcNBSIEKDGfQVoBvf2PA81ECCaL4rWX2/QeVYSCRpzzS49kLGDizjRSSQ==
X-Received: by 2002:a05:600c:1f8b:b0:43c:f1b8:16ad with SMTP id
 5b1f17b1804b1-43d50a4a938mr198105395e9.30.1742939234889; 
 Tue, 25 Mar 2025 14:47:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995a10sm14695353f8f.6.2025.03.25.14.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 14:47:14 -0700 (PDT)
Message-ID: <43c0f8e3-4e9f-4bf8-a0dd-0f39824c03a1@mind.be>
Date: Tue, 25 Mar 2025 22:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charlie Jenkins <charlie@rivosinc.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250310-fix_external_toolchains-v1-1-446f48af7cf7@rivosinc.com>
Content-Language: en-GB
In-Reply-To: <20250310-fix_external_toolchains-v1-1-446f48af7cf7@rivosinc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1742939235; x=1743544035; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z1qWFAU5ZlAbT/MVGlndlvUvpBcpj24LXvozGi++xo8=;
 b=ERqu5tZQ+JbH3f368B17cPYNMKvrvbPi4qAtQNa7xGoP2ibgEhidv5sm3Fh10IXTSi
 wt8xv78tgm/YFnlTb/+FRtjWQeCZbKvAkSNeyd49lFZUEfV2tCDp1TINsg7ponzfC3sS
 L9poF5MuYPR7rds5+TIelhmz0+Z+avVtOMi+i2oF3mJbBm8VNo37jSXWWXWbC5XeFRFF
 sMAsvegeD1I4G1vvQsgmKmNTReVAWagqFpTy6mF8UAtF9u1hW/ngRRpP/C1CF3Qsk3rd
 kJiwRMy/SvXcDHD01VkZ35PIoK41vq8MY2WcVfqWNn+/ld3dUpi+2g4OCETyEvqfG0+9
 1EaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ERqu5tZQ
Subject: Re: [Buildroot] [PATCH] toolchain-external: Fix external toolchains
 when BR2_ROOTFS_MERGED_USR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/03/2025 03:48, Charlie Jenkins wrote:
> External toolchains like crosstool-ng place libraries at /lib.
> When BR2_ROOTFS_MERGED_USR is enabled, these libraries were not being
> copied into the target. This caused these toolchains to be unusable with
> this option.
> 
> WHen BR2_ROOTFS_MERGED_USR is selected, copy the /lib and /lib64
> directories into /usr/lib and /usr/lib64 respectively.

  This should already happen, because the lib -> usr/lib symlink should be 
created in staging dir before the toolchain sysroot is copied.

  But you reported in the other thread that the problem is actually with the 
symlink:

> $ ls -l ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so
> lrwxrwxrwx 1 charlie rvs 6 Mar  9 22:58 ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so -> ../../

  So this looks liek the symlink creation is going wrong. That is done by the 
following code:

	for link in $$(find $(STAGING_DIR) -type l); do \
		target=$$(readlink $${link}) ; \
		if [ "$${target}" == "$${target$(SHARP_SIGN)/}" ] ; then \
			continue ; \
		fi ; \
		relpath="$(call relpath_prefix,$${target$(SHARP_SIGN)/})" ; \
		echo "Fixing symlink $${link} from $${target} to 
$${relpath}$${target$(SHARP_SIGN)/}" ; \
		ln -sf $${relpath}$${target$(SHARP_SIGN)/} $${link} ; \
	done ; \
	relpath="$(call relpath_prefix,$${ARCH_LIB_DIR})" ; \
	if [ "$${relpath}" != "" ]; then \
		for i in $$(find -H $(STAGING_DIR)/$${ARCH_LIB_DIR} 
$(STAGING_DIR)/usr/$${ARCH_LIB_DIR} -type l -xtype l); do \
			LINKTARGET=`readlink $$i` ; \
			NEWLINKTARGET=$${LINKTARGET\#$$relpath} ; \
			ln -sf $${NEWLINKTARGET} $$i ; \
			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
		done ; \
	fi ; \

  So I guess there is a symlink from usr/lib/libm.so to ../../lib/libm.so in the 
ct-ng toolchain, and that this doesn't get handled correctly by the code above. 
But honestly that code is not xxactly readable...

> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> I originally reported this issue here [1].
> 
> [1] https://lore.kernel.org/buildroot/Z86AGdrKHaUqgLVt@ghost/T/#t
> ---
>   toolchain/helpers.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index f3fdaaec07c5a01688da685c4d0fd4e2cb357b95..b565da8a3a8f12567920f14dd3b6a18e548da6c7 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -55,6 +55,9 @@ copy_toolchain_lib_root = \
>   # corresponding architecture variants), and we don't want to import
>   # them.
>   #
> +# Furthermore, when BR2_ROOTFS_MERGED_USR is enabled, the 'lib*' directories
> +# need to be copied over to usr/'lib*'.
> +#
>   # If ARCH_LIB_DIR is not a singular directory component, e.g.
>   # 'lib32/octeon2', then symbolic links in ARCH_LIB_DIR and
>   # usr/ARCH_LIB_DIR may be broken because Buildroot will flatten the
> @@ -109,6 +112,10 @@ copy_toolchain_sysroot = \
>   	ARCH_SUBDIR="$(strip $3)"; \
>   	ARCH_LIB_DIR="$(strip $4)" ; \
>   	SUPPORT_LIB_DIR="$(strip $5)" ; \
> +	if [ "$(BR2_ROOTFS_MERGED_USR)" == "y" ]; then \
> +		rsync -au --chmod=u=rwX,go=rX $${ARCH_SYSROOT_DIR}/lib $(STAGING_DIR)/usr/lib 1>&2 ; \
> +		rsync -au --chmod=u=rwX,go=rX $${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR} $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} 1>&2 ; \

  It looks suspicious to me that you copy both lib and ARCH_LIB_DIR - only one 
of them should be valid (or, usually, one is a symlink to the other). Also, 
ARCH_LIB_DIR is already handled in the loop below (in a slightly different way, 
because thanks to the trailing /, the lib -> usr/lib symlink is preserved).

  Regards,
  Arnout

> +	fi ; \
>   	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
>   		if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
>   			continue ; \
> 
> ---
> base-commit: 4809690d42f9b395ccb76ee7583c199fdd8d42c5
> change-id: 20250310-fix_external_toolchains-d1b8c4da0be8

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
