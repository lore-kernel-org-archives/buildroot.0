Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713E0CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 16:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40A4840D07;
	Sat, 30 May 2026 16:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ader1Bi8s8Az; Sat, 30 May 2026 16:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FE00411FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780158260;
	bh=sHeN3RxUCjaLIOVtVgCnQ6ubcsRMzPQ7vUIgZCjf7Y0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PzBbr19fuPUHVKfPC7H8hUnz8xUeGwIw9TjebiPwlbl1BOsPXbMg6iRDFebEOuVh3
	 f1Lgge6B7OYzXOKcQvv0jpraF+BjefEMA1khxTQHT/2JCa7ExGsITPcwI/KQgqnq5Y
	 K9YmKCPGUOX4zybNyEo3I2S3iAYN2Vuyqa+sGCusBqxs5kMwz2PjrAxFk/du7gDGiG
	 gI+w36rSmO9O56Qx0Rugx11wmY4IM9CsFZrX6khQPuX0GZ3SIA9AsISyLQB/BVE1XY
	 KkWHFot3b8sUN82JjkSa66WFmQXC1D2IdFpCQ5N2MnoKCEDg2ovimizotOYQPWqzIJ
	 Esfrx2Xh3CcgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FE00411FB;
	Sat, 30 May 2026 16:24:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EA9D12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33F5781AA7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7ytHjcOuBfx for <buildroot@buildroot.org>;
 Sat, 30 May 2026 16:24:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECB5181119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB5181119
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECB5181119
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:24:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DB114B97C5F9; Sat, 30 May 2026 18:24:15 +0200 (CEST)
Message-ID: <a39eebbe-f467-4d53-a1a9-04009708893f@rnout.be>
Date: Sat, 30 May 2026 18:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>, Romain Naour <romain.naour@gmail.com>
References: <20260425211641.479665-1-bernd@kuhls.net>
 <20260425211641.479665-3-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260425211641.479665-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780158256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=KGlZ9ViojqOOs0ExQpMMV1zT+oGeYIP0MHaLYXSqZ0g=;
 b=W5ZPgYF3VYTXGc/k9hw/p9o9qGUYYyb/+DCzbwMpgsATBktp0DM5cXk3QpVS/a16NQ28Dy
 7/AmKolNiXpMISsRtIspxzvth+K2SpNOR/M8w/Aly+z0EPZJx0LMv5HfNFfvAFZv0KuV4b
 YGiubKXiXmuTObc1vXTfxUJOUIHXYEk4PcXFs8XnxysFrYtOnJcnzfmtX8KZtVSLnEwlDP
 nJCILV9E1wL4ioZq+hb9VfBcpXA/+CclcTB9c8snVJw5wxqyHKp4T5BO4Jx4s/c8bK9hk5
 bq8O/ZlwLYNPVR3PUrl4JmTwZjEMAL3VZCN5RhkmrhMWuasLxIiryHiwHMuwhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=W5ZPgYF3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/04/2026 23:16, Bernd Kuhls wrote:
> Buildroot commit f7b8508e4fe9c96bf679cc5423cc1500b6523e83 added the
> libbpf package which contains the usage of the 'install_uapi_headers'
> make target to update toolchain headers older than kernel version 5.9.
> This does not work with per-package directories.
> 
> Building this defconfig that includes all packages depending on libbpf:
> 
>    BR2_x86_64=y
>    BR2_x86_rocketlake=y
>    BR2_KERNEL_HEADERS_VERSION=y
>    BR2_DEFAULT_KERNEL_VERSION="5.8.18"
>    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
>    BR2_TOOLCHAIN_BUILDROOT_CXX=y
>    BR2_PER_PACKAGE_DIRECTORIES=y
>    BR2_PACKAGE_BPFTRACE=y
>    BR2_PACKAGE_DPDK=y
>    BR2_PACKAGE_IPROUTE2=y
>    BR2_PACKAGE_HOST_PAHOLE=y

  What about kmemd? At this point it is not affected because it depends on 
headers >= 5.13, but the later patches could affect it? Or perhaps the kernel 
headers dependency in kmemd is actually not needed because it can use libbpf's 
headers?

  Regards,
  Arnout

> 
> on the 2026.02.x branch as of 0be927b89a319c9ac35249354558e9f4cb102fd0
> is broken:
> 
> output/build/bpftrace-0.24.2/src/attached_probe.cpp: In static member
>   function 'static bpftrace::Result<std::unique_ptr<bpftrace::AttachedIterProbe> >
>   bpftrace::AttachedIterProbe::make(bpftrace::Probe&,
>   const bpftrace::BpfProgram&, std::optional<int>)':
> output/build/bpftrace-0.24.2/src/attached_probe.cpp:1435:30: error:
>   aggregate 'bpf_iter_link_info linfo' has incomplete type and cannot be
>   defined
>   1435 |     union bpf_iter_link_info linfo;
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
>    #include <linux/bpf.h>
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
> ---
>   package/bpftrace/bpftrace.mk | 1 +
>   package/libbpf/libbpf.mk     | 7 ++++++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
> index 35c8dec29c..f530d4861b 100644
> --- a/package/bpftrace/bpftrace.mk
> +++ b/package/bpftrace/bpftrace.mk
> @@ -28,6 +28,7 @@ endif
>   BPFTRACE_CONF_OPTS += \
>   	-DBUILD_SHARED_LIBS:BOOL=OFF \
>   	-DBUILD_TESTING:BOOL=OFF \
> +	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/bpf" \
>   	-DENABLE_MAN:BOOL=OFF
>   
>   $(eval $(cmake-package))
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index 3a728867d8..65061a82bc 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -25,9 +25,14 @@ endef
>   # toolchain.
>   # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a5cbe05a6673b85bed2a63ffcfea6a96c6410cff
>   ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9),)
> -LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers
> +LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
> +LIBBPF_POST_INSTALL_STAGING_HOOKS += LIBBPF_FIX_STAGING_PC
>   endif
>   
> +define LIBBPF_FIX_STAGING_PC
> +	$(SED) 's/-I$${includedir}/-I$${includedir}\/bpf -I$${includedir}/' $(STAGING_DIR)/usr/lib/pkgconfig/libbpf.pc
> +endef
> +
>   define LIBBPF_INSTALL_STAGING_CMDS
>   	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
>   		-C $(@D)/src install $(LIBBPF_UPDATE_UAPI_HEADERS) \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
