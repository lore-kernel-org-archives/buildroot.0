Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CF0C43217
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE72D81970;
	Mon, 14 Feb 2022 20:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bF7g_w7cx8pM; Mon, 14 Feb 2022 20:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278D6818DC;
	Mon, 14 Feb 2022 20:46:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 780201BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7424C401EE
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U060Fhm0R4iD for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:46:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74EEA401B8
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:46:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h6so28792816wrb.9
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6iz/njw10tXvK+oXdE8lqvKthfv5KkkJeGt5VNsrClI=;
 b=LzSDaabe5CVklvAiflvrHSY4kGK0f5K+UqTi7EstZ3UrzG2apyo1hLbbw2F3s/6JVc
 I+S2tkkHtXbfP+Y1Fnrp2Evv657lg4bsj6Gy19J5bY0qul9UUiuJGjG1Fr2hwhoTgWoO
 zb6hLnyiG35ikjmUknFXL25xhaLJbvM1HvFWkPGX2EIjIrhv/+CQIlpFph3J3eyLiPwP
 rudJAFRsbS3rptm1HetP+Crdh07um9tgFTuxJESK/xfJHoak9n4lliZ0PjZLsrSs+Hhn
 FZBfnahb52BiYjRifc1LS7iny42P50kv9MJA634A5wCfILDVEUWz4A7Zw0FPq2zbPYbg
 HsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6iz/njw10tXvK+oXdE8lqvKthfv5KkkJeGt5VNsrClI=;
 b=mIVe0BQtrT3DSlYndM2daSdtCAlSPRGDEyMrh5AZcLhq5oXMstU4hOtiPm6xMgg//Y
 1jglbBJCwiAu3yB4QQQTvZFDQIflytzeUMX1X4q7ueQVVWB6BxGzXyiIcmXSgTLzTkj9
 xOv0DcdaUDq/EsRzGsD+KlyEitCFm7q1ZciEPpdmZV1NlXuP9o6AT2rgPFU+9ndnCz+D
 4GCitZi8vopZ6CwIjMaR1Lcuyl+0Pl0VJKkc1DVEdjPRHW68+IHPDDnATLqYgYwBNVmN
 wLPsWo3rNx/1ncGay4QVT0fBjJzo6nvrJF2xlhvGGV0fcLVeD5TA69fJbm7umx53f3e5
 iWAA==
X-Gm-Message-State: AOAM530OrKbjSR5HL1NtoN2hfFJEsFtDPlqt4isJD7yXgSZhmdIBI/9x
 IaEG9THSPfD4aa2RocE9kZTFoQ==
X-Google-Smtp-Source: ABdhPJxcWA/ZodcHvbfKxNahVlXVdet708rlCIRjB+1uMlPeBBDrbQ8TvQeewLG1oCxjiW1PKU/0lA==
X-Received: by 2002:adf:d183:: with SMTP id v3mr617562wrc.538.1644871599752;
 Mon, 14 Feb 2022 12:46:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l20sm13559090wmq.22.2022.02.14.12.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:46:39 -0800 (PST)
Message-ID: <234a1e78-f2cc-9ac1-55b9-9817d51acc89@mind.be>
Date: Mon, 14 Feb 2022 21:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220209192048.319559-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220209192048.319559-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mongrel2: fix build with gcc 4.8
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
Cc: Lionel Orry <lionel.orry@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/02/2022 20:20, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 1.13.0 in
> commit b0a7bffad9e041d9920171802621b67903f9389e:
> 
> arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough=0'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/de324b733e09057c87352220069fe65f6e535eb8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0003-fix-build-with-gcc-4.8.patch         | 60 +++++++++++++++++++
>   1 file changed, 60 insertions(+)
>   create mode 100644 package/mongrel2/0003-fix-build-with-gcc-4.8.patch
> 
> diff --git a/package/mongrel2/0003-fix-build-with-gcc-4.8.patch b/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
> new file mode 100644
> index 0000000000..eebfce0487
> --- /dev/null
> +++ b/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
> @@ -0,0 +1,60 @@
> +From cc2dd3995dc9a9e6f0e705e11e791f3f3c7d7326 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 18 Jan 2022 22:41:36 +0100
> +Subject: [PATCH] fix build with gcc 4.8
> +
> +Drop "-Wno-unused-const-variable -Wimplicit-fallthrough=0" as
> +"-Wno-implicit-fallthrough -Wno-unused-const-variable" is already set in
> +CFLAGS. This will avoid the following build failure with gcc 4.8 raised
> +since version 1.13.0 and
> +https://github.com/mongrel2/mongrel2/commit/725209578599bd7784753d86aee34f6441ff78a5:
> +
> +arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough=0'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/de324b733e09057c87352220069fe65f6e535eb8
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/mongrel2/mongrel2/pull/354]
> +---
> + Makefile            | 1 -
> + tools/m2sh/Makefile | 4 ++--
> + 2 files changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index f6627ed..fb8d028 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -22,7 +22,6 @@ all: bin/mongrel2 tests m2sh procer
> +
> + ${OBJECTS_NOEXT}: CFLAGS += ${NOEXTCFLAGS}
> + ${OBJECTS}: | builddirs
> +-$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0
> +
> + .PHONY: builddirs
> + builddirs:
> +diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
> +index 83e7ae4..86364af 100644
> +--- a/tools/m2sh/Makefile
> ++++ b/tools/m2sh/Makefile
> +@@ -10,7 +10,7 @@ LIB_SRC=$(filter-out src/m2sh.c,${SOURCES})
> + LIB_OBJ=$(filter-out src/m2sh.o,${OBJECTS})
> + RAGEL_OBJECTS=src/lexer.o src/cli.o
> +
> +-$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0 -Wno-unused-parameter
> ++$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-parameter
> +
> + all: ../lemon/lemon tests build/m2sh
> +
> +@@ -20,7 +20,7 @@ dev: all
> + install: build/m2sh
> + 	install build/m2sh ${DESTDIR}${PREFIX}/bin
> +
> +-src/parser.o: CFLAGS += -Wno-unused-const-variable -Wno-unused-parameter
> ++src/parser.o: CFLAGS += -Wno-unused-parameter
> +
> + build/libm2sh.a: ${LIB_OBJ}
> + 	mkdir -p build
> +--
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
