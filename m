Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1327C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 600926074E;
	Sat, 31 May 2025 16:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbGWwn9iEZ1K; Sat, 31 May 2025 16:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F0C260743
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F0C260743;
	Sat, 31 May 2025 16:38:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35097235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26C2540068
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1TFBybQI1Ot for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D6834004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D6834004A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D6834004A
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:38:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF4F61C0D6C; Sat, 31 May 2025 18:38:25 +0200 (CEST)
Message-ID: <921ad02a-fb9e-44dc-a5b0-7bc359cae9e2@rnout.be>
Date: Sat, 31 May 2025 18:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <CACXRmJgW8m7jNxfo_n=QoLfMz-ROgc=N2Ms7GcWh=UQOsnUBQQ@mail.gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <CACXRmJgW8m7jNxfo_n=QoLfMz-ROgc=N2Ms7GcWh=UQOsnUBQQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=aqfNfDDzWF7w8m0yIxCHTj9Cm6tPx2ldbwb4pO0j+cw=;
 b=DzuYZnbyuWP5RnVRc1VTU6EGc9Tfm765lHn/Jl8Ba8koU97thQmxEAKMkApg2rbFjwTXLl
 HWr7FCkhjq/2PsBW0/rG04jLI733ejSfRPYTNIGGEG7VzDbDzzW/YvJta49kpCQa+al0vG
 L45HquU2cnZCeb4f+gy4jL9PGImwTRbgget2opl/ayqJlff4IulCbq7qICPM7WfetZEcLL
 LvMkZKTudFH0Kadx8u7PKunN0APgOOY87gvQlbA0vECL36u6BT3YPyrsS/O1S9bGZ1HgBS
 HW/SpR//H1wBqnD0zrQASJtWqcI7yvFguItw1U4p+gv0SfP4AqfFUNAZZnWjxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=DzuYZnby
Subject: Re: [Buildroot] [PATCH v2] package/webkitgtk: bump to 2.48.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2025 10:23, Thomas Devoogdt wrote:
> This bumps webkit to the 2.48 stable series.
> 
> WebKitGTK+ 2.48 highlights:
> https://webkitgtk.org/2025/04/08/webkitgtk-2.48.html
> 
> News:
> - https://webkitgtk.org/2025/03/14/webkitgtk2.48.0-released.html
> - https://webkitgtk.org/2025/04/02/webkitgtk2.48.1-released.html
> 
> And brings some security fixes:
> - https://webkitgtk.org/security/WSA-2025-0002.html
> - https://webkitgtk.org/security/WSA-2025-0003.html
> 
> Also,
> 
> - Raise the minimal GCC requirement [1],
> which should have been raised by the 2.46.4 bump.
> 
> - Handle SPEECH_SYNTHESIS, which has been enabled
> by default in commit [2].
> 
> [1] https://github.com/WebKit/WebKit/commit/682ac4ba74c53d0cd488c7a595096224a9abb036
> [2] https://github.com/WebKit/WebKit/commit/10381a8de938024f31935184af470ccbce0b22d9
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

  Applied to 2025.02.x, thanks.

  Because of the CVE fixes it already should have been applied before.

  Regards,
  Arnout

> ---
> v2: added additional security report and a link to the release highlights
> ---
>   package/webkitgtk/Config.in      | 6 +++---
>   package/webkitgtk/webkitgtk.hash | 6 +++---
>   package/webkitgtk/webkitgtk.mk   | 9 ++++++++-
>   3 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index 3594299314..bcb4b12fa3 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -16,12 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>    depends on BR2_TOOLCHAIN_HAS_SYNC_4
>    depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
> 
> -comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL,
> dynamic library, gcc >= 10, host gcc >= 4.9"
> +comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL,
> dynamic library, gcc >= 11, host gcc >= 4.9"
>    depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>    depends on !BR2_BINFMT_FLAT
>    depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
>    !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
> - !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
> + !BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
>    !BR2_HOST_GCC_AT_LEAST_4_9
>    depends on BR2_USE_MMU
> 
> @@ -33,7 +33,7 @@ config BR2_PACKAGE_WEBKITGTK
>    depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
>    depends on BR2_INSTALL_LIBSTDCPP
>    depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> - depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
> + depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
>    depends on BR2_USE_WCHAR # icu, libsoup3
>    depends on BR2_PACKAGE_LIBGTK3
>    depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 96100d4c7c..fd9420bad9 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://www.webkitgtk.org/releases/webkitgtk-2.46.4.tar.xz.sums
> -sha1  10d4dbd222acec30b1d20ee3b7d02c0d9727c5a9  webkitgtk-2.46.4.tar.xz
> -sha256  0eff5f0ab0a2872ec87df62bc32e3289c8af625716ac71e94b298d74e0374176
>   webkitgtk-2.46.4.tar.xz
> +# From https://www.webkitgtk.org/releases/webkitgtk-2.48.1.tar.xz.sums
> +sha1  f7939f920f92f6b1395b8573f069d3fb9c085b3f  webkitgtk-2.48.1.tar.xz
> +sha256  98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f
>   webkitgtk-2.48.1.tar.xz
> 
>   # Hashes for license files:
>   sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4
>   Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index ec63d093b7..2c22bfb607 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
> 
> -WEBKITGTK_VERSION = 2.46.4
> +WEBKITGTK_VERSION = 2.48.1
>   WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>   WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>   WEBKITGTK_INSTALL_STAGING = YES
> @@ -73,6 +73,13 @@ else
>   WEBKITGTK_CONF_OPTS += -DENABLE_MINIBROWSER=OFF
>   endif
> 
> +ifeq ($(BR2_PACKAGE_FLITE),y)
> +WEBKITGTK_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=ON
> +WEBKITGTK_DEPENDENCIES += flite
> +else
> +WEBKITGTK_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=OFF
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LCMS2),y)
>   WEBKITGTK_CONF_OPTS += -DUSE_LCMS=ON
>   WEBKITGTK_DEPENDENCIES += lcms2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
