Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C8AEF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE4D8457E;
	Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeZrqJxVk9kU; Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3615384666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011430;
	bh=8boIPM1xagfGq/zNo6Cp8E/pAByQ4ANxu6EtVuZa6O0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qucr/TOmoGi38ASoJgydyHEdMCxgEfMa53EuotR1F9fdgsZ3UERVO6uckTvaTd9iV
	 yPSuHZYrKUYsiJSxtYYYk27v45PrRbQ6tfsEU/zUlwmW5DZtfuGaWWi8+3h6Pb4Q/o
	 TIoGWoV9lF/fsBWLngp2b/ExA2xh9O2QKVQimTf8HqhJFsi38OJRVfb8vs+lTiKJK4
	 BiASSknpJUHAWs7KRprnoadZSJAkOQ8SR5j1pj2aE29LfTd2DHHg2mLR6Wk5CpeuDF
	 XfoxdHb+nY/zx4yVymJhfXnhN18k2RXqv4VWU3FsukHMuxpGi+tunGdrBYj1J0/AzF
	 zRF9CCYI+N7+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3615384666;
	Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7354B69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 610B041ECC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAYxkMaw6-Pn for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C661C41EC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C661C41EC8
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C661C41EC8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-436234ef0f0so842527f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011386; x=1771616186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g2X16eShhJHkw/GtcsXcVzYBJyYcvJaGwcxSRjaYrZw=;
 b=gO59noU4uP+zlCTbRIrz6dwq2rj0YCvyXLBi2XPpV/BprJF3uMni/IwaQ1tqSmaXkY
 jz5iU48m0JBWyy5mCy7OCXIclNk3FdFmOJBeJ2jc+CdubZUl4IbDTZ1UoiLjtJORvJNA
 0mdGDqWrj+J6Y33qNtnxx7lygfUxqpp4/hJw61Zx8YQof5Jt41SCY3+Fd9IfbRhBba8k
 M5j+f1/hZ7HfiiFt1A82bU8H9TkSBaF8CjxQoS8QhRNAjaAHMAykStLjL30AkUXPGnVv
 KmyUxs2xWwUfR9nwWfy2yBe1KZv1Ss4D0gD5lx+lcED8rXDO6HRnbIt/S+mSAdVA++aO
 wGMw==
X-Gm-Message-State: AOJu0Yw7lM/9PVrLsJvlnEP9VWiF4BsbWe0hN7lcS0gA7HkV4O3QrSYn
 dYnrxoAKuzYF5p5FK8YGrPUEuTn6HbPLVCVt/p20SfZVODUKgmKxjXoisJDWNbHKkrSsMEN5ZUe
 SXWyb
X-Gm-Gg: AZuq6aLAA9dxElI0zLcn+m8YaSgB8Yy957NnMGvYWe0GJhfiAJxyw62nnKrTKm+m/c+
 P7YdWcTMAl8cN7tbsTR9+KXk+dPel98ggIBuYZLs2d+bQF26x48havrkWPJ8o18hc3tfie6Ygkz
 rQm6d1dtswYvk/94hviaSMlLDUYkS6QfTP/dN+108NMecUxK5U7EJzHCPUfTbQYQuYxjwcrzTux
 ptLUp9zN6fc8+Lq1UqBAYJ4VcBnCt0Ih7SJuK10txu+/o/OdP/9wXBMqQaAOtajRbDuMVc5PCnx
 CWeC/tok9UpLp+Iwe86n60fRHalOJCLMQ+GiGedP4oZKw5cGsrTRk3/zaZvJvrmqP+4CAHh8HUC
 QwWBCCHdK8XexUBhQswXCZvufkhnkbBoCq2DFPBUwl237wmP4iqYSesp0HAKsivPLtHR/K+nwYq
 m2xNP9zJvzANVnQAQ=
X-Received: by 2002:a05:6000:220d:b0:432:84f9:8bf9 with SMTP id
 ffacd0b85a97d-4379792c687mr5211315f8f.57.1771011386524; 
 Fri, 13 Feb 2026 11:36:26 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5ac7csm7021396f8f.7.2026.02.13.11.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:26 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:25 +0100
Message-ID: <20260213193625.37484-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260207081044.18004-1-thomas.perale@mind.be>
References: <20260207081044.18004-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011386; x=1771616186; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2X16eShhJHkw/GtcsXcVzYBJyYcvJaGwcxSRjaYrZw=;
 b=fs/RxnK12/qnHJRuHduRGZRceqDnDolZbKPOFNNEMKZGK4UrOm6Dk4XaNwbEshZ0uX
 P4fW2joBACVCxvT2H/E4tXnmQu0jlsj8BMtJNyq/UyxBWL5kV6btCI5jlz1PGP8AhJVN
 STvHZ/pg3rGQ0hvrO0PZUs4OHqfJm9kyvpGNExbFbGinAQ6pDsLcnvJHbkmUlUKDrX9M
 OHnx26qs4q9ZdwbocjDHPJH0PV2+S9HjepKaPw1cAjjiBH4eeKoAXab6TXuvB6Epsimj
 PQE1S8YJTuQVH421h1ZA+XhG3iwHWWr8iWzuqrAKXwj4J0nPDhk0PPIrxaR1Pm41bgRa
 /fAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fs/RxnK1
Subject: Re: [Buildroot] [2025.02.x,
 PATCH] package/libselinux: revert "allow pip to use system-provided
 packages"
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This reverts commit [1] which fails on the autobuilder because the patch
> don't apply. This was incorrectly applied as it is specific for a
> libselinux not part of 2025.02.x and fixes an error introduced by a pip
> version not present in 2025.02.x [2].
> 
> [1] 32d1d7c367 package/libselinux: allow pip to use system-provided packages
> [2] 285097051d package/python-pip: bumpp version to 25.3
> 
> Fixes: https://autobuild.buildroot.org/results/068/06854beaf880378da1b9ef75123de76465e5950f
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...akefile-build-python-module-without-.patch | 51 -------------------
>  package/libselinux/libselinux.mk              |  4 --
>  2 files changed, 55 deletions(-)
>  delete mode 100644 package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
> 
> diff --git a/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch b/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
> deleted file mode 100644
> index 7f4a76515b..0000000000
> --- a/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 8cfe4535f23a7768ee5efa615d11563a8404777c Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
> -Date: Mon, 27 Oct 2025 22:40:59 +0100
> -Subject: [PATCH] libselinux/src/Makefile: build python module without
> - isolation
> -
> -The "pip install" logic in libselinux/src/Makefile tries to get
> -setuptools from the network, which is not correct as during the
> -build/installation, there shouldn't be any network access, or
> -downloading of arbitrary resources from the network.
> -
> -This causes build issues in Debian:
> -
> -  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121121
> -
> -And in Buildroot:
> -
> -  https://autobuild.buildroot.net/results/0e9/0e9de0c0d8b6ec57eea9f8834f02076b296ba4f1/build-end.log
> -
> -To fix this, we use the --no-build-isolation pip install argument so
> -that pip install is allowed to use the system-provided setuptools,
> -instead of wanting to download this one.
> -
> -This patch is derived from
> -https://sources.debian.org/src/libselinux/3.9-4/debian/patches/Build-python-module-without-isolation-Closes-1119155.patch,
> -with the change that --no-build-isolation is passed unconditionally,
> -regardless of whether $(DESTDIR) is empty or not.
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Upstream: https://lore.kernel.org/selinux/20251227143911.1630813-1-thomas.petazzoni@bootlin.com/
> ----
> - libselinux/src/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
> -index e9141bb9..9bc10606 100644
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -197,7 +197,7 @@ ifneq ($(DISABLE_SHARED),y)
> - endif
> - 
> - install-pywrap: pywrap
> --	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
> -+	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --no-build-isolation --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
> - 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
> - 	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
> - 
> --- 
> -2.52.0
> -
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index 7bc33392d5..360ab063ca 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -35,12 +35,8 @@ LIBSELINUX_DEPENDENCIES += \
>  	python3 \
>  	python-setuptools \
>  	host-python-pip \
> -	host-python-setuptools \
>  	host-swig
>  
> -LIBSELINUX_MAKE_ENV += \
> -	$(PKG_PYTHON_SETUPTOOLS_ENV)
> -
>  LIBSELINUX_MAKE_OPTS += \
>  	$(PKG_PYTHON_SETUPTOOLS_ENV) \
>  	PYTHON=python$(PYTHON3_VERSION_MAJOR)
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
