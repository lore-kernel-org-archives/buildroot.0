Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757D0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3048F40ACA;
	Thu, 21 Apr 2022 19:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOjWwsqpSt49; Thu, 21 Apr 2022 19:54:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10C0440AA3;
	Thu, 21 Apr 2022 19:54:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 320681BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 113B440AA3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPOz7ESgRD2S for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:54:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF1BB40A98
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:54:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so4117627wmn.1
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 12:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a/7OS0ew5KFwgiY71nQsJZft5CLOLCdjHunknpD0CmI=;
 b=BDIycduzmEVkrB7I1gzLwDaVVfcmw0nopyVrj6im3qQK76bR+TXjfL8lY3hlnpKYQU
 Uv26nL2L0RwcHm21GZcCKMnVZzmTP91yFP+McQN1MTJDSrSxkanX0dj2mmGlmrc0xoRx
 BgJUcbpWTYnkJZ/GmEFZHtn/GSXdQJaBDu+gcpYcQWj1N4znWtsYb9u9Arpw5MfGFwRB
 IINdkTqRCKKe4G/v3VxYbf1o1o/+0RRY9Fyewh38ejKT6tu2do2cr+ZIdGetmIE7cAXi
 j3FsThyuLbwV/rbrco6TOkTqBZGjWwiNrAyYxv5Z/SLQGmSIId/jzTHCAqrik0EpB9tr
 nXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a/7OS0ew5KFwgiY71nQsJZft5CLOLCdjHunknpD0CmI=;
 b=mXvFPtoL5hZt1mMPmKNAec9ZH0UfgI/ZQP0h2JZ1x7+WOYsxmRPEvsito07RnA7edx
 risCa8LDMZ3RZwHlUrn2EqUU144VV4Mk1XbJNQD5RcyHnYOpdGXJg2DG6ut37c312uSS
 X0FVpn2RPo4TSnO2nRgAPAgMwEeMKMgtFJFuQ7LToltJUw3Ja0B8mm1NMP95lzhXm5JP
 N93hscnVMhO5AstGWF8nrNJKXV3tQDd+BRDPOvTpN4F0G6i34eLb+fphBwCx2gfX4pNp
 T8Ptkh7LqW57hnJ2PNthp34+oopR8wrCxrBaXBxJnlH9JVTvEGp/uv98HHCLUFNfkJUZ
 YOSg==
X-Gm-Message-State: AOAM531iUAxwnzMctZqqaGevwk0I0uPQsyM2EEmHCHhMUQMC3WTkarmu
 GJXSfXU0cYvZjnYXgIrbPXdOeA==
X-Google-Smtp-Source: ABdhPJzel8YVrR+lweJSpHLVGX8gacgzxUXco5fHZ4qUckfs0AYuA6E0F0OQ13qFw8vNjl0ZkQRylg==
X-Received: by 2002:a05:600c:19cc:b0:392:8dbc:228e with SMTP id
 u12-20020a05600c19cc00b003928dbc228emr864613wmq.131.1650570877871; 
 Thu, 21 Apr 2022 12:54:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b00391447f7fd4sm3050385wmq.24.2022.04.21.12.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 12:54:37 -0700 (PDT)
Message-ID: <55c0f7da-0907-b920-5a9b-33a82dcdb32b@mind.be>
Date: Thu, 21 Apr 2022 21:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20220414204922.866533-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220414204922.866533-1-christian@paral.in>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: add support for riscv64
 architecture
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2022 22:49, Christian Stewart via buildroot wrote:
> Enable the supported "riscv64" GOARCH.
> 
> Add a patch to fix a build failure due to GOARCH leaking into the calls to the
> go-bootstrap compiler. Unsets the GOARCH before calling go-bootstrap.
> 
> PR: https://github.com/golang/go/pull/52362
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---
> 
> v1 -> v2:
> 
>   - fixed build error with go-bootstrap
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>   ...explicit-option-for-crosscompilation.patch |   8 +-
>   ...set-environment-before-generating-bu.patch | 111 ++++++++++++++++++
>   package/go/Config.in.host                     |   2 +-
>   package/go/go.mk                              |   2 +
>   4 files changed, 118 insertions(+), 5 deletions(-)
>   create mode 100644 package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
> 
> diff --git a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
> index f76c5b1d03..a32a6ee355 100644
> --- a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
> +++ b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
> @@ -1,4 +1,4 @@
> -From e1382a731a726293e30901038c6870fa77ef6095 Mon Sep 17 00:00:00 2001
> +From 86fa3da18b5c73cc84dec91d92db4ae95f288bdc Mon Sep 17 00:00:00 2001
>   From: Angelo Compagnucci <angelo@amarulasolutions.com>
>   Date: Tue, 8 May 2018 16:08:44 +0200
>   Subject: [PATCH] build.go: explicit option for crosscompilation
> @@ -17,10 +17,10 @@ Signed-off-by: Anisse Astier <anisse@astier.eu>
>    1 file changed, 2 insertions(+), 1 deletion(-)
>   
>   diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> -index 99d1db5..eb4097f 100644
> +index d37c3f83ef..d838485bd3 100644
>   --- a/src/cmd/dist/build.go
>   +++ b/src/cmd/dist/build.go
> -@@ -252,12 +252,13 @@ func xinit() {
> +@@ -273,12 +273,13 @@ func xinit() {
>    // $CC_FOR_goos_goarch, if set, applies only to goos/goarch.
>    func compilerEnv(envName, def string) map[string]string {
>    	m := map[string]string{"": def}
> @@ -36,5 +36,5 @@ index 99d1db5..eb4097f 100644
>    		}
>    		m[""] = env
>   --
> -2.7.4
> +2.35.1
>   
> diff --git a/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch b/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
> new file mode 100644
> index 0000000000..44b3fbecc2
> --- /dev/null
> +++ b/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
> @@ -0,0 +1,111 @@
> +From 00f3f4ee0d477779c87e4e60b08708362670e122 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Thu, 14 Apr 2022 13:34:26 -0700
> +Subject: [PATCH] build: bootstrap: set environment before generating buildcfg
> +
> +The GOOS and GOARCH environment variables should be unset before calling
> +mkbuildcfg. This change fixes a build failure when GOARCH=riscv64.
> +
> +Building Go toolchain1 using go-1.4-bootstrap-20171003.
> +src/cmd/compile/internal/ssa/rewriteRISCV64.go:4814
> +invalid operation: y << x (shift count type int64, must be unsigned integer)
> +
> +There is a build issue with go1.4 with the riscv64 code: however, why is the
> +riscv64 code being compiled at all?
> +
> +GOARCH is set when calling mkbuildcfg, so go1.4 is trying to compile riscv64.

  You SoB is missing.

  Also, the reference to the upstream PR is missing. And you should probably 
refer to gerrit instead.

[snip]
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index e82ab6e81a..8be86103ea 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
>   	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
>   		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
> -		|| BR2_mips64 || BR2_mips64el || BR2_s390x
> +		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x

  Here you enable it both for riscv32 and riscv64, but below you always set 
GOARCH to riscv64.

  Also, are you sure it doesn't need any of the ISA extensions? I can imagine 
that Go would be using atomics, floating point and integer 
multiplication/division. Of course, there's almost no chance of finding a 
riscv64 without these extensions, but better be correct, right?

  Also, does Go support all three ABI types (integer, single precision and 
double precision)? Again, we only ever test lp64d in the autobuilders, but 
better be correct, right?

  Regards,
  Arnout

>   	depends on !BR2_ARM_CPU_ARMV4
>   	# MIPS R6 support in Go has not yet been developed.
>   	depends on !BR2_MIPS_CPU_MIPS64R6
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 3df16c9a68..ba0da74b86 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -63,6 +63,8 @@ else ifeq ($(BR2_mips64),y)
>   GO_GOARCH = mips64
>   else ifeq ($(BR2_mips64el),y)
>   GO_GOARCH = mips64le
> +else ifeq ($(BR2_riscv),y)
> +GO_GOARCH = riscv64
>   else ifeq ($(BR2_s390x),y)
>   GO_GOARCH = s390x
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
