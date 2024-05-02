Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D147C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 21:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7C560866;
	Thu,  2 May 2024 21:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fs0BqsRNhhZc; Thu,  2 May 2024 21:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 969C360876
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 969C360876;
	Thu,  2 May 2024 21:09:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D63661BF340
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 21:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C29F641BF8
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 21:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uquLTXGHrkup for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 21:09:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B27A41BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B27A41BF5
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B27A41BF5
 for <buildroot@buildroot.org>; Thu,  2 May 2024 21:09:01 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41b79451153so51929555e9.2
 for <buildroot@buildroot.org>; Thu, 02 May 2024 14:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714684140; x=1715288940;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iNe8oLWy2HJqMPIaBhlVjqXNJomZFBxZonGyq/ETboI=;
 b=TS2RgiBv9rsx78746U7ZD18n9DYOYWhvymmVBUj8Vng/9+QrUk+0BpyrJlMG9PdG70
 13d3+Zj2DU8WS1+gPYKXkAZ2dP1T9VvRUtlUlVXhv2pCI+/Y6F9FTD/Y59fdrptuWsQP
 Nds+W604Jx+oRHWJoq+rf3nsCyaLNDwVf8xGJE/FfLOoWku8U/qRVi41gweNSvx9lusX
 DKk5JMmO00J2LwOnsUZ9D77l+T1g0LifJfHGP04ZTKikHWYGjwYUh+uYMv/C8EifoU3O
 cK8+stVgr2noVsADFeJXsyhFyHsw2tbtPgDz1xSNBIjBJ1r8C2uR1yvfw6S6OnLymb7u
 QkpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUofMge8lNeJBpmaA21z171F2mWWDXzxrmGYS3pqR7SEYSxpaaUTqxjYqDoK8YqwzJbtRZ9bDMCgV2aCR2zUuUrGl2OnPLuaA==
X-Gm-Message-State: AOJu0Yy5wK1Fj8g65/xHqlbS6ImUks5PIpbdtkC3x5+CNPN4eWzJ0k4N
 xoAah3ZI18T6ddxYFvlZpm20sOb9j1ftgFZwsldumkzAdel4llS7PFy9s6LL23qGNmxFLztTL5R
 5
X-Google-Smtp-Source: AGHT+IFnY427eWtrk6rAldNgS/+BWZGoob4kzf1m7I2f06Hg51/ZATLuSP38s6QiKDGYistdL+Qjdg==
X-Received: by 2002:a05:600c:3d8b:b0:41a:b30e:42a3 with SMTP id
 bi11-20020a05600c3d8b00b0041ab30e42a3mr684305wmb.37.1714684139731; 
 Thu, 02 May 2024 14:08:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a056000018d00b0034e229a7d5bsm2124496wrx.7.2024.05.02.14.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 14:08:59 -0700 (PDT)
Message-ID: <97928e91-8148-41a4-b7a2-0297fc72446a@mind.be>
Date: Thu, 2 May 2024 23:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: franco ariel <fran.millocs@live.com.ar>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <PH0PR19MB5409054A4A7DF4561A75F2E9D0182@PH0PR19MB5409.namprd19.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <PH0PR19MB5409054A4A7DF4561A75F2E9D0182@PH0PR19MB5409.namprd19.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714684140; x=1715288940; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iNe8oLWy2HJqMPIaBhlVjqXNJomZFBxZonGyq/ETboI=;
 b=XZolgWY/hDj3ZF0QL87kKqQA6kDmolM1y+S0IJNQsfNzZQAy0zBGdtLVaME2xN+dFl
 eHanb5iwGho7cvLyjWZU1jADY0rmbGG3/RFjUpJb4ce9/3aDVIGE8RTVoK1rY8yV/0OZ
 qS8qXLkrdaq4enlQ9ygToDFVZ+8h0ZAGSx0hHXwomF9UiGDwJUU2Feb72WjOGZc/zlZ8
 Q66sggG9W+mU0jwuUEVe6rJEoNxrWuklp3H9nb2PDYUgixTInA5RntXTRycVZLMCXfBH
 KbL5BnGB37jjhTCZMQAaZSS7pO0YL2yFwCsCqbcG40SJGQdsFbzcpYKZlGGaJ7xAMtx4
 HOag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XZolgWY/
Subject: Re: [Buildroot] Error building flutter-engine
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/05/2024 21:45, franco ariel wrote:
> Hi everyone!
> 
> I'm trying to compile flutter-engine from the latest version of buildroot but, 
> I'm getting this error:
> 
>  >>> flutter-engine 3.19.5 Building
> cd /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5 && 
> PATH=/home/frank/buildroot-base/buildroot/output/host/share/depot_tools:"/home/frank/buildroot-base/buildroot/output/host/bin:/home/frank/buildroot-base/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" PUB_CACHE=/home/frank/buildroot-base/buildroot/dl/br-flutter-pub-cache HOME=/home/frank/buildroot-base/buildroot/output/host/share/flutter/sdk /home/frank/buildroot-base/buildroot/output/host/bin/ninja -j 33 -C /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5/out/linux_release_arm64
> ninja: Entering directory 
> `/home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5/out/linux_release_arm64'
> ninja: warning: premature end of file; recovering

  This looks like something went wrong in the configuring step, and the ninja 
file is corrupted... Perhaps a file size limit that was exceeded, or out of disk 
space?

  Regards,
  Arnout

> ninja: warning: -jN forced on command line; ignoring GNU make jobserver.
> [2485/8965] CXX obj/third_party/icu/source/i18n/icui18n_hidden_visibility.nfsubs.o
> 
> FAILED: obj/third_party/icu/source/i18n/icui18n_hidden_visibility.nfsubs.o
> /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5/buildtools/linux-x64/clang/bin/clang++ -MD -MF obj/third_party/icu/source/i18n/icui18n_hidden_visibility.nfsubs.o.d --target=aarch64-unknown-linux-gnu --sysroot /home/frank/buildroot-base/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot -DU_I18N_IMPLEMENTATION -DUSE_OPENSSL=1 -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_LIBCPP_DISABLE_AVAILABILITY=1 -D_LIBCPP_DISABLE_VISIBILITY_ANNOTATIONS -D_LIBCPP_ENABLE_THREAD_SAFETY_ANNOTATIONS -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DHAVE_DLOPEN=0 -DUCONFIG_ONLY_HTML_CONVERSION=1 -DUCONFIG_USE_ML_PHRASE_BREAKING=1 -DUCONFIG_USE_WINDOWS_LCID_MAPPING_API=0 -DU_CHARSET_IS_UTF8=1 -DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DUSE_CHROMIUM_ICU=1 -DU_ENABLE_TRACING=1 -DU_ENABLE_RESOURCE_TRACING=0 -DU_STATIC_IMPLEMENTATION -DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -I../.. -Igen -I../../third_party/libcxx/include -I../../third_party/lib
 cxxabi/include -I../../flutter/build/secondary/third_party/libcxx/config -I../../third_party/icu/source/common -I../../third_party/icu/source/i18n -fno-strict-aliasing -fstack-protector --param=ssp-buffer-size=4 -fPIC -pipe -pthread --target=aarch64-linux-gnu -DBORINGSSL_CLANG_SUPPORTS_DOT_ARCH -fcolor-diagnostics -fvisibility=hidden --sysroot=/home/frank/buildroot-base/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot -Wstring-conversion -Wnewline-eof -O2 -fno-ident -fdata-sections -ffunction-sections -g0 -Wno-deprecated-non-prototype -Wno-newline-eof -Wno-typedef-redefinition -Wendif-labels -Werror -Wno-missing-field-initializers -Wno-unused-parameter -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-implicit-int-float-conversion -Wno-deprecated-copy -Wno-psabi -Wno-deprecated-literal-operator -Wno-unqualified-std-cast-call -Wno-non-c-typedef-for-linkage -Wno-range-loop-construct -Wno-unused-function -Wno-parentheses -Wno-unused-function -Wno-unused-variable 
 -Wno-ambiguous-reversed-operator -Wno-deprecated-declarations -fvisibility=hidden -fvisibility-inlines-hidden -std=c++17 -nostdinc++ -nostdinc++ -fvisibility=hidden -fno-exceptions -Wno-newline-eof -c ../../third_party/icu/source/i18n/nfsubs.cpp -o obj/third_party/icu/source/i18n/icui18n_hidden_visibility.nfsubs.o
> clang++: error: clang frontend command failed with exit code 139 (use -v to see 
> invocation)
> Fuchsia clang version 18.0.0 (https://llvm.googlesource.com/llvm-project 
> 725656bdd885483c39f482a01ea25d67acf39c46)
> Target: aarch64-unknown-linux-gnu
> Thread model: posix
> InstalledDir: 
> /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5/buildtools/linux-x64/clang/bin
> clang++: note: diagnostic msg:
> ********************
> 
> I'm stuck on this since I format my computer, I download everything what I need, 
> and every time that it comes to flutter-engine, I get this error that I never seen.
> 
> 
> Thank you in advance,
> Franco.
> 
> 
> 
> 
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
