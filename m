Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFCCC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 14:15:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED44B60F36
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 14:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED44B60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8C0983976;
	Mon,  2 Aug 2021 14:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DRVzrh5HAgs; Mon,  2 Aug 2021 14:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 097608380B;
	Mon,  2 Aug 2021 14:15:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54A311BF4D5
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 14:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4448560817
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 14:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2YWjwBLMiNZ for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 14:15:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F20876080C
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 14:15:08 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id h9so15691786ejs.4
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gk3SSV8hqOjMT/CBXcQXDT+QJrcbXasBzjkf9txl35Q=;
 b=D2KYPBCtBOCQ3JqNDozH7WbI0gwNmGqISsTQv0cFeQ3ec+RL5V9FGSEZL8dIecF1xp
 +y1zwGla+f4ypR9trazP0Tfz3vhQEwgmT494bZ7Yb/yApCklSGvSOIPjWe3a31HJmK7/
 5bWDKILEVAzhw7NzyT6cgjCg4fpZNseQ9alenRPJrAUD80KM2pAnKJfM9TyWktP4/or7
 fO/ETZ7PMNb7dRzrhW2XD+IHE/jwEO/UOeStiNGYAmNLacRYO9Lz/XOXlqzZoOBnutDN
 QvJ2HigeiUbU171KXOg7TlDF/81j9sXKOMzNN+2DRuWJy8Pnjssuj7O74rwXX5j71cAo
 japA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Gk3SSV8hqOjMT/CBXcQXDT+QJrcbXasBzjkf9txl35Q=;
 b=BTQPA/FRMOvVxy6XvXwtJaHO4Hg0TLvfoSvpafLObCbPt9WHAwfI52cSj41zYgkQfq
 OKdsLsZ8xpHM88Sl398yXlLyGGg/hWxP4qBpLmYzVTiUPSHFefApmVEOhN4FMUY//U8M
 QQeFvMef4R55LdCOkjUfVEwOGdylYWUr4bCsbOeSHG1OcguhY60/ASs9HUlOSgw3U9Ir
 5ES9oqNQfcgoSaN0F4wVpT/XFeKa200wOuF2W1vqq6C1i4P89F5PkVUF0vcYXetJ05Kj
 KyoHdbRxaKAVRyOPv3+6hhQoGZhQCkcPAOqjnu99AYS2l56qR2fnrDXvRV7KN1uI+4/t
 Cl2w==
X-Gm-Message-State: AOAM530IPhNB4p+BetpQtCsg2yRnBI1+Fb7/LsGHmguLWoXrB0bJlQ6n
 pErVXPow+cSaha1PGJAwlMbKjGxXiLNauCzjp98=
X-Google-Smtp-Source: ABdhPJw66NYcKphNBnrUIpt+qwc39HwtLBIgJNSU2q6WkSzRosEfAOaLz4fqvquYQwmEr5rbiNt45A==
X-Received: by 2002:a17:906:5d06:: with SMTP id
 g6mr15081444ejt.96.1627913704931; 
 Mon, 02 Aug 2021 07:15:04 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id c15sm6201035edu.78.2021.08.02.07.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 07:15:04 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210725091622.897777-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <b517914b-8481-6fb0-44ca-70e61a021381@mind.be>
Date: Mon, 2 Aug 2021 16:15:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725091622.897777-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/bird: needs autoreconf
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?Q?Adrien_Gallou=c3=abt?= <adrien@gallouet.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 25/07/2021 11:16, Fabrice Fontaine wrote:
> For an unknown reason, autoreconf is needed since bump to version 2.0.8
> in commit f5906644b45269b1a5fe109cb64fad837e4fbff2 to avoid the
> following build failure:
> 
> checking for glob.h... no
> configure: error: glob.h not found.
> 
> This build failure is raised because -g0 and -g are both passed to gcc:
> 
> configure:5207: checking for glob.h
> configure:5230: /data/buildroot-autobuilder/instance-0/output-1/host/bin/mips64el-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -pthread -fno-strict-aliasing -fno-strict-overflow -flto -Wall -Wextra -Wstrict-prototypes -Wno-parentheses -Wno-pointer-sign -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pthread -flto=4 -g conftest.c  >&5
> /data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccDboxph.ltrans0.ltrans.o:(.debug_info+0x2a): undefined reference to `conftest.c.0943dc99'
> /data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccDboxph.ltrans0.ltrans.o:(.debug_info+0x2f): undefined reference to `conftest.c.0943dc99'
> 
> -g0 is passed by buildroot and -g is passed by bird if
> $ac_test_CFLAGS" != set (since version 2.0.7 and
> https://gitlab.nic.cz/labs/bird/-/commit/cc95b4594ac924b40325a4f1adcae5312179db40)
> 
> For an unknown reason without autoreconf, ac_test_CFLAGS doesn't seem to
> be equal to "set"

 I really don't like "unknown reason", so I investigated a bit more.

 It seems that bird's configure script was generated with a fork of autoconf
that identifies itself as "GNU Autoconf 2.69e". It generates pretty wildly
different code - one of the differences is that it uses

    ac_test_CFLAGS=${CFLAGS+y}

to remember if CFLAGS was saved, while standard autoconf uses

    ac_test_CFLAGS=${CFLAGS+set}

The configure.ac code itself, however, uses

    if test "$ac_test_CFLAGS" != set ; then

to check if CFLAGS was overridden.


 So basically it's a f**up of the distributor that used some weird autoconf version.

 That's enough of an explanation for me, so I updated the commit message with
the above points and applied to master, thanks!

 Regards,
 Arnout



> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1d2acc9f6b8830adc8b62d6b2e55837abae561a9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bird/bird.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/bird/bird.mk b/package/bird/bird.mk
> index a8b9b18b50..7d7002d5f2 100644
> --- a/package/bird/bird.mk
> +++ b/package/bird/bird.mk
> @@ -11,6 +11,7 @@ BIRD_LICENSE_FILES = README
>  BIRD_CPE_ID_VENDOR = nic
>  BIRD_SELINUX_MODULES = bird
>  BIRD_DEPENDENCIES = host-flex host-bison
> +BIRD_AUTORECONF = YES
>  
>  ifeq ($(BR2_PACKAGE_BIRD_CLIENT),y)
>  BIRD_CONF_OPTS += --enable-client
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
