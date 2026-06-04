Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286B5CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F28EB82215;
	Fri,  5 Jun 2026 12:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcEHobCp8jPv; Fri,  5 Jun 2026 12:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED8082216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663235;
	bh=hvCKXiNKeUIosGVbJfnk7UE5uoua1CJV4NR91wg4jRY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sszde7uryBOf1dTz8D2qOArdhx9vyho9OSgcUw5VhStPte7p7/KH2NCeKmD6YoArE
	 Yw3GLj4wp/0RnH9PqZOR5LiOJxdlqk6+hlltNSh9p3uihuafrK6Ohhc3wBv24n67Rd
	 H0BLl9qVExKjK9EXB84R7Rnwi/LaAjzje5PbzzYgRptOUeJ7Fs7xG48o+j1Y3wu1kZ
	 A4yONAdasHTLKDBeL+k/ToUj6ifnnXvSdkPpSFiQzpCdNebXZoq9zTNDv+CtCpH0VF
	 MBV8CNqL0Kuc1VA3Ix9OVXb2GTeOc3Ng8mmcAWctDCgcF6EYCBccv+UxOpKBKmSYAZ
	 WWF4/FsfPw+1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED8082216;
	Fri,  5 Jun 2026 12:40:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE553B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 826AB814DE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLbxLyt34mni for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72AA882027
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72AA882027
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CE7587B41; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:08:49 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c46e011a52b513cb78f6578b72c0da8e2590655a
X-Git-Newrev: 49cc5deacd4d0d3e19b83a3b856ed66b02f7f9b7
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.9CE7587B41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/bpftrace: fix
 build with per-package directories
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/49cc5deacd4d0d3e19b83a3b856ed66b02f7f9b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit f7b8508e4fe9c96bf679cc5423cc1500b6523e83 in 2021.08-rc1
added the libbpf package which contains the usage of the
'install_uapi_headers' make target to update toolchain headers older
than kernel version 5.9.  This does not work with per-package
directories.

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
a new directory.

Other packages need to find this directory. This mostly happens through
pkg-config, but bpftrace doesn't use that:
https://github.com/bpftrace/bpftrace/blob/v0.25.1/cmake/FindLibBpf.cmake#L9
Therefore, use a configure option in bpftrace to set the correct path.

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

The dpdk package uses pkg-config` to detect libbpf and will use the updated
.pc file:
https://github.com/DPDK/dpdk/blob/v25.11/drivers/net/tap/bpf/meson.build#L7

The iproute2 package is not affected by the problem because it contains
"matching sanitized kernel headers":
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/tree/README?h=v6.17.0#n44

As a host package pahole is also not affected.

Fixes:
https://autobuild.buildroot.net/results/d8b/d8b416e40bf7bd019cd93e6f2d42c98fc12d4160/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit f07fb2bcd2ece6b7a85763858a55c2bdf7d1e6de)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index 3a728867d8..a4bd270cbd 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -25,7 +25,12 @@ endef
 # toolchain.
 # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a5cbe05a6673b85bed2a63ffcfea6a96c6410cff
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9),)
-LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers
+LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
+
+define LIBBPF_FIX_STAGING_PC
+	$(SED) 's/-I$${includedir}/-I$${includedir}\/bpf -I$${includedir}/' $(STAGING_DIR)/usr/lib/pkgconfig/libbpf.pc
+endef
+LIBBPF_POST_INSTALL_STAGING_HOOKS += LIBBPF_FIX_STAGING_PC
 endif
 
 define LIBBPF_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
