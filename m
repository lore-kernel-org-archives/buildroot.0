Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC07EC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 14:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A06D140572;
	Fri, 31 May 2024 14:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piVfEqUOJYeu; Fri, 31 May 2024 14:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D9240B67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D9240B67;
	Fri, 31 May 2024 14:03:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 614B01D5390
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 14:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B27840B67
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 14:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFyfjSl4cGFx for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 14:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B5A040572
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B5A040572
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B5A040572
 for <buildroot@buildroot.org>; Fri, 31 May 2024 14:03:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 042FC13F8D5;
 Fri, 31 May 2024 16:03:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 May 2024 16:03:10 +0200
Date: Fri, 31 May 2024 16:03:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-ID: <ZlnYnjOZ26-UO7xb@landeda>
References: <20240531031938.19992-2-wilfred.mallawa@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531031938.19992-2-wilfred.mallawa@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717164194;
 bh=vlPE5Iex/32gB2AUX/MHZfF+u1wJlnFCmbzQKJIlRes=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VHZooUHZ6YcoE7kdxohtGlfI+nHBdEgJhlWMrqIavWrZ8PCvIPzLycUnAH/jfHZfT
 G7HvOkQ3GJGAMn3ICBvrKsf/vkgyIupvAXckihBPWyQ9Q4s3btDmYbO6pwYX9Tp7ab
 NWoLAWTYuDu4Cw60vlfFRTjDKNJxbzByy7U4aDu3ZsPdSDiU5CzKk4JDELQjGwAYqg
 03VZoiyJUYiG//GWe9+0wvif+u8Gq3mcIZMPlbi/jLt85akRs3oDgwKfDh7bBIsWl5
 pZfSDbwnCYNyf8MEdopwNEVR+4wHtVfdMl7TJNvwMVK1HMOxiwb6ubyrlRMbyRek6i
 1xaQxmCNogfwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VHZooUHZ
Subject: Re: [Buildroot] [PATCH 1/1] package/libspdm: bump version to 3.3.0
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
Cc: Alistair Francis <alistair@alistair23.me>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Wilfred, All,

On 2024-05-31 13:19 +1000, Wilfred Mallawa via buildroot spake thusly:
> Add pending upstream patch that fixes the incorrect parsing of
> certificates with `id-DMTF-hardware-identity OID` tags.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
[--SNIP--]
> diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
> index 2ec35be0ac..341a98ebf5 100644
> --- a/package/libspdm/libspdm.mk
> +++ b/package/libspdm/libspdm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBSPDM_VERSION = 3.2.0
> +LIBSPDM_VERSION = 3.3.0
>  LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
>  LIBSPDM_LICENSE = BSD-3-Clause
>  LIBSPDM_LICENSE_FILES = LICENSE.md
> @@ -27,7 +27,9 @@ LIBSPDM_CONF_OPTS = \
>  	-DCOMPILED_LIBSSL_PATH=/usr/lib/ \
>  	-DDISABLE_TESTS=1 \
>  	-DDISABLE_EDDSA=1 \
> -	-DLINK_FLAGS=$(STAGING_DIR)
> +	-DDISABLE_LTO=1 \
> +	-DLINK_FLAGS=$(STAGING_DIR) \
> +	-DCMAKE_C_FLAGS="-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0" ..

Why do you have to explicitly disable LTO?

Can you also explain in a few words what that new optoin
LIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 means?

Regards,
Yann E. MORIN.

>  define LIBSPDM_INSTALL_STAGING_CMDS
>  	mkdir -p $(STAGING_DIR)/usr/lib
> -- 
> 2.45.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
