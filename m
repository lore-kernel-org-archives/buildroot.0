Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D2EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A4FF81BBD;
	Mon, 20 Dec 2021 22:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGsxAuKlqsoM; Mon, 20 Dec 2021 22:39:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E26D819D1;
	Mon, 20 Dec 2021 22:39:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 280611BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2557B40629
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZXPpCa5qxGn for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:39:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20BF5405C8
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:39:49 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id j21so39958150edt.9
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y4hXRUK9S3LV0EvV2bU84AOxw8IeiAzSA1cifhb+Bbs=;
 b=Qk3YdMc2SF1y+LLSGVCPhQ599d1Z3Xy5mdSdcFse/avv+x4D+IaObyeShYoq+J21w4
 Dd53AZkapyxPJbT24AJk7cVVb+3j68rVjENkUeTJuIFjqdOAxRQfNBQkKiyMQ1doH5mC
 sz4BPAvwXWrtuao3Jmv9r2qZjntB7uAWfZfJnMNYvUWCLzKIKRVpOTRBRa2eLW9OZekw
 qwDtI9cfw+xAZSKvE0zsY1QakHgDBYTMngVYd0VjblJpvU0Rg/rE8gvjZ96HWgdlq3SK
 ke2FDFNSDrrVgnXHQhzG9TSlIWMt7g/WaD7G8C9ZIn+owRgcQRrTvmKHRzTp284ZvVAS
 e0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y4hXRUK9S3LV0EvV2bU84AOxw8IeiAzSA1cifhb+Bbs=;
 b=NFdB1ndDLr89DQc3KIhnPXjXDP9gcXt3VreP+NI7cLwNNu2vx5AOyYRlJIaSZwNPUy
 tBWD1B0YwyYoR7+of1rBOO0ULDZidOorEpL3sKpyfxgZBTh5l33BzB9PYrZ4AEyHGn+w
 GXEtc097/cD3CEbBL9/6vPQ55Yk/sCldZVOH33uI/4cTIZWVPI2o2KYTTqc/42qIdUSV
 5GjbjVFeCP6pcZ3qmKp5+GZ8dTCgncLxgObxgmkL0iC2hDg7nuDZiaTgqDod3YbMG0Fx
 BqhDvLF0LBSPU0WbVSD3AHnyay33zTJqRFk+WoCimpgcSMovulTG0V2FFmOEKoDDPE1I
 bd/w==
X-Gm-Message-State: AOAM531XoF7RBt9U3NQk/GFJxDpFNQNw69cljDzrggXrUtj/Eg64UMAb
 qNHiQ6r3asOSnFv4HL/y3akLVQ==
X-Google-Smtp-Source: ABdhPJx8MZeFdt8nC3/958ulOiZoQ2u8XGzqbG2NigJ7i26OHlNwZUljKb/dvV0QJjoESrw+dgjx5g==
X-Received: by 2002:a17:907:3d94:: with SMTP id
 he20mr274585ejc.14.1640039987389; 
 Mon, 20 Dec 2021 14:39:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p7sm7274819edu.84.2021.12.20.14.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:39:46 -0800 (PST)
Message-ID: <86e9ade2-ce8b-7c28-2c00-14627c8d72c9@mind.be>
Date: Mon, 20 Dec 2021 23:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211219153207.1084655-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211219153207.1084655-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/jitterentropy-library: fix
 build without stack-protector
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



On 19/12/2021 16:32, Fabrice Fontaine wrote:
> Fix the following build failure without stack-protector raised since
> bump to version 3.3.1 in commit 3965f09cb427af411055a783cd14b501b2b28285
> and
> https://github.com/smuellerDD/jitterentropy-library/commit/5b3cb7f35e41ba2f34a75d004cf095c965a1a0c4:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/jitterentropy-base.o: in function `jent_fips_enabled':
> jitterentropy-base.c:(.text+0x131): undefined reference to `__stack_chk_fail_local'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8de/8dee462d16d934dd173d58f17933c6911e4336bf/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, after adding the explanation about the toolchain wrapper to 
the commit message, thanks.

  Regards,
  Arnout

> ---
>   ...-Makefile-add-ENABLE_STACK_PROTECTOR.patch | 52 +++++++++++++++++++
>   .../jitterentropy-library.mk                  |  2 +-
>   2 files changed, 53 insertions(+), 1 deletion(-)
>   create mode 100644 package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
> 
> diff --git a/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch b/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
> new file mode 100644
> index 0000000000..c4388663b0
> --- /dev/null
> +++ b/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
> @@ -0,0 +1,52 @@
> +From 272ee47892563e849f6b1bf59b0173f8aa33b631 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 19 Dec 2021 11:36:13 +0100
> +Subject: [PATCH] Makefile: add ENABLE_STACK_PROTECTOR
> +
> +Add ENABLE_STACK_PROTECTOR as build on embedded toolchains without
> +stack-protector is again broken since
> +https://github.com/smuellerDD/jitterentropy-library/commit/5b3cb7f35e41ba2f34a75d004cf095c965a1a0c4:
> +
> +/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/jitterentropy-base.o: in function `jent_fips_enabled':
> +jitterentropy-base.c:(.text+0x131): undefined reference to `__stack_chk_fail_local'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/8dee462d16d934dd173d58f17933c6911e4336bf
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Signed-off-by: Stephan Mueller <smueller@chronox.de>
> +[Retrieved from:
> +https://github.com/smuellerDD/jitterentropy-library/commit/272ee47892563e849f6b1bf59b0173f8aa33b631]
> +---
> + Makefile | 11 +++++++----
> + 1 file changed, 7 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index dfb96a8..c999ef5 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -2,6 +2,7 @@
> +
> + CC ?= gcc
> + #Hardening
> ++ENABLE_STACK_PROTECTOR ?= 1
> + CFLAGS ?= -fwrapv --param ssp-buffer-size=4 -fvisibility=hidden -fPIE -Wcast-align -Wmissing-field-initializers -Wshadow -Wswitch-enum
> + CFLAGS +=-Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion
> + LDFLAGS +=-Wl,-z,relro,-z,now -lpthread
> +@@ -13,10 +14,12 @@ else
> +   GCC_GTEQ_490 := $(shell expr `$(CC) -dumpfullversion | sed -e 's/\.\([0-9][0-9]\)/\1/g' -e 's/\.\([0-9]\)/0\1/g' -e 's/^[0-9]\{3,4\}$$/&00/'` \>= 40900)
> + endif
> +
> +-ifeq "$(GCC_GTEQ_490)" "1"
> +-  CFLAGS += -fstack-protector-strong
> +-else
> +-  CFLAGS += -fstack-protector-all
> ++ifeq "$(ENABLE_STACK_PROTECTOR)" "1"
> ++  ifeq "$(GCC_GTEQ_490)" "1"
> ++    CFLAGS += -fstack-protector-strong
> ++  else
> ++    CFLAGS += -fstack-protector-all
> ++  endif
> + endif
> +
> + # Change as necessary
> diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
> index 830da0e065..4cdebf46a3 100644
> --- a/package/jitterentropy-library/jitterentropy-library.mk
> +++ b/package/jitterentropy-library/jitterentropy-library.mk
> @@ -26,7 +26,7 @@ endif
>   
>   define JITTERENTROPY_LIBRARY_BUILD_CMDS
>   	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> -		$(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
> +		ENABLE_STACK_PROTECTOR=0 $(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
>   endef
>   
>   define JITTERENTROPY_LIBRARY_INSTALL_STAGING_CMDS
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
