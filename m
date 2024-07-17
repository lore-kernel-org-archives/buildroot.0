Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DFBC3DA5D
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 20:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7887740C01;
	Wed, 17 Jul 2024 20:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYOifAgvduuc; Wed, 17 Jul 2024 20:10:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D18D940146
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D18D940146;
	Wed, 17 Jul 2024 20:10:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC2D1BF846
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09AA060AD0
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1RPoXa4m31g for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 20:10:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94CDD60771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94CDD60771
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94CDD60771
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 20:10:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 975CD20003;
 Wed, 17 Jul 2024 20:10:03 +0000 (UTC)
Date: Wed, 17 Jul 2024 22:10:00 +0200
To: "Karicheri, Murali via buildroot" <buildroot@buildroot.org>
Message-ID: <20240717221000.5ced2d0d@windsurf>
In-Reply-To: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
References: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721247003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oX7HrCexCJUhAAznQbasozaWBVWXBJjAUtTxrkuI1L8=;
 b=IYS2FcYAsy5Dnuzz1JvqdzdV05A10IMmJbn7V7LQgQbSIFGPk+937sZlB6NVSLDAGAmPfm
 fD3T46cH22w7gzIS35rE6l+612rjDxjPg+H3X3C7eJjzSLbFPMewECDyFqWy9Pq3A88UOL
 ozruSIvpvUTsa1X+YvMmxIi24evQTxvWuOwze+V01fYz+EFg7o/s7N9PhrX+M4UwrOlGV2
 bUt9FkxstVJJB+j2xuABNXSFX7wLGOb0yC5OucgsEBiHMHF9O6YeaCKdmykNhYNcdzFYxw
 w6bY5jWpbhPhv8l1F6IE01RWc2pQ8RD6g3A5o69m07ng18rHlyfzcZelRk0z1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IYS2FcYA
Subject: Re: [Buildroot] Year 2038 time util issue - Build failure in
 2024.02.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Karicheri, Murali" <Murali.Karicheri@sandc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Murali,

On Wed, 17 Jul 2024 18:18:35 +0000
"Karicheri, Murali via buildroot" <buildroot@buildroot.org> wrote:

> We were using buildroot version 2023.08 version and encountered a
> year 2038 crash when using time/date utilities. So, my research found
> some work done in the recent version of buildroot. Where
> BR2_TIME_BITS_64=y was added to build with 64bit time field. My board
> is based on a STM32MP133c SoC and using an external project to build
> buildroot. So, I have migrated our project to using 2024.02.x version
> of buildroot and enabled BR2_TIME_BITS_64=y to get the fix for the
> 2038 issue. But my build fails with the logs below.

Sorry to hear that your build fails with Buildroot 2024.02.x. See below
some details.

> 
> Could you help me answer the following questions?

> 1. Is the Y2038 time issue resolved in buildroot? If not, is there
> some work, though officially not supported,  I can investigate for a
> potential solution

Things are not as black and white as "Is the Y2038 time issue
resolved". How 64-bit time_t is handled depends on the C library, and
also different packages might exhibit different problems. So it's not
like we can absolutely guarantee that everything is fixed.

> 2. If it is in fact resolved and expected to work in 2024.02.x, what
> I might be missing? Is there specific version of the toolchain
> packages I need to select in the Toolchain configuration and other
> packages?

We expect things to work, but we have lots of packages.

> libtool: compile:  /src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/./gcc/xgcc -shared-libgcc -B/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/./gcc -nostdinc++ -L/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/arm-buildroot-linux-gnueabihf/libstdc++-v3/src -L/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/arm-buildroot-linux-gnueabihf/libstdc++-v3/src/.libs -L/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/arm-buildroot-linux-gnueabihf/libstdc++-v3/libsupc++/.libs -B/src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/bin/ -B/src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/lib/ -isystem /src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/include -isystem /src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/sy
 s-
>  include -D_GNU_SOURCE -D_DEBUG -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -DHAVE_RPC_XDR_H=0 -DHAVE_TIRPC_RPC_XDR_H=0 -I. -I../../../../libsanitizer/sanitizer_common -I.. -I ../../../../libsanitizer/include -I ../../../../libsanitizer -isystem ../../../../libsanitizer/include/system -Wall -W -Wno-unused-parameter -Wwrite-strings -pedantic -Wno-long-long -fPIC -fno-builtin -fno-exceptions -fno-rtti -fomit-frame-pointer -funwind-tables -fvisibility=hidden -Wno-variadic-macros -I../../libstdc++-v3/include -I../../libstdc++-v3/include/arm-buildroot-linux-gnueabihf -I../../../../libsanitizer/../libstdc++-v3/libsupc++ -std=gnu++14 -DSANITIZER_LIBBACKTRACE -DSANITIZER_CP_DEMANGLE -I ../../../../libsanitizer/../libbacktrace -I ../libbacktrace -I ../../../../libsanitizer/../include -include ../../../../libsanitizer/libbacktrace/backtrace-rename.h -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64 -Og -g2 -D_GNU_SOURCE -MT sanitizer_p
 ro
>  cmaps_common.lo -MD -MP -MF .deps/sanitizer_procmaps_common.Tpo -c ../../../../libsanitizer/sanitizer_common/sanitizer_procmaps_common.cpp -o sanitizer_procmaps_common.o >/dev/null 2>&1
> mv -f .deps/sanitizer_linux_libcdep.Tpo .deps/sanitizer_linux_libcdep.Plo
> mv -f .deps/sanitizer_procmaps_linux.Tpo .deps/sanitizer_procmaps_linux.Plo
> mv -f .deps/sanitizer_linux.Tpo .deps/sanitizer_linux.Plo
> mv -f .deps/sanitizer_printf.Tpo .deps/sanitizer_printf.Plo
> mv -f .deps/sanitizer_posix.Tpo .deps/sanitizer_posix.Plo
> mv -f .deps/sanitizer_procmaps_common.Tpo .deps/sanitizer_procmaps_common.Plo
> mv -f .deps/sanitizer_posix_libcdep.Tpo .deps/sanitizer_posix_libcdep.Plo
> make[6]: *** [Makefile:533: all-recursive] Error 1
> make[5]: *** [Makefile:420: all] Error 2
> make[4]: *** [Makefile:13138: all-target-libsanitizer] Error 2
> make[3]: *** [Makefile:1033: all] Error 2
> make[2]: *** [package/pkg-generic.mk:283: /src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/.stamp_built] Error 2
> make[1]: *** [Makefile:82: _all] Error 2
> make: *** [Makefile:106: /src/linux-bsp-stm32mp133c/output/development/host/bin/arm-none-linux-gnueabihf-gcc] Error 2

This error log is unfortunately useless, as you didn't copy/paste
enough of the build log to have the actual error. All we can see from
this is that the compilation failed during the host-gcc-final step.

Please provide:

 1. A Buildroot .config file that allows to reproduce the issue with
    upstream Buildroot (without any custom changes)

 2. The full build log, preferably posted on some pastebin site, as the
    mailing list will not accept a mail that contains a full build log.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
