Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CA1C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 076CD81106;
	Fri, 25 Sep 2026 14:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zYrERoLmLBB; Fri, 25 Sep 2026 14:47:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 013B9811B6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347650;
	b=jaH6DVxbKi6UvKOIcpK9YwMeYl5+ZhV4z8+2Yq+cIVc06aR2cX2GhzHkL4fiaaK0l13p
	 cbhMlrndKIjoESjNdFKog45leTOxyS8QyZe1oncPSrv+KXF9Uh45qS6xMugUzPLbBvcYH
	 rjDGDimL+NURxqm6D5vEZnZGZn8RBK0No9BIfSSaJv84qJNLLHN//z8UspG6IJZ0WJX19
	 awKz4K1WoQXwvQ0bxdUv64Xo8IJzjNlu/tgmyYpC8v1mZs2K3VjS8Nd4yLOUl1+NbxOAR
	 FuT8PZdlB8tlX3psRqlgzRxID292KDCWk05z1wlSF/o8gCIQKyV4HSf0DHA6MmSPUYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347650;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2eQdDcT5Md517pyAnTvoCbrhP2zzGZ1QPDQYamchk5I=;
	b=kgtHerV+nM/Ya5NyY2/ZZ825N5gz+pBCqGl+wNmZRS8anIqZKeFwuKkSPow/lx/QJHHg
	 nFdoEjeuLEWnMkYdbC7ynNin/UXu+pj/xJgXvmnqfQh2FUjoO3zOjLPhwNLHf1tNSk+7e
	 rdeNhwIJrTXWg9WYlyjnePS3n9FP/Q1eVrRNQIOifYK+tOHQKL2hgtTICCOgMaDUif3LR
	 LAU77xZRds/UpG7R0d7f7P4jTrceZJSlaoKaZkJKyXBtZG6YQNtISTvmZZOARjptV0qAD
	 EknP2B0hwpkSa882A2Y5k+v2/ykLYpnh2Sde7+Kh4zDMjyXq8EDjGn71R1wqy2XbvqA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347650;
	bh=2eQdDcT5Md517pyAnTvoCbrhP2zzGZ1QPDQYamchk5I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AyAzGQ4z4xJNh8Doar7mono/XBpFMQTZsMnFrZ9oLeHTcB1q1ye7+k+uIJFSP3zwB
	 vWGnz6Xs28JNggd19iK8ncfogK/ig+pJVag2vIuIHq+YUBL7jaPAy/yG1bmBdh+bWh
	 na3jC8Oj86fKB3mU1pkJrFbb5iLgMsWRIAOd6sG03qZ6kVeIbSU+T/ARexsWWQUFVt
	 Hx1e1hV8FJ7hZLIU5jvtHWchg2cmgJv10Tf/zxiAZb1TtYP9kaNnvTUgF2v0qsiwl9
	 HIxw5VUZHYcEI+CD8gz3tqzX/tWYCaHFwzo7V1JlkfJ2QhBmBcbabundQ7TtSUG4ik
	 NvWOZA08eF+Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 013B9811B6;
	Fri, 25 Sep 2026 14:47:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 048AD332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE6F060E8C
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94aZmmWZX6lN for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 89ADC60E8A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347645;
 b=F9+lMSM1RDq6j7GR3VqtMBWYdgFleYzJ73+GjYcQOByq/rvKJ+MTHvxRw+EgQAr0Xi7m
 yAsdtHO0vsnsFhjJYJbLLX+aGmF2UvQrkHhcSP7AQ7HNU7Y79Cjiwfa048VyjVyM+K96R
 uLUuBoYoYS1pyjfCPBqlQzZNb3oPDEi1zXEevlB+y6SUQ2kZabmrDpplfQ2JC+i3jqsLO
 7C4IwVwhuJraZwa0jegt2fcEVyWUNYZCSmm0Jckh3HfBIythnF9SB3AlKTWAJUM2X/pXi
 25NqaulZVrK7hbMLSdjjddVQ0GxYWhzmV7+szjwrGz4RZ+t8alIaarhslqKvfeKp0Bg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347645;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=AJLL5Janya6H44metwl+MpyGzzioFizr1l3luBtaWkM=;
 b=Xc89ZGNVVVjjPbPQWCFgFhPoqnXfzJ6czMeIo5PGyhF70HN9V6Mnu9r4DgZRfpFuTpMZ
 rqBohjb5P76yq31N7Ji/TK93z1tjKZqZ8RlqJ2Npl1pBaCOtpqW49yUuckxv0ZEGktCP1
 o71vM+ZUdUDZVoNpF0ZKqspshF/o73yIs+OGTpLZSHR8MzMD7e5RXcZvpPE/1LgZwUjsR
 UZKE9AJFqpuYPFCFt8v4GUfFxyErQ+FNBJhS+3sxARf7knMbaZ+w++F6/jrpMgywMTz3r
 i02CXbvSNkI7ncLgJigVbGPmjaVGugVTmA7qFC3THF/DgbrZTIPKtcG2rFb0/IjKChA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Z40CDpXA; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89ADC60E8A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:25 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ff23af865so6528565e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347643; x=1790952443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AJLL5Janya6H44metwl+MpyGzzioFizr1l3luBtaWkM=;
 b=JTesPNjiWA+eannlsVnwFq3UuNkuR6Aakc0waxQ1d7Ocsx9DtBXzVqHW9zQ2f4h5wb
 FIDk3Kkfz9tAn0XW9z5IJCiIDYItHGP24kWojFBTWN6Egz/oadehrEUGq3qgNtcXR3/9
 1ViXF/Vu1bAxlVsdfyFhD5Ys/JLzivBlpuA1j/5vDYDUdb8cDhShxxuSjfOQSV2vTxJu
 wgXnYgzoIWyp4uBk1fRrN38o2tFzO+HXZWqaMYQHlFEJ4+hula4CISL/ttr2HWddGCPc
 8VFXv0sWEBFy8NnAM3KVVYsedidlzWPCWEIWYtnnBRfuEu4eeJ0MlPpJgIRc37QTEQAk
 2Mnw==
X-Gm-Message-State: AFuF++k3BbrsINxZzXIoDLVJEwu1dulVK3hxL8y+/hSSJRJcb3p9Y4eB
 hMHkanPNeR2OUbWj9fVygnxnzutey1gcHgetlLmGm9jLCzHpswJC6JS6tanvhwTyvQmmtT/7e09
 99+bD4u/Olg==
X-Gm-Gg: AYBFou1BBZFPvjekogqD/SS3p9he8vlkvIOI4FYSWoYV7JPApC4UAFaMFb8KE9dcxDi
 quzx3b+PAwHdSjY7FgdzF71hdKR7kEBXpI1Y0mQ8fDLEe8je8qCgZ+yln/BfHnHRiKXwPZsGRI4
 3GEFn9g+iE38QSjXC3+KqaB6OvwE0fzPJ07oah2k+FLC+IPa5UgJxOVWCXQQokLt3lP5PG7+61W
 SioHVkHEzrOV5u4iCA58NUkHzaSewCH0+Fj2MApbfS45tlGbTJWbSG/EUyZ5enAyJc1UCAcwc3j
 levwPvl9fdMA7v2Eb3LPY1EiKvoo6HmwJnfvZhpANOH9vQF1+5C6cABzbpFC618KJDeHJtcOw7Z
 HYdqA2WES9YWBnt9ADNOLg1FcXTQSCeE4N7ywa3gRcf7WaPbQ/m2Sj3ywK/BxZmp4wpuZjSliZu
 7dJ5V40Z383N6Fva/arY92l1zpLkTHF5iRHF/39Pu4nBByq9VHbwCRtRK1hI+X1SqLSx+CxQWqg
 h5W0vAiM3H5NkeO4Gc+iyShZ8AyNh2aUziuX+fhpkd1/KyRnoJJ
X-Received: by 2002:a05:600c:4703:b0:49c:fc6e:a3e1 with SMTP id
 5b1f17b1804b1-49fe66fd374mr99487595e9.32.1790347643575; 
 Fri, 25 Sep 2026 07:47:23 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fedec53c4sm93399215e9.4.2026.09.25.07.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:47:23 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:47:20 +0200
Message-ID: <20260925144722.4101075-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260919155845.5776-19-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 18/77] package/ibrcommon: update patches
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Replaced patch 0001 with an upstream commit.
> 
> Added Upstream: tags to patches 0002 & 0003.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  .checkpackageignore                           |  3 -
>  ...mplyfied-POSIX-method-to-get-the-bas.patch | 46 ++++++++++++++++
>  ...File.cpp-support-POSIX-basename-call.patch | 55 -------------------
>  ...-added-openssl-1.1-compatibility-264.patch |  3 +-
>  ...sl-gcm-fix-static-build-with-openssl.patch |  3 +-
>  5 files changed, 49 insertions(+), 61 deletions(-)
>  create mode 100644 package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
>  delete mode 100644 package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 7e5d774821..50c1631df3 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -400,9 +400,6 @@ package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch lib_patch.Upstr
>  package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch lib_patch.Upstream
>  package/i2pd/S99i2pd Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/i7z/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
> -package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch lib_patch.Upstream
> -package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch lib_patch.Upstream
> -package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch lib_patch.Upstream
>  package/icu/0001-dont-build-static-dynamic-twice.patch lib_patch.Upstream
>  package/icu/0002-link-icudata-as-data-only.patch lib_patch.Upstream
>  package/icu/0003-fix-static-linking-with-icu-uc.patch lib_patch.Upstream
> diff --git a/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch b/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
> new file mode 100644
> index 0000000000..e52981b38b
> --- /dev/null
> +++ b/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
> @@ -0,0 +1,46 @@
> +From fcea9d27f5153c8da77ebab956f75eaa1fd48836 Mon Sep 17 00:00:00 2001
> +From: Johannes Morgenroth <jm@m-network.de>
> +Date: Sun, 20 Dec 2015 12:51:53 +0100
> +Subject: [PATCH] ibrcommon: Use simplyfied POSIX method to get the basename
> +
> +Upstream: https://github.com/ibrdtn/ibrdtn/commit/fcea9d27f5153c8da77ebab956f75eaa1fd48836
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + ibrcommon/data/File.cpp | 12 +-----------
> + 1 file changed, 1 insertion(+), 11 deletions(-)
> +
> +diff --git a/ibrcommon/data/File.cpp b/ibrcommon/data/File.cpp
> +index 31af4ae7..5f8e24e3 100644
> +--- a/ibrcommon/data/File.cpp
> ++++ b/ibrcommon/data/File.cpp
> +@@ -34,10 +34,7 @@
> + #include <cstring>
> + #include <cerrno>
> + #include <fstream>
> +-
> +-#if !defined(HAVE_FEATURES_H) || defined(ANDROID)
> + #include <libgen.h>
> +-#endif
> + 
> + #ifdef __WIN32__
> + #include <io.h>
> +@@ -225,14 +222,7 @@ namespace ibrcommon
> + 
> + 	std::string File::getBasename() const
> + 	{
> +-#if !defined(ANDROID) && defined(HAVE_FEATURES_H)
> +-		return std::string(basename(_path.c_str()));
> +-#else
> +-		char path[_path.length()+1];
> +-		::memcpy(&path, _path.c_str(), _path.length()+1);
> +-
> +-		return std::string(basename(path));
> +-#endif
> ++		return std::string(basename((char*)_path.c_str()));
> + 	}
> + 
> + 	File File::get(const std::string &filename) const
> +-- 
> +2.47.3
> +
> diff --git a/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch b/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
> deleted file mode 100644
> index 5cd302c979..0000000000
> --- a/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From d667b13a87cf3207599a19eb981a893a1d7a67ee Mon Sep 17 00:00:00 2001
> -From: Brendan Heading <brendanheading@gmail.com>
> -Date: Mon, 14 Sep 2015 23:25:52 +0100
> -Subject: [PATCH] ibrcommon/data/File.cpp: support POSIX basename call
> -
> -Firstly, and somewhat strangely, musl chooses not to provide a basename(3)
> -prototype within <string.h> whenever __cplusplus is defined. This can be
> -solved by including the <libgen.h> header defined by POSIX 1003.1 whenever
> -__GLIBC__ is not defined.
> -
> -However, this leads to a second problem. POSIX defines the function as
> -char* basename(char*) and this is the only version supported by musl.
> -However, the std::string.cstr() method returns a const char*.
> -
> -POSIX says that the string parameter can be modified. However the GNU
> -implementation never modifies it. glibc therefore supports an extension
> -when compiling under C++ by also supplying
> -const char* basename(const char*). This extension is not present on musl
> -which is the cause of the failure.
> -
> -The solution is reasonably straightforward; test if __GLIBC__ is defined
> -before calling basename. If not, use the fallback already provided for
> -other platforms whereby basename() is called on a temporary copy.
> -
> -Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> -Upstream-status: pending
> ----
> - ibrcommon/data/File.cpp | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/ibrcommon/data/File.cpp b/ibrcommon/data/File.cpp
> -index 31af4ae..68e9b4f 100644
> ---- a/ibrcommon/data/File.cpp
> -+++ b/ibrcommon/data/File.cpp
> -@@ -35,7 +35,7 @@
> - #include <cerrno>
> - #include <fstream>
> - 
> --#if !defined(HAVE_FEATURES_H) || defined(ANDROID)
> -+#if !defined(HAVE_FEATURES_H) || !defined(__GLIBC__) || defined(ANDROID)
> - #include <libgen.h>
> - #endif
> - 
> -@@ -225,7 +225,7 @@ namespace ibrcommon
> - 
> - 	std::string File::getBasename() const
> - 	{
> --#if !defined(ANDROID) && defined(HAVE_FEATURES_H)
> -+#if !defined(ANDROID) && defined(HAVE_FEATURES_H) && defined(__GLIBC__)
> - 		return std::string(basename(_path.c_str()));
> - #else
> - 		char path[_path.length()+1];
> --- 
> -2.4.3
> -
> diff --git a/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch b/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
> index 90e5147f54..8e890de965 100644
> --- a/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
> +++ b/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
> @@ -5,8 +5,7 @@ Subject: [PATCH] ibrcommon: added openssl 1.1 compatibility (#264)
>  
>  This patch adds compatibility to openssl 1.1.0.
>  
> -Backported from master branch:
> -https://github.com/ibrdtn/ibrdtn/commit/a801d10a081e3130e24042256a43190c9eb6c112
> +Upstream: https://github.com/ibrdtn/ibrdtn/commit/a801d10a081e3130e24042256a43190c9eb6c112
>  
>  Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
>  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> diff --git a/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch b/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
> index c55b227c0c..2045b8cbab 100644
> --- a/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
> +++ b/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
> @@ -15,8 +15,9 @@ Makefile:560: recipe for target 'dtnd' failed
>  Fixes:
>   - http://autobuild.buildroot.org/results/1d3b4b6cf043a3e185ce758b617a0a18c3d36cdb
>  
> +Upstream: https://github.com/ibrdtn/ibrdtn/commit/103bab3d4759e56b7e46cb9848e64037cd666911
> +
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/ibrdtn/ibrdtn/pull/269]
>  ---
>   ibrcommon/ibrcommon/ssl/gcm/gcm.cpp      | 10 +++++-----
>   ibrcommon/ibrcommon/ssl/gcm/gf128mul.cpp |  2 +-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
