Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2214CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE976418F9;
	Thu, 21 Apr 2022 17:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77XOlmj3m8vj; Thu, 21 Apr 2022 17:56:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 373A94168E;
	Thu, 21 Apr 2022 17:56:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E48A1BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3977B8301F
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3wpTRi654N-C for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:56:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4F4983148
 for <buildroot@busybox.net>; Thu, 21 Apr 2022 17:56:31 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h25so1716592wrc.13
 for <buildroot@busybox.net>; Thu, 21 Apr 2022 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sW5KJaTYs/mOlQX44CwIwRXfwwXPMaOgJuJxoNaSb7E=;
 b=FfImOHfrLuA+TOPqWhtx3FVGVclESrMmsu3su+DFRBwhItbj2DbdDvt1GPWNBDxXcK
 JCujWkoFzEHtREpYHi9NBdk0eoTDE0N8YY5XYY7UN88gB7Vq6VTP7qlYlymHjFeSNeSC
 FFjyoEpJnG+SNHLZTwZq5lNdNQPiC6STRt1ypfmW/oTDfph6H8e3FJG39ws9ruXVCBnJ
 ugp6H3jumvKA9CygpN1hkFIHmpcP5ykA3ACwusUexkn4cMcn2XbChyGlCaT/+eLqbcTu
 zlhueaynek3VGmrn5472Zx0rtwxkYHH66Q6K1JkuPDR/8JVkS9Lag7t01Xm2kXzs0llG
 O6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sW5KJaTYs/mOlQX44CwIwRXfwwXPMaOgJuJxoNaSb7E=;
 b=MgGLO+0qSAr35xn7h9VbsIcg8jLbPjw6jt5DMVRmrXPRYr32tTUrTG64P3vOuH35C1
 FFWpyAjxOVqfVbKMI/bhrP01R7KV+ZMPyIp3IOAA9+F00jKhu9F4MXreeM7CxhB8whK1
 FQLwPFK5yB4ffFJ9gjGYHtnv3PBtdo4KAMNS4Y1+4plKBG3UAvjKjSeIOsRvsNh/+5hw
 qkBsHi/uZNUIJrmaLq097KFOfW4Y0QR7iwT2XmblY4qmO1Yb66kKaumvYmLnUcTiwyTX
 9nqoJmwWjm/g4NzJWhUZZC+MqcFbq8mwQ2q+mQGKNIKEdEEUse8Zd0cVuw29OZueidsz
 GY8g==
X-Gm-Message-State: AOAM533D6S9UKhuy0uKpTxCSlZ3JPLn6+vXG5loE3+W6rpiduQayiEeM
 0lcGMFvTEYCIiV3huGnYdYReYg==
X-Google-Smtp-Source: ABdhPJxIzZSqNmm8e2xOJOyl8BkvnjY9mMc5Hf/ure/Kg9cFgrPAqTWCu5/VdZdLn2akm6fRjR3Ygw==
X-Received: by 2002:a05:6000:1542:b0:20a:a5d0:a30b with SMTP id
 2-20020a056000154200b0020aa5d0a30bmr677104wry.173.1650563789995; 
 Thu, 21 Apr 2022 10:56:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d5608000000b00207ab405d15sm2694340wrv.42.2022.04.21.10.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:56:29 -0700 (PDT)
Message-ID: <31a7215a-b322-d640-436d-d177aaa6803f@mind.be>
Date: Thu, 21 Apr 2022 19:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
References: <20220412101919.7454-1-mf@go-sys.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220412101919.7454-1-mf@go-sys.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: bump to version 9.0p1
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
Cc: Peter Seiderer <ps.report@gmx.net>, John Keeping <john@metanate.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/04/2022 12:19, Michael Fischer wrote:
> patch 0001: already applied upstream
> patch 0002: already applied upstream
> 
> https://www.openssh.com/txt/release-9.0
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...llow-ppoll_time64-in-seccomp-sandbox.patch | 32 ----------------
>   ...n-of-fzero-call-used-regs-all-suppor.patch | 38 -------------------
>   package/openssh/openssh.hash                  |  4 +-
>   package/openssh/openssh.mk                    |  2 +-
>   4 files changed, 3 insertions(+), 73 deletions(-)
>   delete mode 100644 package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
>   delete mode 100644 package/openssh/0002-Improve-detection-of-fzero-call-used-regs-all-suppor.patch
> 
> diff --git a/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
> deleted file mode 100644
> index 16eb6eaba2..0000000000
> --- a/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 284b6e5394652d519e31782e3b3cdfd7b21d1a81 Mon Sep 17 00:00:00 2001
> -From: Darren Tucker <dtucker@dtucker.net>
> -Date: Sat, 26 Feb 2022 14:06:14 +1100
> -Subject: [PATCH] Allow ppoll_time64 in seccomp sandbox.
> -
> -Should fix sandbox violations on (some? at least i386 and armhf) 32bit
> -Linux platforms.  Patch from chutzpahu at gentoo.org and cjwatson at
> -debian.org via bz#3396.
> -
> -[Upstream: https://github.com/openssh/openssh-portable/commit/284b6e5394652d519e31782e3b3cdfd7b21d1a81.patch]
> -Signed-off-by: John Keeping <john@metanate.com>
> ----
> - sandbox-seccomp-filter.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
> -index 2e065ba3..4ce80cb2 100644
> ---- a/sandbox-seccomp-filter.c
> -+++ b/sandbox-seccomp-filter.c
> -@@ -276,6 +276,9 @@ static const struct sock_filter preauth_insns[] = {
> - #ifdef __NR_ppoll
> - 	SC_ALLOW(__NR_ppoll),
> - #endif
> -+#ifdef __NR_ppoll_time64
> -+	SC_ALLOW(__NR_ppoll_time64),
> -+#endif
> - #ifdef __NR_poll
> - 	SC_ALLOW(__NR_poll),
> - #endif
> ---
> -2.35.1
> -
> diff --git a/package/openssh/0002-Improve-detection-of-fzero-call-used-regs-all-suppor.patch b/package/openssh/0002-Improve-detection-of-fzero-call-used-regs-all-suppor.patch
> deleted file mode 100644
> index ce5c5539ff..0000000000
> --- a/package/openssh/0002-Improve-detection-of-fzero-call-used-regs-all-suppor.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From b5fee5fe98f708c1dc61a1564db35eacadbfe8b3 Mon Sep 17 00:00:00 2001
> -From: Colin Watson <cjwatson@debian.org>
> -Date: Thu, 24 Feb 2022 16:04:18 +0000
> -Subject: [PATCH] Improve detection of -fzero-call-used-regs=all support
> -
> -GCC doesn't tell us whether this option is supported unless it runs into
> -the situation where it would need to emit corresponding code.
> -
> -[Upstream: https://github.com/openssh/openssh-portable/commit/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch]
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - m4/openssh.m4 | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/m4/openssh.m4 b/m4/openssh.m4
> -index 4f9c379..8c33c70 100644
> ---- a/m4/openssh.m4
> -+++ b/m4/openssh.m4
> -@@ -14,6 +14,8 @@ AC_DEFUN([OSSH_CHECK_CFLAG_COMPILE], [{
> - 	AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
> - #include <stdlib.h>
> - #include <stdio.h>
> -+/* Trivial function to help test for -fzero-call-used-regs */
> -+void f(int n) {}
> - int main(int argc, char **argv) {
> - 	(void)argv;
> - 	/* Some math to catch -ftrapv problems in the toolchain */
> -@@ -21,6 +23,7 @@ int main(int argc, char **argv) {
> - 	float l = i * 2.1;
> - 	double m = l / 0.5;
> - 	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
> -+	f(0);
> - 	printf("%d %d %d %f %f %lld %lld\n", i, j, k, l, m, n, o);
> - 	/*
> - 	 * Test fallthrough behaviour.  clang 10's -Wimplicit-fallthrough does
> ---
> -2.35.1
> -
> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
> index dd123c1bb6..4cfdb91484 100644
> --- a/package/openssh/openssh.hash
> +++ b/package/openssh/openssh.hash
> @@ -1,4 +1,4 @@
> -# From https://www.openssh.com/txt/release-8.9 (base64 encoded)
> -sha256  fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7  openssh-8.9p1.tar.gz
> +# From https://www.openssh.com/txt/release-9.0 (base64 encoded)
> +sha256  03974302161e9ecce32153cfa10012f1e65c8f3750f573a73ab1befd5972a28a  openssh-9.0p1.tar.gz
>   # Locally calculated
>   sha256  d6807e99f3d159145c659060f57c3fa74e109faa39326dbfc38674cb550fd104  LICENCE
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 84add9563d..63a28f3af5 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENSSH_VERSION_MAJOR = 8.9
> +OPENSSH_VERSION_MAJOR = 9.0
>   OPENSSH_VERSION_MINOR = p1
>   OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
>   OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
