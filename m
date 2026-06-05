Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC744CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8430460F40;
	Fri,  5 Jun 2026 12:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxUfjelYkICk; Fri,  5 Jun 2026 12:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 675C160F7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663766;
	bh=uTrmbYry+Hhr8ITkuBG3ERiPsVH3x/pxuuMAqwxBGck=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BlzNCxMZoIPgFo6CTAnAR6ww6Vbcff1XlXc4siN6ix11UcjQ1aX4o/GWXYOHEbhn7
	 CJ6gbF2xcyLKo8GXgEO6s89VcC5bddnncgtZS8nsS9NIsGLdC2JAOynu6q82XHp80V
	 MyW1hPDVZD32vqd1FMsQQ5T9HBLw/DUGrNkfRde7VeRkuA5EKvBUEtorL2E9zC52NL
	 PVjtb1Rr/n+5ZawVxUk0dCWi9bEd2UQptQSA+/eKNHGejcnHlLFfMQ3yIQ7gj2JS/h
	 rUJG/5s3koZHE2JJgJReFyGIbbi579sFqHQnbW1TAMuj7PNiWt5NUbFNLwtt375ixj
	 eN7iJnzNak/zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 675C160F7C;
	Fri,  5 Jun 2026 12:49:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F6AFF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75A7F821DC
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFZqS3wuRpTN for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42729820C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42729820C8
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42729820C8
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so15794165e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663759; x=1781268559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+okPFZAndvOZekiPMvg6guh2IFQ0Sx9C93n1T12EBqk=;
 b=gboX6BtDNg9//t1nX7JpgsnapnIGj7eDaoyg6FKum6U8KnUkiDNQzE5XZyryyQqBvM
 MwbsBZToJCQAB3Kaz3a91JEefM66jl+rf+rBYJD3rCdRqCW8GRKQI+utD7VD+bLfHNtf
 oHBDbXlglAL1zYar7NV7fEFGtiyiFnIclpxzH64oyi2sk8lirhdIRBGz5mBg5xFmyWZS
 o4fg1FxAflCMocq9FNAwXuyQidNr8qBBocIVWo2BGNB5iMgxPJ6MpOLC1FbabgSPCNu6
 R7+/Mw4+CMDAxacjhlIwS3PKEvtzfH+vmgH7/1heDd0ali0pV94zL35bZzg/O6k13uAm
 g3eg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TMzIrpqXSNQuPXUwGoMGw1k4gB6VYaDdux8T/cFV6P7eyAmv4SUoFhm2py9WvcSCCJKPKm3RZfHI=@buildroot.org
X-Gm-Message-State: AOJu0YxaLuJok96KRL+7qgZqvMppuiDjxUEQWr8rye4ZQYTdNroMCasa
 K+hAlThtGU2wPd41xqREuxxU6i3jxlS15eYr6jvmW4zrb+Sp3MKHqdgDU8n9xlw6tPU=
X-Gm-Gg: Acq92OFjFPtiHWpE3t79vSGbEBpPOObZs8mOpGuyCKLz5EG/OEf9Tx1IC2NDKfnEoW9
 GT2IGkjW2S8ON+l7bIu1UqdVq7VvnM2SyPpx/7qTXil+/Qnnr6XJ2KIri3SyUyZ676jfgW06eHP
 kmE/pCcoU6KbPns2ZIFUsSTs0Amj+LOoKjj/2iNRio0rsq5WIg96kdqMNxs01xHrJitjWA/tJQg
 JQmsI9fI3wqTwXZekO68Ife9V5ZM5mDVaeEOUwD2/Bu0O17MhfyFQOwC57fhwWDDm/mrVQEZPp3
 2H2TjJIcQupVAgHd3PrlkEPYkaZrOLyn4svBPpcxOnoePYOb//iG11/HeFX5E3L4mXiVJ7cj+mx
 MzM5zH/p/zhO8CrVXTTr7qMvcm4Fo3CwE7DNQrKDVvkxFiadR9UClJEUbcIVHzYYh/WernBOLs9
 PLu+TRAYK2525xVTc5YZgEsE3pmg4zGMS4PB9J
X-Received: by 2002:a05:600c:c3ce:20b0:490:bf3d:c7de with SMTP id
 5b1f17b1804b1-490c2d08eddmr28327755e9.10.1780663758963; 
 Fri, 05 Jun 2026 05:49:18 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2eadefsm25772735f8f.11.2026.06.05.05.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:18 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:18 +0200
Message-ID: <20260605124918.270803-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425211641.479665-3-bernd@kuhls.net>
References: <20260425211641.479665-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663759; x=1781268559; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+okPFZAndvOZekiPMvg6guh2IFQ0Sx9C93n1T12EBqk=;
 b=JZ6EbxIXSWrz0n5sEb7uw3+fEeMAa45oCQW0xdUTpn+vMDwBcRlrft+5/MCzaG/dZ2
 /a5N4IJwcSYitxFXiqQO/bTW5yu+hzx9n4/xjcCksVl5clRhuxPADza0x5wx+iUpSS2I
 KOqksp1BL2wQrqiuQ5a+tqavpqQepnj2o89w9HE9SbPPwRJoysd8mvHX2bdyufV+pciv
 Z0l+Un/e4EvyqGeg59vjpWd56uw8VJWNtlAEbN4te+KgYioBJkebRJdBZEghsvWRfc2d
 tz/4WeLgc3qJSCNmPG6LFBAfm7xOmXNbDwSBLKhoj8SWHGZD+YB03R4cmKYDoc4Jb7t0
 1Hmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JZ6EbxIX
Subject: Re: [Buildroot] [PATCH 3/8] package/bpftrace: fix build with
 per-package directories
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
> Buildroot commit f7b8508e4fe9c96bf679cc5423cc1500b6523e83 added the
> libbpf package which contains the usage of the 'install_uapi_headers'
> make target to update toolchain headers older than kernel version 5.9.
> This does not work with per-package directories.
> 
> Building this defconfig that includes all packages depending on libbpf:
> 
>   BR2_x86_64=y
>   BR2_x86_rocketlake=y
>   BR2_KERNEL_HEADERS_VERSION=y
>   BR2_DEFAULT_KERNEL_VERSION="5.8.18"
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
>   BR2_TOOLCHAIN_BUILDROOT_CXX=y
>   BR2_PER_PACKAGE_DIRECTORIES=y
>   BR2_PACKAGE_BPFTRACE=y
>   BR2_PACKAGE_DPDK=y
>   BR2_PACKAGE_IPROUTE2=y
>   BR2_PACKAGE_HOST_PAHOLE=y
> 
> on the 2026.02.x branch as of 0be927b89a319c9ac35249354558e9f4cb102fd0
> is broken:
> 
> output/build/bpftrace-0.24.2/src/attached_probe.cpp: In static member
>  function 'static bpftrace::Result<std::unique_ptr<bpftrace::AttachedIterProbe> >
>  bpftrace::AttachedIterProbe::make(bpftrace::Probe&,
>  const bpftrace::BpfProgram&, std::optional<int>)':
> output/build/bpftrace-0.24.2/src/attached_probe.cpp:1435:30: error:
>  aggregate 'bpf_iter_link_info linfo' has incomplete type and cannot be
>  defined
>  1435 |     union bpf_iter_link_info linfo;
> 
> Testing the defconfig took place on the 2026.02.x branch because the
> current master is broken due to the llvm bump to 22.x which causes an
> error already during configure stage. This will be addressed by another
> patch in this series.
> 
> libbpf overwrites kernel header files installed in $STAGING_DIR when
> they are too old by adding 'install_uapi_headers' as make target. In
> the case of per-package directories these header files are stored only
> in output/per-package/libbpf/.
> 
> When output/per-package/bpftrace/ is populated, the content of
> output/per-package/ from other packages overwrites the header files
> installed by libbpf because the list of rsync'ed packages is sorted
> alphabetically:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.1/package/pkg-generic.mk#L796
> 
> To prevent this problem let libbpf install the updated kernel headers in
> a new directory and add a configure option to bpftrace which is needed
> because pkgconf is not used to detect libbpf:
> https://github.com/bpftrace/bpftrace/blob/v0.25.1/cmake/FindLibBpf.cmake#L9
> 
> Please note that libbpf will add '/linux' to the path provided in
> $UAPIDIR:
> https://github.com/libbpf/libbpf/blob/v1.7.0/src/Makefile#L169
> so the headers end up in the previously non-existing directory
> $(STAGING_DIR)/usr/include/bpf/linux/:
> 
> $ find output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/ -iname bpf.h -exec ls -lao {} \;
> -rw-r--r-- 1 bernd 26434 25. Apr 13:15 output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bpf/bpf.h
> -rw-r--r-- 1 bernd 283012 25. Apr 13:15 output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bpf/linux/bpf.h
> -rw-r--r-- 12 bernd 160166 25. Apr 13:08 output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/bpf.h
> 
> bpf.h with 283012 bytes is the update-to-date version needed for bpftrace:
> 
> $ grep -m1 bpf_iter_link_info output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bpf/linux/bpf.h
> union bpf_iter_link_info {
> $
> 
> $ grep -m1 bpf_iter_link_info output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/bpf.h
> $
> 
> By adding '-I$(STAGING_DIR)/usr/include/bpf' to the CXXFLAGS of bpftrace
> its include finds the correct header:
> https://github.com/bpftrace/bpftrace/blob/v0.25.1/src/bpfprogram.cpp#L3
> 
>   #include <linux/bpf.h>
> 
> The dpdk package uses pkgconf to detect libbpf and will use the updated
> .pc file:
> https://github.com/DPDK/dpdk/blob/v25.11/drivers/net/tap/bpf/meson.build#L7
> 
> The iproute2 package is not affected by the problem because it contains
> "matching sanitized kernel headers":
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/tree/README?h=v6.17.0#n44
> 
> As a host package pahole is also not affected.
> 
> Fixes:
> https://autobuild.buildroot.net/results/d8b/d8b416e40bf7bd019cd93e6f2d42c98fc12d4160/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/bpftrace/bpftrace.mk | 1 +
>  package/libbpf/libbpf.mk     | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
> index 35c8dec29c..f530d4861b 100644
> --- a/package/bpftrace/bpftrace.mk
> +++ b/package/bpftrace/bpftrace.mk
> @@ -28,6 +28,7 @@ endif
>  BPFTRACE_CONF_OPTS += \
>  	-DBUILD_SHARED_LIBS:BOOL=OFF \
>  	-DBUILD_TESTING:BOOL=OFF \
> +	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/bpf" \
>  	-DENABLE_MAN:BOOL=OFF
>  
>  $(eval $(cmake-package))
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index 3a728867d8..65061a82bc 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -25,9 +25,14 @@ endef
>  # toolchain.
>  # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a5cbe05a6673b85bed2a63ffcfea6a96c6410cff
>  ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9),)
> -LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers
> +LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
> +LIBBPF_POST_INSTALL_STAGING_HOOKS += LIBBPF_FIX_STAGING_PC
>  endif
>  
> +define LIBBPF_FIX_STAGING_PC
> +	$(SED) 's/-I$${includedir}/-I$${includedir}\/bpf -I$${includedir}/' $(STAGING_DIR)/usr/lib/pkgconfig/libbpf.pc
> +endef
> +
>  define LIBBPF_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
>  		-C $(@D)/src install $(LIBBPF_UPDATE_UAPI_HEADERS) \
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
