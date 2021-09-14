Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D034C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:54:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1F26112D
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB1F26112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71E3F400A4;
	Tue, 14 Sep 2021 19:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dPDaU4AljxE; Tue, 14 Sep 2021 19:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FB3C4039B;
	Tue, 14 Sep 2021 19:54:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7D5F1BF228
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A47B580E43
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-A3L360YcSY for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 19:54:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9745B80E3F
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 19:54:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:31d8:df7a:786c:e8e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 01C3619F5A7;
 Tue, 14 Sep 2021 21:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631649275;
 bh=n19ufxQ1ShbxxxPtItyBYQ5ne9k9GYzVPSGfix2aRys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jbk4yjKwJNx9von2+OgRTO8epcZo1s+DjD7SjJZjGTqgyERBLHeAqV3uxvF4hFy8E
 O4/L4wC+4soI+Pv/kt+Y4OnjqtaqSBSQ8JGZPNeB8q9rkmg54wEgegTihW0Af172zV
 f3llWz0djvnt7tLnFNcYh0ZvIUcvU2YNRN+bZCUNp8/keEmPE7K65y/57K8TN3S5BT
 MVnPn5HD2Xs8D0QtycEb1d53BP3ysrIIjgXSEy2Xcxg1712tQvK6+DbCrZunL9EV0R
 XId5LLJa6TereGI1Q6uyswwJAa6zj8LHHFps40EUUQE38r1MicYVPmedRoemO3ktJU
 dGwz1NAoMfHzw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 14 Sep 2021 21:54:28 +0200
Date: Tue, 14 Sep 2021 21:54:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210914195428.GR1053080@scaer>
References: <20210914161731.45958-1-fontaine.fabrice@gmail.com>
 <20210914161731.45958-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914161731.45958-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/x11r7/xapp_xeyes: add
 xlib_libXi mandatory dependency
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-14 18:17 +0200, Fabrice Fontaine spake thusly:
> Build fails since commit c47ebe7aeb70015614ff1d477dc1a71e8c161425
> because xlib_libXi is a mandatory dependency since version 1.2.0 and
> https://gitlab.freedesktop.org/xorg/app/xeyes/-/commit/420c2d8517246c9e422739cadb7acb29e35a3bed:
> 
> configure: error: Package requirements (xi >= 1.7 x11 xt xext xmu xproto >= 7.0.17) were not met:
> 
> Package 'xi', required by 'virtual:world', not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/896f45fb9eadcd235aeab096db479ee0aa5d0860
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/x11r7/xapp_xeyes/Config.in     | 1 +
>  package/x11r7/xapp_xeyes/xapp_xeyes.mk | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xapp_xeyes/Config.in b/package/x11r7/xapp_xeyes/Config.in
> index a7b77375fd..268bc5807e 100644
> --- a/package/x11r7/xapp_xeyes/Config.in
> +++ b/package/x11r7/xapp_xeyes/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_XAPP_XEYES
>  	bool "xeyes"
>  	select BR2_PACKAGE_XLIB_LIBX11
>  	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XLIB_LIBXI
>  	select BR2_PACKAGE_XLIB_LIBXMU
>  	select BR2_PACKAGE_XLIB_LIBXT
>  	help
> diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
> index a127e28ea7..68df8c9ab0 100644
> --- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
> +++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
> @@ -9,7 +9,8 @@ XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
>  XAPP_XEYES_SITE = https://xorg.freedesktop.org/archive/individual/app
>  XAPP_XEYES_LICENSE = MIT
>  XAPP_XEYES_LICENSE_FILES = COPYING
> -XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
> +XAPP_XEYES_DEPENDENCIES = \
> +	xlib_libX11 xlib_libXext xlib_libXi xlib_libXmu xlib_libXt

When a list does not fit on a single line, I prefer that each item is on
their own line:
    XAPP_XEYES_DEPENDENCIES = \
        xlib_libX11 \
        xlib_libXext \
        xlib_libXi \
        xlib_libXmu \
        xlib_libXt

Applied to master with the above change, thanks.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
>  XAPP_XEYES_DEPENDENCIES += xlib_libXrender
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
