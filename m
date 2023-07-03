Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71551C30658
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF6A060B0D;
	Mon,  3 Jul 2023 18:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF6A060B0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGhDnrygYG-q; Mon,  3 Jul 2023 18:16:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA61960AB9;
	Mon,  3 Jul 2023 18:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA61960AB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72E931BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45CF260AB9
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45CF260AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xp1IGnaU_icE for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:15:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E283607DE
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E283607DE
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:15:58 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51dfa0771cdso3154813a12.2
 for <buildroot@buildroot.org>; Mon, 03 Jul 2023 11:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688408156; x=1691000156;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bjgul1yGsY5O0NldmGLZshwKk8ypKs13JwDIZA5xzk4=;
 b=FmMgggA9rKvPld0/OUJuvmlSXmB2/kI86JVnLsQc6h3J3Opu9a7GF7qXh9XsUxyfkg
 TMEmA8qMC/MiyvgTpOPFGnx3JdXrqlrR0GDezmEddY5i/K7eGFnNr6z2/OU3NCJ6sCLH
 5tt2bhgWxG7xl7cnYEoC31XLBx6JLb7772lkj46aObraVrx6ItYcZJNYdF99HE/fzC8t
 EUwRylCTAs3O7IKOVKY156RTrWzJFRBo+WjaJGZts+UJFaWIdvZvKr9G/POr65NYq0w+
 UJ0+fAnwq+6e+wB8YFoD+4pu7Va2kPne9CVlxsCBjVp41pDoDmzE6L/nIOjFQLj15FPd
 80Aw==
X-Gm-Message-State: ABy/qLafXd6xPe82Ncsgz/rQhc8YO+8k492YLHyEeZr3DL+lvpiJck3I
 iKfuQI1yEKnPTwBqDeNcZIpRPQ==
X-Google-Smtp-Source: APBJJlEKH4EkS1lKqafCWTFDFrtE05nFnA24r6CKaYRgO6r6V4n5ogQQVdYhW7jJqzwC5qdMTEXHwQ==
X-Received: by 2002:a17:906:1690:b0:974:e767:e1e7 with SMTP id
 s16-20020a170906169000b00974e767e1e7mr8038160ejd.28.1688408156559; 
 Mon, 03 Jul 2023 11:15:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a170906115400b00987e2f84768sm12236703eja.0.2023.07.03.11.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 11:15:55 -0700 (PDT)
Message-ID: <e2ecab93-e3d6-0ca3-08be-acf777d9f300@mind.be>
Date: Mon, 3 Jul 2023 20:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230629060652.313306-1-bernd@kuhls.net>
In-Reply-To: <20230629060652.313306-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688408156; x=1691000156;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bjgul1yGsY5O0NldmGLZshwKk8ypKs13JwDIZA5xzk4=;
 b=f6JWKd0A7G8IVARs/3oBeW8E0ugIoUsINYBxDbsuBOYFbr19Fje9HT7VASBYGgxpnN
 RqW7rNtCqCsfZ7Droa1i3y8/ohIBtLfKBjPDXCkCXHDFz4v1IbO2vkLdV0E57rnn4P3C
 zSXL0V5PedWZRSfd8v7JUE0LFnpHVy5Mt8ZMxId9vwYzPxWcTCXNOSPulkTw0nufDsED
 TsjKVdws/BEKJGHimsohqyV6hGZf6CxJW6wDddbhqtXKWjqyOCMAkG0fdKc8mtsaHEhF
 0Pg1qXlKWbStF4MW0bIlHFHe1DmNC0VSZ/N/JE60jLgliYVr8JV/TLsrks4OaNi/hWE+
 85UA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f6JWKd0A
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-lib: Fix symver build
 error on non-ELF platforms
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/06/2023 08:06, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/1e9/1e965d83d75615f35308440c5db044314a349357/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   ...ver-build-error-on-non-ELF-platforms.patch | 84 +++++++++++++++++++
>   1 file changed, 84 insertions(+)
>   create mode 100644 package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch
> 
> diff --git a/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch b/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch
> new file mode 100644
> index 0000000000..cade461671
> --- /dev/null
> +++ b/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch
> @@ -0,0 +1,84 @@
> +From 317aafb133ed797c4cd62599565a77ecc595daea Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Thu, 29 Jun 2023 07:57:21 +0200
> +Subject: [PATCH] Fix symver build error on non-ELF platforms
> +
> +The following error is observed on Microblaze [1] build:
> +
> +    error: symver is only supported on ELF platforms
> +
> +due to using __attribute__((symver)) on non-ELF platform.
> +
> +[1] http://autobuild.buildroot.net/results/1e9/1e965d83d75615f35308440c5db044314a349357/build-end.log
> +
> +ac_check_attribute_symver.m4 was downloaded from
> +https://github.com/smuellerDD/libkcapi/blob/master/m4/ac_check_attribute_symver.m4
> +
> +Upstream: https://github.com/alsa-project/alsa-lib/pull/334
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + configure.ac                    |  1 +
> + include/alsa-symbols.h          |  2 +-
> + m4/ac_check_attribute_symver.m4 | 24 ++++++++++++++++++++++++
> + 3 files changed, 26 insertions(+), 1 deletion(-)
> + create mode 100644 m4/ac_check_attribute_symver.m4
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0588eec3..71ec0b15 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -46,6 +46,7 @@ dnl Checks for typedefs, structures, and compiler characteristics.
> + AC_C_CONST
> + AC_C_INLINE
> + AC_HEADER_TIME
> ++AC_CHECK_ATTRIBUTE_SYMVER
> +
> + dnl Checks for library functions.
> + AC_PROG_GCC_TRADITIONAL
> +diff --git a/include/alsa-symbols.h b/include/alsa-symbols.h
> +index f8c49103..521e5956 100644
> +--- a/include/alsa-symbols.h
> ++++ b/include/alsa-symbols.h
> +@@ -29,7 +29,7 @@
> + #define INTERNAL_CONCAT2_2(Pre, Post) Pre##Post
> + #define INTERNAL(Name) INTERNAL_CONCAT2_2(__, Name)
> +
> +-#if __GNUC__ > 10
> ++#if HAVE_ATTRIBUTE_SYMVER && __GNUC__ >= 10

Why does this change from > 10 to >= 10 ?

  Regards,
  Arnout

> + #define symbol_version(real, name, version) \
> + 	extern __typeof (real) real __attribute__((symver (#name "@" #version)))
> + #define default_symbol_version(real, name, version) \
> +diff --git a/m4/ac_check_attribute_symver.m4 b/m4/ac_check_attribute_symver.m4
> +new file mode 100644
> +index 00000000..b484c5eb
> +--- /dev/null
> ++++ b/m4/ac_check_attribute_symver.m4
> +@@ -0,0 +1,24 @@
> ++dnl Check compiler support for symver function attribute
> ++AC_DEFUN([AC_CHECK_ATTRIBUTE_SYMVER], [
> ++	saved_CFLAGS=$CFLAGS
> ++	CFLAGS="-O0 -Werror"
> ++	AC_COMPILE_IFELSE(
> ++		[AC_LANG_PROGRAM(
> ++			[[
> ++				void _test_attribute_symver(void);
> ++				__attribute__((__symver__("sym@VER_1.2.3"))) void _test_attribute_symver(void) {}
> ++			]],
> ++			[[
> ++				_test_attribute_symver()
> ++			]]
> ++		)],
> ++		[
> ++			AC_DEFINE([HAVE_ATTRIBUTE_SYMVER], 1, [Define to 1 if __attribute__((symver)) is supported])
> ++		],
> ++		[
> ++			AC_DEFINE([HAVE_ATTRIBUTE_SYMVER], 0, [Define to 0 if __attribute__((symver)) is not supported])
> ++		]
> ++	)
> ++	CFLAGS=$saved_CFLAGS
> ++])
> ++
> +--
> +2.39.2
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
