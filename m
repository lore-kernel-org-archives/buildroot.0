Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3FDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 11:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FED883EAB;
	Sat, 23 Jul 2022 11:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FED883EAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDPAvWUfcAS1; Sat, 23 Jul 2022 11:49:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40B1C83DF1;
	Sat, 23 Jul 2022 11:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40B1C83DF1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0A41BF2F2
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 11:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D019883DF1
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 11:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D019883DF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oz0y0EmM0oUt for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 11:49:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F35D83449
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F35D83449
 for <buildroot@busybox.net>; Sat, 23 Jul 2022 11:49:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id n12so9686728wrc.8
 for <buildroot@busybox.net>; Sat, 23 Jul 2022 04:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zWIWb/jihvZns29rq/KAMzMEVad1+NaRgs/y2wol828=;
 b=ki62hKqvZ8YPFqB+UsmBJA2m3deazDS+MsSXgrfUlQCSGbislDl++bePeb0sSjLRFz
 pIbbOYfROXhr0tjH4JsOQinhsOQpDPTfF/A1TsI9x9C0nv/uLGiiBR7/aR9vuiDe0Yd1
 YE30Et305I6Sve0Nn/qNZJfqyqzS1fMMxVRLbqcSAKM40eZae2jzLlb/KZ9Y7LHN8qHs
 qxdVc4pvEPEvwlzvSCBAjZSkocywPgpGJx9dxoL1AqVUiEApACSoLSYN6C+D/0uaE3Fv
 6zthOlWw7bhkpdLZQ0xqFfBls4US8zVwXl9KHZWJlYVrjAd/Wmgsl1JyYQhYTzPzrpsL
 Ddww==
X-Gm-Message-State: AJIora/N4axHH9MvyY3VmaOr3vSo6nQMtcKJWa/TMnDSIhRxUE6vvt2T
 EwxCFcBkTdy9IXU3aMiTXPWHX21Vm7guBA==
X-Google-Smtp-Source: AGRyM1uHhnAe/UDfe+IgGRNacobWSryskdJMtBpWEjMDuNzsXvDC4BCjcDRG17o3N3aHl3urQpucfQ==
X-Received: by 2002:a5d:4607:0:b0:21d:93fb:aace with SMTP id
 t7-20020a5d4607000000b0021d93fbaacemr2602668wrq.704.1658576957199; 
 Sat, 23 Jul 2022 04:49:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 n186-20020a1ca4c3000000b003a32438c518sm11538102wme.6.2022.07.23.04.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 04:49:16 -0700 (PDT)
Message-ID: <5bbf502b-5fe5-45af-319f-dd05251d9a4e@mind.be>
Date: Sat, 23 Jul 2022 13:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>, buildroot@busybox.net
References: <a91e52dc20742c251ac5fdc6ada81c499dfc1705.1658419808.git.baruch@tkos.co.il>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <a91e52dc20742c251ac5fdc6ada81c499dfc1705.1658419808.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zWIWb/jihvZns29rq/KAMzMEVad1+NaRgs/y2wol828=;
 b=WARmDYiVLS8nwvnMjcc2C1PteVyXcKLZuSC92zzAJqLKIhGyllW1J5AidiKoTqRZDk
 gO3Bx/Pa4jJh4upVb4YyJ9bAf1S/j/0WOQX2m8mxbuPlxGmXZQDy3sG4qEqlAmXbYI7z
 iDyJlW9o58Qxrsg7JE7p9qz88SMDB6I3Kc1MlFFSvsD7AgiI1AQfreQBsiTVZO7enVwK
 tUw5O/yuNAn2DZ6UAoplJ8Dyjuzx5sd/aKOkVX7IyB7nr/4rg0LZaYNPOx6u4t7gFbW1
 dDRJYVTa+mDzSC94SS2RpOfvXz/PBJ7hpAqqqS3J6r6Rw+7PiRJQQb/7FCQu3haIqZlM
 Xo9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WARmDYiV
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix build when
 !BR2_TOOLCHAIN_HAS_SYNC_1
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/07/2022 18:10, Baruch Siach via buildroot wrote:
> On platform that do not provide __atomic_exchange_1(), and when
> libatomic is not available (e.g., threads support disabled) link of
> libcurl.so fails. To solve this use an indirect way to make HAVE_ATOMIC
> undefined. Add an upstream patch for checking the stdatomic.h header,
> and seed the 'no' answer.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8f695d4dbb91cfde8e93ab38e837b0a0042b986b/
> http://autobuild.buildroot.net/results/3b4712b0ace52da1650e88cdaafb6a20be135464/
> 
> Cc: Matt Weber <matthew.weber@collins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>   ...for-the-stdatomic.h-header-in-config.patch | 70 +++++++++++++++++++
>   package/libcurl/libcurl.mk                    |  6 ++
>   2 files changed, 76 insertions(+)
>   create mode 100644 package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch
> 
> diff --git a/package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch b/package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch
> new file mode 100644
> index 000000000000..083238819b1b
> --- /dev/null
> +++ b/package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch
> @@ -0,0 +1,70 @@
> +From a68074b5db2a1fb637853b808e5b263c2ce9cbdd Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 28 Jun 2022 08:37:22 +0200
> +Subject: [PATCH] configure: check for the stdatomic.h header in configure
> +
> +... and only set HAVE_ATOMIC if that header exists since we use
> +typedefes set in it.
> +
> +Reported-by: Ryan Schmidt
> +Fixes #9059
> +Closes #9060
> +
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +---
> +Upstream status: commit a68074b5db2a1fb637853b808e5b263c2ce9cbdd
> +
> + m4/curl-functions.m4 | 36 +++++++++++++++++++-----------------
> + 1 file changed, 19 insertions(+), 17 deletions(-)
> +
> +diff --git a/m4/curl-functions.m4 b/m4/curl-functions.m4
> +index ec406f56aed8..f3e12a53a9fd 100644
> +--- a/m4/curl-functions.m4
> ++++ b/m4/curl-functions.m4
> +@@ -6570,24 +6570,26 @@ AC_DEFUN([CURL_COVERAGE],[
> + ])
> +
> + dnl CURL_ATOMIC
> +-dnl --------------------------------------------------
> +-dnl Check if _Atomic works
> ++dnl -------------------------------------------------------------
> ++dnl Check if _Atomic works. But only check if stdatomic.h exists.
> + dnl
> + AC_DEFUN([CURL_ATOMIC],[
> +-  AC_MSG_CHECKING([if _Atomic is available])
> +-  AC_COMPILE_IFELSE([
> +-    AC_LANG_PROGRAM([[
> +-      $curl_includes_unistd
> +-    ]],[[
> +-      _Atomic int i = 0;
> +-    ]])
> +-  ],[
> +-    AC_MSG_RESULT([yes])
> +-    AC_DEFINE_UNQUOTED(HAVE_ATOMIC, 1,
> +-      [Define to 1 if you have _Atomic support.])
> +-    tst_atomic="yes"
> +-  ],[
> +-    AC_MSG_RESULT([no])
> +-    tst_atomic="no"
> ++  AC_CHECK_HEADERS(stdatomic.h, [
> ++    AC_MSG_CHECKING([if _Atomic is available])
> ++    AC_COMPILE_IFELSE([
> ++      AC_LANG_PROGRAM([[
> ++        $curl_includes_unistd
> ++      ]],[[
> ++        _Atomic int i = 0;
> ++      ]])
> ++    ],[
> ++      AC_MSG_RESULT([yes])
> ++      AC_DEFINE_UNQUOTED(HAVE_ATOMIC, 1,
> ++        [Define to 1 if you have _Atomic support.])
> ++      tst_atomic="yes"
> ++    ],[
> ++      AC_MSG_RESULT([no])
> ++      tst_atomic="no"
> ++    ])
> +   ])
> + ])
> +--
> +2.35.1
> +
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 5dc4eebefa49..ab2fd75276b2 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -15,6 +15,8 @@ LIBCURL_LICENSE_FILES = COPYING
>   LIBCURL_CPE_ID_VENDOR = haxx
>   LIBCURL_CPE_ID_PRODUCT = libcurl
>   LIBCURL_INSTALL_STAGING = YES
> +# We are patching configure.ac
> +LIBCURL_AUTORECONF = YES
>   
>   # We disable NTLM support because it uses fork(), which doesn't work
>   # on non-MMU platforms. Moreover, this authentication method is
> @@ -36,6 +38,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>   LIBCURL_CONF_OPTS += LIBS=-latomic
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_1),)
> +LIBCURL_CONF_ENV += ac_cv_header_stdatomic_h=no

  I've added a comment to explain why this is needed, and applied to master, thanks.

  Regards,
  Arnout

> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBCURL_VERBOSE),y)
>   LIBCURL_CONF_OPTS += --enable-verbose
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
