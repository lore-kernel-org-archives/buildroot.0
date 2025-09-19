Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4459CAC5A8
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E9D56108E;
	Fri, 19 Sep 2025 12:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRoHTkW3VFrp; Fri, 19 Sep 2025 12:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C8A4610BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C8A4610BA;
	Fri, 19 Sep 2025 12:58:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2067AE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0707740DB4
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dt1M7XiOZfjX for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:58:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C5CC540DB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5CC540DB5
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5CC540DB5
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:02 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3df15fdf0caso1842482f8f.0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286681; x=1758891481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vx76rrI6OwI96+LoadVa9MTJBy5f/IXLthnOysvzNt4=;
 b=M1tkzkQHLTjXNoj6pOqpUkmUiCoHhoHuAu2J7oNwMaK8b2qz/HYZHs98YCynsW/xBW
 bNRR5u+fzCNSs/2vzp2I/XhiK4WEZnrSDzaCJpcev/ixRn6x0nSRMGGa9nIhtxKFfxyJ
 PcSb69visB8PvJAg5FAerSpWw8PZLtftZhXh7SWYPYb/HhbZvNxG/qf/UoOZ0fnPenrc
 DnlWsxnJJYEP04j7aT6LaFepCLK6Akl7A+GfhbABC5HxOM4WaKTKHG6kLVi4kvmpODjj
 anUnbF+/epBRDPu/fqSVh0hfWzaKsIJ8XJ1lQ9/N6ejrQrrFv8XOPNwf9dah6DdWyYqU
 /hhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+0er/ZhtdjbyXujc26Lta/ku15jobfnZ+DrzhEmxto3bruK7JkBfaU2RvAKYGOP9RMRtC02SM7VQ=@buildroot.org
X-Gm-Message-State: AOJu0YzWacTGEk8XuknJAdtBHBJ4Ok/Iln21ZuPjkLMo/ygQwT16qsVw
 LT/W6qoSpofeJEYcTscjMeolDRc/zUcFuIYsCo23PYkCPSxydsuyOGPjNfyDDQ4FAeRAPwKKj/G
 8PoQtobU=
X-Gm-Gg: ASbGncvqFR+w1xA/tD0Aziy11dbNCsL6/Wjkw4FePkOL9aa/dPbB9lSx2vkvAN0mrRY
 mJmvTtIKWH2ip6NGYqWo+FtJ2JOD+K+YH8g5l3HqX/4pbvO4Gl6PVeV+o7TlSwa8bPrO0U3DspA
 R8YXA0AWjVIabQii2N2+dWaGCLq+ZNim07yBaMJhM65yu1ovy2r6++ZjVEsEydIXKWARmGUvqle
 +0FEpZoBGNdRTseImkqnIBXopbj78FMs0KBmr18ZbViVOS5FGjvMTdS8FThXg34kRxzLGw0kufT
 ugSO2Lvootb1MozqyIPeQh+Ey+WcHmLbDU7G5oQqJu1UEEYXaXOX30iDlwZGfM9O6aYEUI3Fnq0
 NW+xWkZ4c6dlxmtQ=
X-Google-Smtp-Source: AGHT+IHLwyQaQLuTJnbOyEcsvG4/AolY7INi0NIRVPIMsI51IGn/gshTC9c3THVGv0qMMem3NVFBOw==
X-Received: by 2002:a05:6000:184b:b0:3b7:8da6:1bb4 with SMTP id
 ffacd0b85a97d-3ee86b847d0mr2488904f8f.58.1758286680681; 
 Fri, 19 Sep 2025 05:58:00 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3f127660840sm1524887f8f.11.2025.09.19.05.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:58:00 -0700 (PDT)
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:57:59 +0200
Message-ID: <20250919125759.137717-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910111944.2685069-1-thomas@devoogdt.com>
References: <20250910111944.2685069-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286681; x=1758891481; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vx76rrI6OwI96+LoadVa9MTJBy5f/IXLthnOysvzNt4=;
 b=iF7h8SnfCNFukExOZ1rhJP6aKADcowpRWqZB8Ndh2EoZwDwptd7SCxgTHe830OR//G
 XIqx3oG3PebI6YBf/e1Ab/yRpcNKiT6MJ7faV7SYeeQvuG2QLrFeCc8m6ri6GegLHon4
 0Ta8JOvtYYl58uwANeBgDGhERthN5YDFzrJx3ZJihX0CTBZMNMt5eha8G/PZcY70EzYt
 fCo1g2W7H7dBE+I2oDh4jj4eFO6PACnmdu084hLfQiafLKMN7oBERElSJZQQUr57VQqH
 nyk6lMTVVcVyJ87NKGbzpHvDexjXyUNn5po7SZhWAyUbj33iV0b/mkQV4gE13Sn3+QyH
 rPYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iF7h8Snf
Subject: Re: [Buildroot] [PATCH v1] package/fluent-bit: bump to 4.0.9
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> News:
>  - https://fluentbit.io/announcements/v4.0.4/
>  - https://fluentbit.io/announcements/v4.0.5/
>  - https://fluentbit.io/announcements/v4.0.6/
>  - https://fluentbit.io/announcements/v4.0.7/
>  - https://fluentbit.io/announcements/v4.0.8/
>  - https://fluentbit.io/announcements/v4.0.9/
> 
> Fixes:
>  - https://autobuild.buildroot.org/results/770/770e9106a0c92f02e0f699505e69b35ac0e6cd41/build-end.log
> 
>    /home/buildroot/instance-0/output-1/build/fluent-bit-4.0.3/plugins/out_cloudwatch_logs/cloudwatch_api.c:1540:66: error: implicit declaration of function 'strcasestr'; did you mean 'strcasecmp'? [-Wimplicit-function-declaration]
> 
>    Fix commit: https://github.com/fluent/fluent-bit/pull/10452
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to 2025.08.x. Thanks

> ---
>  ...s-kafka-fix-cmake-cross-compile-error.patch | 10 +++++-----
>  ...-librdkafka-only-require-a-C-compiler.patch | 18 +++++++++---------
>  package/fluent-bit/fluent-bit.hash             |  2 +-
>  package/fluent-bit/fluent-bit.mk               |  2 +-
>  4 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch b/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
> index de5dc54e75..8b74d5911d 100644
> --- a/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
> +++ b/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
> @@ -1,4 +1,4 @@
> -From f32c4e909ec4a4872c2c5fc186f27d1f7e4e8c2a Mon Sep 17 00:00:00 2001
> +From a21de9cb95f2199270a6ac6922ffa4ca8d453f26 Mon Sep 17 00:00:00 2001
>  From: Thomas Devoogdt <thomas@devoogdt.com>
>  Date: Sat, 16 Nov 2024 19:46:28 +0100
>  Subject: [PATCH] plugins: kafka: fix cmake cross compile error
> @@ -17,26 +17,26 @@ Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
>   2 files changed, 6 insertions(+), 2 deletions(-)
>  
>  diff --git a/plugins/in_kafka/CMakeLists.txt b/plugins/in_kafka/CMakeLists.txt
> -index ede0831f9..02e2dc786 100644
> +index 928266b57..dc251276e 100644
>  --- a/plugins/in_kafka/CMakeLists.txt
>  +++ b/plugins/in_kafka/CMakeLists.txt
>  @@ -3,5 +3,7 @@ set(src
>     )
>   
> - FLB_PLUGIN(in_kafka "${src}" ${KAFKA_LIBRARIES})
> + FLB_PLUGIN(in_kafka "${src}" ${KAFKA_LIBRARIES} flb-aws)
>  -target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
>  +if(DEFINED KAFKA_INCLUDEDIR)
>  +  target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
>  +endif()
>   target_link_libraries(flb-plugin-in_kafka -lpthread)
>  diff --git a/plugins/out_kafka/CMakeLists.txt b/plugins/out_kafka/CMakeLists.txt
> -index 01c96529b..54b14fc2a 100644
> +index 9d8b34642..1c967329f 100644
>  --- a/plugins/out_kafka/CMakeLists.txt
>  +++ b/plugins/out_kafka/CMakeLists.txt
>  @@ -5,5 +5,7 @@ set(src
>     kafka.c)
>   
> - FLB_PLUGIN(out_kafka "${src}" ${KAFKA_LIBRARIES})
> + FLB_PLUGIN(out_kafka "${src}" ${KAFKA_LIBRARIES} flb-aws)
>  -target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
>  +if(DEFINED KAFKA_INCLUDEDIR)
>  +  target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
> diff --git a/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch b/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
> index d7c6bba20b..83c77ff70c 100644
> --- a/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
> +++ b/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
> @@ -1,4 +1,4 @@
> -From dea6fb0138d9356ebdc4983a61c185bc759d86b0 Mon Sep 17 00:00:00 2001
> +From c33d6bd392c5c8bbd231b2a9d00d4959cc553c44 Mon Sep 17 00:00:00 2001
>  From: Thomas Devoogdt <thomas.devoogdt@barco.com>
>  Date: Tue, 25 Jul 2023 09:10:41 +0200
>  Subject: [PATCH] lib: librdkafka: only require a C compiler
> @@ -6,14 +6,14 @@ Subject: [PATCH] lib: librdkafka: only require a C compiler
>  Upstream: https://github.com/confluentinc/librdkafka/pull/4366
>  Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
>  ---
> - lib/librdkafka-2.8.0/CMakeLists.txt          | 22 ++++++++++++--
> - lib/librdkafka-2.8.0/examples/CMakeLists.txt | 31 +++++++++++++-------
> + lib/librdkafka-2.10.1/CMakeLists.txt          | 22 +++++++++++--
> + lib/librdkafka-2.10.1/examples/CMakeLists.txt | 31 ++++++++++++-------
>   2 files changed, 39 insertions(+), 14 deletions(-)
>  
> -diff --git a/lib/librdkafka-2.8.0/CMakeLists.txt b/lib/librdkafka-2.8.0/CMakeLists.txt
> +diff --git a/lib/librdkafka-2.10.1/CMakeLists.txt b/lib/librdkafka-2.10.1/CMakeLists.txt
>  index f3d05bad7..8ef47053a 100644
> ---- a/lib/librdkafka-2.8.0/CMakeLists.txt
> -+++ b/lib/librdkafka-2.8.0/CMakeLists.txt
> +--- a/lib/librdkafka-2.10.1/CMakeLists.txt
> ++++ b/lib/librdkafka-2.10.1/CMakeLists.txt
>  @@ -3,7 +3,16 @@ cmake_minimum_required(VERSION 3.5)
>   include("packaging/cmake/parseversion.cmake")
>   parseversion("src/rdkafka.h")
> @@ -57,10 +57,10 @@ index f3d05bad7..8ef47053a 100644
>   
>   if(RDKAFKA_BUILD_EXAMPLES)
>     add_subdirectory(examples)
> -diff --git a/lib/librdkafka-2.8.0/examples/CMakeLists.txt b/lib/librdkafka-2.8.0/examples/CMakeLists.txt
> +diff --git a/lib/librdkafka-2.10.1/examples/CMakeLists.txt b/lib/librdkafka-2.10.1/examples/CMakeLists.txt
>  index 91851d2cb..6874195ce 100644
> ---- a/lib/librdkafka-2.8.0/examples/CMakeLists.txt
> -+++ b/lib/librdkafka-2.8.0/examples/CMakeLists.txt
> +--- a/lib/librdkafka-2.10.1/examples/CMakeLists.txt
> ++++ b/lib/librdkafka-2.10.1/examples/CMakeLists.txt
>  @@ -5,8 +5,10 @@ endif(WIN32)
>   add_executable(producer producer.c ${win32_sources})
>   target_link_libraries(producer PUBLIC rdkafka)
> diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
> index ec820416ed..3a4e637d88 100644
> --- a/package/fluent-bit/fluent-bit.hash
> +++ b/package/fluent-bit/fluent-bit.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c7d276238d25242467218941842d8cd4df6cfa52cc9379ae5755220cdefd1dc1  fluent-bit-4.0.3.tar.gz
> +sha256  0031f74b616b4669064a59902559da2f87174aa8007e749b5df19ed79c534f5b  fluent-bit-4.0.9.tar.gz
>  sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> index 3e7e04907e..73bd686b27 100644
> --- a/package/fluent-bit/fluent-bit.mk
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLUENT_BIT_VERSION = 4.0.3
> +FLUENT_BIT_VERSION = 4.0.9
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
