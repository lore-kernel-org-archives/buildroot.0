Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CD4CD8C81
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65300610E5;
	Fri,  5 Jun 2026 12:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OYJQfPFi6Rr; Fri,  5 Jun 2026 12:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B19160B20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663838;
	bh=XImqZXBT5zrWdyCA5VYbmzoLL96pBPLr+nuz2f/fNEg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eBql09CG4YSx9Ty7T73uvJl5Ays6tuubF4MX17xfLLrsNMpNWvTCrBgspEwO3WRAa
	 JeC2uWhq/Iuk1ubZa4jeQp43F+Cc8BYG27W88YyTab6lX13Qx34RTiWM+uScFfy9xo
	 RKsz6UpgtQTnPN5jyf2kEwX9upNPEDioCQfT/0OttEiPa3uoCN2vOG/cNt5L1r1of6
	 8HoHuCzTIIxLSgmgLW2GQfu+LgKqxUWLUdcI2UJPfwBLroRkbu78hf28H/fSSf7JDk
	 Afa18PocHgEEcZT7ZSowWR4Kve0O/WkIwjncsjv/si7fiSVS9JhV8wdjZiyouY/jE6
	 tRwJWqfIJnhfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B19160B20;
	Fri,  5 Jun 2026 12:50:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB7E388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E6F2610E6
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXhpUPNEX-ZG for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 55819610B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55819610B8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55819610B8
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-490abf12f0fso10114735e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663827; x=1781268627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t4HEItzpm7dN6Tv0gDxEgQOU0KnVbIDMpLbXa3nLFXM=;
 b=VZEIfQEeWBQhM+A4YevCw6C0gXakZ5e86yOJA0CvlH/EUmUHXmD7UDbrUVVvJVq7q9
 mfcGPlI58FbFh1l7mkwul3k3sIjnLRkZiVSvD197oHTOjx85/ExCY3FXQkmylPIWKNe5
 6zz+VXNiKVkHYuuFv9n83/LwRu3XRdagUAqcjUzKRWtG2gNf/td1b1GJcLcy9VTw0FK+
 cvLr5e68j5YAjGVszGjsOCHUTPWYjhy2tizjcYv/6dSxYENduPxX2lOU93PL2yiVcUrz
 EGviMs4o4UZCd2TH6qj1B6i+3NJYSAQyWtslu0aZBqZVJjn7GTj6ZNaN6pnW1mkainAx
 lHQg==
X-Forwarded-Encrypted: i=1;
 AFNElJ911246DCRGt+qR21mpUH80rl6RVCjHWMYOr/ri74GwXFsVfQmLNAVhsq9mHXPwfqyC06ySiPJek1E=@buildroot.org
X-Gm-Message-State: AOJu0YxeSa7kVql4Bh9iIS6rCDWKICv1uNFD+phUPNVz0XmXVESMu/bq
 epEfJTIO4LCBvUrFwftVO50iVBALQFFUXBtFKFt90/8+XvmnCiVNfQ6MGCyVB4VvghM=
X-Gm-Gg: Acq92OGw3HDOp7lbHkd7btvGjVT82a7Mu6dy0Lu9D74ErnN7N64skKDyYJMHyPDaWPx
 v21C+BBQm0rQtGNT6sXV9J9kGviBopXqmVbIzZdNY3XV4jvnjHkd7MThFHeFVZ6f5Tmn5VQrtG5
 NGc8Lbr71H2j5ku1g1pF5po11WHE2ifJSiIt3osDk30pHfi3IroBvvSVvdb8N2+Qe44sH4rZS0c
 LIfmafqe0xHjksvviAJA5wyh8YG6BxOQkRBj1t6iOEq8Q++ggXez5070DxYH/3u65NnQeoNxyXE
 BGAjoDpHfNiJzBEEXOULuobRIe5DiR5DUKo3roOwnTttPJzNPzqmBCB3liXEv1ABdFU57nEssAb
 FbJK92HB9zBzPNGkDnfPtGSFf/fzJWhvmwavkPYzOFOC2mbkTZ0dIjZzElohKneCDiTo2iRFiar
 WPuxLKW8XmksZIOQ6EqxwE+DaePA==
X-Received: by 2002:a05:600c:6388:b0:48a:53cb:8604 with SMTP id
 5b1f17b1804b1-490c2d1412emr41059215e9.14.1780663827033; 
 Fri, 05 Jun 2026 05:50:27 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3fd663sm172669075e9.10.2026.06.05.05.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:26 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:26 +0200
Message-ID: <20260605125026.273479-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260413-linux-werror-v2-1-e29e45398c56@cherry.de>
References: <20260413-linux-werror-v2-1-e29e45398c56@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663827; x=1781268627; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t4HEItzpm7dN6Tv0gDxEgQOU0KnVbIDMpLbXa3nLFXM=;
 b=WCTaEJPVdwR/0cV2WFgIs9sBM8mRAu4ea0DfIAMlybGSOEstV/qXhsaUdpIeKhX4PY
 HC7GMH7pH2BES9h3if6340LhjYolnlw0fvN85+PgioUpBiZsEFhbXqDXtwMkIr4ukDX0
 rZLSq2vl+ITbe4qyvbZjnww5nuDzy2I3QMXn90fHMtzL714FGIborNFzXOsNk4NTtghx
 jFGWAzmAmtv1QSFcEyzudqAQq0oI+qRuuWpMU+J01ZG94LX9ET9k8COPOk4lmVbdNoxJ
 jDoFrl4gZRvfTvJAIYD5xceKm8EHyxrextZyUpiYo9qR88qKS0cfeTO78BEmmAjceI2G
 4Jjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WCTaEJPV
Subject: Re: [Buildroot] [PATCH v2] Revert "linux: disable -Werror"
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This reverts commit 6b56e0b4f09b36140e2cb9e41072d5ac6074f375.
> 
> commit 6b56e0b4f09b ("linux: disable -Werror") said we needed to disable
> CONFIG_WERROR in the kernel because it failed to build the esp-hosted
> kernel module. This was very much the hammer approach because a) it'd be
> better to fix the warnings in the kernel module or b) disable the
> kernel's CONFIG_WERROR *only* if esp-hosted is to be built, via the
> ESP_HOSTED_LINUX_CONFIG_FIXUPS variable in
> package/esp-hosted/esp-hosted.mk.
> 
> This is a simple revert without making any change to any kernel module
> (including esp-hosted) because all upstream Buildroot defconfigs with a
> kernel module enabled build fine today (albeit with warnings). The two
> defconfigs that were pointed at by the now-reverted commit all have been
> (updated for and) run on master without failing the build.
> 
> Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> I've rebuilt the kernel of all 307 upstream Buildroot defconfigs which
> selects the Linux kernel with:
> 
> for defconfig in $(git grep -l LINUX_KERNEL configs/); do
>   d=$(basename "$defconfig")
>   make O=build/$d $d | tee -a log.txt
>   make O=build/$d linux | tee -a log.txt || break
>   rm -rf build/$d
> done
> 
> and the loop didn't exit early and log.txt didn't contain any error: (or
> even warning: or ^^^ lines, which is surprising...).
> 
> I also built the kernel modules of the couple of upstream Buildroot
> defconfigs that build some modules, identified with:
> 
> for module in $(git grep -l --full-name kernel-module package/ | xargs basename -a | grep '.mk' | xargs basename -a -s .mk | sed 's/-/_/g' | tr '[:lower:]' '[:upper:]' | sed 's/\(.*\)/BR2_PACKAGE_\1/'); do
>         git grep $module configs
> done
> 
> which returns:
> configs/orangepi_lite_defconfig:BR2_PACKAGE_RTL8189FS=y
> configs/orangepi_pc_plus_defconfig:BR2_PACKAGE_RTL8189FS=y
> configs/mangopi_mq1rdw2_defconfig:BR2_PACKAGE_RTL8723DS=y
> configs/sipeed_lichee_rv_dock_defconfig:BR2_PACKAGE_RTL8723DS=y
> configs/sipeed_lichee_rv_dock_defconfig:BR2_PACKAGE_RTL8723DS_BT=y
> configs/orangepi_zero_defconfig:BR2_PACKAGE_XR819_XRADIO=y
> 
> and while there were warnings, they don't fail the build of the kernel
> module(s) for those defconfigs. No available updates for all kernel
> modules I built, as far as I could tell.
> ---
> Changes in v2:
> - changed implementation: simply revert commit 6b56e0b4f09b instead of
>   adding yet another Kconfig knob,
> - Link to v1: https://patch.msgid.link/20260325-linux-werror-v1-1-2b98ff2a2cdd@cherry.de
> ---
>  linux/linux.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c61089bfe0..79117275f7 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -474,7 +474,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
>  	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
> -	$(call KCONFIG_DISABLE_OPT,CONFIG_WERROR)
>  	$(PACKAGES_LINUX_CONFIG_FIXUPS)
>  endef
>  
> 
> ---
> base-commit: c8dd9e9a011f1a5755df62baceb865efc09862fe
> change-id: 20260325-linux-werror-9f6e4ad44b0f
> 
> Best regards,
> --  
> Quentin Schulz <quentin.schulz@cherry.de>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
