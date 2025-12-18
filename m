Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6A0D6E2B1
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B82F441119;
	Thu, 18 Dec 2025 16:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-x4D5HgQ-fr; Thu, 18 Dec 2025 16:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D52BB4112F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075898;
	bh=JHYJ4BrjPPt74WNbMObYvac023tnFV3AbnahoOQpl/8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PtGUJORYMLGHTWqIqHj+XzsnZQjscBWGX6xOJMMvcGS2vFgWuax0Fvwa6AtnWdSyF
	 JmIA7Eb+ckImcWoNOElqlyslrP9G5lU7S9efRuxZXyqTrmZd0cI8x8gNoe5ImIK7BC
	 zgu8/xgzOtW5bN5ZrrCb+LbYNFS6sIpHj505lBfsOKcv8ymvQurF8m6UoKws8AYz9D
	 b/mMPDXbf2yraJqLJsVgplBgiLNAfmnqQH134+OMERhmXaHbkSDKtbupsfWh24Xpsh
	 /WrkKOex8hwxqNRv86dj/YKPYbeH/EwAT2KNwPIWtI8+C7pyO/GUp3MhLIUm2ULyrv
	 zH/ZagWdQcgdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D52BB4112F;
	Thu, 18 Dec 2025 16:38:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C183E1A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A881E80BA7
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_zm2OY36mjG for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:38:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EF6180BA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF6180BA4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EF6180BA4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3157FB97A323; Thu, 18 Dec 2025 17:38:14 +0100 (CET)
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:38:09 +0100
Message-ID: <20251218163809.380089-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207201705.4154936-1-thomas@devoogdt.com>
References: <20251207201705.4154936-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075894; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=AWYAx/2TpWRrTFLLPOEKKLPwcFW4GoR7SH1RP/ai7AA=;
 b=eYJTkK1PaJ8s7z2s+qqfoI1mM8EvKRbM1SdUOql7ephgyTsYBUNZY5rOIB1uCgc2iqV4aa
 VvRSzinlg1bDNsGf2Kdkm7r9s1yvWpT0TI9WEeeoy+KhPzIBsIJoigDr5bXucJ4o3JWfjN
 MMuHjXFdqAFMboNqsKUhEGq3Fj40IDzo143ggC2rVtDOmvxJ2SkrxiBeOtqaqLpQqe/RAR
 7IX0nC3cLcQKS/+KOwpi0JoNI3RGN27KPnG4dSvbCVfSNctHJFdjV4lR8oo2UCmWTX9Msg
 hVo6cOuKB/UKEj4O7YaDWlNSlbuGic/VqvOdB7zlvXFYaK25fcFNE6NSOf5WIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=eYJTkK1P
Subject: Re: [Buildroot] [PATCH] package/fluent-bit: bump to 4.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This is a major release that introduces new features,
> including one highlighted in the release notes:
> 
> "The v4.2 release introduces a powerful new Direct Routing
>  capability that allows inputs to specify routes directly to
>  outputs, bypassing the traditional routing mechanism."
> 
> But it also brings some security fixes. Not all of
> them are relevant, but some piece of lecture can be found here [1].
> 
> News:
> - https://fluentbit.io/announcements/v4.1.0/
> - https://fluentbit.io/announcements/v4.1.1/
> - https://fluentbit.io/announcements/v4.2.0/
> 
> The patch 0001-plugins-kafka-fix-cmake-cross-compile-error.patch
> can be dropped as it has been merged upstream [2].
> 
> [1] https://www.theregister.com/2025/11/24/fluent_bit_cves/
> [2] https://github.com/fluent/fluent-bit/pull/9600
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to 2025.11.x. Thanks

> ---
>  ...ibrdkafka-only-require-a-C-compiler.patch} |  2 +-
>  ...-kafka-fix-cmake-cross-compile-error.patch | 47 -------------------
>  package/fluent-bit/fluent-bit.hash            |  2 +-
>  package/fluent-bit/fluent-bit.mk              |  2 +-
>  4 files changed, 3 insertions(+), 50 deletions(-)
>  rename package/fluent-bit/{0002-lib-librdkafka-only-require-a-C-compiler.patch => 0001-lib-librdkafka-only-require-a-C-compiler.patch} (98%)
>  delete mode 100644 package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
> 
> diff --git a/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch b/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
> similarity index 98%
> rename from package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
> rename to package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
> index 83c77ff70ce..660ed7bed49 100644
> --- a/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
> +++ b/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
> @@ -1,4 +1,4 @@
> -From c33d6bd392c5c8bbd231b2a9d00d4959cc553c44 Mon Sep 17 00:00:00 2001
> +From 7329316bdcc72aceb6bbbdf8711f5bf8894c2a15 Mon Sep 17 00:00:00 2001
>  From: Thomas Devoogdt <thomas.devoogdt@barco.com>
>  Date: Tue, 25 Jul 2023 09:10:41 +0200
>  Subject: [PATCH] lib: librdkafka: only require a C compiler
> diff --git a/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch b/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
> deleted file mode 100644
> index 8b74d5911d9..00000000000
> --- a/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From a21de9cb95f2199270a6ac6922ffa4ca8d453f26 Mon Sep 17 00:00:00 2001
> -From: Thomas Devoogdt <thomas@devoogdt.com>
> -Date: Sat, 16 Nov 2024 19:46:28 +0100
> -Subject: [PATCH] plugins: kafka: fix cmake cross compile error
> -
> -KAFKA_INCLUDEDIR is not set if FLB_PREFER_SYSTEM_LIB_KAFKA is not used,
> -when cross-compiling, it just translates to -I/librdkafka, which is not allowed.
> -Fix this by only including KAFKA_INCLUDEDIR if really set.
> -
> -x86_64-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/librdkafka'
> -
> -Upstream: https://github.com/fluent/fluent-bit/pull/9600
> -Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ----
> - plugins/in_kafka/CMakeLists.txt  | 4 +++-
> - plugins/out_kafka/CMakeLists.txt | 4 +++-
> - 2 files changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/plugins/in_kafka/CMakeLists.txt b/plugins/in_kafka/CMakeLists.txt
> -index 928266b57..dc251276e 100644
> ---- a/plugins/in_kafka/CMakeLists.txt
> -+++ b/plugins/in_kafka/CMakeLists.txt
> -@@ -3,5 +3,7 @@ set(src
> -   )
> - 
> - FLB_PLUGIN(in_kafka "${src}" ${KAFKA_LIBRARIES} flb-aws)
> --target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
> -+if(DEFINED KAFKA_INCLUDEDIR)
> -+  target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
> -+endif()
> - target_link_libraries(flb-plugin-in_kafka -lpthread)
> -diff --git a/plugins/out_kafka/CMakeLists.txt b/plugins/out_kafka/CMakeLists.txt
> -index 9d8b34642..1c967329f 100644
> ---- a/plugins/out_kafka/CMakeLists.txt
> -+++ b/plugins/out_kafka/CMakeLists.txt
> -@@ -5,5 +5,7 @@ set(src
> -   kafka.c)
> - 
> - FLB_PLUGIN(out_kafka "${src}" ${KAFKA_LIBRARIES} flb-aws)
> --target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
> -+if(DEFINED KAFKA_INCLUDEDIR)
> -+  target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
> -+endif()
> - target_link_libraries(flb-plugin-out_kafka -lpthread)
> --- 
> -2.43.0
> -
> diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
> index 3a4e637d885..be02761ed53 100644
> --- a/package/fluent-bit/fluent-bit.hash
> +++ b/package/fluent-bit/fluent-bit.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  0031f74b616b4669064a59902559da2f87174aa8007e749b5df19ed79c534f5b  fluent-bit-4.0.9.tar.gz
> +sha256  44fe0f52e89a63b213695748f99691d0a6247a4bd05065f1b517c798d9f89bcc  fluent-bit-4.2.0.tar.gz
>  sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> index 73bd686b279..f571896797c 100644
> --- a/package/fluent-bit/fluent-bit.mk
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLUENT_BIT_VERSION = 4.0.9
> +FLUENT_BIT_VERSION = 4.2.0
>  FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
>  FLUENT_BIT_LICENSE = Apache-2.0
>  FLUENT_BIT_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
