Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FF9C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD8CA419C2;
	Fri, 12 Jul 2024 14:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vr9ZVaLTSRiB; Fri, 12 Jul 2024 14:32:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17018419A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17018419A0;
	Fri, 12 Jul 2024 14:32:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F2CA1BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AA86413E6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4PI3cnsIgfc for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:32:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10EFA419A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10EFA419A0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10EFA419A0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:32:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEBCD1BF207;
 Fri, 12 Jul 2024 14:32:31 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:32:28 +0200
To: Simon Ruepp via buildroot <buildroot@buildroot.org>
Message-ID: <20240712163228.05cb0a6c@windsurf>
In-Reply-To: <20240712084824.43044-1-ruepp.simon@mailbox.org>
References: <20240712084824.43044-1-ruepp.simon@mailbox.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720794753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLH0gy/u84+rY6dY3ZkV2LY1sdeiQEtdZL/CCA6KeY8=;
 b=fBPapZfRCwSungziijKLwmFC4DEesfcdsn0FWhsTkh2fT4MNOS5u1f/HMmx33e+dftCAKq
 J/GPttmWAImcPM2KncE3AnBkE3W4Lm0UMJL7NvqXxkNP1I6pkO+HjiQSh2quklE5n2HI/x
 2F8rm8DjF21v+cS43vLa90o6KFaeJULFYbyc1f30O+fQJ3QNCtc6d1f2HNk3+HrbWaoIpq
 A9EbNb/ixEbc61iz7+DsdLl96Qs45iAGUSI0Xc4XEF1YgSnM3M4ddKAMHXapV6chRje30E
 Av7fmkY7emdnqsV+fOGRV0GYhcaRU0bBiMYAD1A/lP3fwzQ8YCVEf89kkU2OKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fBPapZfR
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5: bump packages to latest
 kde submodule versions
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Julien Corjon <corjon.j@ecagroup.com>, Simon Ruepp <ruepp.simon@mailbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Simon,

On Fri, 12 Jul 2024 10:48:25 +0200
Simon Ruepp via buildroot <buildroot@buildroot.org> wrote:

> From: "Simon Ruepp" <ruepp.simon@mailbox.org>
> 
> Bump qt5 packages to latest submodule versions from:
> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> 
> Signed-off-by: Simon Ruepp <ruepp.simon@mailbox.org>

Thanks for your patch. However, I will apply a similar patch that we
have received earlier:

  https://patchwork.ozlabs.org/project/buildroot/patch/20240611141216.1211627-1-roy.kollen.svendsen@gmail.com/

Indeed, there are a number of things in your patch that do much more
than bumping, but the commit log is completely silent about those
changes.

> diff --git a/package/qt5/qt53d-assimp/Config.in b/package/qt5/qt53d-assimp/Config.in
> new file mode 100644
> index 0000000000..421e424f8d
> --- /dev/null
> +++ b/package/qt5/qt53d-assimp/Config.in
> @@ -0,0 +1,4 @@
> +# Not user-selectable, it is only needed to be copied
> +# into the qt53d source tree.
> +config QT53D_ASSIMP
> +	bool

Why is this new package needed? Is this related to the version bump?


> diff --git a/package/qt5/qt5webengine-chromium/0001-Add-python3-build-support.patch b/package/qt5/qt5webengine-chromium/0001-Add-python3-build-support.patch
> deleted file mode 100644
> index cc9726418e..0000000000
> --- a/package/qt5/qt5webengine-chromium/0001-Add-python3-build-support.patch
> +++ /dev/null
> @@ -1,1858 +0,0 @@
> -From bf94b834e9beb4e7bc25dbc4c61f5e2db39e7cdc Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Fri, 4 Feb 2022 15:43:35 -0700
> -Subject: [PATCH] Add python3 build support
> -
> -Adapted from:
> -https://github.com/archlinux/svntogit-packages/blob/6edf5f1aaea952d046aff89a2e0175258fe77361/trunk/qt5-webengine-chromium-python3.patch
> -
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Should be explained in the commit log why this patch gets removed.


> rename to package/qt5/qt5webengine/0001-Add-python3-build-support.patch
> diff --git a/package/qt5/qt5webengine/0002-Pass-cppflags-and-ldflags-to-build.patch b/package/qt5/qt5webengine/0002-Pass-cppflags-and-ldflags-to-build.patch
> new file mode 100644
> index 0000000000..4fd2105c66
> --- /dev/null
> +++ b/package/qt5/qt5webengine/0002-Pass-cppflags-and-ldflags-to-build.patch
> @@ -0,0 +1,55 @@
> +From d4ad0fb124c017bdabe72d3a5671bd26c6216470 Mon Sep 17 00:00:00 2001
> +From: Stefan Mayrhofer <stefan.mayrhofer@ginzinger.com>
> +Date: Tue, 23 Aug 2022 13:48:26 +0200
> +Subject: [PATCH 1/1] Pass cppflags and ldflags to build
> +
> +This patch forwards cppflags and ldflags to the build. This fixes the following compilation error:
> +
> +[18497/21900] CXX v8_snapshot/obj/v8/gen-regexp-special-case/gen-regexp-special-case.o
> +FAILED: v8_snapshot/obj/v8/gen-regexp-special-case/gen-regexp-special-case.o
> +/usr/bin/g++ -MMD -MF v8_snapshot/obj/v8/gen-regexp-special-case/gen-regexp-special-case.o.d -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DOFFICIAL_BUILD -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNO_UNWIND_TABLES -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=64 -DENABLE_MINOR_MC -DV8_INTL_SUPPORT -DV8_CONCURRENT_MARKING -DV8_ENABLE_LAZY_SOURCE_POSITIONS -DV8_WIN64_UNWINDING_INFO -DV8_ENABLE_REGEXP_INTERPRETER_THREADED_DISPATCH -DV8_SNAPSHOT_COMPRESSION -DV8_COMPRESS_POINTERS -DV8_31BIT_SMIS_ON_64BIT_ARCH -DV8_DEPRECATION_WARNINGS -DV8_REVERSE_JSARGS -DV8_TARGET_ARCH_ARM64 -DV8_HAVE_TARGET_OS -DV8_TARGET_OS_LINUX -DDISABLE_UNTRUSTED_CODE_MITIGATIONS -DV8_COMPRESS_POINTERS -DV8_31BIT_SMIS_ON_64BIT_ARCH -DV8_DEPRECATION_WARNINGS -DV8_REVERSE_JSARGS -DUSING_SYSTEM_ICU=1 -DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_STATIC -DUCHAR_TYPE=uint16_t -Iv8_snapshot/gen -I../../
 3rdparty/chromium -I../../3rdparty/chromium/v8 -I../../3rdparty/chromium/v8/include -Iv8_snapshot/gen/v8 -Iv8_snapshot/gen -Iv8_snapshot/gen -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector -fno-unwind-tables -fno-asynchronous-unwind-tables -fPIC -pipe -pthread -m64 -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments -Wno-packed-not-aligned -Wno-dangling-else -Wno-missing-field-initializers -Wno-unused-parameter -fno-omit-frame-pointer -g0 -fvisibility=hidden -Wno-strict-overflow -Wno-return-type -O3 -fno-ident -fdata-sections -ffunction-sections -I/usr/include -I/usr/include -std=gnu++14 -Wno-narrowing -Wno-class-memaccess -Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -Wno-invalid-offsetof -Wno-return-type -Wno-deprecated-copy -fno-exceptions -fno-rtti -fvisibility-inlines-hidden -c ../../3rdparty/chromium/v8/src/regexp/gen-regexp-spec
 ial-case.cc -o v8_snapshot/obj/v8/gen-regexp-special-case/gen-regexp-special-case.o
> +In file included from ../../3rdparty/chromium/v8/src/regexp/gen-regexp-special-case.cc:10:
> +../../3rdparty/chromium/v8/src/regexp/special-case.h:12:10: fatal error: unicode/uchar.h: No such file or directory
> +   12 | #include "unicode/uchar.h"
> +      |          ^~~~~~~~~~~~~~~~~
> +compilation terminated.
> +
> +For the v8 build, extra_cppflags was not passed through.
> +v8 and host build both were also missing extra_ldflags. These are needed to find libraries in the buildroot directory.
> +

This patch needs your Signed-off-by line, as well as an Upstream: tag
(please run "make check-package" before sending patches, it will warn
you about those coding style issues).

Also, could you explain in the commit log why it's needed?

I suggest you wait for the patch from Roy to be applied, and then
rebase your changes on top of it, if that's fine with you?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
