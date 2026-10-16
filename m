Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE37CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D62E40AD9;
	Fri, 16 Oct 2026 15:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ymiizph_tytA; Fri, 16 Oct 2026 15:05:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7FCF540B1B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163124;
	b=Z5cV5Lym6xQfllGL2VcVDzUU61X2ztVCC2/vpFIXnV4xii0OpTSB79+dKKJN2vn/3c8s
	 BdJ5uhEFTLuKi6rneBSho9OhL6Ehc/O2qLNX9Gy1nmIMOvmun/fyxObFLNQnLKqAkL0La
	 qdDiD37UHB0qhxqhAxiwPuHHohVIR/NriR5qnokwfTpC/AKoDhvDOYzmB9J8Rry3hv3K3
	 B+F7PtIiFMRRQ13V+DWMnf0LK9yqqNyFDl6WyXa2M6RuHALVuUzfmr7AmokTH8gEQuSJD
	 DTsa5xOOb1dllU38i9diI1jDmO1roR61ZjwPpUvr/i5AppUa6o/L4Nsvo7r9aaPskxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163124;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=q/14Db5Tri0JShnWDOsIUD7l+oj+rTmXTT6G/T5zGQU=;
	b=fGTlrC7asj43Et10NJVvl046Ce2ivfa4+hL4+WO1RBI9cIdt6hAZI6pCvNYcjp7ZVqG+
	 qa2CHzowcnExVHkppWFVXuhpX8oMhy9EZHCVhWXTwSOfK0fgaGb9LVCapj424J4Ap54Vx
	 0WMQvZIs6fLadd2jYgSj6WmA1ViHnl4XaOZjx3dPQd2bO3bfdTy2bLxXn4fVtvDezcNxm
	 4Xr8pc8EY18AgWivES2c0sVNs2WJx/Gb8SbNZXxtzOsi2VIu4qp1msCpty7baPJ3N4K4S
	 nT+3ov8DjIYXl5C4qlRt8kK7PClIaaOTygYJ3ywxv0+RLfSAEJ/d+AkCY0/cIdqQ0zw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163124;
	bh=q/14Db5Tri0JShnWDOsIUD7l+oj+rTmXTT6G/T5zGQU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AJXFBHyNV4Ji6/q8M2ZkYXZfTjKg9LalNNzVfiWCbkJ1O1jU/VcdqBHt5HpRpjpTy
	 hGca/GjOL3Cx2i2fM5h1YaIMxo1lQJf3tPU6oti8SaHakH9cwoxABjtGzKi16q3eC1
	 xQjLA2ofC1ET1RbNjrMbnT3cESdtNR2PNch7mlNgTEOIfSsOEwpCsj3A8W2FdWxYTD
	 CbR8C76v4ouUx5iLqO1d+UjdhrYWaDxCV+ALqE9yq3vhQeNzbG9Ju2VMm6E8YsPrCL
	 ENa1H+y4Ip64luIlOmliX2UBM6AfKy05W5vECWo7TDslEit66ZN7NHzCfa27mF635r
	 woPCqaCtvjyhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FCF540B1B;
	Fri, 16 Oct 2026 15:05:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C83D255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5243F40BA3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iH1OnvwoPrBo for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0D5B040AD9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163122;
 b=aQbLCum9Xgho/WijnPMI43odPAKYpxgJ8qHmmDyNhntx4vFqWYwdgfW+kCDj2GiVLIIy
 w9CXzE4Dl9hSPDqLcIvdenlr0Xrct+2eLmze57tX6C+00OvxVpjYVHCgopewFnMVJEn+L
 WUu57mrDJz7rG82T7Sys9+xh4b8xsT1uHFZBmVCh8Jq4Br1IOyavOcXC5wZCA+WX1fvDV
 r/qyoNuYhp9y2/SD/5RPyuiqu9TJFFW9DF9Ii2N0ISLPWOcNNNPbwghYNtwFpeEYneWBJ
 W0taXCW+gLfXgClQ/bnNozIleorZGcVNU0Mi+iDkZnld38pBsGW6wpu7msjX1wrNOjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163122;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=utDR8RR81mbSfcNv3z5WZC83yEfNMtZZx+4xmABoa5k=;
 b=XMEilkRwWskO3ydPm9v0N1NiGdMAjefywBRBlHP3aO6b2MD+j/lz/K1aJkERSc6pmbiW
 QM5uZ1u+wvL6g95fhYHmTyFEu4nvNu/oj38o6ka3UsWvxlF23l2yyzv+Le77HYx18WdfC
 j7MqkN+ZjVtzaBr4pHUu9fC+RN47bsYt97J32tp508Jon5SCI0ExGhBsP6vLNrF2khvXz
 U35KD1vjMUylc8KApV8Lf25MQOenHaJPoSELt2XwWglLoZZ+SEJvb99A+mjrwBj5zaGEa
 wtBizDvuqgSA5zGCUEVERkU70Yafxvc3qhsBgWJp2EngPhNdffEqrFfDNw693Ka3hkQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LUg1wBoh; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D5B040AD9
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso1095655e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163120; x=1792767920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=utDR8RR81mbSfcNv3z5WZC83yEfNMtZZx+4xmABoa5k=;
 b=tKPGx8yyTDgxXUvbT5T1fw1oy9jYyEJwVz9AaueDbldkAbEs+lXbT7DqSOrGQUhdPC
 KBXdOwI/b2GastCQfm9gWwX85ly6zaTIsK2EqolIAw/berhA/HI52L/PxEuP/WNyt8PR
 ixmFPxlpjuSqESptUJmAsHIXKeFHv0reezTzb3HPnbj7EgR5I3KgRFEgkI1WO1gnGHxZ
 5XGXwvQqDJGc04zr3ULvsBiax0N1RxKMfmWx4r4o+FL5dDuRwVSo99kCZ2GuxdOa10Cc
 ohzbpZiiOoQOfTGKYvqG61b8rpvgitKFccoIWoVm254gV/HxjisfYobKfJopLJPHyraH
 Y8lA==
X-Gm-Message-State: AFq9FYIUf7hgQ26ZNuJ1BjiLYeVexbECYUwhrRZ2l1cttD/qlP1C7Hr0
 Id9Q9YbLATDxXkahZbmkxdQ3vuMshVFimwL5dySnymZdKLKZqhuOnv30S0D4LSb0JTwBUufv+cx
 1hgm5P6I=
X-Gm-Gg: AYBFou3PioGwnwyjeSG+GjLJCUdd1dVZYpjakIgBI3x4dtBKQbhEr2yVTyVlgnBn1M+
 wPHwWWhvu6NRbDDb2926ll3kk0YUm/TBnZODaInaC1lWkIOPluIztxckcaMIwckio5Wahxm3a5Q
 2VbKcepbwiVU5giNofeEZEx7nrNCZQw5s/1x9H5pMzfYRr5ZphKRugL2/llpBJTFDTIIECS7crX
 DT2C30SPvpyXL5od1h39LwGH1vIw38Q/AnZwe1OUMzq9BVFKyJgxUcqx1XskoHYVZMWziV2Rlyu
 gVmal3Ue+JDogff2/QT1YPdabdirDqWd1U2E8S42rtEB7b9eqRxZh1Uigs8p7cfxnYfQWYzrEFX
 nA2/NdmrTLFNwZDvPDTzrx3bVShz3OyTp8byZcfnQD7Bq4U/PxfMLMz8nNKcyaY+wx8EtS9si6d
 Xq4ZJFf4T5uT43RjUEKfQV7Sp3Df8jGyyZVyR1czP0EPr+bMwW5spX1hIcOWEYyk8wde2D2eyk/
 fKtHWJNya9InuLWQhQrf3gfuSEdCULMdYCI01Elxw==
X-Received: by 2002:a05:600c:c8d:b0:49e:63cc:6324 with SMTP id
 5b1f17b1804b1-4a1d75f2bacmr1654575e9.6.1792163119562; 
 Fri, 16 Oct 2026 08:05:19 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c9a6787bsm39719075e9.1.2026.10.16.08.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:18 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:15 +0200
Message-ID: <20261016150517.73663-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006162106.3439373-25-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v8 24/84] package/snort3: fix build error
 with numa support
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit 5e78c6cf3323b4a45f84bcbc504f511dd268e270 bumped the
> package from 3.1.40.0 to 3.11.1.0. Upstream commit
> https://github.com/snort3/snort3/commit/83e9a2dda250a0ced9a105454a5a4fe59c304601
> added numa support, first included in release 3.1.65.0.
> 
> This causes a build error due to the numactl package being pulled-in as
> optional dependency by hwloc, the latter being a hard dependency of
> snort3.
> 
> Fixes:
> https://autobuild.buildroot.net/results/e8a/e8a9d787973fd109c07c185103de1f9f7339d506/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  .../0001-Rename-numa.h-to-numa_snort.h.patch  | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
> 
> diff --git a/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch b/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
> new file mode 100644
> index 0000000000..ca8f7774f1
> --- /dev/null
> +++ b/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
> @@ -0,0 +1,79 @@
> +From 3bb2a8fc1244fcbdf24235e541fa2a06a655dcea Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Tue, 8 Sep 2026 21:20:04 +0200
> +Subject: [PATCH] Rename numa.h to numa_snort.h
> +
> +Fixes https://github.com/snort3/snort3/issues/368
> +
> +and a build error seen with gcc 15.1.0 by the buildroot autobuilders:
> +https://autobuild.buildroot.net/results/e8a/e8a9d787973fd109c07c185103de1f9f7339d506/build-end.log
> +
> +/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:
> + In member function 'virtual int NumaWrapper::available()':
> +/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:50:16:
> + error: 'numa_available' was not declared in this scope; did you mean 'available'?
> +   50 |         return numa_available();
> +
> +/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:
> + In member function 'virtual int NumaWrapper::max_node()':
> +/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:54:16:
> + error: 'numa_max_node' was not declared in this scope; did you mean 'max_node'?
> +   54 |         return numa_max_node();
> +
> +Upstream: https://github.com/snort3/snort3/pull/479
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/main/CMakeLists.txt           | 2 +-
> + src/main/numa.cc                  | 2 +-
> + src/main/{numa.h => numa_snort.h} | 0
> + src/main/thread_config.h          | 2 +-
> + 4 files changed, 3 insertions(+), 3 deletions(-)
> + rename src/main/{numa.h => numa_snort.h} (100%)
> +
> +diff --git a/src/main/CMakeLists.txt b/src/main/CMakeLists.txt
> +index 117612b94..e4e816d15 100644
> +--- a/src/main/CMakeLists.txt
> ++++ b/src/main/CMakeLists.txt
> +@@ -23,7 +23,7 @@ endif ( ENABLE_SHELL )
> + add_subdirectory(test)
> + 
> + if ( HAVE_NUMA )
> +-    set ( NUMA_SOURCES numa.h numa.cc)
> ++    set ( NUMA_SOURCES numa_snort.h numa.cc)
> + endif( HAVE_NUMA )
> + 
> + add_library (main OBJECT
> +diff --git a/src/main/numa.cc b/src/main/numa.cc
> +index 259f776b7..5cb23e26b 100644
> +--- a/src/main/numa.cc
> ++++ b/src/main/numa.cc
> +@@ -17,7 +17,7 @@
> + //--------------------------------------------------------------------------
> + // numa.cc author Denys Zikratyi <dzikraty@cisco.com>
> + 
> +-#include "numa.h"
> ++#include "numa_snort.h"
> + 
> + #ifdef HAVE_CONFIG_H
> + #include "config.h"
> +diff --git a/src/main/numa.h b/src/main/numa_snort.h
> +similarity index 100%
> +rename from src/main/numa.h
> +rename to src/main/numa_snort.h
> +diff --git a/src/main/thread_config.h b/src/main/thread_config.h
> +index 93bfe63d2..8134da8bf 100644
> +--- a/src/main/thread_config.h
> ++++ b/src/main/thread_config.h
> +@@ -26,7 +26,7 @@
> + #include "main/thread.h"
> + 
> + #ifdef HAVE_NUMA
> +-#include "numa.h"
> ++#include "numa_snort.h"
> + #endif
> + 
> + struct CpuSet;
> +-- 
> +2.47.3
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
