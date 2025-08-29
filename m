Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12628CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD3D9417E2;
	Fri, 29 Aug 2025 17:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hT4bgGhp1dCX; Fri, 29 Aug 2025 17:23:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D49AC417E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D49AC417E3;
	Fri, 29 Aug 2025 17:23:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F517D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 159FF417E3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmpsRZtJzF0y for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:23:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E3A0417E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E3A0417E2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E3A0417E2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:23:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F24BAB978475; Fri, 29 Aug 2025 19:23:11 +0200 (CEST)
Message-ID: <540122c2-746a-4f61-a2b8-8c046e3cff3d@rnout.be>
Date: Fri, 29 Aug 2025 19:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: ju.o@free.fr
References: <6e3994b190d42c3e8f45481e7f3438c9@free.fr>
 <20250828071402.175523-1-thomas@devoogdt.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250828071402.175523-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756488192; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=wJ5zLQvrTYXqwq3i6hZE1PUuGIWpK8VgNC9Dp9SigjE=;
 b=MsnKKsbAy1em585Ww/ua6ektZyPRIcv5oGCmuOuM6/t48DDwDmQrcFRSJYZa4NpJN1Dz5i
 GDrojyjluzdieg9ABwgqP83WLg3P4MDhQgy8wg0ax1/dKzy4CZuTGl9fQdyRz/qGWaSuSi
 BhTqdXd1onUYrJgYweRCTQUWzSjn7nbbnqvEiMCF3hFpG/v/drShu78zfTS8SimHli3PxM
 nttNgNTrsZLwm04+XU/PdhAaBG+BnXorl6MlZ6hTPkmQEf+TMPFH0BgTd6eAKMfi291lvs
 OTz8OhgbBugSoBQpmvzbRgXLtz7LdsEXnFCcKKKS60NKXA9iffRGrN2xwkjCKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MsnKKsbA
Subject: Re: [Buildroot] [PATCH next v2] package/lighttpd: bump to 1.4.81
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



On 28/08/2025 09:14, Thomas Devoogdt wrote:
> News:
> - https://www.lighttpd.net/2025/8/13/1.4.80/

  Contains:

detect and issue error trace for HTTP/2 MadeYouReset VU#767506 CVE-2025-8671

> - https://www.lighttpd.net/2025/8/17/1.4.81/

  Contains:

security: fix to reject disallowed trailers

  So I've marked this as a security bump and applied to master, thanks.

  Regards,
  Arnout

> 
> See Changes from 1.4.79:
> 
> [build] remove references to libev; no longer used
> 
> So drop here as well.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>   Config.in.legacy               | 8 ++++++++
>   package/lighttpd/Config.in     | 6 ------
>   package/lighttpd/lighttpd.hash | 8 ++++----
>   package/lighttpd/lighttpd.mk   | 9 +--------
>   4 files changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index efb59dc535..45b1807b9f 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -144,6 +144,14 @@ endif
>   
>   ###############################################################################
>   
> +comment "Legacy options removed in 2025.11"
> +
> +config BR2_PACKAGE_LIGHTTPD_LIBEV
> +	bool "lighttpd removed libev support"
> +	select BR2_LEGACY
> +	help
> +	  Lighttpd 1.4.80 removed optional libev support.
> +
>   comment "Legacy options removed in 2025.08"
>   
>   config BR2_PACKAGE_LIBCURL_BEARSSL
> diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
> index 1a9a9a277d..fe2c7a2815 100644
> --- a/package/lighttpd/Config.in
> +++ b/package/lighttpd/Config.in
> @@ -67,12 +67,6 @@ config BR2_PACKAGE_LIGHTTPD_LDAP
>   comment "ldap support needs a toolchain w/ wchar"
>   	depends on !BR2_USE_WCHAR
>   
> -config BR2_PACKAGE_LIGHTTPD_LIBEV
> -	bool "libev support"
> -	select BR2_PACKAGE_LIBEV
> -	help
> -	  Enable libev support for lighttpd fdevent handlers.
> -
>   config BR2_PACKAGE_LIGHTTPD_LUA
>   	bool "lua support"
>   	depends on BR2_PACKAGE_LUA
> diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
> index 4adbd08648..a23af84c28 100644
> --- a/package/lighttpd/lighttpd.hash
> +++ b/package/lighttpd/lighttpd.hash
> @@ -1,6 +1,6 @@
> -# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha512sum
> -sha512  e0f1bb2cfca5e81001ea30d13f088425dfc7acbec924ecddf438eb6326ab3158a61c6c4aaee0b68a90666d1cb987ce94b1f6a48afd92485cc995db5b58265f83  lighttpd-1.4.79.tar.xz
> -# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha256sum
> -sha256  3b29a625b3ad88702d1fea4f5f42bb7d87488f2e4efc977d7f185329ca6084bd  lighttpd-1.4.79.tar.xz
> +# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha512sum
> +sha512  10c24b1c1ce1aa1d826a426868223393eb81d7c0fbcc0b4f032b082a14593e0364228a5275e1440ed8782a2e78f0ded7cf72bc6642e5528bc82defcefab9301b  lighttpd-1.4.81.tar.xz
> +# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha256sum
> +sha256  d7d42c3fd2fd94b63c915aa7d18f4da3cac5937ddba33e909f81cf50842a5840  lighttpd-1.4.81.tar.xz
>   # Locally calculated
>   sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index 5337042340..71c860a31a 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIGHTTPD_VERSION_MAJOR = 1.4
> -LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).79
> +LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).81
>   LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
>   LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
>   LIGHTTPD_LICENSE = BSD-3-Clause
> @@ -76,13 +76,6 @@ else
>   LIGHTTPD_CONF_OPTS += -Dwith_ldap=disabled
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIGHTTPD_LIBEV),y)
> -LIGHTTPD_DEPENDENCIES += libev
> -LIGHTTPD_CONF_OPTS += -Dwith_libev=enabled
> -else
> -LIGHTTPD_CONF_OPTS += -Dwith_libev=disabled
> -endif
> -
>   ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
>   LIGHTTPD_DEPENDENCIES += lua
>   LIGHTTPD_CONF_OPTS += -Dwith_lua=true

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
