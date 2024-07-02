Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE993C3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7584E810E7;
	Tue,  2 Jul 2024 19:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnmLAnXskmlB; Tue,  2 Jul 2024 19:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08913810FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08913810FB;
	Tue,  2 Jul 2024 19:40:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 496201BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41947810FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUgnaa3kzN5I for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2B4C810E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2B4C810E7
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2B4C810E7
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:40:13 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52cdcd26d61so5117476e87.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719949211; x=1720554011;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ur99/8Xqh63Rh/8qRcmETWnT2n8tBbp+Gm0lfaiIVUc=;
 b=UMZk949F0L4Npx81JFB3b3/NuvXb1vDVlWKChn8xADckECoGn56WiGpNxky5WwYrlg
 QXRYs1VIOAEtQJe0sfJyIF3CN0A2J6mtLcBGiO0h+WVjKEzNneHoDmsBDFZEt8JEMcX9
 XQoiLskDkocIfuqQUD2NmCaliEf/5h54uxYqZqu+Zydr9Q5NV6zfqbZgSpjihyoYD3mJ
 rpEAJpN/c/2HqOXScwYWbaMXfDOoJrGcTkBlqbo0buRf67/68vHD8U6+T820Tsr4dhKU
 r57rWGhDOVFh8lKttLyVOsqWSOIhAMRv3sHdYaYSBj+n19xX4Lk09wMUOcMJD+Ltd+Vd
 FMYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkYLLAI9NslmQEI/QIri+EFAMrqwxGDyiRaRKREvmLT1T4+viO66VyChtxTy99MayEn0JQoBds18qtzp5czHnyfSHZdNl1ig==
X-Gm-Message-State: AOJu0Yyv0jAuiw8vhyjL7RediqbmxWbuR48V0hV0DjELpQSKNEsJFrzN
 TFsJMQLiLgd/0bBwYzO420Sb0qNyMY6nESu4xJxqeZhWB4dPZWb/22RDPr9AKyxI7K0IbJ1iKQd
 t
X-Google-Smtp-Source: AGHT+IGAVjYzTJB+rZXJCiX+PDjy+UA5vaeAT6TlSSbmnv+n8V5Wg9w1upe5BN2wX9fS/Q5g/rLZOQ==
X-Received: by 2002:a05:6512:2312:b0:52c:7fe8:6489 with SMTP id
 2adb3069b0e04-52e8273e4a5mr6566834e87.63.1719949211409; 
 Tue, 02 Jul 2024 12:40:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3c25esm209665455e9.9.2024.07.02.12.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:40:10 -0700 (PDT)
Message-ID: <f619cdf5-395c-4e37-87fe-49c7863b72bf@mind.be>
Date: Tue, 2 Jul 2024 21:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702092945.2394743-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240702092945.2394743-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719949211; x=1720554011; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ur99/8Xqh63Rh/8qRcmETWnT2n8tBbp+Gm0lfaiIVUc=;
 b=EltMyii3fUH1IjheT8TXAheIIwEhio3IOVsjNFqyq5lQ9WGJphc383K11QB+eUu8rS
 ylH/rdnBdcNoLC7DOo+XuXoiZlI2793w6NJwvyNaaJUbuRJimY+Jo/mXwsuOVB4vki0D
 tYR1QurK/OJ/TIqrXn1HBx8ohWokMdEgux30gFbypD9AyNL4C9cn7PiyKS1+b1zXESZI
 STcHIYdwSbg80kwypNooehsPMGYDSNYw7bOMn8/AtIIabp86DN+DNlmlshUJ6bnoF5t0
 b0INsHI3an00yf9fbxe6MiCOhU3leAz+G9N42vf/d4qXQCK+xNM7MzyxaeOWxw+D3RX2
 Mqdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EltMyii3
Subject: Re: [Buildroot] [PATCH 1/1] package/grpc: update the patches to be
 applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: linux-amarula@amarulasolutions.com, Robert Rose <robertroyrose@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 11:29, Dario Binacchi wrote:
> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, grpc fails to build with output:
> 
>      Applying 0003-host-grpc-only-cpp-plugin.patch using patch:
>      patching file CMakeLists.txt
>      Hunk #2 succeeded at 567 (offset 8 lines).
>      Hunk #3 succeeded at 580 (offset 7 lines).
>      Hunk #4 succeeded at 1315 (offset 79 lines).
>      Hunk #5 succeeded at 1368 (offset 79 lines).
>      Hunk #6 FAILED at 1462.
>      Hunk #7 succeeded at 2515 (offset 131 lines).
>      Hunk #8 succeeded at 2631 (offset 107 lines).
>      Hunk #9 succeeded at 3117 (offset 186 lines).
>      Hunk #10 succeeded at 3202 (offset 198 lines).
>      Hunk #11 succeeded at 3654 (offset 172 lines).
>      Hunk #12 succeeded at 3909 (offset 184 lines).
>      Hunk #13 succeeded at 4203 (offset 158 lines).
>      Hunk #14 succeeded at 4263 (offset 158 lines).
>      Hunk #15 succeeded at 4347 (offset 158 lines).
>      Hunk #16 FAILED at 4281.
>      Hunk #17 succeeded at 11110 (offset -143 lines).
>      Hunk #18 succeeded at 11140 (offset -143 lines).
>      Hunk #19 succeeded at 23153 (offset 3325 lines).
>      Hunk #20 succeeded at 23250 (offset 3325 lines).
>      2 out of 20 hunks FAILED -- saving rejects to file CMakeLists.txt.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                           |  1 -
>   .../grpc/0003-host-grpc-only-cpp-plugin.patch | 59 ++++++++++---------
>   2 files changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 76b1c3c49ba1..532a308891f1 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -700,7 +700,6 @@ package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
>   package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
>   package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch lib_patch.Upstream
>   package/grpc/0002-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch lib_patch.Upstream
> -package/grpc/0003-host-grpc-only-cpp-plugin.patch lib_patch.Upstream
>   package/grpc/0004-disable-unconditionally-downloading-api-repos.patch lib_patch.Upstream
>   package/gstreamer1/gstd/0001-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch lib_patch.Upstream
>   package/guile/0001-calculate-csqrt_manually.patch lib_patch.Upstream
> diff --git a/package/grpc/0003-host-grpc-only-cpp-plugin.patch b/package/grpc/0003-host-grpc-only-cpp-plugin.patch
> index c68b096df65c..bfb871305349 100644
> --- a/package/grpc/0003-host-grpc-only-cpp-plugin.patch
> +++ b/package/grpc/0003-host-grpc-only-cpp-plugin.patch
> @@ -1,4 +1,4 @@
> -From a1922eadfc87da3dd221ff631f94ddd4a8ee7049 Mon Sep 17 00:00:00 2001
> +From 0f2c73b62bdc612f9d5cdd8e0c765995470d4f8b Mon Sep 17 00:00:00 2001
>   From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>   Date: Tue, 25 May 2021 14:55:23 +0200
>   Subject: [PATCH] Add option to restrict building of (host-)grpc to
> @@ -7,7 +7,7 @@ Subject: [PATCH] Add option to restrict building of (host-)grpc to
>   This avoids unnecessary dependencies on big packages like libabseil-cpp and
>   others.
>   
> -Upstream-status: not accepted (see https://github.com/grpc/grpc/issues/25322)
> +Upstream: not accepted (see https://github.com/grpc/grpc/issues/25322)
>   
>   Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> @@ -15,11 +15,11 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   Updated for 1.48.0:
>   Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
>   ---
> - CMakeLists.txt | 43 +++++++++++++++++++++++++++++++++++--------
> - 1 file changed, 35 insertions(+), 8 deletions(-)
> + CMakeLists.txt | 39 +++++++++++++++++++++++++++++++++++----
> + 1 file changed, 35 insertions(+), 4 deletions(-)
>   
>   diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index d3963b074b..51cef83141 100644
> +index 0dcae6b1aee5..57b3963a43b0 100644
>   --- a/CMakeLists.txt
>   +++ b/CMakeLists.txt
>   @@ -49,12 +49,16 @@ option(gRPC_BUILD_TESTS "Build tests" OFF)
> @@ -39,7 +39,7 @@ index d3963b074b..51cef83141 100644
>    set(gRPC_INSTALL ${gRPC_INSTALL_default} CACHE BOOL
>        "Generate installation target")
>    
> -@@ -555,6 +559,8 @@ add_custom_target(plugins
> +@@ -563,6 +567,8 @@ add_custom_target(plugins
>      DEPENDS ${_gRPC_PLUGIN_LIST}
>    )
>    
> @@ -48,7 +48,7 @@ index d3963b074b..51cef83141 100644
>    add_custom_target(tools_c
>      DEPENDS
>    )
> -@@ -567,6 +573,8 @@ add_custom_target(tools_cxx
> +@@ -574,6 +580,8 @@ add_custom_target(tools_cxx
>    add_custom_target(tools
>      DEPENDS tools_c tools_cxx)
>    
> @@ -57,7 +57,7 @@ index d3963b074b..51cef83141 100644
>    protobuf_generate_grpc_cpp_with_import_path_correction(
>      src/proto/grpc/channelz/channelz.proto src/proto/grpc/channelz/channelz.proto
>    )
> -@@ -1228,6 +1236,7 @@ if(gRPC_BUILD_TESTS)
> +@@ -1307,6 +1315,7 @@ if(gRPC_BUILD_TESTS)
>        DEPENDS buildtests_c buildtests_cxx)
>    endif()
>    
> @@ -65,7 +65,7 @@ index d3963b074b..51cef83141 100644
>    
>    add_library(address_sorting
>      third_party/address_sorting/address_sorting.c
> -@@ -1280,6 +1289,8 @@ if(gRPC_INSTALL)
> +@@ -1359,6 +1368,8 @@ if(gRPC_INSTALL)
>      )
>    endif()
>    
> @@ -74,16 +74,16 @@ index d3963b074b..51cef83141 100644
>    if(gRPC_BUILD_TESTS)
>    
>    add_library(end2end_tests
> -@@ -1451,6 +1462,8 @@ endforeach()
> +@@ -1512,6 +1523,8 @@ target_link_libraries(end2end_tests
>    
>    endif()
>    
>   +if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
>   +
>    add_library(gpr
> -   src/core/ext/upb-generated/google/protobuf/any.upb.c
> -   src/core/ext/upb-generated/google/rpc/status.upb.c
> -@@ -2373,6 +2386,8 @@ if(gRPC_INSTALL)
> +   src/core/lib/gpr/alloc.cc
> +   src/core/lib/gpr/atm.cc
> +@@ -2504,6 +2517,8 @@ if(gRPC_INSTALL)
>      )
>    endif()
>    
> @@ -92,7 +92,7 @@ index d3963b074b..51cef83141 100644
>    if(gRPC_BUILD_TESTS)
>    
>    add_library(grpc_test_util
> -@@ -2511,6 +2526,8 @@ endif()
> +@@ -2618,6 +2633,8 @@ endif()
>    
>    endif()
>    
> @@ -101,7 +101,7 @@ index d3963b074b..51cef83141 100644
>    add_library(grpc_unsecure
>      src/core/ext/filters/census/grpc_context.cc
>      src/core/ext/filters/channel_idle/channel_idle_filter.cc
> -@@ -2916,6 +2933,8 @@ if(gRPC_INSTALL)
> +@@ -3102,6 +3119,8 @@ if(gRPC_INSTALL)
>      )
>    endif()
>    
> @@ -110,7 +110,7 @@ index d3963b074b..51cef83141 100644
>    if(gRPC_BUILD_TESTS)
>    
>    if(gRPC_BUILD_CODEGEN)
> -@@ -2987,6 +3006,8 @@ endif()
> +@@ -3185,6 +3204,8 @@ endif()
>    
>    endif()
>    
> @@ -119,7 +119,7 @@ index d3963b074b..51cef83141 100644
>    add_library(grpc++
>      src/core/ext/transport/binder/client/binder_connector.cc
>      src/core/ext/transport/binder/client/channel_create.cc
> -@@ -3463,6 +3484,7 @@ if(gRPC_INSTALL)
> +@@ -3635,6 +3656,7 @@ if(gRPC_INSTALL)
>      )
>    endif()
>    
> @@ -127,7 +127,7 @@ index d3963b074b..51cef83141 100644
>    
>    if(gRPC_BUILD_CODEGEN)
>    add_library(grpc++_reflection
> -@@ -3705,6 +3727,8 @@ target_link_libraries(grpc++_test_util
> +@@ -3889,6 +3911,8 @@ target_link_libraries(grpc++_test_util
>    
>    endif()
>    
> @@ -136,7 +136,7 @@ index d3963b074b..51cef83141 100644
>    add_library(grpc++_unsecure
>      src/cpp/client/channel_cc.cc
>      src/cpp/client/client_callback.cc
> -@@ -4023,6 +4047,7 @@ if(gRPC_INSTALL)
> +@@ -4181,6 +4205,7 @@ if(gRPC_INSTALL)
>      )
>    endif()
>    
> @@ -144,7 +144,7 @@ index d3963b074b..51cef83141 100644
>    
>    add_library(grpc_plugin_support
>      src/compiler/cpp_generator.cc
> -@@ -4082,7 +4107,7 @@ foreach(_hdr
> +@@ -4240,7 +4265,7 @@ foreach(_hdr
>    endforeach()
>    
>    
> @@ -153,7 +153,7 @@ index d3963b074b..51cef83141 100644
>      install(TARGETS grpc_plugin_support EXPORT gRPCTargets
>        RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>        BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> -@@ -4166,6 +4191,8 @@ endif()
> +@@ -4324,6 +4349,8 @@ endif()
>    
>    endif()
>    
> @@ -162,16 +162,16 @@ index d3963b074b..51cef83141 100644
>    add_library(upb
>      third_party/upb/third_party/utf8_range/naive.c
>      third_party/upb/third_party/utf8_range/range2-neon.c
> -@@ -4256,6 +4283,8 @@ target_link_libraries(gen_hpack_tables
> -   gpr
> - )
> +@@ -4393,6 +4420,8 @@ if(gRPC_INSTALL)
> +   )
> + endif()
>    
>   +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
>   +
>    
>    if(gRPC_BUILD_TESTS)
>    
> -@@ -11228,7 +11257,7 @@ target_link_libraries(grpc_cli
> +@@ -11085,7 +11114,7 @@ target_link_libraries(grpc_completion_queue_test
>    
>    
>    endif()
> @@ -180,7 +180,7 @@ index d3963b074b..51cef83141 100644
>    
>    add_executable(grpc_cpp_plugin
>      src/compiler/cpp_plugin.cc
> -@@ -11258,7 +11287,7 @@ target_link_libraries(grpc_cpp_plugin
> +@@ -11115,7 +11144,7 @@ target_link_libraries(grpc_cpp_plugin
>    
>    
>    
> @@ -189,7 +189,7 @@ index d3963b074b..51cef83141 100644
>      install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
>        RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>        BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> -@@ -19803,7 +19832,7 @@ endif()
> +@@ -23128,7 +23157,7 @@ endif()
>    
>    
>    
> @@ -198,9 +198,12 @@ index d3963b074b..51cef83141 100644
>    
>    if(gRPC_INSTALL)
>      install(EXPORT gRPCTargets
> -@@ -19900,3 +19929,5 @@ generate_pkgconfig(
> +@@ -23225,3 +23254,5 @@ generate_pkgconfig(
>      "-lgrpc++_unsecure"
>      ""
>      "grpc++_unsecure.pc")
>   +
>   +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
> +--
> +2.43.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
