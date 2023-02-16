Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E5BC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 19:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C0104194E;
	Thu, 16 Feb 2023 19:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C0104194E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5x-PAR47o5b; Thu, 16 Feb 2023 19:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 063C641795;
	Thu, 16 Feb 2023 19:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 063C641795
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CD381BF330
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 19:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7031060AD4
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 19:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7031060AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5W16vKpI8X3 for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 19:34:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71EA360ABE
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71EA360ABE
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 19:34:19 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id g14so3067152ljh.10
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 11:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EqT+5B7rum9SxHHjFjhLQwKqmqwG+2BQN2+M8BG08dE=;
 b=4hgBKczGbK98ROr4La9f8N6UrkSfz2r3+0sn9AWYK+AqR3+DsGgqxYzkEkyf6dX6NO
 PLJ6LC9MhcRx/F//G3mjMBvd91oVEXS1y1FD/R4un6BGlDPmTxuh2RR03Q5HrNtqhh9/
 S/Tp0aAeNGdPM7E6OcKP+jyffYLqQzR4WnqgSTRyN7PeO8qNBBgqk9+idUyUePzjf+7S
 3scZcyeZ+Y/V1DqbPQGgh2lIKjAxCxIWBGr8VXqS2Hyw3osynGYhDWAXYfWo7UwjIVzB
 vkzwfHvwcakCD1lRk+jf1Mx+dvmwTF+bu2bUES2cY8LcaN4vt2V+ASP7kULTqyAY8ps/
 aOrA==
X-Gm-Message-State: AO0yUKUJ162TtojRl8W6Fd5owBRvnM1c3cupW3ITV+15xJiz7LqwKhJT
 fqBzbLhlRIxOgEv85+7F1sCIXm3ooFqp/AGU
X-Google-Smtp-Source: AK7set9JoObO3Pl5KEnakwoI6sa/cMz5ss2e6nkqNH2esLo5kxLWi8IiXs+ZOz1G3h3FkxKVheCcdQ==
X-Received: by 2002:a2e:870b:0:b0:28e:763b:63bc with SMTP id
 m11-20020a2e870b000000b0028e763b63bcmr2091432lji.46.1676576056992; 
 Thu, 16 Feb 2023 11:34:16 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 l5-20020a2ea305000000b002934a7c04efsm325662lje.98.2023.02.16.11.34.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 11:34:16 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id br9so4108280lfb.4
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 11:34:16 -0800 (PST)
X-Received: by 2002:ac2:54b8:0:b0:4d5:ca32:68a0 with SMTP id
 w24-20020ac254b8000000b004d5ca3268a0mr1941976lfk.5.1676576056013; Thu, 16 Feb
 2023 11:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20230216174134.34179-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20230216174134.34179-1-fontaine.fabrice@gmail.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 16 Feb 2023 20:34:05 +0100
X-Gmail-Original-Message-ID: <CACXRmJiqrD+svtBb91oXJiLrZr8_433u_nSuP9nATPpN5tjpqw@mail.gmail.com>
Message-ID: <CACXRmJiqrD+svtBb91oXJiLrZr8_433u_nSuP9nATPpN5tjpqw@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build with
 libexecinfo
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Perhaps I'm missing something, but why is it not needed to select
`BR2_PACKAGE_LIBEXECINFO` in the Config.in file?
(Similar to `select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC`)

The `ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)` can be re-used to add and
select execinfo.

Kr,

Thomas Devoogdt

Op do 16 feb. 2023 om 18:41 schreef Fabrice Fontaine
<fontaine.fabrice@gmail.com>:
>
> Fix the following build failure with libexecinfo raised since commit
> d649bcd3805a26cedb30120ebbdcf12f8fbf449f:
>
> /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/mips-buildroot-linux-musl/10.4.0/../../../../mips-buildroot-linux-musl/bin/ld: ../lib/monkey/library/libmonkey.a(mk_utils.c.o): in function `mk_utils_stacktrace':
> mk_utils.c:(.text+0x1578): undefined reference to `backtrace'
>
> Fixes:
>  - http://autobuild.buildroot.org/results/63a6ba9104dfddbd7f6a7debadc0c6ef6e3a21f5
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fluent-bit/fluent-bit.mk | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> index d618fdf1e2..8ba16399bb 100644
> --- a/package/fluent-bit/fluent-bit.mk
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -56,6 +56,11 @@ FLUENT_BIT_CXXFLAGS += -fcommon
>  FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS
>  FLUENT_BIT_CXXFLAGS += -U_FILE_OFFSET_BITS
>
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +FLUENT_BIT_DEPENDENCIES += libexecinfo
> +FLUENT_BIT_LDFLAGS += -lexecinfo
> +endif
> +
>  ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
>  FLUENT_BIT_DEPENDENCIES += musl-fts
>  FLUENT_BIT_LDFLAGS += -lfts
> --
> 2.39.0
>
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
