Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915FDCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5821C4078C;
	Sat, 10 Oct 2026 16:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efVLrw_IevPI; Sat, 10 Oct 2026 16:38:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B9CB24078E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791650281;
	b=eCZ+94u9SQc/xgIF+JeDbZhThabZDW5vGoOgGJNDkvrd0Zl5c5OUyKya8b8INPqTrzik
	 pVqcBc/EjnI4qLNO0zWVuunFRi1Pm1Ae1YA/Pr6XSaFgyEE7ablqfKU1BGcvuvwFaVr7I
	 hxSd9CaaPN5e3sqhv51mi0dE6SVctF8pSgRDtgdFRVaC0sBSBSLH+bmF8QZAtav8Gb6OL
	 XBZ2s6LaP2579D02aB14goRpZHqOBqZ+CcHjgtxDVoAEEFiYypP1LVivIqSpxfHQa8Z2q
	 L2KrlU7KDFBGAe266J7dlwvBGvaDXj3tqC4EOBh2on+CA+IJFV87Yo5zBRgqPPFkaZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791650281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZfyjIRANiWZiziUpoornZqYWi0HYHfoKEHggUTogTEg=;
	b=sK5YZCxlwGaDuHuOqxGn3p8j0Gj1dMqX+JNRlmst51tCZArj9yEkPePMjj2D437MBPl+
	 CaDJDSeNYjBEC/mBgTxf962F7gscx/nq0Kd4jI0YcQ4iUJV3DrgI3d7msWPHI437zEphQ
	 N6jr0WGT1TCyKizCIA2+ZYPr3zKqGVaN3d6fRejxZoGmvFbbmUpyZGk2DAkhlxAd2FZed
	 ZCYdfrTe1OTtaqo9tNuOWYtGGQpWFrTorBVsa+CSvf8qUaqK/J4k7u1kAm57x3tdI9vHG
	 gGlkCPACp5ITqB+hUTAFgAcRAXjwg5cd3mhtGwi0HSFwKmsy56xK3mizIrOMWYWAQ0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791650281;
	bh=ZfyjIRANiWZiziUpoornZqYWi0HYHfoKEHggUTogTEg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mUbhGmig3ALfCmC4RyoU0VQZKMg8jouCiOt6137zJCFLfJnkAIDaPza4NWGFaXos3
	 6Uv8fAVuC/Tnu4DPWFxUdwKf3cJWpohL3k0L0ypjocinlMcvr+ytAPFAXQAa+WVveG
	 x/0sL+j9JJg9XKSDm9iTnrqulYrJb0YtqOP6EcHyx/07hqS+/yu3fyIf6dJymCdNdz
	 Wtq96hnVHGPEV1niNhJPTvKtxNOydyHshDsdvDYF3ybOc2RW5HLj4hGx+v+tnGC50N
	 RJhw6vNbj2B4+uCwLHUun32gyEB1SWhdHGt4JbphMogMnYKVWO/w1DoF8f2Bd9NEBk
	 HOWJNS750Wqbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9CB24078E;
	Sat, 10 Oct 2026 16:38:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26EC3317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED6EE60648
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Xrew6No5C4b for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:37:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3AA426062B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791650278;
 b=WUNxNj9M7/hUm7++YFAGyOsFZ0lRRuUlcVrQ8UW8lewfWC/AgEhUTMDVLoub6BLoLT9/
 RNespxFGgcfazjMz1Qb1cclVeG8elOeZuHY5TmctyaFGvFaWJzlvAX9cePFdCo9Vj61VB
 rqK/rfMWYu1lhp1hRpTzIxtepNC42v+GIQ4kt5XbI5dhIg3kViL4fgrQ7lvdzyvt2fdZK
 GDl8EPPsHLuRLPPe8bYAhDlEIuysIDmfuhMoDy29db7A5ophp7D7aDn1RacMXBN7nqOVs
 /fFm2iUJLCokyeFpUPd3s7QZUccrgjsCwy8hQVp2OaSv9Zb2sbuv24GR+m7U1rOHPHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791650278;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=SvbK2TS6D5rusplBHe2+16HfH6auxaaBX5xpKrxR3Zk=;
 b=Mdr9kNn1AJ2dswrtft7X9kiuKqWqE7Lcne+vrM8YETP2iSyuTrkiHlBtAh4rq9Yw+KmU
 DFH/ZGNXkMTyGg6Y/IWu30RDKA8Ep4c1Q7rlwvUPargNu9GXngdfSVo798jK9im3KLhAl
 +chc3zDmeVpfyDpmT04FV8fFrGk5ShWrN7F3nHSDrrdYGh+YEwmzaapj8DW+TAPhOQuKW
 X7MdqPydkqy7bM4hrqfUBTwVJ3DuQSpOyfK6fpXKPznt1CH5iLnN30Gx/SifKAoirug7j
 8n8TUxl/0EvaOhKX58FQW7IpxtLm+/e1D2ybTkKFg/OGZtSLwzkOC0OZds8BxH48E0A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Fx1nuI4L; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AA426062B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:37:57 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso9235785e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791650275; x=1792255075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SvbK2TS6D5rusplBHe2+16HfH6auxaaBX5xpKrxR3Zk=;
 b=Txc70XUktZfMnBKXn1Au/XwU0e3h1a08xgNOF5+EFxxfNI2ZZYnzwtTYBJiHYZiDr0
 dvmeagqgIkJ4RHnQh1LXQMfQKz0fPoH80v6AL6DfDgWVRUM9zNi/8XZ6XvhG+pZs5w00
 rGNO6V9KrpiX2nPYDXGqa/oTY2/QNjqgHNqipP0kgAdCPv5TVRXvDT4KTpcVdi0l7uAY
 w2vg6GZ/SANS8LE/X78UFcfRKVPDUvIVu5HvIiWr5pueWG68ytMC78i0eVLXMPajgLwQ
 teOWqPFUnFKvoxgu3GCgh0l/gC+9HWlF8ZNJV2RHzGvy5zyVqUlz8+Zl8OdDtwk1HuOW
 O2UQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzPUhQwXKsAg9c3RSIzGpGXF2P5FObJRiX++aWl1FjAwda1KsHH9yURSZiLdMFm+N7cSo7Yk+2GzxA=@buildroot.org
X-Gm-Message-State: AFq9FYKXS0ej2AGAHhjRuWllJtfH2NMQMTyXopbO+TwtAyHhiJu0/We9
 1sMoqSrXp17b0LYlH/3L/H22BTvIy79lw/VOPM3QvaP/lnCxR54H7Whk+OWX6jW5MHQ=
X-Gm-Gg: AYBFou2utjDvVPvcfYjlUTR4D29ag7FDOFuOr974JEkGQ888GDMb75fyYPDbuw4ATEs
 F0g11SB3YysTUW/II86SssS2xvTE1PqbMH71nwoyHSfr/nHVoTw4Y93amxKfB4orGvuJZ0QYweq
 mZ394/6p3ugQDbQlJGMBTj4OVUb35aKKxgs69Q4STqoflYUkATC3Pen3bIB6+PufZhYa1FJvjEF
 CaDa2Qc1sdSfR73YhM+tsyeSpyZl+4lxS3uEya4kMlOk+mpSFhJKS50/r9bQAeBwxzyeV+H6Gl9
 1bwIitpzHmZNDIXLTSmv4S7EludlWbg8w9DS8awNWM0YWmdD2xZ3xTSFxDxocmfTcSIwhjompoV
 hxu//ZV/GJLBXEaQ6Uls3ptgtUhIa9IS3hzlcmrFhzStfCLaILUIRc9b3PCDS47VD4UaAsCsrzj
 l/b7t9rnmBtuiApJSEBmHGzF9HplnRjGlAVeRuLCsvMku42Fgh9pJK2uqNukv7zkxmOZEZUkhfu
 n+Qtlw75xxHX1SYhdDztluoSEhD3+T0ZS2RJ/qU1bGCdaWtRJdZttA0
X-Received: by 2002:a05:600c:46ca:b0:4a1:7a1e:6910 with SMTP id
 5b1f17b1804b1-4a18e48363amr97334015e9.4.1791650275140; 
 Sat, 10 Oct 2026 09:37:55 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bea0f1csm221359915e9.9.2026.10.10.09.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 09:37:54 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Stefan Hager <stefan.hager@ginzinger.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Robert Rose <robertroyrose@gmail.com>
Date: Sat, 10 Oct 2026 18:37:53 +0200
Message-ID: <20261010163753.612816-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005194814.1090598-1-buildroot@heine.tech>
References: <20261005194814.1090598-1-buildroot@heine.tech>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libabseil-cpp: require wchar
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

Hello,

This looks like this was introduced by the upstream commit
https://github.com/abseil/abseil-cpp/commit/5dc2cc1a6a992e09d9cf930cdce7984640e2b7e0
and then introduced in Buildroot in commit 0d40b47866753340b214e811af53e6a95216bbb3

Best regards,
PERALE Thomas

In reply of:
> absl::StrFormat() unconditionally includes <cwchar>. So a toolchain
> with wchar support is required.
> 
> Fixes:
> https://autobuild.buildroot.org/results/948/948463b01ce52456179b06ae17d4ace9a823f92b//
> 
> Assisted-by: Github Copilot:GPT-6 Luna
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 

> ---
> 
> V2:
>  - moved the depends from ARCH_SUPPORT directly on the symbol.
>  - propagate that dependency to packages
>  - update comment
> ---
>  package/collectd/Config.in                    | 6 ++++--
>  package/falcosecurity-libs/Config.in          | 1 +
>  package/grpc/Config.in                        | 6 ++++--
>  package/gstreamer1/gst1-plugins-bad/Config.in | 6 ++++--
>  package/kismet/Config.in                      | 5 +++--
>  package/libabseil-cpp/Config.in               | 5 +++--
>  package/netdata/Config.in                     | 5 +++--
>  package/protobuf/Config.in                    | 5 +++--
>  package/re2/Config.in                         | 5 +++--
>  package/sysdig/Config.in                      | 6 ++++--
>  package/tensorflow-lite/Config.in             | 5 +++--
>  package/usbguard/Config.in                    | 5 +++--
>  package/webrtc-audio-processing/Config.in     | 6 ++++--
>  13 files changed, 42 insertions(+), 24 deletions(-)
> 
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index 8df1f5fa9b..0b210c66a1 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -694,13 +694,15 @@ config BR2_PACKAGE_COLLECTD_GRPC
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # grpc -> libabseil-cpp
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
> +	depends on BR2_USE_WCHAR # grpc -> libabseil-cpp
>  	select BR2_PACKAGE_GRPC
>  	help
>  	  Send/receive values using the gRPC protocol.
>  
> -comment "grpc needs a toolchain w/ C++, gcc >= 8"
> +comment "grpc needs a toolchain w/ C++, wchar, gcc >= 8"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
> +		!BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
>  
> diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
> index 9d9cbd12aa..66ee55f101 100644
> --- a/package/falcosecurity-libs/Config.in
> +++ b/package/falcosecurity-libs/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_FALCOSECURITY_LIBS
>  	bool
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
> +	depends on BR2_USE_WCHAR # grpc -> libabseil-cpp
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
>  	depends on BR2_LINUX_KERNEL
>  	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
> diff --git a/package/grpc/Config.in b/package/grpc/Config.in
> index bdb31fc899..754ae16fea 100644
> --- a/package/grpc/Config.in
> +++ b/package/grpc/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_GRPC
>  	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp, re2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	select BR2_PACKAGE_C_ARES
>  	select BR2_PACKAGE_LIBABSEIL_CPP
>  	select BR2_PACKAGE_OPENSSL
> @@ -19,9 +20,10 @@ config BR2_PACKAGE_GRPC
>  
>  	  http://github.com/grpc/grpc
>  
> -comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
> +comment "grpc needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
> +		|| !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 0586b7f327..fd518c228d 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -673,6 +673,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
>  	# All depends from webrtc-audio-processing
>  	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> @@ -681,11 +682,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
>  	help
>  	  WebRTC echo-cancellation, gain control and noise suppression
>  
> -comment "webrtcdsp needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 10"
> +comment "webrtcdsp needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 10"
>  	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
> +		|| !BR2_USE_WCHAR
>  
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
>  	bool "wpe"
> diff --git a/package/kismet/Config.in b/package/kismet/Config.in
> index 65c17baeaf..d03bf199f4 100644
> --- a/package/kismet/Config.in
> +++ b/package/kismet/Config.in
> @@ -34,6 +34,7 @@ if BR2_PACKAGE_KISMET
>  config BR2_PACKAGE_KISMET_PYTHON_TOOLS
>  	bool "Install python tools"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
> +	depends on BR2_USE_WCHAR # protobuf
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
>  	depends on BR2_PACKAGE_PYTHON3
> @@ -52,12 +53,12 @@ comment "python tools needs python3"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  
> -comment "python tools needs a glibc or musl toolchain w/ dynamic library, gcc >= 8"
> +comment "python tools needs a glibc or musl toolchain w/ wchar, dynamic library, gcc >= 8"
>  	depends on BR2_STATIC_LIBS
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_USE_WCHAR
>  
>  config BR2_PACKAGE_KISMET_SERVER
>  	bool "Install server"
> diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
> index feb4963042..aba065fca7 100644
> --- a/package/libabseil-cpp/Config.in
> +++ b/package/libabseil-cpp/Config.in
> @@ -26,6 +26,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS # uses dlfcn.h
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR
>  	help
>  	  Abseil is an open-source collection of C++ library code
>  	  designed to augment the C++ standard library. The Abseil
> @@ -35,7 +36,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP
>  
>  	  https://github.com/abseil/abseil-cpp
>  
> -comment "libabseil-cpp needs a toolchain w/ gcc >= 10, C++, threads, dynamic library"
> +comment "libabseil-cpp needs a toolchain w/ wchar, gcc >= 10, C++, threads, dynamic library"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
> diff --git a/package/netdata/Config.in b/package/netdata/Config.in
> index 2c7d456528..65eba65ac0 100644
> --- a/package/netdata/Config.in
> +++ b/package/netdata/Config.in
> @@ -23,14 +23,15 @@ if BR2_PACKAGE_NETDATA
>  config BR2_PACKAGE_NETDATA_PROMETHEUS
>  	bool "prometheus remote write backend"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # protobuf
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
>  	select BR2_PACKAGE_PROTOBUF
>  	select BR2_PACKAGE_SNAPPY
>  	help
>  	  Enable prometheus remote write backend
>  
> -comment "prometheus remote write backend needs a toolchain w/ gcc >= 10"
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +comment "prometheus remote write backend needs a toolchain w/ wchar, gcc >= 10"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  
>  endif
> diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
> index ae4044ea32..1f30314c3f 100644
> --- a/package/protobuf/Config.in
> +++ b/package/protobuf/Config.in
> @@ -45,6 +45,7 @@ config BR2_PACKAGE_PROTOBUF
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_LIBABSEIL_CPP
> @@ -55,7 +56,7 @@ config BR2_PACKAGE_PROTOBUF
>  
>  	  https://developers.google.com/protocol-buffers
>  
> -comment "protobuf needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
> +comment "protobuf needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> diff --git a/package/re2/Config.in b/package/re2/Config.in
> index b2de476bad..4e90423865 100644
> --- a/package/re2/Config.in
> +++ b/package/re2/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_RE2
>  	bool "re2"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++17, libabseil-cpp
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> @@ -14,8 +15,8 @@ config BR2_PACKAGE_RE2
>  
>  	  https://github.com/google/re2
>  
> -comment "re2 needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
> +comment "re2 needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index a6e6809d82..73ac03e240 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_SYSDIG
>  	bool "sysdig"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # falcosecurity-libs
> +	depends on BR2_USE_WCHAR # falcosecurity-libs -> libabseil-cpp
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # falcosecurity-libs
>  	depends on BR2_LINUX_KERNEL # falcosecurity-libs
>  	depends on BR2_INSTALL_LIBSTDCPP
> @@ -23,12 +24,13 @@ config BR2_PACKAGE_SYSDIG
>  
>  	  https://github.com/draios/sysdig/wiki
>  
> -comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
> +comment "sysdig needs a glibc toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_STATIC_LIBS \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR \
> +		|| BR2_STATIC_LIBS \
>  		|| !BR2_TOOLCHAIN_USES_GLIBC \
>  		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
> diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
> index 2536112f99..6d2db7b2c2 100644
> --- a/package/tensorflow-lite/Config.in
> +++ b/package/tensorflow-lite/Config.in
> @@ -11,6 +11,7 @@ config BR2_PACKAGE_TENSORFLOW_LITE
>  	bool "tensorflow-lite"
>  	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
> @@ -31,8 +32,8 @@ config BR2_PACKAGE_TENSORFLOW_LITE
>  
>  	  https://www.tensorflow.org/
>  
> -comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 10, C++, threads, dynamic libraries"
> +comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 10, C++, threads, wchar, dynamic libraries"
>  	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
>  			!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_HAS_THREADS || \
> -			BR2_STATIC_LIBS
> +			BR2_STATIC_LIBS || !BR2_USE_WCHAR
> diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
> index b71333aed9..7f9a95ad3c 100644
> --- a/package/usbguard/Config.in
> +++ b/package/usbguard/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_USBGUARD
>  	bool "usbguard"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
> +	depends on BR2_USE_WCHAR # protobuf
>  	depends on BR2_INSTALL_LIBSTDCPP # protobuf
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
> @@ -18,9 +19,9 @@ config BR2_PACKAGE_USBGUARD
>  
>  	  https://usbguard.github.io/
>  
> -comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
> +comment "usbguard needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  
>  comment "usbguard needs a toolchain not affected by GCC bug 64735"
> diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
> index 051985f5e3..f6cc4b6801 100644
> --- a/package/webrtc-audio-processing/Config.in
> +++ b/package/webrtc-audio-processing/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
>  	bool "webrtc-audio-processing"
>  	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # libabseil-cpp
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
>  	# pthread_condattr_setclock
> @@ -18,8 +19,9 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
>  
>  	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
>  
> -comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 10"
> +comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 10"
>  	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
> +		|| !BR2_USE_WCHAR
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
