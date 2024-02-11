Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEA8C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A33764028D;
	Sun, 11 Feb 2024 17:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O2VB64VUfkIC; Sun, 11 Feb 2024 17:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D18D40486
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D18D40486;
	Sun, 11 Feb 2024 17:05:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F9431BF4D5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3806140486
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TioX0jrGCzzk for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:04:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C4BF4028D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C4BF4028D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C4BF4028D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:04:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D80D513F86A;
 Sun, 11 Feb 2024 18:04:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 18:04:49 +0100
Date: Sun, 11 Feb 2024 18:04:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zcj-MdyVc_ESj6yW@landeda>
References: <20240211160553.429144-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240211160553.429144-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707671094;
 bh=xQCv3fH880L/PS0+j1oXNP2On6Idk5S0RAsikWqIMGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UYlxj14FNjBE8r9gyShnrvk8gssYlmwS6qU124rja1qlze3Qju3jHEB0VYVFLbYpu
 5BrXRM2uCA7mfBj4fGhrBTgh5I00BEHXccDyd4wGOaUnHEf8e4zS8blvhhZZ+gSIHC
 tjfW/6Nu/o6CwlADqRFtDwc6mr8hD4cpDsOtVC3CVU5HSLqtjIAycPX2mLekHQufQw
 4Fi5rx0miH30HFr+7y/SM6JQRHByk/Iu6OzvsOBzSSg+fb7CIc2K1uam+Cn3iBbWjB
 his1xQss98P/BW4jCjZwzhxkJwn2jvdomlDQqjUJYXa++PBV7022owRAhVNzwNos9K
 04bbfwZo5S4wQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UYlxj14F
Subject: Re: [Buildroot] [PATCH 1/1] package:libselinux: replace
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-11 17:05 +0100, Fabrice Fontaine spake thusly:
> Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV as
> libselinux uses setuptools instead of distutils since version 3.5 and
> https://github.com/SELinuxProject/selinux/commit/2b5d5585754eb731a68158b613c7676fc3195ed9
> 
> This will avoid the following build failure raised since commit
> 09de823cbc7bd50a40e25f4166b4e42be94b0c7b:
> 
> In file included from /home/buildroot/autobuild/instance-0/output-1/per-package/libselinux/host/include/python3.12/Python.h:38,
>                  from selinuxswig_python_wrap.c:168:
> /home/buildroot/autobuild/instance-0/output-1/per-package/libselinux/host/include/python3.12/pyport.h:586:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>   586 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>       |  ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3fbbb741de33310c8cacab753a32e79c5e531036

I've slightly changes the formatting of the "fixes" tag, to also point
to the commit introducing the issue.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libselinux/libselinux.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index 529745f82e..734084ba50 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -38,7 +38,7 @@ LIBSELINUX_DEPENDENCIES += \
>  	host-swig
>  
>  LIBSELINUX_MAKE_OPTS += \
> -	$(PKG_PYTHON_DISTUTILS_ENV) \
> +	$(PKG_PYTHON_SETUPTOOLS_ENV) \
>  	PYTHON=python$(PYTHON3_VERSION_MAJOR)
>  
>  LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
> @@ -85,7 +85,7 @@ HOST_LIBSELINUX_MAKE_OPTS = \
>  	$(HOST_CONFIGURE_OPTS) \
>  	PREFIX=$(HOST_DIR) \
>  	SHLIBDIR=$(HOST_DIR)/lib \
> -	$(HOST_PKG_PYTHON_DISTUTILS_ENV) \
> +	$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
>  	PYTHON=python$(PYTHON3_VERSION_MAJOR) \
>  	USE_PCRE2=y
>  
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
