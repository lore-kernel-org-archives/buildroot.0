Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E587DCAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5481425E7;
	Thu, 11 Sep 2025 20:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIHPz0fdNxLc; Thu, 11 Sep 2025 20:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF5B542604
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF5B542604;
	Thu, 11 Sep 2025 20:12:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 478AA234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DFD484C05
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPnTdck8xdmO for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24FD184C04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24FD184C04
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24FD184C04
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:12:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3429EB978576; Thu, 11 Sep 2025 22:12:39 +0200 (CEST)
Message-ID: <37150cd9-735d-473f-8175-51ee2fcb884b@rnout.be>
Date: Thu, 11 Sep 2025 22:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-16-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-16-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757621559; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=GJ5Dr6kdiiP1SZ6OqecUWowDiTGucwPU2+mvoxRD//I=;
 b=orYL63j4iH80VnoEc674nzPMPJ5PnZxzh/xylBBLmPiXu+3e54Nn5k6tEQuBBhogDmROm2
 LGOfLJxlisiFz8PW4SbvG0FxYpqlGwvReNQwA7KQFl0WlYIPm4wnnDyJ7ntpieyx0EqVud
 4aO5WxITxQNJCjNBelpHKiCpr4+J4WrftkZuaShUztrv00UEnhSn4t+jE7yRuhsbgmIdfF
 mIZUXQTfaiaeSCQ1PeE2kAQ+zTnKTdihx0wGl3xG6jZftqMDkMjcbba9B0PQabqHGFUwmH
 lX7xi71Qs4SyqMChf1ciGRjsk5w9fRsrbctqu0x+02yIujA4xHG/VznbWomGGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=orYL63j4
Subject: Re: [Buildroot] [PATCH 15/23] package/netsurf: drop support for gtk
 backend
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> As we're about to remove the libgtk2 package, let's drop the gtk
> backend from netsurf. It is worth mentioning that the gtk3 backend
> remains in place as an alternative.

  It's a frontend, not a backend :-)

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   Config.in.legacy           | 8 ++++++++
>   package/netsurf/Config.in  | 6 ------
>   package/netsurf/netsurf.mk | 7 -------
>   3 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 5c3b289688..e1fe008cf5 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,14 @@ endif
>   
>   comment "Legacy options removed in 2025.11"
>   
> +config BR2_PACKAGE_NETSURF_GTK
> +	bool "gtk backend of netsurf has been removed"
> +	select BR2_LEGACY
> +	help
> +	  Due to the removal of libgtk2, the gtk backend of netsurf
> +	  has been removed. The gtk3 backend can be used instead for
> +	  example.

  Here as well.

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

> +
>   config BR2_PACKAGE_METACITY
>   	bool "metacity has been removed"
>   	select BR2_LEGACY
> diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
> index 394befcf28..dd37d876f6 100644
> --- a/package/netsurf/Config.in
> +++ b/package/netsurf/Config.in
> @@ -40,12 +40,6 @@ config BR2_PACKAGE_NETSURF_SDL
>   	help
>   	  Select SDL 1.2 frontend.
>   
> -config BR2_PACKAGE_NETSURF_GTK
> -	bool "gtk2 frontend"
> -	depends on BR2_PACKAGE_LIBGTK2
> -	help
> -	  Select GTK+ 2 frontend.
> -
>   config BR2_PACKAGE_NETSURF_GTK3
>   	bool "gtk3 frontend"
>   	depends on BR2_PACKAGE_LIBGTK3
> diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
> index 574c1423df..383cd8ab9d 100644
> --- a/package/netsurf/netsurf.mk
> +++ b/package/netsurf/netsurf.mk
> @@ -25,17 +25,10 @@ define NETSURF_DUKTAPE_CONFIGURE_CMDS
>   endef
>   endif
>   
> -ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
> -NETSURF_DEPENDENCIES += libgtk2
> -NETSURF_FRONTEND = gtk2
> -endif
> -
>   ifeq ($(BR2_PACKAGE_NETSURF_GTK3),y)
>   NETSURF_DEPENDENCIES += libgtk3
>   NETSURF_FRONTEND = gtk3
> -endif
>   
> -ifeq ($(BR2_PACKAGE_NETSURF_GTK)$(BR2_PACKAGE_NETSURF_GTK3),y)
>   ifeq ($(BR2_PACKAGE_LIBRSVG),y)
>   NETSURF_DEPENDENCIES += librsvg
>   define NETSURF_SVG_CONFIGURE_CMDS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
