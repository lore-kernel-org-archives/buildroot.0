Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57FBC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 17:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AA37605B3;
	Sun,  5 May 2024 17:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9FKUeUH9LJh; Sun,  5 May 2024 17:29:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2627260613
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2627260613;
	Sun,  5 May 2024 17:29:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 926C81BF3F2
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 17:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EDA360613
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 17:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWU0gy3jpDsK for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 17:29:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 528EF605B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 528EF605B3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 528EF605B3
 for <buildroot@buildroot.org>; Sun,  5 May 2024 17:29:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 578D413F880;
 Sun,  5 May 2024 19:28:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 19:28:50 +0200
Date: Sun, 5 May 2024 19:28:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZjfB0rkXpCdVfPkd@landeda>
References: <20240502072327.741463-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240502072327.741463-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714930135;
 bh=7DVjNeeXR//Hzixf9R6v/IZbONyK61FDD2ZMlYDXbho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RLZ99OkBb6e+T8hqvDaIDId7euH90yjJskUyjSNcHVHXAN4X/ZSvk88HNGwwqE1Zr
 shKgQaXk7+WEjtWvzk9ij366FgxU+vTJEyu7Cfbx0l6vGeV70Llh32Z7HB4nMsQfpY
 C835cx+B7O/wa8WrEFCAhl6yRGM/yV65TjkBKDWmUIJHlscSPKdxf0dhdUeM1vGVS2
 rNEceIQf9RS0WRBDeL6JTYmaOnvT3Lo+r5gqWRN1aSygUVkvxUBA+WsVZ2YFTK96gX
 JYMzUe7wTUsFi8hZgV3Iq+e0Ll9JRJ3UQ4Y1sEmSNWrixyNlnCQkxlfs1OxJz6WAgK
 rresDFGiEirmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RLZ99OkB
Subject: Re: [Buildroot] [PATCH v2 1/2] package/qemu: fix disabling fp-bench
 test compilation
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
Cc: Romain Naour <romain.naour@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-05-02 09:23 +0200, Dario Binacchi spake thusly:
> With the bump to version 8.1.1, the patch that disabled the compilation
> of the fp-bench test is no longer applicable, even though the package
> compilation process does not report any errors in applying the patch
> itself. The new patch does not disable the test by default but only if
> the file fenv.h is not missing, with the hope that this approach will be
> considered acceptable by the maintainer and merged upstream.
> 
> The patch is an adaptation of the one sent upstream.
> 
> Link: https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00492.html
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Changes v1 -> v2
>  - Replace [Upstream status: <url>] with Upstream: <url>
>  - Drop the added line to .checkpackageignore
> 
>  .checkpackageignore                           |  1 -
>  ...fp-disable-fp-bench-build-by-default.patch | 28 -----------
>  ...on-t-build-fp-bench-test-if-fenv.h-i.patch | 49 +++++++++++++++++++
>  3 files changed, 49 insertions(+), 29 deletions(-)
>  delete mode 100644 package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
>  create mode 100644 package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index db23450f0381..3693b770cf4d 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1360,7 +1360,6 @@ package/python3/0028-fix-building-on-older-distributions.patch lib_patch.Upstrea
>  package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch lib_patch.Upstream
>  package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch lib_patch.Upstream
>  package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch lib_patch.Upstream
> -package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch lib_patch.Upstream
>  package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch lib_patch.Upstream
>  package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch lib_patch.Upstream
>  package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch lib_patch.Upstream
> diff --git a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch b/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
> deleted file mode 100644
> index fb7a9a69897b..000000000000
> --- a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 83d976d6d7f0357659d5daa0f01c52048a609e88 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@gmail.com>
> -Date: Wed, 25 Aug 2021 21:55:53 +0200
> -Subject: [PATCH] tests/fp: disable fp-bench build by default
> -
> -Fixes:
> -https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00947.html
> -
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - tests/fp/meson.build | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/tests/fp/meson.build b/tests/fp/meson.build
> -index 8bd0979f67..2fe019d2c6 100644
> ---- a/tests/fp/meson.build
> -+++ b/tests/fp/meson.build
> -@@ -640,6 +640,7 @@ fpbench = executable(
> -   dependencies: [qemuutil],
> -   include_directories: [sfinc, include_directories(tfdir)],
> -   c_args: fpcflags,
> -+  build_by_default: false,
> - )
> - 
> - fptestlog2 = executable(
> --- 
> -2.35.1
> -
> diff --git a/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
> new file mode 100644
> index 000000000000..b7e41d6f232c
> --- /dev/null
> +++ b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
> @@ -0,0 +1,49 @@
> +From b4a692f46135af1011bf0adbfeb19abf354ca191 Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Tue, 30 Apr 2024 09:40:55 +0200
> +Subject: [PATCH] tests/fp/meson: don't build fp-bench test if fenv.h is
> + missing
> +
> +The fp-bench test (i. e. tests/fp/fp-bench.c) use fenv.h that is not
> +always provided by the libc (uClibc). The patch disables its compilation
> +in case the header is not available.
> +
> +The patch is based on a suggestion from Paolo Bonzini, which you can
> +find at the following link.
> +
> +Link: https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00492.html
> +Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://patchwork.ozlabs.org/project/qemu-devel/patch/20240430164752.645521-1-dario.binacchi@amarulasolutions.com/
> +---
> + tests/fp/meson.build | 14 ++++++++------
> + 1 file changed, 8 insertions(+), 6 deletions(-)
> +
> +diff --git a/tests/fp/meson.build b/tests/fp/meson.build
> +index cbc17392d678..cd052667e940 100644
> +--- a/tests/fp/meson.build
> ++++ b/tests/fp/meson.build
> +@@ -126,12 +126,14 @@ test('fp-test-mulAdd', fptest,
> +            ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
> +      suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'], timeout: 90)
> + 
> +-executable(
> +-  'fp-bench',
> +-  ['fp-bench.c', '../../fpu/softfloat.c'],
> +-  dependencies: [qemuutil, libtestfloat, libsoftfloat],
> +-  c_args: fpcflags,
> +-)
> ++if cc.has_header('fenv.h')
> ++  executable(
> ++    'fp-bench',
> ++    ['fp-bench.c', '../../fpu/softfloat.c'],
> ++    dependencies: [qemuutil, libtestfloat, libsoftfloat],
> ++    c_args: fpcflags,
> ++  )
> ++endif
> + 
> + fptestlog2 = executable(
> +   'fp-test-log2',
> +-- 
> +2.43.0
> +
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
