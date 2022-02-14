Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4A3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDCF6400D9;
	Mon, 14 Feb 2022 21:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEw3l2SwDV_d; Mon, 14 Feb 2022 21:17:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 708BA40350;
	Mon, 14 Feb 2022 21:17:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5AE1BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BDDF81A64
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzOg35u3NOS8 for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:17:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E121281A2B
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:17:10 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id k25so40046131ejp.5
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 13:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=JxuzzUBRDuxrtzebyjQAOnJtJ2MucMMj829Y1Yzb01s=;
 b=RfH1bjx+eUfoKKTVH7f1ZZynR2S8PYhYb94aeCw+fftjm8//VIGBmruses5SFHGdJR
 TPsFCG8c1UeFRmFjkU82ODTfPc42iTtf+vCt2NgTqcaAPpd6G4npA5AY8VNNGSjssJjN
 Zo9OBA1mPQ3E0vvCySEUNW/J4+mgjwPTpvtOD8FrhhnVWuflxu82FDU6sQAi4tNMPKgC
 sjDUcrKo1exPodRAOyICvA9D2d+wA1wtAbiyGZ1YyB6UdbFDbgHVfUy59rcjK+726/vm
 XMv/wNK6dCG5pCGfgKoK/J0ijx6V8cZLbOmhilb4Mb7ps8tMI4n0tbZB20D1nwsHdhbX
 pCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JxuzzUBRDuxrtzebyjQAOnJtJ2MucMMj829Y1Yzb01s=;
 b=Gv3ELyPK4pp093EyA/eUcP9D8wqtsVAqUEsIZg7js+s1qGU8eTfSBcDi+8/GyVVt44
 AneWjvhknsPLYJv3DIDKLWbYT9Ms4YRmbsg60Zoki93lvAdUi2eIdnHDNi4huFF33tjC
 Fju718HdGAkbiT/7Xiftrsc1S6rbSgi8fQ2Ku39tDcqbtFGoUeWeF3R+vB8zkynVdZjl
 XMwgGHy0fTEyYoboAsPh2WcsLhuXgranogedYyhxqUCHNPKU8CJuP8fLYFpB3Ss2wQB9
 zoyv2u49TCs+mRy2gmU91FCPESa/J1V7zz13SYnKB/yL5c+Yg+JnZZEw2S5QPlXjw9Fe
 vwQw==
X-Gm-Message-State: AOAM533MfZVucTQHegZZ1ykhLMp9PHUxmqoonm8CtGE8eF34C0NatpfJ
 fisGVOsExrVGf83g2Fh46CbnxGkofu811w==
X-Google-Smtp-Source: ABdhPJyGVEklnJ9RwlQkgKXoPBvmSm8xEwwS6CtqOKLFFoSH/NhDlsMddJA29873kgUsBuPP5pj2PA==
X-Received: by 2002:a17:906:64cd:: with SMTP id
 p13mr545792ejn.297.1644873429057; 
 Mon, 14 Feb 2022 13:17:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e20sm1046586ejm.133.2022.02.14.13.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 13:17:08 -0800 (PST)
Message-ID: <f2c88463-2ae6-b010-6e68-1d959e304e39@mind.be>
Date: Mon, 14 Feb 2022 22:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220209002308.137832-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220209002308.137832-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCHv2] package/poke: bump to version 2.1
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



On 09/02/2022 01:23, Romain Naour wrote:
> Tested locally with poke testsuite on aarch64 with Qemu:
> 
>           === poke Summary ===
>   # of expected passes		6320
>   # of unsupported tests		7
> 
> Build tested with test-pkg:
> https://gitlab.com/kubu93/buildroot/-/pipelines/466516470
> 
> See:
> http://www.jemarch.net/poke-2.0-relnotes.html
> http://www.jemarch.net/poke-2.1-relnotes.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
> test-pkg config:
> BR2_PACKAGE_POKE=y
> BR2_PACKAGE_JSON_C=y
> 
> v2: poke 2.0 had a issue with minimal-threading on
> several architectures (not only ARM thumb2), this feature
> is now disabled by default with poke 2.1.
> ---
>   ...P2MAN-replace-by-true-when-cross-com.patch |  6 ++--
>   ...andom.c-fix-build-with-uclibc-1.0.35.patch | 28 +++++++++----------
>   package/poke/poke.hash                        |  2 +-
>   package/poke/poke.mk                          |  2 +-
>   4 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
> index c169516153..85a76e068e 100644
> --- a/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
> +++ b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
> @@ -1,4 +1,4 @@
> -From b35dadae6371c3727cac46ae5bd348b66aa411fc Mon Sep 17 00:00:00 2001
> +From 51fb81264323f01a86dd0bdeaf1c7a044a9cb6dc Mon Sep 17 00:00:00 2001
>   From: Romain Naour <romain.naour@gmail.com>
>   Date: Fri, 30 Apr 2021 15:43:59 +0200
>   Subject: [PATCH] configure.ac: HELP2MAN replace ':' by 'true' when
> @@ -17,10 +17,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index 2c6f1aef..9c4c9be2 100644
> +index a1943b57..c633f719 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -74,7 +74,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
> +@@ -90,7 +90,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
>    if test $cross_compiling = no; then
>      AM_MISSING_PROG(HELP2MAN, help2man)
>    else
> diff --git a/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
> index 757dc3f760..bd20b5d2c6 100644
> --- a/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
> +++ b/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
> @@ -1,4 +1,4 @@
> -From a0594387565e1e6b4a8a8ba04ad13b135cc1f0b5 Mon Sep 17 00:00:00 2001
> +From 236b019b83228d2e37fa07635fb6864ed7dc5fad Mon Sep 17 00:00:00 2001
>   From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   Date: Thu, 1 Apr 2021 07:49:46 +0200
>   Subject: [PATCH] lib/getrandom.c: fix build with uclibc < 1.0.35
> @@ -15,7 +15,7 @@ In file included from ./sys/random.h:40,
>   /tmp/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
>       7 | #include <features.h>
>     +++ |+#include <stddef.h>
> -    8 |
> +    8 |
>   
>   This patch is not upstreamable as it is only a workaround for
>   uclibc < 1.0.35, upstream uclibc has been patched with
> @@ -26,15 +26,15 @@ Fixes:
>   
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   ---
> - jitter/gnulib-local/getrandom.c | 1 +
> - gl/getrandom.c                  | 1 +
>    gl-libpoke/getrandom.c          | 1 +
> + gl/getrandom.c                  | 1 +
> + jitter/gnulib-local/getrandom.c | 1 +
>    3 files changed, 3 insertions(+)
>   
> -diff --git a/jitter/gnulib-local/getrandom.c b/jitter/gnulib-local/getrandom.c
> -index 41212fb32..0ad3f9648 100644
> ---- a/jitter/gnulib-local/getrandom.c
> -+++ b/jitter/gnulib-local/getrandom.c
> +diff --git a/gl-libpoke/getrandom.c b/gl-libpoke/getrandom.c
> +index e146873..3948d8d 100644
> +--- a/gl-libpoke/getrandom.c
> ++++ b/gl-libpoke/getrandom.c
>   @@ -19,6 +19,7 @@
>    
>    #include <config.h>
> @@ -44,7 +44,7 @@ index 41212fb32..0ad3f9648 100644
>    
>    #include <errno.h>
>   diff --git a/gl/getrandom.c b/gl/getrandom.c
> -index 41212fb32..0ad3f9648 100644
> +index e146873..3948d8d 100644
>   --- a/gl/getrandom.c
>   +++ b/gl/getrandom.c
>   @@ -19,6 +19,7 @@
> @@ -55,10 +55,10 @@ index 41212fb32..0ad3f9648 100644
>    #include <sys/random.h>
>    
>    #include <errno.h>
> -diff --git a/gl-libpoke/getrandom.c b/gl-libpoke/getrandom.c
> -index 41212fb32..0ad3f9648 100644
> ---- a/gl-libpoke/getrandom.c
> -+++ b/gl-libpoke/getrandom.c
> +diff --git a/jitter/gnulib-local/getrandom.c b/jitter/gnulib-local/getrandom.c
> +index e146873..3948d8d 100644
> +--- a/jitter/gnulib-local/getrandom.c
> ++++ b/jitter/gnulib-local/getrandom.c
>   @@ -19,6 +19,7 @@
>    
>    #include <config.h>
> @@ -68,5 +68,5 @@ index 41212fb32..0ad3f9648 100644
>    
>    #include <errno.h>
>   --
> -2.30.2
> +2.31.1
>   
> diff --git a/package/poke/poke.hash b/package/poke/poke.hash
> index 1367262f54..c30713b91c 100644
> --- a/package/poke/poke.hash
> +++ b/package/poke/poke.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  ce054df29560c921230132703ee449fe130b6e25ab03aa6cc796bb401506aa24  poke-1.4.tar.gz
> +sha256  cd528e6c1bbc540c3b629c2b4f36b784b30a026b005a38b99283422599442670  poke-2.1.tar.gz
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  jitter/COPYING
> diff --git a/package/poke/poke.mk b/package/poke/poke.mk
> index ddd03ae3b0..2852673548 100644
> --- a/package/poke/poke.mk
> +++ b/package/poke/poke.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -POKE_VERSION = 1.4
> +POKE_VERSION = 2.1
>   POKE_SITE = $(BR2_GNU_MIRROR)/poke
>   # gnulib license is a mix/mess of public-domain and various GPL and LGPL versions.
>   POKE_LICENSE = GPL-3.0+, GPL-3.0+ (jitter), gnulib license (gnulib)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
