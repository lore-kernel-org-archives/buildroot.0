Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAB8CD37B5
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B6180B39;
	Tue,  3 Sep 2024 22:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDD0M2bSU1zH; Tue,  3 Sep 2024 22:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8308180D1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8308180D1C;
	Tue,  3 Sep 2024 22:49:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 380451BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25167402AE
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUunnsrL-Tfp for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:48:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70682402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70682402A8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70682402A8
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:48:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 377EB13F88D;
 Wed,  4 Sep 2024 00:48:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 04 Sep 2024 00:48:53 +0200
Date: Wed, 4 Sep 2024 00:48:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <ZteSVQdsV9Fy7auE@landeda>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
 <20240829144940.209964-23-johan.oudinet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829144940.209964-23-johan.oudinet@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725403735;
 bh=PAJWAMkED5iUk0bhod/GLaZ+6sGG2ebx1rdfV3i1e/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UkE6X2FP1D2VN1cNUqKy5Jgu0HR13fVQDXkeWzPAic0Q4V/WMbn7ffI6MBm6yWCGL
 iDLn+lFvzQ67kZl9nFhbiYBkOp2RMU9GJ7TAnqWUAfmLT2mQsw14XmbdQkl4NPWNgc
 w4zrbtL3X0K0zi6J/WbOLPUy4pKhtyZDvKqdtKRGvrfpCJK/2UUlbvQDnI1AE0Q8Yc
 7RVGRooCaIMX3ePKcWFOTYj6fxVtmw+r0aD0ezMMM/aZe6i/+vRPfpJf13K5yBtjLB
 0zGJ13oSpfRzuMB0cNiDNpMQIsDWUFaTPQMdxszk1a4wBtRzTtmIPmrjibnCpnmbOn
 VHlkoe2sYMCgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UkE6X2FP
Subject: Re: [Buildroot] [PATCH v2 22/23] package/ejabberd: bump version to
 24.07
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

Johan, All,

On 2024-08-29 16:49 +0200, Johan Oudinet spake thusly:
> and update the two patched accordingly. Ejabberd now uses rebar3 by
> default, so use the --with-rebar configure option to set the correct
> rebar binary to use.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  ...not-download-or-compile-dependencies.patch | 23 +++++++++----------
>  package/ejabberd/0002-fix-ejabberdctl.patch   | 19 ++++++++-------

Ditto, the patches are modified with the appropriate Upstream tag, so
.checkpackageignore must be updated at the same time. I see you did that
in the last patch, but it really belongs to this one.

I've fixed when applying.

Thanks!

Regards,
Yann E. MORIN.

>  package/ejabberd/ejabberd.hash                |  4 ++--
>  package/ejabberd/ejabberd.mk                  |  5 ++--
>  4 files changed, 25 insertions(+), 26 deletions(-)
> 
> diff --git a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
> index abcc8975b2..69f25304b5 100644
> --- a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
> +++ b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
> @@ -1,37 +1,36 @@
> -From bf3571da4a68a6a857ab7ad8256f8276b3687a38 Mon Sep 17 00:00:00 2001
> -From: Johan Oudinet <johan.oudinet@gmail.com>
> -Date: Fri, 13 May 2022 14:22:37 +0200
> +From bfcc72e5bb96fc9fc1f3558191a1a3f40c7f159a Mon Sep 17 00:00:00 2001
> +From: Johan Oudinet <johan.oudinet@gmail.com>
> +Date: Fri, 2 Aug 2024 17:32:37 +0200
>  Subject: [PATCH] Makefile.in: do not download or compile dependencies
>  
> -Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> -[Bernd: updated for version 23.04]
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> +Upstream: N/A, not upstreamable
>  ---
>   Makefile.in | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/Makefile.in b/Makefile.in
> -index ab0e9d967..6e54168a7 100644
> +index 5adf241d5..74aad3156 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -155,7 +155,7 @@ else
> - endif
> - endif
> +@@ -201,7 +201,7 @@ endif
> + #' main targets
> + #
>   
>  -all: scripts deps src
>  +all: scripts src
>   
>   deps: $(DEPSDIR)/.got
>   
> -@@ -169,7 +169,7 @@ $(DEPSDIR)/.built: $(DEPSDIR)/.got
> +@@ -215,7 +215,7 @@ $(DEPSDIR)/.got:
>   $(DEPSDIR)/.built: $(DEPSDIR)/.got
>   	$(REBAR) compile && :> $(DEPSDIR)/.built
>   
>  -src: $(DEPSDIR)/.built
>  +src:
>   	$(REBAR) $(SKIPDEPS) compile
> + 	$(EXPLICIT_ELIXIR_COMPILE)
>   
> - update:
>  -- 
>  2.34.1
>  
> diff --git a/package/ejabberd/0002-fix-ejabberdctl.patch b/package/ejabberd/0002-fix-ejabberdctl.patch
> index ae28f3a632..89504d11c5 100644
> --- a/package/ejabberd/0002-fix-ejabberdctl.patch
> +++ b/package/ejabberd/0002-fix-ejabberdctl.patch
> @@ -1,30 +1,29 @@
> -From 4283f675f21d3923e200092cec6418014a03ad52 Mon Sep 17 00:00:00 2001
> -From: Johan Oudinet <johan.oudinet@gmail.com>
> -Date: Thu, 26 Dec 2019 17:06:34 +0100
> +From d403c0bca48f2678c70763c3faca41c9adc76658 Mon Sep 17 00:00:00 2001
> +From: Johan Oudinet <johan.oudinet@gmail.com>
> +Date: Fri, 2 Aug 2024 17:39:07 +0200
>  Subject: [PATCH] fix ejabberdctl
>  
>  Change default values so ejabberdctl run commands as ejabberd user.
>  
> -Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> -[Bernd: updated for version 23.04]
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> +Upstream: N/A (specific to buildroot)
>  ---
>   ejabberdctl.template | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/ejabberdctl.template b/ejabberdctl.template
> -index a940c3df7..5166e5a27 100755
> +index 83ec7e1bd..513c48c25 100755
>  --- a/ejabberdctl.template
>  +++ b/ejabberdctl.template
> -@@ -17,7 +17,7 @@ SCRIPT_DIR=$(cd "${0%/*}" && pwd)
> +@@ -17,7 +17,7 @@ ERTS_VSN="{{erts_vsn}}"
>   ERL="{{erl}}"
> - IEX="{{bindir}}/iex"
>   EPMD="{{epmd}}"
> + IEX="{{iexpath}}"
>  -INSTALLUSER="{{installuser}}"
>  +INSTALLUSER=ejabberd
>   
>   # check the proper system user is used
>   case $(id -un) in
>  -- 
> -2.20.1
> +2.34.1
>  
> diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
> index 15e879be19..e6d9b2560e 100644
> --- a/package/ejabberd/ejabberd.hash
> +++ b/package/ejabberd/ejabberd.hash
> @@ -1,4 +1,4 @@
> -# From https://static.process-one.net/ejabberd/downloads/23.04/ejabberd-23.04.tar.gz.sum
> -sha256  6ff1d41a1ff6261a0c846193647d8ec143e82142859bf1cfdc62299022ceb2ad  ejabberd-23.04.tar.gz
> +# From https://static.process-one.net/ejabberd/downloads/24.07/ejabberd-24.07.tar.gz.sum
> +sha256  c0fb746acba81a5db41de97c03968c1f681a13b1b6c1a895b7182e33820c18d9  ejabberd-24.07.tar.gz
>  # Locally computed
>  sha256  469bb8cfa3ef22c102875ff31932450c075e6908ff3f7d36893485c0c30898eb  COPYING
> diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
> index 58b544fb84..df9fc1c1d0 100644
> --- a/package/ejabberd/ejabberd.mk
> +++ b/package/ejabberd/ejabberd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EJABBERD_VERSION = 23.04
> +EJABBERD_VERSION = 24.07
>  EJABBERD_SITE = https://static.process-one.net/ejabberd/downloads/$(EJABBERD_VERSION)
>  EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
>  EJABBERD_LICENSE_FILES = COPYING
> @@ -36,7 +36,8 @@ EJABBERD_CONF_ENV = \
>  
>  EJABBERD_CONF_OPTS = \
>  	--enable-system-deps \
> -	--disable-erlang-version-check
> +	--disable-erlang-version-check \
> +	--with-rebar="$(HOST_DIR)/bin/rebar"
>  
>  define EJABBERD_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) all install -C $(@D)
> -- 
> 2.34.1
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
