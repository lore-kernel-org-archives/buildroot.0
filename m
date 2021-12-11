Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35ADC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 09:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F51D4242F;
	Sat, 11 Dec 2021 09:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZEYO6UIYwJd; Sat, 11 Dec 2021 09:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB1CE4242B;
	Sat, 11 Dec 2021 09:58:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 252ED1BF363
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A22842364
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpxvfPyjAcnq for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 09:58:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2911400C6
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 09:58:07 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id t5so36761525edd.0
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 01:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tOMYAFJWeFxEDO/5DIO2RCuLqexxqkds54kfrjUX3uQ=;
 b=azF5JIYHhSXPrcUtwmrRRBL2Hi7k+XZyxZrQCh5uyfmvNEyZ6TjHOPxeUVmaaE1VJN
 V7RSJ7y/iXA8Noz1DOGg2h5N9hGNCglpH8HeCigQQoQLNxCHwGdBHcr3S2Sbgpcvtc+K
 gQpSFcQKpHXm5OxgNOI/qNoZKLtBZoAvUnYj1+PWzGRO2ho356+SpYSAbn98iD5+BIvW
 Gnaf07N0ypS53qZEJ4imjNu2JSQQT/YXaTyAnOQ4WNDLl3BLKFR5+GPP0G0eaXOPr3El
 1vjTb0PPvyX60n14TOe8QEFJ3IwP+03blsg9+bOB5Qu84Is15z3K11H9TiAKxRaUYOuh
 TIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tOMYAFJWeFxEDO/5DIO2RCuLqexxqkds54kfrjUX3uQ=;
 b=EoFw2EM8rukdQuF4A+VYaJ13yNgi54FluaKpGu/5wLjYpLfOvqMU4kH2OcKW2RjUkz
 qTHYKpENAgYgQzGaF4hITOKBXB58V/lO0HrUB3DWllX0FyQvwYOh3eNvPpYtUXt2rdke
 /mfVVkFneeKX72ld5qKERYU+7EWmWUeynUFCB5ZI+JsUOuj0Q4cm/9ErKRxcIK2+Ao6r
 5TTadUn/XoY38BlysxqMgvQnC3igAwhqRfiHcxe1Ft/zgn+HTHO87Gay4E/mx2FncJeT
 sCq7oIQ6MzPRuiclk+hBYAH/72b9kYPavC5YogZ/QyEr2xTnJxbt2rfYxR1t9lJlB9Hk
 +1nQ==
X-Gm-Message-State: AOAM532Z7n9jehXGZGCXcSb++mh1ckxek3kb/HGG82NSaZEdFqfwVopU
 rIVVsObRsddHIIRgPXVC+A0gmINTOevJVTB6qEo=
X-Google-Smtp-Source: ABdhPJzX9B5Z76fAduh8zViCQMG97RDsf3wydvC2ZKwiCbWMTQ1/Z/nwdbAgs35IpsP8O452cSYjSw==
X-Received: by 2002:a05:6402:3488:: with SMTP id
 v8mr47552295edc.398.1639216685940; 
 Sat, 11 Dec 2021 01:58:05 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h2sm2834467edl.85.2021.12.11.01.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 01:58:05 -0800 (PST)
Message-ID: <1cc57fb6-6ca5-e82d-e748-780028b748b8@mind.be>
Date: Sat, 11 Dec 2021 10:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211115221805.3956738-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211115221805.3956738-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/capnproto: bump to version 0.9.1
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
Cc: Koen Martens <gmc@sonologic.nl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/11/2021 23:18, Fabrice Fontaine wrote:
> - Drop patch (already in version)
> - Fix build on musl by disabling fibers through the new KJ_USE_FIBERS
>    variable:
>    https://github.com/capnproto/capnproto/issues/1167
>    https://github.com/capnproto/capnproto/pull/1313
> - Update indentation in hash file (two spaces)
> 
> https://capnproto.org/news
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/1a54cf9e7223c2bd67a5c85a6f2f42aa98da3a53

  I've applied to master now, but hte build error of course still exists on the 
2021.11 branch.

  Regards,
  Arnout

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...it-architectures-using-64-bit-time_t.patch | 37 -------------------
>   package/capnproto/capnproto.hash              |  4 +-
>   package/capnproto/capnproto.mk                |  7 +++-
>   3 files changed, 8 insertions(+), 40 deletions(-)
>   delete mode 100644 package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
> 
> diff --git a/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch b/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
> deleted file mode 100644
> index ce70ab8f29..0000000000
> --- a/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From e2a05a19e9dc51287e19cc9f11fd91449219e361 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 15 Nov 2020 12:10:28 -0800
> -Subject: [PATCH] mutex: Fix build on 32-bit architectures using 64-bit time_t
> -
> -mutex code uses SYS_futex, which it expects from system C library.
> -in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
> -rv32 is using 64bit time_t from get go unlike other 32bit architectures
> -in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
> -this aliases it to NR_futex so that SYS_futex is then defined for rv32
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -[Retrieved from:
> -https://github.com/capnproto/capnproto/commit/e2a05a19e9dc51287e19cc9f11fd91449219e361]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - c++/src/kj/mutex.c++ | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/c++/src/kj/mutex.c++ b/c++/src/kj/mutex.c++
> -index c81cead7b..e1594b117 100644
> ---- a/c++/src/kj/mutex.c++
> -+++ b/c++/src/kj/mutex.c++
> -@@ -39,7 +39,13 @@
> -
> - #ifndef SYS_futex
> - // Missing on Android/Bionic.
> -+#ifdef __NR_futex
> - #define SYS_futex __NR_futex
> -+#elif defined(SYS_futex_time64)
> -+#define SYS_futex SYS_futex_time64
> -+#else
> -+#error "Need working SYS_futex"
> -+#endif
> - #endif
> -
> - #ifndef FUTEX_WAIT_PRIVATE
> diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
> index d4500e0aad..7fd0e6158b 100644
> --- a/package/capnproto/capnproto.hash
> +++ b/package/capnproto/capnproto.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256	6d8b43a7ec2a764b4dfe4139a7cdd070ad9057f106898050d9f4db3754b98820  capnproto-0.8.0.tar.gz
> -sha256	9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
> +sha256  daf49f794560f715e2f4651c842aaece2d065d4216834c5c3d3254962e35b535  capnproto-0.9.1.tar.gz
> +sha256  9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
> diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
> index 901b57ecda..7fc07043fb 100644
> --- a/package/capnproto/capnproto.mk
> +++ b/package/capnproto/capnproto.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CAPNPROTO_VERSION = 0.8.0
> +CAPNPROTO_VERSION = 0.9.1
>   CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
>   CAPNPROTO_LICENSE = MIT
>   CAPNPROTO_LICENSE_FILES = LICENSE
> @@ -29,5 +29,10 @@ else
>   CAPNPROTO_CONF_OPTS += --without-openssl
>   endif
>   
> +# musl doesn't support getcontext/setcontext
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +CAPNPROTO_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DKJ_USE_FIBERS=0"
> +endif
> +
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
