Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D0FC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 18:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43A3840B91;
	Fri, 17 May 2024 18:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnJ-rduwXB_i; Fri, 17 May 2024 18:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36E7840275
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36E7840275;
	Fri, 17 May 2024 18:35:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5BD31BF312
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 18:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B001F6069F
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 18:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKJonkVKlQGy for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 18:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6190D6063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6190D6063F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6190D6063F
 for <buildroot@buildroot.org>; Fri, 17 May 2024 18:35:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AAAA413F86A;
 Fri, 17 May 2024 20:35:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 20:35:38 +0200
Date: Fri, 17 May 2024 20:35:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZkejevC_Jkanjo06@landeda>
References: <20240517173140.24531-1-jarkko@kernel.org>
 <20240517173140.24531-2-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517173140.24531-2-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715970941;
 bh=pYREyjkHg8fw5FhHAAPbXeJlVRWOQUwss+Lk8jPRlvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=av8awujB8dkKqxcEdFINAsSdFqPt6FHfyCJdt8PNeSCmIsNLo3Ga2q5qz5HaVdpmq
 T13eCOWHQUsMUp8YAe29jVPr1vD5moJqJMklILPhxT3epYz8EymW0ZN7myqLJRbHO4
 TJDAth7EQcCxdcZ7bQzVta9+k1qTzXMSNmySG0efMpeEiJ6ZST18bRlxs4bAPV+FKs
 lMJ7aHJOBT7XpqotUoB/j1vy/tFHfZC32r/1Orx9GmVetdd2i/k1N/cnKbRaYQwMOw
 dyXaUZCZ9JozcOrPZtCOzc2wecKVpiS/TSQ27hkYs95oABDc2t3DsGrLCC9qX+2wZo
 V3iJtVZ1GEQ3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=av8awujB
Subject: Re: [Buildroot] [PATCH v2 1/3] package/json-glib: add host build
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jarkko, All,

On 2024-05-17 20:31 +0300, Jarkko Sakkinen spake thusly:
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
> v2:
> - Disable GOI and NLS for the host.

I think your forgot the GOI part [0]...

> - Add the missing host config.

Err, I was probably not explicit enough in my previous review: there is
no need for a Kconfig option for host packages, when they only provide a
library.

Also see below...

> ---
>  package/json-glib/Config.in    | 9 +++++++++
>  package/json-glib/json-glib.mk | 5 +++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/json-glib/Config.in b/package/json-glib/Config.in
> index 9df03d924a..ebf697bc64 100644
> --- a/package/json-glib/Config.in
> +++ b/package/json-glib/Config.in
> @@ -11,6 +11,15 @@ config BR2_PACKAGE_JSON_GLIB
> 
>  	  https://live.gnome.org/JsonGlib/
> 
> +config BR2_HOST_PACKAGE_JSON_GLIB

The actual Kconfig symbol should be BR2_PACKAGE_HOST_JSON_GLIB (note the
inversion between PACKAGE and HOST). You can catch such mis-naming by
running the basic sanity checks:

    $ ./utils/docker-run make check-package
    package/json-glib/Config.in:14: BR2_HOST_PACKAGE_JSON_GLIB defined but not referenced

Also, Kconfig entries for host packages should be in a separate
Config.in.host.

But in this case, there is no need for a Kconfig symbol, because
json-glib only provides a library, so you only need the changes in
json-glib.mk.

> +	bool "json-glib"
> +	help
> +	  JSON-GLib is a library providing serialization and
> +	  deserialization support for the JavaScript Object Notation
> +	  (JSON) format described by RFC 4627.
> +
> +	  https://live.gnome.org/JsonGlib/
> +
>  comment "json-glib needs a toolchain w/ wchar, threads"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
> index cd53f24cee..a6bc53b823 100644
> --- a/package/json-glib/json-glib.mk
> +++ b/package/json-glib/json-glib.mk
> @@ -18,6 +18,10 @@ JSON_GLIB_DEPENDENCIES = \
>  	host-pkgconf \
>  	libglib2
> 
> +HOST_JSON_GLIB_DEPENDENCIES = \
> +	host-pkgconf \
> +	host-libglib2

...[0] I think you forgot:

    HOST_JSON_GLIB_CONF_OPTS = -Dintrospection=diabled

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
>  JSON_GLIB_DEPENDENCIES += gobject-introspection
> @@ -34,3 +38,4 @@ endif
>  JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> 
>  $(eval $(meson-package))
> +$(eval $(host-meson-package))
> --
> 2.45.0
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
