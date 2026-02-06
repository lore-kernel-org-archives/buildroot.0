Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDD0EB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E801C61278;
	Fri,  6 Feb 2026 08:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nYTxIjJ33Aw; Fri,  6 Feb 2026 08:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44C7A61294
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365546;
	bh=XtrUGkU5SwxnfRihDcVLE8XuPnhB13ijlC+Gpmsd5wI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DPRiV/T4Os0cooarVbrYUeqjwFAC8T77jhI2GV12Mn6RAFOLtFZ0mZq4EEaBC+zpa
	 MORwLDZwkejyzvrl3hqGDYI+jN33Pzi6E5OVWszMRCpBB9EQgMBZHVihYITpvqgYRH
	 SikNs2ekLn8Gxwa1oc8rwIgDmQhF8Qq2szICDX9JXgk4hPbF7EboBo4Ju2M/iq0lkN
	 AtHXX72VG05iebPWlieOE5KJtWdX5Cjb25tkRQI9y2c9mX6g44F7ntcjTIJ/1MUewO
	 uWIbpowgt4nZ1Rxfai9hU7E9jrHSpJIQWPFrwC/PFHteiWaXGTRp2BtZVpeYSnB5LL
	 n5wdLqI7NRBJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44C7A61294;
	Fri,  6 Feb 2026 08:12:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09BD6378
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA6176123E
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdaI5zsOF_PE for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 854466122C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 854466122C
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 854466122C
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:09 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so17078005e9.0
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365527; x=1770970327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qEdLUcJYysaQ7nRrjiMxO7rYtWnLS6bh2/Odi5uR6pY=;
 b=BE/0DIHf4o2NMimUUef15hqoSigX21h7Wd+o+4BDHqgpbMGfGG1hk2jkRRs01JQ6SV
 GcQMO4KB5Bitzp2uZs6+8C6/hgoZv/XCylNeNV4OSIS/VTTjozFpMxTnfq0jkStnBm6J
 fBI+2aG3kHzCWknjnxGj4gnle16Sl+cT/ZhxMq6Y+4TCmrJu4njwA0s42XgLY29GZEcT
 fZ7tjq3mojsffUN2tuWD0tj7nTe9x5kKUEN4sscuuas8gDKtkbJQChGqNsRAzvbWI81Y
 Qm8CeGZSuDWsbqBmAaxgDmECZpmhRVDBKpOE8hRbES1P4/COUgSnAoIwWE6FDYNG8l16
 CbzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2vxEv4bzOAlp/wUF5Et8n8RNstBuHPYiRrD40ka0S2Y3DQw6kBlZHPCMbsDp+OuF6oej6oIbY0M0=@buildroot.org
X-Gm-Message-State: AOJu0YxvN9OWlU0nYOIEJguiQo+xvDCnrUfmKhHLg1bjG2fBiz6P5yXU
 8eJAosmnPgwoivqqW85VQixchEMRz/pIxGP5uZmb2VDHaP2L/8NDjH9VGsdAomq/EGkUqx84N7g
 5/QJDvMk=
X-Gm-Gg: AZuq6aLAAOew94T79ztmfYtiMK72MhpK15IggtWbydSuJT5qDQdJEPGu6i3Yy+fsoG4
 4sqtl5naTZE/5uNljRdWniVnfYkqV+3PVeiEiBlV8TGI2TQR8UBM7i0YqA4pK28p2VwJn3TxMBH
 EsvSyvAU1TGWHFlyH/UwqnEJidEYMP2mdqRB1OfKFTnPBPfqoj/g/CYYn4L/Vm6dNjo8fBUyOUa
 FlhietkLg79e/BMDnxV27sCxygyUY7DhL4BYbUJ8xybOuCScwdLEDlqnLR62K5x+NJW8Z3eRO7E
 2t+OCdFxoVXWUmymgYvQFD/AXUJ1GTrxzYrkZprkSQwDh+pSdIEQGkSlcgwF58+mb1/2GGpCFUZ
 YWZtROP2ZaWPp9lHFiWHB6KqZthf3rgCwUyf5NfLErDi9Q47XXCf4vmYykUJRExO6Ha6ZGFF2nj
 jyRBI=
X-Received: by 2002:a05:600c:810c:b0:47e:e59c:67c5 with SMTP id
 5b1f17b1804b1-483203ab857mr30353845e9.8.1770365527470; 
 Fri, 06 Feb 2026 00:12:07 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d7a924sm166174735e9.10.2026.02.06.00.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:07 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:06 +0100
Message-ID: <20260206081206.33141-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127163528.283380-2-peter@korsgaard.com>
References: <20260127163528.283380-2-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365527; x=1770970327; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qEdLUcJYysaQ7nRrjiMxO7rYtWnLS6bh2/Odi5uR6pY=;
 b=h3hgv1ni0GOfl4iJzQtE7SYA6bbPjGK+gLKILUXlUl0s1MeUEtfYeq5KGoV2zloaJ+
 +Bm6Gw/bPGGuF3X6SjTSXS/K2tZAHgNGYCmdO+7IDR9lzDgMkEFcxAL2mDFtK7LwvppC
 6eztgmIH2uu4jRYGwT7lpbTWpownau7PxGf0Lgd1rM/AOGqI3MRzFA8ycbNUGEgGTOC9
 +9T7cSoJqfsM06vAv++q/FyecaTzcs3tyZ4xKSbiYr7I6utIGZnvF0V5l0YVLF5p8x08
 ZaFvF4uFcOIHcBuhL1vYp0qdPsWhI6D+8usjsfegl4CyWYSjtqxobGg/NNCXiVEG+f1W
 b60Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=h3hgv1ni
Subject: Re: [Buildroot] [PATCH 2/2] package/busybox: default to
 BR2_TARGET_GENERIC_PASSWD_* algo
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
> Make busybox follow the BR2_TARGET_GENERIC_PASSWD_* system configuration
> option, E.G.
> 
> cat defconfig
> BR2_x86_core2=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE=y
> BR2_STATIC_LIBS=y
> BR2_TARGET_GENERIC_PASSWD_SHA512=y
> 
> ./target/usr/bin/mkpasswd --help
> BusyBox v1.37.0 (2026-01-27 17:31:51 CET) multi-call binary.
> 
> Usage: mkpasswd [-P FD] [-m TYPE] [-S SALT] [PASSWORD] [SALT]
> 
> Print crypt(3) hashed PASSWORD
> 
>         -P N    Read password from fd N
>         -m TYPE des,md5,sha256/512 (default sha512)
>         -S SALT
> 
> ./target/usr/bin/mkpasswd test
> $6$VQ6lDdGRJOgs8Exs$gEWp1nN/FHCAgmoB6lD.fN13EKA40yV7WQmZJcFp114VrL/st74zP5iPsLHi5NFX/A6GAa1gD.yqzp5Lz3DKl/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/busybox/busybox.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index d7eda71db6..446f93c36c 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -176,6 +176,18 @@ define BUSYBOX_SET_CRYPT_SHA
>  endef
>  endif
>  
> +ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256),y)
> +define BUSYBOX_SET_DEFAULT_PASSWD_ALGO
> +	$(call KCONFIG_SET_OPT,CONFIG_FEATURE_DEFAULT_PASSWD_ALGO,"sha256")
> +endef
> +endif
> +
> +ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
> +define BUSYBOX_SET_DEFAULT_PASSWD_ALGO
> +	$(call KCONFIG_SET_OPT,CONFIG_FEATURE_DEFAULT_PASSWD_ALGO,"sha512")
> +endef
> +endif
> +
>  ifeq ($(BR2_USE_MMU),y)
>  define BUSYBOX_SET_MMU
>  	$(call KCONFIG_DISABLE_OPT,CONFIG_NOMMU)
> @@ -427,6 +439,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
>  	$(BUSYBOX_SET_MDEV)
>  	$(BUSYBOX_SET_CRYPT_SHA)
>  	$(BUSYBOX_LINUX_PAM)
> +	$(BUSYBOX_SET_DEFAULT_PASSWD_ALGO)
>  	$(BUSYBOX_SET_INIT)
>  	$(BUSYBOX_SET_WATCHDOG)
>  	$(BUSYBOX_SET_SELINUX)
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
