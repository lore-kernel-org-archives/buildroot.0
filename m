Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A271C25B79
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 13:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C4F8126D;
	Fri, 17 May 2024 13:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ra3qvWK4caFd; Fri, 17 May 2024 13:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D3AA810AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D3AA810AC;
	Fri, 17 May 2024 13:39:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2994F1BF3F0
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 163CC60679
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-63W3kyomPz for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 13:39:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 629656060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 629656060E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 629656060E
 for <buildroot@buildroot.org>; Fri, 17 May 2024 13:39:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 74F1713F8C0;
 Fri, 17 May 2024 15:39:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 15:39:00 +0200
Date: Fri, 17 May 2024 15:39:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <Zkdd9AYOR-flnKmX@landeda>
References: <20240517132039.7124-1-jarkko@kernel.org>
 <20240517132039.7124-3-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517132039.7124-3-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715953144;
 bh=UJA2yqvRXSMmYK9FEovsf6Sc6pfpGpNnUL+u8BmGi+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iBpOFyY/DmiZ5u9/K3ZyQxLfP31iLwaNM5K8Tvn6ku6aeYEDQmAkanVyrdRztyVlX
 UYHVsrkmj2dxL1KQ2j+bhqQRUsZBKxM4Q1tS0r5SfS09PPwgq2Qr9fHMf49KAMw8OJ
 UW7XjWMICO2dZS2XsHAnGWjif9YRFUJODySU8sjGaCcnn0S8oOo9BemxggE4Dm8/hg
 a/LRb3AEowR6FvYw7OraS+3Cc5WlGLxepq5s0e4bIZDXKmu7rlNDyZdhlsmlWNvsNM
 LCn4W86lrtnrrcuyNo/QXvVGjcChj51tyV24jA6iMFmIYiYEhoRrnc2E8YIBWN+/oW
 dnco40veQ0J1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iBpOFyY/
Subject: Re: [Buildroot] [PATCH 2/4] package/json-glib: add host build
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

Thanks for these patches; please find comments below.

On 2024-05-17 16:20 +0300, Jarkko Sakkinen spake thusly:
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
>  package/json-glib/json-glib.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
> index cd53f24cee..ffdc76f2c1 100644
> --- a/package/json-glib/json-glib.mk
> +++ b/package/json-glib/json-glib.mk
> @@ -18,19 +18,31 @@ JSON_GLIB_DEPENDENCIES = \
>  	host-pkgconf \
>  	libglib2
>  
> +HOST_JSON_GLIB_DEPENDENCIES = \
> +	$(HOST_NLS_DEPENDENCIES) \
> +	host-pkgconf \
> +	host-libglib2
> +
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
>  JSON_GLIB_DEPENDENCIES += gobject-introspection
> +HOST_JSON_GLIB_CONF_OPTS += -Dintrospection=enabled

BR2_PACKAGE_GOBJECT_INTROSPECTION (the condition for this block) is a
target setting, so it semantically does not make sense to protect the
host variant with that condition.

Usually, for host variants, we do not have conditional compilation of
features; either the feature is needed to run on the host, in which case
we always enable it, or it is not needed, in which case we always
disable it.

The only case where we would have such an option for such a feature,
is when the feature needs a lot of dependencies, or time-consuming
dependencies (e.g. needs LLVM!). GOI is probably a good reasong to
add such an option, *iff* introspection is needed on the host, which I
doubt is.

> +HOST_JSON_GLIB_DEPENDENCIES += gobject-introspection

Here, you instruct a host variant to depend on a target variant, which
is usually not what you intended. And indeed, I believe here you'd need
a dependency on host-gobject-introspection. I guess it worked ion your
case, because gobject-introspection has a dependency on
host-gobject-introspection, so that pulled it in for you. Still, this is
probably not correct.

So, my proposal would be to always disable GOI unconditionally in the
host variant, unless there are cases where it is required, in which case
we always enable it.

Unless there is actually a reason that the host variant has the same
feature set as the target variant, in which case it should be explained
in the commit log.

>  else
>  JSON_GLIB_CONF_OPTS += -Dintrospection=disabled
> +HOST_JSON_GLIB_CONF_OPTS += -Dintrospection=disabled
>  endif
>  
>  ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
>  JSON_GLIB_CONF_OPTS += -Dnls=enabled
> +HOST_JSON_GLIB_CONF_OPTS += -Dnls=enabled
>  else
>  JSON_GLIB_CONF_OPTS += -Dnls=disabled
> +HOST_JSON_GLIB_CONF_OPTS += -Dnls=disabled
>  endif

Ditto: the BR2_SYSTEM_ENABLE_NLS option drives NLS support for the
target, not for the host. For the host, we assume it is never needed,
and it is already forcefully disabled in the autotools-package infra:
    https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/pkg-autotools.mk#L196

>  JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> +HOST_JSON_GLIB_LDFLAGS = $(HOST_LDFLAGS) $(HOST_NLS_LIBS)

HOST_NLS_LIBS is never defined anywhere, so this is basically a noop.
;-)

Regards,
Yann E. MORIN.

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
