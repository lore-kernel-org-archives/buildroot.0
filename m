Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E29FF885A
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 21:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0031A421E8;
	Sat, 25 Apr 2026 21:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBIkRMFbexMp; Sat, 25 Apr 2026 21:17:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 128E0421EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777151823;
	bh=qvZvbELhQqGnr59Xaxb0v1XMtVwKwfFmJRRACK8jP00=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JuRretGoMra1wdwAPEnlcaseZNYqO4QKxLkMTb0fGSHfqxrUnGA4NGy6TZVMduUQm
	 H6tA+WDMOvmWCzp4mAU7kWZRmRc+iwCUVyyEdlxkvgmK7sdCRcCMTCWGyU9FFGy8r1
	 Amom9hcC841z2SURtnEFIlWj4BU5s8ZX749OGTtX980miD75r8Fz4E96+zgiL4DkuZ
	 wsnXREFEWQxaChR6jPzewgvUHIU1zc2CB6zM9TzR8gufDVYWBQ0hpQ/e8OecrUStlw
	 QDgTYjKNfYZ/zYqyKwMn6kpbBPqaXWOGTipg8wqx8ai6V+S3b1S7XhJrHsxTPhAU5J
	 aObNpmT+ObfGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 128E0421EC;
	Sat, 25 Apr 2026 21:17:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6BB8231
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D0B9421EC
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oc4zVKYsZ4-x for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 21:17:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A610421E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A610421E8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A610421E8
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 761C4A4C0C88;
 Sat, 25 Apr 2026 23:16:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48402)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGkMj-000000004gG-0Lcb;
 Sat, 25 Apr 2026 21:16:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Apr 2026 23:16:36 +0200
Message-ID: <20260425211641.479665-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260425211641.479665-1-bernd@kuhls.net>
References: <20260425211641.479665-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777151803;
 bh=Ra22NYnDTM3eidrTgn/a79L+LCRG0cOXuxm/vWvU9XU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hkII6enTqaiEVOSQH+X+ZXjWQB9TxIYtp9HXZeitT/099CqlhDXIBPOpxuvraQSIe
 Gf0778xmQu9yh0NHz5VOR0RmJn5x7qr2N25/9cxHWL7BH4w66EW8+zbiBHoZujKIJC
 pm12R1lj0Bm1z/xs8fDmecEkRL4Lzagf2Dn0TbRvV1+jaVrRdlWasa7PsGWjUYx1mI
 TLjchRUdi4T5M1Esb5VD3G63BDZ6smURCWVA2O8y1N2wvd1E1GId7KblvySDFxzEPg
 t4Q5N+3k+d+viNolSdZxOiilfRhkzYi/HhQv0opAankUe+MW4Fy0Au2mm6TQEgNBOZ
 +JsfopCaMhMIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hkII6enT
Subject: [Buildroot] [PATCH 3/8] package/bpftrace: fix build with
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit f7b8508e4fe9c96bf679cc5423cc1500b6523e83 added the
libbpf package which contains the usage of the 'install_uapi_headers'
make target to update toolchain headers older than kernel version 5.9.
This does not work with per-package directories.

Building this defconfig that includes all packages depending on libbpf:

  BR2_x86_64=y
  BR2_x86_rocketlake=y
  BR2_KERNEL_HEADERS_VERSION=y
  BR2_DEFAULT_KERNEL_VERSION="5.8.18"
  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
  BR2_TOOLCHAIN_BUILDROOT_CXX=y
  BR2_PER_PACKAGE_DIRECTORIES=y
  BR2_PACKAGE_BPFTRACE=y
  BR2_PACKAGE_DPDK=y
  BR2_PACKAGE_IPROUTE2=y
  BR2_PACKAGE_HOST_PAHOLE=y

on the 2026.02.x branch as of 0be927b89a319c9ac35249354558e9f4cb102fd0
is broken:

output/build/bpftrace-0.24.2/src/attached_probe.cpp: In static member
 function 'static bpftrace::Result<std::unique_ptr<bpftrace::AttachedIterProbe> >
 bpftrace::AttachedIterProbe::make(bpftrace::Probe&,
 const bpftrace::BpfProgram&, std::optional<int>)':
output/build/bpftrace-0.24.2/src/attached_probe.cpp:1435:30: error:
 aggregate 'bpf_iter_link_info linfo' has incomplete type and cannot be
 defined
 1435 |     union bpf_iter_link_info linfo;

Testing the defconfig took place on the 2026.02.x branch because the
current master is broken due to the llvm bump to 22.x which causes an
error already during configure stage. This will be addressed by another
patch in this series.

libbpf overwrites kernel header files installed in $STAGING_DIR when
they are too old by adding 'install_uapi_headers' as make target. In
the case of per-package directories these header files are stored only
in output/per-package/libbpf/.

When output/per-package/bpftrace/ is populated, the content of
output/per-package/ from other packages overwrites the header files
installed by libbpf because the list of rsync'ed packages is sorted
alphabetically:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.1/package/pkg-generic.mk#L796

To prevent this problem let libbpf install the updated kernel headers in
a new directory and add a configure option to bpftrace which is needed
because pkgconf is not used to detect libbpf:
https://github.com/bpftrace/bpftrace/blob/v0.25.1/cmake/FindLibBpf.cmake#L9

Please note that libbpf will add '/linux' to the path provided in
$UAPIDIR:
https://github.com/libbpf/libbpf/blob/v1.7.0/src/Makefile#L169
so the headers end up in the previously non-existing directory
$(STAGING_DIR)/usr/include/bpf/linux/:

$ find output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/ -iname bpf.h -exec ls -lao {} \;
-rw-r--r-- 1 bernd 26434 25. Apr 13:15 output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bpf/bpf.h
-rw-r--r-- 1 bernd 283012 25. Apr 13:15 output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bpf/linux/bpf.h
-rw-r--r-- 12 bernd 160166 25. Apr 13:08 output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/bpf.h

bpf.h with 283012 bytes is the update-to-date version needed for bpftrace:

$ grep -m1 bpf_iter_link_info output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bpf/linux/bpf.h
union bpf_iter_link_info {
$

$ grep -m1 bpf_iter_link_info output/per-package/libbpf/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/bpf.h
$

By adding '-I$(STAGING_DIR)/usr/include/bpf' to the CXXFLAGS of bpftrace
its include finds the correct header:
https://github.com/bpftrace/bpftrace/blob/v0.25.1/src/bpfprogram.cpp#L3

  #include <linux/bpf.h>

The dpdk package uses pkgconf to detect libbpf and will use the updated
.pc file:
https://github.com/DPDK/dpdk/blob/v25.11/drivers/net/tap/bpf/meson.build#L7

The iproute2 package is not affected by the problem because it contains
"matching sanitized kernel headers":
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/tree/README?h=v6.17.0#n44

As a host package pahole is also not affected.

Fixes:
https://autobuild.buildroot.net/results/d8b/d8b416e40bf7bd019cd93e6f2d42c98fc12d4160/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bpftrace/bpftrace.mk | 1 +
 package/libbpf/libbpf.mk     | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 35c8dec29c..f530d4861b 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -28,6 +28,7 @@ endif
 BPFTRACE_CONF_OPTS += \
 	-DBUILD_SHARED_LIBS:BOOL=OFF \
 	-DBUILD_TESTING:BOOL=OFF \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/bpf" \
 	-DENABLE_MAN:BOOL=OFF
 
 $(eval $(cmake-package))
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 3a728867d8..65061a82bc 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -25,9 +25,14 @@ endef
 # toolchain.
 # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a5cbe05a6673b85bed2a63ffcfea6a96c6410cff
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9),)
-LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers
+LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
+LIBBPF_POST_INSTALL_STAGING_HOOKS += LIBBPF_FIX_STAGING_PC
 endif
 
+define LIBBPF_FIX_STAGING_PC
+	$(SED) 's/-I$${includedir}/-I$${includedir}\/bpf -I$${includedir}/' $(STAGING_DIR)/usr/lib/pkgconfig/libbpf.pc
+endef
+
 define LIBBPF_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
 		-C $(@D)/src install $(LIBBPF_UPDATE_UAPI_HEADERS) \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
