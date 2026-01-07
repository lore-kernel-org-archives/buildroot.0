Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC643D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946464098E;
	Wed,  7 Jan 2026 17:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ss4Vnv4vC0-l; Wed,  7 Jan 2026 17:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 989F440D7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808193;
	bh=ZRT86HaULZGgc+J0O5TZ8NSfBeE49/G9F05gGy2ZvGI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TvNu+tXzvpRZR45oqf63FwlPv4JUS9BlrGlUEsr81aRhVHwW27SyBYto15hcxwyjm
	 sILLzMw9FizFCF5vo03vxko77+KTCGsml3kIrX9x7i1s16+pJUGnJj9kzbkfZDe4xF
	 n4xOkvV+t/GaN1XNxhbQroewBeRMgXwexP1R5xY8V+s/+MljaxFfYZt/1a4yMsHY/e
	 wW4JgWPdU8ItlLOgLuiNNDKO0WwIrA0bhgKzurIrW7B0VIzQqKr+Tw+5EcaVsiMycO
	 0d9+3WedlQtJV79rkv707GpNjyJDqC7GVxfmXJRuM2a6KGSwaEEqjydQuEi03D2OUs
	 qQzYczCLz8ZSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 989F440D7A;
	Wed,  7 Jan 2026 17:49:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E24649ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C91EB80CDD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H128EIDu9KMo for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD0AD82341
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD0AD82341
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD0AD82341
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD1D6B97A192; Wed,  7 Jan 2026 18:49:48 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:46 +0100
Message-ID: <20260107174946.225560-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221171550.2356174-1-bernd@kuhls.net>
References: <20251221171550.2356174-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808189; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=YuWoHiJdv+pjboLyvrmIxM1jEuMIcGEjcI5yYE0F9HE=;
 b=d6CUpZRtoonwnBaJibhUN3j1O5NhJkAMLXlcGvcK4BEvRQt41LvxDhBDhcDh4Jt7eMMhxn
 qliMbUM8HzrnwVddQ9ev34G6losQWeY1+pSfEiBOLTcIH9B3SnMi9SKWAlGVhCqOG8LrNK
 bhVb7nxuQfvW1Mx1lXfBCAfmiVOMplDNI7hVt/hu5eVRvd+zmk2MbKOCpMmP1R3C5PXGSg
 zHcKsel20YVB0FvwYlBqJMmwWdkFg0wOhIzUXHIgBht4fKrEi8qOBX53fQgChibJ0vBxMb
 NJpNldrKHx4aZ99lCEroUxMVCrVhHMvE0drghiDLpBeL+A1eqma7xjd7F8Vcqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=d6CUpZRt
Subject: Re: [Buildroot] [PATCH 1/1] package/libselinux: fix Python build
 errors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes:
> https://autobuild.buildroot.org/results/953/953b8c6d7da0f150ec56760c4a3191e630c01381/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Co-Authored-By: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...uild-python-module-without-isolation.patch | 41 +++++++++++++++++++
>  package/libselinux/libselinux.mk              |  4 ++
>  2 files changed, 45 insertions(+)
>  create mode 100644 package/libselinux/0003-Build-python-module-without-isolation.patch
> 
> diff --git a/package/libselinux/0003-Build-python-module-without-isolation.patch b/package/libselinux/0003-Build-python-module-without-isolation.patch
> new file mode 100644
> index 0000000000..9614efa6c8
> --- /dev/null
> +++ b/package/libselinux/0003-Build-python-module-without-isolation.patch
> @@ -0,0 +1,41 @@
> +From: =?utf-8?q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
> +Date: Mon, 27 Oct 2025 22:40:59 +0100
> +Subject: Build python module without isolation (Closes: #1119155)
> +
> +Let pip find the system installed setuptools.
> +
> +Downloaded from
> +https://sources.debian.org/src/libselinux/3.9-4/debian/patches/Build-python-module-without-isolation-Closes-1119155.patch
> +
> +Used by Debian to fix a build error:
> +https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1119155
> +
> +Building the Buildroot package breaks with a different error:
> +
> +      ModuleNotFoundError: No module named '_sysconfigdata__linux_aarch64-linux-gnu'
> +
> +which is also fixed by this patch, most likely both are caused by
> +incorrect usage of python-pip by libselinux:
> +https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121121#29
> +
> +Upstream: buildroot-specific
> +
> +[Bernd: rebased after patch 0002 was applied]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index 261c22d..29057a8 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -198,7 +198,7 @@ ifneq ($(DISABLE_SHARED),y)
> + endif
> + 
> + install-pywrap: pywrap
> +-	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
> ++	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps --no-build-isolation` $(PYTHON_SETUP_ARGS) .
> + 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
> + 	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
> + 
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index 405c4a9f21..a77ee7659a 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -35,8 +35,12 @@ LIBSELINUX_DEPENDENCIES += \
>  	python3 \
>  	python-setuptools \
>  	host-python-pip \
> +	host-python-setuptools \
>  	host-swig
>  
> +LIBSELINUX_MAKE_ENV += \
> +	$(PKG_PYTHON_SETUPTOOLS_ENV)
> +
>  LIBSELINUX_MAKE_OPTS += \
>  	$(PKG_PYTHON_SETUPTOOLS_ENV) \
>  	PYTHON=python$(PYTHON3_VERSION_MAJOR)
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
