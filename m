Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B44CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A261E6104D;
	Fri,  5 Jun 2026 12:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTF5AALKpOxh; Fri,  5 Jun 2026 12:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B16AB60FB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663782;
	bh=DJJw065mb3sa8fiJKgGmLulxvd0fjGUAncq7VxbbGus=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YRuXWVqURpNZX4Rv8vGCx0Q6jmoYczqaX4mONqDvHUnT+2nuAXi3Ppeh+fOyKRiQI
	 Q5IBJ9BX4zvf/3qBiGcmxF68hxjP2S1/9z2F0/Cg13ArPLpoZ7rBm4BrNnkvz1gyBQ
	 yK+8unlKLKsut2AyOnmZ1X8CZIfsSjAUFbcCLYRjA624qB2HEUjMl1voI5/7DKN+UU
	 4AI7WKfbMndADuslJfHC4OeKeN1JKfADKdrDrqp2stO+LaI/BLERmpd2jWTPccAtJ7
	 jxh88oMlMj+AlN+rGjuATSKdfibFxLMeFb8Dy3xq2laQ2zeXj0RMZt9WVmXXbuqnrj
	 Qrnh5TU9rz47w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B16AB60FB1;
	Fri,  5 Jun 2026 12:49:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E22549B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F41FA41EB4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFWpjnldgkos for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10DC141E8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10DC141E8A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10DC141E8A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490be03d47bso15571135e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663775; x=1781268575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g6LbaxuyKHtRDa4+HvK89fD8uTLCnycgtD1v2845xqc=;
 b=tRQjwfk72cLAojx/5EqENDDdafkF3oUwMxbNAmL3TH4LBSNLoF3Uqi/CQjp50/A6mH
 OyK5MPdVkKD9skihE/E6jdE9fZR7WRnLdKtiUbT+94TPDBBgDU6bJWZVpWJKJYfkz6k9
 Cmoh7H0+edstOPBYs/lFv8r2d2qEAIOXSOHBzEujMQt99Lfq+55yjnBep5xmDCSwz1qU
 cIns5Ta2WfUgPscrAxbHoOl1SrjRcNeFlUhaNhMAurNKnJos5FN3/GVM8EV+YTpzZXNB
 J/XLf+YjsCJO1mWvkSE3gXda/TpAPL1bNGgzsnu1pS0n5f6C+Di8z20WteaaaEVbl2Ua
 up1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8XHBe/QoWnsA3Mmne6XGW5bO6lesCB9MEKpdEKjsAMIau35okVKPptKsxEoHB92F3t4aGLTF0wqu0=@buildroot.org
X-Gm-Message-State: AOJu0YxCJUd2I+in8RDdwGlV7V87Sz0p+Bcvsbe8yxH8sjoqcCqCsqGq
 Sa95tRyu+jsvFkNUHaslB4nR+6u38KPR+TgMsNkA0s9MZwR+/+5dPth/+wzThWSKEZU=
X-Gm-Gg: Acq92OGK9PLZaFoV66ap8nuj+VxnbnevPSptDe2eGdTSWL8uQof/58tF8rCUz/+Svzd
 ijY74mOcEAnvnBU2R2v/o4X/bRKVBJKFB8hY8MXr6wTkiv8IISljE503Rr7+xHwG4uq8iw30pam
 ReyPzoHzsL3y7QiveHMLJNuqQtRtRRQJVoZZlBQaPYkuTr/s9cmC3E9E6+/RK826Ycx3+6WE1pK
 KR9zI+pVP7szZeaUzH7xknSPZAvxxc97BJoBO4Gh14hfqJcz1znkU1Aj8INMM3tFE7Cq//3o0EK
 WS5/6oiHxl0hOiUQ6H/sA4/TfUv4MXwUX/iBqFa0kh7vVSGN923wWjPJyOHolRYCEl/ZsmKPCZ6
 u5w36J4jrqGYBe2G9UIWjcX3okU3A8+c/wuUrWE36l4l4uFovR86HL8f6mD5yWGjl5ZDr/lG0Dh
 /CJCvTCJdK/+nvj+IDqMcbUKSCFA==
X-Received: by 2002:a05:600c:8b68:b0:490:bad7:3634 with SMTP id
 5b1f17b1804b1-490c25e1104mr54810965e9.19.1780663775098; 
 Fri, 05 Jun 2026 05:49:35 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3529e0sm25869001f8f.28.2026.06.05.05.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:34 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:34 +0200
Message-ID: <20260605124934.271632-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530155718.657095-2-bernd@kuhls.net>
References: <20260530155718.657095-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663775; x=1781268575; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g6LbaxuyKHtRDa4+HvK89fD8uTLCnycgtD1v2845xqc=;
 b=Lbjhex8cizVbFcDgBebPQDftJkqLrwd1D9/O+z60F6WKWnmIGR/vYypKvkOX/Y7wwL
 QCoVT1fz/iZOU/Haby/+gnPPqU7KgMoo/9MyLHy0oLB2iu3hMpqKF4ShDoaslWKS48zu
 Q/tH3C8DMyML6/D5zhDMsNdi9Z7LQcQqqkZQmcKuq8eyKeFjfOeiHEYRvKbi7bjMk4Xp
 Ze2d+BieZ1QkE4dN1rr4gGyvXF6MvoH1hX8CZ+YePvML3uY46W1TjktK5nRYgtgKCQd7
 UX71s/gEkkMaco5b4BBE+4yAgwzChh6JE2u8AjmOUgZ026zpaR7xcGdY7FRrT5/iae7Q
 dvGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Lbjhex8c
Subject: Re: [Buildroot] [PATCH v2 2/5] package/stellarium: add extra
 downloads
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
> Building Stellarium includes the download of external tarballs during
> configure.
> 
> This fails with host-cmake during configure stage:
> 
> CMake Error at md4c-subbuild/md4c-populate-prefix/src/md4c-populate-stamp/download-md4c-populate.cmake:163 (message):
>   Each download failed!
> 
>     error: downloading 'https://github.com/mity/md4c/archive/refs/tags/release-0.5.2.tar.gz' failed
>           status_code: 1
>           status_string: "Unsupported protocol"
>           log:
>           --- LOG BEGIN ---
>           Protocol "https" not supported
> 
>   closing connection #-1
> 
> due to buildroot commit f87138339b17bc2b1d84c59ea176abb941413550 which
> disabled SSL support for host-cmake.
> 
> This patch uses _EXTRA_DOWNLOADS to provide these tarball to allow
> offline builds.
> 
> No autobuilder error was recorded, the build error can be reproduced
> with this defconfig:
> 
> BR2_x86_64=y
> BR2_x86_corei7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
> BR2_FORCE_HOST_BUILD=y
> BR2_PACKAGE_STELLARIUM=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_XORG7=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
> v2: rephrased commit message
>     Series passed qt5-based Gitlab pipelines:
>     https://gitlab.com/bkuhls/buildroot/-/commits/d4c3a7f6096e3dc48fa33a27c697d76fc3f38d48
> 
>  package/stellarium/stellarium.hash |  4 ++++
>  package/stellarium/stellarium.mk   | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
> index 67e053eff7..4298c3dcde 100644
> --- a/package/stellarium/stellarium.hash
> +++ b/package/stellarium/stellarium.hash
> @@ -1,4 +1,8 @@
>  # From https://github.com/Stellarium/stellarium/releases
>  sha256  e376e0dc28eae0f7c4b3686fed9c2129c69a87a371b33e24bd79559a5142d613  stellarium-25.4.tar.xz
> +# From https://github.com/Stellarium/stellarium/blob/v25.4/CMakeLists.txt#L849
> +sha256  55d0111d48fb11883aaee91465e642b8b640775a4d6993c2d0e7a8092758ef21  release-0.5.2.tar.gz
> +# From https://github.com/Stellarium/stellarium/blob/v25.4/plugins/LensDistortionEstimator/src/CMakeLists.txt
> +sha256  6e899e297485e457ec1bf84844de29921aeef674f9d5caf60277df45dca6ff76  v2.9.0.tar.gz
>  # Locally computed
>  sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
> diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
> index 48dadfec61..de992352a1 100644
> --- a/package/stellarium/stellarium.mk
> +++ b/package/stellarium/stellarium.mk
> @@ -9,6 +9,19 @@ STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
>  STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
>  STELLARIUM_LICENSE = GPL-2.0+
>  STELLARIUM_LICENSE_FILES = COPYING
> +
> +STELLARIUM_EXTRA_DOWNLOADS += \
> +	https://github.com/mity/md4c/archive/refs/tags/release-0.5.2.tar.gz \
> +	https://github.com/stevengj/nlopt/archive/refs/tags/v2.9.0.tar.gz
> +
> +define STELLARIUM_COPY_EXTRA_DOWNLOADS
> +	mkdir -p $(@D)/_deps/md4c-subbuild/md4c-populate-prefix/src/
> +	cp $(STELLARIUM_DL_DIR)/release-0.5.2.tar.gz $(@D)/_deps/md4c-subbuild/md4c-populate-prefix/src/
> +	mkdir -p $(@D)/_deps/nlopt-subbuild/nlopt-populate-prefix/src/
> +	cp $(STELLARIUM_DL_DIR)/v2.9.0.tar.gz $(@D)/_deps/nlopt-subbuild/nlopt-populate-prefix/src/
> +endef
> +STELLARIUM_POST_EXTRACT_HOOKS = STELLARIUM_COPY_EXTRA_DOWNLOADS
> +
>  STELLARIUM_DEPENDENCIES = \
>  	qt5base \
>  	qt5charts \
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
