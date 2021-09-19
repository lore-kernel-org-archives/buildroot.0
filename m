Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E34C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:32:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5802160F50
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5802160F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B0AC40442;
	Sun, 19 Sep 2021 08:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ST-IixW8452K; Sun, 19 Sep 2021 08:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FEDE4043C;
	Sun, 19 Sep 2021 08:31:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E86861BF2AB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD01940182
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FSp88sBCaWQD for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 08:31:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53A7A400D1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 08:31:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4C4472003EE;
 Sun, 19 Sep 2021 10:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632040312;
 bh=lRmI49ezGPQDhH7B8Sx4lmRUsyp5FRUxb4agPBBtmHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ct+YvVDhlrR8oag7ndKZ4+n8zMIxKX9UzrDP6xAzZFx4AGLQRVOATXGXDw7mHrtDl
 ghA4inKq5T2Y/2xyPlcY9lltkp+VWMeCZTY1hqE6FoEA3L504epykLy0wHb3Bo2HKh
 B9+Faz6k9tOwsd30Fwte6DtaGrOFYKeKQHxiukq54QpgzsEMIYOXGHb/x62OnAjGat
 R4ye5Kqbp4QV9yBdXQDZdAqv2MRQyVNlqcJNk941/Iq/mz/SAZjuuFhCZxD2xcJucf
 PuN1U+8+I1rIQn6U2Swk0rC/ddCdVMiqHW2pu7Gy2ge5AGFO4OVrBhty6fH0tLEAnS
 vHTEzJsl9YQ4w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 10:31:46 +0200
Date: Sun, 19 Sep 2021 10:31:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210919083145.GK1053080@scaer>
References: <20210919081552.1415522-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919081552.1415522-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland-protocols: add wayland
 dependency
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-19 10:15 +0200, Fabrice Fontaine spake thusly:
> wayland is needed to avoid the following build failure raised since bump
> to version 1.23 in commit 7eedc9cc1e0c3cce1c18cb150157cb2346075b23:
> 
> Build-time dependency wayland-scanner found: NO (tried pkgconfig and cmake)
> 
> ../output-1/build/wayland-protocols-1.23/meson.build:11:0: ERROR: Dependency "wayland-scanner" not found, tried pkgconfig and cmake

I guess what it really needs, in fact, is just host-wayland, which
provides wayland-scanner, no?

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/2744e50465a9cd9d3726d23298ad6c943ef49a21
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wayland-protocols/wayland-protocols.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
> index 41ab1e1c99..845b7e0d5e 100644
> --- a/package/wayland-protocols/wayland-protocols.mk
> +++ b/package/wayland-protocols/wayland-protocols.mk
> @@ -11,6 +11,7 @@ WAYLAND_PROTOCOLS_LICENSE = MIT
>  WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
>  WAYLAND_PROTOCOLS_INSTALL_STAGING = YES
>  WAYLAND_PROTOCOLS_INSTALL_TARGET = NO
> +WAYLAND_PROTOCOLS_DEPENDENCIES = wayland
>  
>  WAYLAND_PROTOCOLS_CONF_OPTS = -Dtests=false
>  
> -- 
> 2.33.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
