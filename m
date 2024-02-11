Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1930C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACD4A404C3;
	Sun, 11 Feb 2024 17:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uYm2twxvXTN; Sun, 11 Feb 2024 17:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3245640492
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3245640492;
	Sun, 11 Feb 2024 17:05:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3FC31BF4D5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 908B140492
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0vHDIFY5mRv for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DE1140486
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DE1140486
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DE1140486
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:05:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5B37013F86E;
 Sun, 11 Feb 2024 18:05:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 18:05:27 +0100
Date: Sun, 11 Feb 2024 18:05:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zcj-V7kLJe3iEBkj@landeda>
References: <20240211161219.453635-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240211161219.453635-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707671129;
 bh=j4+lhiIaJLNWLNVimlaY8uqu9uCLs5Is9UqRZeMb4j8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qkSvPqOI5eIgfKcEX5mR1dCA9HNbi5WysdThwngyEoW8AS1PhZw7gY8iRMoHArpbg
 Ub8eUj6X1MOydHewXEIqjn2AlDcDE/YRPiVvNEYy409cc0MUafByxip1xUmi9XZC3f
 Y0KMC4UWEFBHBL6OiMMMOTrUsRhmdbet8Q9JfujpZtfxeuBp+rvDYPUxmZOJpnN4jS
 bHV8r5cIxqsXM8dP28lXxMwMdIdKdM6DqAUbVmvnxvXoElsLsWV2skhdQVmBg6TjL/
 deMwn9npMYKqyIeuSq3hPW/8sPILUmhI/SH8xksna9J3XAEH1On8QsBOtxzjA2MVWS
 Ip19aWHJ2VJaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qkSvPqOI
Subject: Re: [Buildroot] [PATCH 1/1] package/libdnet: replace
 PKG_PYTHON_DISTUTILS_ENV
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-11 17:12 +0100, Fabrice Fontaine spake thusly:
> Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV as libdnet
> uses setuptools instead of distutils since version 1.16.2 and
> https://github.com/ofalk/libdnet/commit/4e4fc687953105b66bcc847a68869126ac3ec918
> 
> This will avoid the following build failure raised since commit
> 09de823cbc7bd50a40e25f4166b4e42be94b0c7b:
> 
> In file included from /home/fabrice/buildroot/output/per-package/libdnet/host/include/python3.12/Python.h:38,
>                  from ./dnet.c:40:
> /home/fabrice/buildroot/output/per-package/libdnet/host/include/python3.12/pyport.h:586:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>   586 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>       |  ^~~~~
> 
> Fixes:
>  - No autobuilder failures (yet)

I've also added a reference to the commit that introduced the issue.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libdnet/libdnet.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
> index fc2995979d..e678565bdf 100644
> --- a/package/libdnet/libdnet.mk
> +++ b/package/libdnet/libdnet.mk
> @@ -19,7 +19,7 @@ LIBDNET_DEPENDENCIES = host-pkgconf
>  ifeq ($(BR2_PACKAGE_LIBDNET_PYTHON),y)
>  LIBDNET_DEPENDENCIES += libbsd host-python-cython python3
>  LIBDNET_CONF_OPTS += --with-python=$(HOST_DIR)/bin
> -LIBDNET_MAKE_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
> +LIBDNET_MAKE_ENV += $(PKG_PYTHON_SETUPTOOLS_ENV)
>  LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
>  LIBDNET_INSTALL_STAGING_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
>  endif
> -- 
> 2.43.0
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
