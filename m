Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5204BC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E243460AA3;
	Mon,  6 Feb 2023 10:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E243460AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDxAsf1LmQLr; Mon,  6 Feb 2023 10:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 163C360A89;
	Mon,  6 Feb 2023 10:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 163C360A89
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F95F1BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7919A60759
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7919A60759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uHvo4Iyas1gI for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:57:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C27CD60A89
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C27CD60A89
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:57:14 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id ba1so5890688wrb.5
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 02:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k7kachpnsG8VWCVK2MsapgBIhwUPrA3MDnuSzgEdaIU=;
 b=zrRzkij6yNTUL5Ky1dBJ56YZqmXCbWFI0Q38nPp3lBLMZO8V1C8CmCrwdPTwQ0PUVF
 GAHs8oqAVuTohTsZUfj5riPmAghQnG4wVTI2JUrnYkU7u2/hSBh20JPmqpmAiogSrYsx
 WQzb8Hh0BZRvfFpV5YWmt3Pi2cPFUnm+0fYIkfrVbid1xNaBAgjGnTbdljpBqvyczZP2
 AYbMojT+qfD+v/QjaSISjX9H12nmrR8GYh0ePr9YQOVf0KDNrtXAsojL9thZnK6OZ96e
 pq/2PGcyXj7HrXnnf+9z5FnBKE73/mak1eT69mGQV9CGmlPOcFKZVE/5n1x1Z6owBVOD
 FJeA==
X-Gm-Message-State: AO0yUKUJRHt1+YBuKLy++rUvkn9UUX5V/y8FKHLITQoMb9RpBvkPMMxv
 AmIp4Q4nvoMlH8TN3inJ5PHQ7A==
X-Google-Smtp-Source: AK7set+rwTucVJbAGWvKZm+k4FHFz0YsFcYNDKBOHdVwp2tML+VvpbJL7quqY+v2L12HdAkXtMmD0g==
X-Received: by 2002:a05:6000:68f:b0:2bd:e87a:7fb7 with SMTP id
 bo15-20020a056000068f00b002bde87a7fb7mr18175338wrb.26.1675681033022; 
 Mon, 06 Feb 2023 02:57:13 -0800 (PST)
Received: from [192.168.16.192] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d4a81000000b002c3d67aac74sm8051412wrq.88.2023.02.06.02.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 02:57:12 -0800 (PST)
Message-ID: <038b530f-18f1-fd5e-f926-32e73d434a63@smile.fr>
Date: Mon, 6 Feb 2023 11:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20230122090947.1369673-1-yann.morin.1998@free.fr>
From: Sebastian WEYER <sebastian.weyer@smile.fr>
In-Reply-To: <20230122090947.1369673-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k7kachpnsG8VWCVK2MsapgBIhwUPrA3MDnuSzgEdaIU=;
 b=fouBLajy+2Q2FNAjTq/vbnGWW5zdWq4FKdHkud0XbRCqhNKhgNjV/Kc2gIV0Pe5pRr
 q7ey5nJqNQ6UeZGTxHY6D0wAxMEtzWPcMYo6gkIn2DiFN1WRaE/6/+l4aV6fkx1DaLrN
 Hfulmpjpksnzvrp1fLg66SDVaMnP578cZsy9RsEtEn+lpJLK7cSm7mqkzuH3GPwf4Vbm
 lrT0qTpyNR70Nx6aTq4st8ix/guuufcLpA6KYqEQnZGfI6/eYTij2ShG426Ul5lOLTvZ
 eUS4G0t7mgalK9Tp/JDKVnjbts89uIOp2geeM08capXdfj/iSnxHXgoZ9X2dFnVreJfX
 u1OA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=fouBLajy
Subject: Re: [Buildroot] [PATCH] Makefile: fix build when $(O) ends in
 _defconfig
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
Cc: Romain Naour <romain.naour@gmail.com>, Nevo Hed <nhed+buildroot@starry.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On 22/01/2023 10:09, Yann E. MORIN wrote:
> Commit e6195c53041f (Makefile: fix use of many br2-external trees) fixed
> a slowdown with many br2-external trees. In doing so, it changed the
> type of the %_defconfig rule: the stem is no longer present in the
> prerequisites, so it changes from a pattern rule to an implicit pattern
> rule [0].
>
> It is not unusual to name the build directory after the defconfig that
> is being built, so we may end up with a build directory named
> meh_defconfig. Before e6195c53041f, the pattern rule would not match
> [1], but now it does, which causes somewhat-cryptic build failures:
>
>     Makefile:1015: *** "Can't find /some/path/meh_defconfig".  Stop.
>
> The issue is that we have this set of rules and assignments (elided and
> reordered for legibility):
>
>     all: world
>     world: target-post-image
>     target-post-image: staging-finalize
>     staging-finalize: $(STAGING_DIR_SYMLINK)
>     $(STAGING_DIR_SYMLINK): | $(BASE_DIR)
>     BASE_DIR := $(CANONICAL_O)
>     CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
>
> So, there is a rule that (eventually) has a dependency on $(O), but we
> have no rule that provides it explicitly, so the %_defconfig rule kicks
> in, with the stem as "/some/path/meh". When the loop searches all the
> ".../configs/" directories for a file named ".../configs/%_defconfig",
> it actually lookes for a file named ".../configs//some/path/meh_defconfig"
> and that indeed never matches anything.
>
> The solution is to provide an actual rule for $(BASE_DIR), so that the
> implicit rule does not kick in.
>
> [0] Terminology and behaviour in make is hard, so the terms we used here
>     may be wrong or incorrectly used, and/or the explanations for the
>     behavious be wrong or incomplete... Still, the reasoning stands, and
>     the root cause is the removal of the stem in the RHS of the rule
>     (adding one back does fix the issue).
>
> [1] not sure how the prerequisite was solved  before e6195c53041f,
>     though...
>
> Fixes: e6195c53041f
>
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Nevo Hed <nhed+buildroot@starry.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 8517d563d5..f39af5eae9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1042,7 +1042,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  
>  # staging and target directories do NOT list these as
>  # dependencies anywhere else
> -$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
> +$(BASE_DIR) $(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
>  	@mkdir -p $@
>  
>  # outputmakefile generates a Makefile in the output directory, if using a

I first verified that the build fails when the output folder's name ends in
"_defconfig" with "make O=./test/second_defconfig qemu_aarch64_virt_defconfig"
followed by "make O=./test/second_defconfig".
I then applied the patch and redid "make O=./test/second_defconfig" and verified
that the build succeeded.

Tested-by: Sebastian Weyer <sebastian.weyer@smile.fr>

Best regards,
Sebastian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
