Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BD6C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 10:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B65A94056A;
	Sat,  5 Nov 2022 10:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B65A94056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12cvUt8VVN4H; Sat,  5 Nov 2022 10:44:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9141A404EB;
	Sat,  5 Nov 2022 10:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9141A404EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 216291BF330
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 10:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE06E418F0
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 10:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE06E418F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kPJW3bPtcqtZ for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 10:44:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73DB5418E5
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73DB5418E5
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 10:44:44 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id z18so10890370edb.9
 for <buildroot@buildroot.org>; Sat, 05 Nov 2022 03:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lUp9eBIIc4O/q5JeTMyJlxElEeacKf2sOIr1nIYAC0o=;
 b=mj3cGo9AvQal9klvMYCIkFI3+1+EfoM2LWz1ApiTdGb/Z9UJVT4ZrQrGQ3nv4Jk0Hs
 UskAn5plsbroNLXThle6z4Mwdzhk0j10KP3yxy7G7VyVSGb0xLXhVLDLFWTwv2EKT/hw
 aRWY+JIJrq9u0JCf6qY3tLoWGPhPBFMsouOKjPgnOpb97uNDBcSClLuPJk0fqHC1PpVM
 OmL3rnlSSS6mb3gd9IwFDD6RUpPd0hcVwDQMeSiSu3wuoFtIgcAJWb/TlVvhnJnrlpQY
 Qh1o6gFJLavbftpkX+d+idGTxvjKSEvYZimyc7U1mqzEp7ViKq6YkdX/Nic0zfecZ8Cq
 kWPQ==
X-Gm-Message-State: ACrzQf1s0sSxifoqQQHS/tWOmEqmpJ5QH1WbkvBlh3Nf3x8+R3Xl8qJN
 1MjCcYgpp9LIDt3DRiis7Ko=
X-Google-Smtp-Source: AMsMyM4ZAqc1UCIwk0UU1vo60OTWxO7Q1U1fcDEZ/mcOVgwZYh3XLiECXuIKZdqN3N6uNvr5Rk1ljQ==
X-Received: by 2002:a05:6402:616:b0:463:e2cd:a88d with SMTP id
 n22-20020a056402061600b00463e2cda88dmr20080280edv.400.1667645082403; 
 Sat, 05 Nov 2022 03:44:42 -0700 (PDT)
Received: from localhost (tmo-098-248.customers.d1-online.com. [80.187.98.248])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05640212d200b0044ef2ac2650sm953890edx.90.2022.11.05.03.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 03:44:41 -0700 (PDT)
Date: Sat, 5 Nov 2022 11:44:33 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: unixmania@gmail.com
Message-ID: <20221105114433.2a5e6b09@tuxfamily.org>
In-Reply-To: <20221104235727.587650-3-unixmania@gmail.com>
References: <20221104235727.587650-1-unixmania@gmail.com>
 <20221104235727.587650-3-unixmania@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/qemu: select FDT for custom
 targets too
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Fri,  4 Nov 2022 20:57:26 -0300
schrieb unixmania@gmail.com:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Custom targets selects system and Linux user-land emulation, which in
> their turn require FDT. Move the BR2_PACKAGE_QEMU_FDT selection to the
> BR2_PACKAGE_QEMU_HAS_EMULS hidden boolean, to cover all cases.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/qemu/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 8b8a999885..9e0cbd4acf 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -95,7 +95,6 @@ comment "... or you can select emulator families to enable, below:"
>  config BR2_PACKAGE_QEMU_SYSTEM
>  	bool "Enable all systems emulation"
>  	depends on !BR2_STATIC_LIBS # dtc
> -	select BR2_PACKAGE_QEMU_FDT
>  	help
>  	  Say 'y' to build all system emulators/virtualisers that QEMU
>  	  supports.
> @@ -121,6 +120,7 @@ endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
>  config BR2_PACKAGE_QEMU_HAS_EMULS
>  	def_bool y
>  	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
> +	select BR2_PACKAGE_QEMU_FDT

Technically, I think you don't need FDT if you are only compiling the
linux-user targets ... so maybe it would be better to add this to the
BR2_PACKAGE_QEMU_CUSTOM_TARGETS switch instead?

 Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
