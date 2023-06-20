Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6841AEB64D7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jun 2023 21:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7F756131F;
	Tue, 20 Jun 2023 21:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7F756131F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXPW-o9_9imN; Tue, 20 Jun 2023 21:06:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D03E76123A;
	Tue, 20 Jun 2023 21:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D03E76123A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8539D1BF584
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 21:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BF4D404EF
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 21:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BF4D404EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqoDaTWwXipo for <buildroot@lists.busybox.net>;
 Tue, 20 Jun 2023 21:06:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0473A40146
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0473A40146
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 21:06:26 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f8689fbf59so4027964e87.0
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 14:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687295184; x=1689887184;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cHibgNDDkfH0BAH48pHYOFKJto9RFXIEKxhKo05oJ3o=;
 b=c43UpYPWl8qql5Crar6Ih5UNekWUnSbBQj3bJwI0BPRTwrvLMeFpD5Q0EUSESGu/um
 GVcrWFFv3EM6Sgfl3RL9443SiU38ALCccu2GG2rLcaBAiOZjCG4aEYseTCTG67GNuUVR
 NgPlt8JP/Ula5q/na4DQJFc0aSejwho0m74crEcOGveHe+ou3AhbRHxBYmL5wT2KpSuW
 VoHC+zbgcavfOFY7ZEKBx0CoZHdUjIMZwruWEAPf3dPVTEAGo/gLN4jTDUbiDt/Nl61E
 0Lw1BrG8RvaBT+ajqV59UoCLWFfpKVDLZqLpIu7HovvRFjGm5fP5WDMdo9V+OJ/O1J1D
 KWpA==
X-Gm-Message-State: AC+VfDwRbC43bcPaLfo5C8rokQlSPUEhGH4RRhSMVFELKOel6PSZAcF/
 lptNjHtCC0AAU9RPuV5vHdwMAQ5jvro=
X-Google-Smtp-Source: ACHHUZ5LDq+nqmOoGrkr9dprubko0nxmYXBgFoN1PFqm8JrkKFkOJkcS3yXr2v1LR8DfXS/E56XIfA==
X-Received: by 2002:ac2:5b1d:0:b0:4f8:6ff9:ec55 with SMTP id
 v29-20020ac25b1d000000b004f86ff9ec55mr2680631lfn.20.1687295184169; 
 Tue, 20 Jun 2023 14:06:24 -0700 (PDT)
Received: from cab-wsm-0679811 ([109.252.101.181])
 by smtp.gmail.com with ESMTPSA id
 w15-20020ac2598f000000b004f60a2429d4sm505900lfn.78.2023.06.20.14.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 14:06:23 -0700 (PDT)
References: <20230620174321.4774-1-ckhardin@gmail.com>
User-agent: mu4e 1.10.3; emacs 28.2
From: Sergey Bobrenok <bobrofon@gmail.com>
To: Charles Hardin <ckhardin@gmail.com>
Date: Tue, 20 Jun 2023 23:04:43 +0300
In-reply-to: <20230620174321.4774-1-ckhardin@gmail.com>
Message-ID: <7rlv211qi5269d.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687295184; x=1689887184;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=cHibgNDDkfH0BAH48pHYOFKJto9RFXIEKxhKo05oJ3o=;
 b=FL5qXil+02ZTAKFnm8G5ExNxJpIsxZ3qAbtbBXPfm7Ry0feMhemRt4qH0AY/dPWiWI
 7gHt5sKZqtPAtzV4fkCSyW7i2WlsCLMs1LvLBUwlaECx1wJUaMSTSbT9rDfVT3xqEq7m
 18iElRkX2Huu7ZkKnSw7pO1amTNjGGRzyOsvW8sEIWupi1OYjisA2oJsC0PZKkt68Mwd
 BQtUBMoxvgbk0e0hDeI5EBGeGNzp/Kg+eiePWCmOBx4SUNeY36HWqJ0XDGjJpJGVMdjQ
 QHw4cGDflK4O7b3w53a2eey4t+vKnABvqogJm2NXZH9tmJFap36NJn3+pxO+LGcJo7eQ
 dzsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FL5qXil+
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: add support to build
 the host stub generator
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Charles,

I also think that it would be useful to have an option to build 
the 'sdbus-c++-xml2cpp'
host tool. I even tried to add a host variant of the package 
initially [1]. But I wasn't
sure of the right way to implement it.
'sdbus-c++-xml2cpp' is more like a stand-alone tool: it doesn't 
depend on sdbus-c++ or its
dependencies, it has its own build files, it requires a different 
C++ standard (14 vs 17).
It just lives in the same repository.
So I think, maybe it would be better to make 'sdbus-c++-xml2cpp' a 
separate host package?
For example, the same approach is used in the 'Yocto meta-oe' 
repository: one package for
sdbus-c++ itself, and another package for sdbus-c++-tools [2].

[1] 
https://lore.kernel.org/all/20201113171845.63359-1-bobrofon@gmail.com/
[2] 
https://lore.kernel.org/all/CAA9bybPbYubZDBnACQAa+44K4Jkza9Eb9wpgAo_r0WB7e6MjaA@mail.gmail.com/

Charles Hardin <ckhardin@gmail.com> writes:

> Add a host option to build the xml2cpp-codegen part of the
> sdbus-cpp package for use in creating adaptor and proxy
> implementations from the D-Bus IDL.
>
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>  package/Config.in.host           |  1 +
>  package/sdbus-cpp/Config.in.host | 14 ++++++++++++++
>  package/sdbus-cpp/sdbus-cpp.mk   |  9 +++++++++
>  3 files changed, 24 insertions(+)
>  create mode 100644 package/sdbus-cpp/Config.in.host
>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index dcadbfdfc1..13eec7f7f5 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -94,6 +94,7 @@ menu "Host utilities"
>  	source "package/rustc/Config.in.host"
>  	source "package/s6-rc/Config.in.host"
>  	source "package/sam-ba/Config.in.host"
> +	source "package/sdbus-cpp/Config.in.host"
>  	source "package/sdbusplus/Config.in.host"
>  	source "package/sentry-cli/Config.in.host"
>  	source "package/sloci-image/Config.in.host"
> diff --git a/package/sdbus-cpp/Config.in.host 
> b/package/sdbus-cpp/Config.in.host
> new file mode 100644
> index 0000000000..79402af441
> --- /dev/null
> +++ b/package/sdbus-cpp/Config.in.host
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_HOST_SDBUS_CPP
> +	bool "host-sdbus-c++-xml2cpp"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_HOST_SYSTEMD
> +	select BR2_PACKAGE_HOST_PKGCONF
> +	depends on BR2_HOST_GCC_AT_LEAST_7
> +	help
> +	  sdbus-c++ is a high-level C++ D-Bus library for Linux
> +	  designed to provide expressive, easy-to-use API in modern 
> C++.
> +
> +	  This will build the stub code generator for the adaptor and
> +	  proxy interfaces from D-Bus IDL.
> +
> +	  https://github.com/Kistler-Group/sdbus-cpp
> diff --git a/package/sdbus-cpp/sdbus-cpp.mk 
> b/package/sdbus-cpp/sdbus-cpp.mk
> index 0e8d74cfcd..ece18126ba 100644
> --- a/package/sdbus-cpp/sdbus-cpp.mk
> +++ b/package/sdbus-cpp/sdbus-cpp.mk
> @@ -12,4 +12,13 @@ SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
>  SDBUS_CPP_LICENSE = LGPL-2.1+ with exception (headers)
>  SDBUS_CPP_LICENSE_FILES = COPYING COPYING-LGPL-Exception
>  
> +# Host build for sdbus-c++-xml2cpp
> +HOST_SDBUS_CPP_DEPENDENCIES = host-pkgconf host-systemd

'sdbus-c++-xml2cpp' depends on the 'expat' library, so 
'host-expat' is required as well.

> +HOST_SDBUS_CPP_CONF_OPTS += \
> +	-DBUILD_CODE_GEN=ON \
> +	-DBUILD_DOC=OFF \
> +	-DBUILD_TESTS=OFF \
> +	-DBUILD_LIBSYSTEMD=OFF
> +
>  $(eval $(cmake-package))
> +$(eval $(host-cmake-package))


-- 
Sergey Bobrenok
System software developer
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
