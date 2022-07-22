Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046FCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 11:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F2C984923;
	Fri, 22 Jul 2022 11:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F2C984923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AhfgyK1X_m5M; Fri, 22 Jul 2022 11:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9765A848F0;
	Fri, 22 Jul 2022 11:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9765A848F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86E601BF312
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 11:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E3A760F12
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 11:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E3A760F12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XB7Z9RGZ50Bw for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 11:24:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F7CD60E28
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F7CD60E28
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 11:24:15 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id tk8so8043349ejc.7
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 04:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=atQlxJDi2EXRMAptz5qO9v69AQekiwE6rEBflvqJVhk=;
 b=2eNjnwkVc1QZoIvms1msKdFDmNwUXE91ohFp/yKs9TuJI/99eEkDLIyaVS5QM1KUgU
 Uwham4ZzHOeypJaaF8BvcZ2Vp3AlZQ4VRH6ZvDH9Th5zNjM7CPcvmvdVli7vp+Z3vBdq
 Za96HZt4KUIxIZSdQgQp8eQoY14M85byArKyDvfFGNYWF46XUXF8BCknRHdz4mqbbfPs
 MLcayb0fQ6pOWFwp56YsnC0jmrJyYlmJ8gGsNI4hheXgOemgQk2mVuk0IKypIMckS7pJ
 6KZxjlCFge0Por9FkZQsqoqP9WJPqZU3fJEBXsjN8ClpSmvHYdG21Tselr+Tp/LdtFuw
 q+KQ==
X-Gm-Message-State: AJIora80lWDY6Z9sjUFzwutyPdVqRvr8dyb3xNB9tgF2yuoDSLZhKUJP
 uiF4eT+maicO9lwcdGzcG0jBi2K3SvKgbNzj1lNlX/vI1Ls=
X-Google-Smtp-Source: AGRyM1vkEfZDxqqDPacowu/qThSCglAuPyR6zygdDWsG3rD4UPQkAJNg9dT0wnUEukhIKdkKI763NdWHmPt4bhiVaO8=
X-Received: by 2002:a17:906:98c8:b0:72b:408f:f499 with SMTP id
 zd8-20020a17090698c800b0072b408ff499mr78450ejb.736.1658489053267; Fri, 22 Jul
 2022 04:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220722100920.00132969@windsurf>
In-Reply-To: <20220722100920.00132969@windsurf>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 22 Jul 2022 04:24:16 -0700
Message-ID: <CAMo8BfJ+AdrewRkuZzMq+_4w6=A-7SkC16MXneWkTHJ+i_=Crw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=atQlxJDi2EXRMAptz5qO9v69AQekiwE6rEBflvqJVhk=;
 b=B2H4iVNA40rBGELLSxRjxyyI1YQyWowPM9efUJHybROiDAy6h6UUhotVS9Ierp0UGV
 uM+htuNt3mlQCJ3+hR4ysgt0P4IhFHX1dOKOzMeRgwAlcnSYwct3CcxpTe7cQwf789SP
 KoKYqbtF1fWw68H/F+lt5db0lU3FTG3tId46M5zR58BdcdJI6UfR6GctcUROA8fMV+9E
 MJiNBAI1EdqiEf3CdakKozyXpO3qkqmdV2a6FcROWT6AC056ytAgy9eLOUHi66FUVRPT
 r1VymtnwjERaxPGs5eu/DxA9VKdnRmsJZRQ6ukeINmOCh3YiK5jCi8I6n5yxXaIXlYPI
 ZIzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B2H4iVNA
Subject: Re: [Buildroot] uclibc-ng build failures on Xtensa
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Fri, Jul 22, 2022 at 1:09 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> We are seeing build failures of uclibc-ng on Xtensa:
>
>   http://autobuild.buildroot.net/?reason=uclibc%&arch=xtensa
>
> A relevant one is:
>
>   http://autobuild.buildroot.net/results/38e/38e9d9a76f1877e7952ad5c20a405382642fd227/build-end.log
>
> Which goes like this:
>
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: ldso/ldso/ld-uClibc_so.a(ldso.oS): compiled for a big endian system and target is little endian
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: failed to merge target specific data of file ldso/ldso/ld-uClibc_so.a(ldso.oS)
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: ldso/ldso/ld-uClibc_so.a(dl-tlsdesc.oS): compiled for a big endian system and target is little endian
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: failed to merge target specific data of file ldso/ldso/ld-uClibc_so.a(dl-tlsdesc.oS)
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: ldso/ldso/ld-uClibc_so.a(resolve.oS): compiled for a big endian system and target is little endian
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: failed to merge target specific data of file ldso/ldso/ld-uClibc_so.a(resolve.oS)
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: little endian output does not match Xtensa configuration
>
> This happens on configurations that have:
>
> BR2_XTENSA_CUSTOM=y
>
> Indeed, in Buildroot we support two Xtensa variants:
>
> config BR2_XTENSA_CUSTOM
>         bool "Custom Xtensa processor configuration"
>         select BR2_ARCH_HAS_MMU_OPTIONAL
>
> config BR2_xtensa_fsf
>         bool "fsf - Default configuration"
>         select BR2_ARCH_HAS_MMU_MANDATORY
>
> So far, all builds were done using BR2_xtensa_fsf but with the full
> randomization, we've started doing builds with BR2_XTENSA_CUSTOM.
> However, for BR2_XTENSA_CUSTOM, the endianess is configurable:
>
> choice
>         prompt "Target Architecture Endianness"
>         default BR2_XTENSA_LITTLE_ENDIAN
>         depends on BR2_XTENSA_CUSTOM
>
> config BR2_XTENSA_LITTLE_ENDIAN
>         bool "Little endian"
>
> config BR2_XTENSA_BIG_ENDIAN
>         bool "Big endian"
>
> endchoice
>
> And the default is BR2_XTENSA_LITTLE_ENDIAN, while normally for
> BR2_xtensa_fsf, the endianness is BIG.
>
> Which configurations are supported?

When BR2_XTENSA_CUSTOM is selected BR2_XTENSA_OVERLAY_FILE
must be specified and selected endianness must match the endianness of the
configuration in the overlay file. Empty BR2_XTENSA_OVERLAY_FILE is
equivalent to fsf and it is big endian.

> Is there something to fix here, or
> we just need to disallow the usage of little endian?

Little endian xtensa configurations are well supported, see e.g.
configs/qemu_xtensa_lx60_defconfig that uses the dc233c core.

-- 
Thanks.
-- Max
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
