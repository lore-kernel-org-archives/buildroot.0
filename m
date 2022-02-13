Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB6EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3BC181970;
	Sun, 13 Feb 2022 11:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjaBWQZ1Yj-H; Sun, 13 Feb 2022 11:45:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D6D81A58;
	Sun, 13 Feb 2022 11:45:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8449F1BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71EB9401F8
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:45:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9QIeFiOs_KS for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:44:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3602340181
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:44:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id d10so31872429eje.10
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ziRw3hfb1S/1EpwQQwPFCfJJba9tnnIalTRlbUtAAm0=;
 b=Svm/O6yVA0htuqJ79YWaN5skWO3XGf+zME6LtYm580IcczxUMqR/JlAr7HhmQRqeng
 spBYUZdmw76rxm01aGGenvsLxJNwGO0JiHR7VHbFRHE/wb0aLSMAoY7G3zDLatzoRptZ
 RSDZUhVDhGZ980M5+FSMg39j9tRr3izmlbLTkpQq5gdtBHB5/oGWp0LyJmdj8shuBJxw
 GbpS6NCeCj8DEXNpEAbezAEEJTEd6QqoY01VgK+bzVaEPceBYKNvxCtRft0gh20kAeOa
 spA9nAwwE0Q6n4FpI/ssXyhPKpWxAWo5imxtUgyoNrj8Ab7vp9zm72neoZr+jw5tbQpx
 cMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ziRw3hfb1S/1EpwQQwPFCfJJba9tnnIalTRlbUtAAm0=;
 b=mZ/4MLu3BxqAhM5O/nI9Gk2xzf+d+gQx8ZJZraCY2y2CLmam7zmSpI8sEbCCGLjFy0
 QRDgYtccSfUNpGDQhsn3p5URmisuNhnhxhyyN2U8251b4Mp20c95/RszGbLHx+58eUYN
 okNAAg1TC9uo0oZAiRaDA2xBRhVff5yqciFZSoRCPsjtttz6NLqeH7MW3oPR30tS3g5S
 vDn0rjGc1E6YtJm5nx+1FwyWXObheRgu5Sxz+30YsCno2x2cQEQRVLMpYaK5/xe8002q
 OZ6AHJSe0fiIiJk1vmg9yCWP+ZmIB1iuXdzNV+5HJzDdTBw/WWo6XcJt29gVbW/IbN2+
 3j8Q==
X-Gm-Message-State: AOAM530W+IACDxLIyBI1P3mrnydNVCXvTUYTRYaT1Yu3xLljrVeC5UDg
 sTR5V+z8mzXRJ/M3z61G+xP5HQ==
X-Google-Smtp-Source: ABdhPJya47uOERvkwEGUV+HpNa9Ec7HmiLmUqkhMDo6rBUEMeKU4j5/iZaPkUzNtlc9ru3N51ux0RA==
X-Received: by 2002:a17:906:7a43:: with SMTP id
 i3mr722208ejo.371.1644752697422; 
 Sun, 13 Feb 2022 03:44:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n2sm9292924ejl.86.2022.02.13.03.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 03:44:57 -0800 (PST)
Message-ID: <d48247ee-c1bb-183b-1bad-a19eb721bf58@mind.be>
Date: Sun, 13 Feb 2022 12:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220202203725.2115889-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220202203725.2115889-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: fix build failure with
 Microblaze
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/02/2022 21:37, Giulio Benetti wrote:
> Add local patch pending upstream[1] to fix the build failure after my
> suggestion[2] to imitate what I've done with libfuse[3].
> 
> [1]: https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/275?commit_id=5f71b3d63181aa88a68f7f71eab8801f2d8d2cde
> [2]: https://gitlab.com/cryptsetup/cryptsetup/-/issues/709
> [3]: https://github.com/libfuse/libfuse/pull/620/commits/3aba09a5c56e017746c5c1652dbc845f4db7374a
> 
> Fixes:
> http://autobuild.buildroot.net/results/bad/bad4d01fde3191e4d481a8e9dae18df3b1a94537/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...d-check-program-for-symver-attribute.patch | 56 +++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch
> 
> diff --git a/package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch b/package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch
> new file mode 100644
> index 0000000000..04f59a2050
> --- /dev/null
> +++ b/package/cryptsetup/0001-Add-check-program-for-symver-attribute.patch
> @@ -0,0 +1,56 @@
> +From 7c6ec620de3f99d4212f4a54aa576df1b97020ab Mon Sep 17 00:00:00 2001
> +From: Ondrej Kozina <okozina@redhat.com>
> +Date: Wed, 2 Feb 2022 11:34:57 +0100
> +Subject: [PATCH] Add check program for symver attribute.
> +
> +Fixes: #709.
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + configure.ac               | 11 +++++++++++
> + lib/libcryptsetup_symver.h |  8 +++-----
> + 2 files changed, 14 insertions(+), 5 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index a0e5990d..b052f8cf 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -554,6 +554,17 @@ if test "x$enable_static_cryptsetup" = "xyes"; then
> + 	PKG_CONFIG=$saved_PKG_CONFIG
> + fi
> +
> ++dnl Check compiler support for symver function attribute
> ++saved_CFLAGS=$CFLAGS
> ++CFLAGS="-O0 -Werror"
> ++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> ++	void _test_sym(void);
> ++	__attribute__((__symver__("sym@VERSION_4.2"))) void _test_sym(void) {}
> ++]],
> ++[[ _test_sym() ]]
> ++)],[ AC_DEFINE([HAVE_ATTRIBUTE_SYMVER], 1, [Define to 1 to use __attribute__((symver))])])
> ++CFLAGS=$saved_CFLAGS
> ++
> + AC_MSG_CHECKING([for systemd tmpfiles config directory])
> + PKG_CHECK_VAR([systemd_tmpfilesdir], [systemd], [tmpfilesdir], [], [systemd_tmpfilesdir=no])
> + AC_MSG_RESULT([$systemd_tmpfilesdir])
> +diff --git a/lib/libcryptsetup_symver.h b/lib/libcryptsetup_symver.h
> +index 2a804b6a..3558310d 100644
> +--- a/lib/libcryptsetup_symver.h
> ++++ b/lib/libcryptsetup_symver.h
> +@@ -67,11 +67,9 @@
> +  *   under CRYPT_SYMBOL_EXPORT_OLD(int, crypt_func_X, ...) macro
> +  */
> +
> +-#ifdef __has_attribute
> +-#  if __has_attribute(symver)
> +-#    define _CRYPT_SYMVER(_local_sym, _public_sym, _ver_str, _maj, _min)     \
> +-       __attribute__((__symver__(#_public_sym _ver_str #_maj "." #_min)))
> +-#  endif
> ++#if HAVE_ATTRIBUTE_SYMVER
> ++#  define _CRYPT_SYMVER(_local_sym, _public_sym, _ver_str, _maj, _min)     \
> ++     __attribute__((__symver__(#_public_sym _ver_str #_maj "." #_min)))
> + #endif
> +
> + #if !defined(_CRYPT_SYMVER) && defined(__GNUC__)
> +--
> +2.25.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
