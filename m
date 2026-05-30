Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197FDCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 16:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B076F5BA;
	Sat, 30 May 2026 16:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsGJM-WlYXqF; Sat, 30 May 2026 16:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CC9D6F5C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780158316;
	bh=MprmnyUmKXHDptgxri04EPd/sQtf3OWJJenJ9wxGIpU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oKtWvL/3lZZlAe/FnboOdjP1ZZd0kq8xJTUQMyjOGf1AmyshHrS3/zW0la1RO5Ia2
	 5UO3MyaJAiTshi+vJWnrOGzF+qQ8vY81T8abSbUu3pu6ENwOTRQABSyW3+SyAYUu1L
	 8WQDJHHQ6s6G+u+gGNIWSueXDRlwyO5mDVjhjncypWgcK6mG+aVSYbhbvulqimHuiS
	 rXFo7S/GCMawhdUQAMLy5K9OwrZCYwY4XC9vtkTQUYX3zCLJ0JQprxD2HA3rkAv/mB
	 Cdmr44ea/85lYgZkUFhyY4ZMbZm28PtW+Sb40VUxx2bmW34JOxiqnbYePDysG9d/JY
	 Efxu/R4knYJ2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC9D6F5C4;
	Sat, 30 May 2026 16:25:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FD2CF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61ACE8534D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVT8Swin9eOH for <buildroot@buildroot.org>;
 Sat, 30 May 2026 16:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8436280F7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8436280F7F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69F0E835C8; Sat, 30 May 2026 16:24:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 18:08:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7102aa5ffdbb8b9b7f2a7475fffb6486c0cd04fb
X-Git-Newrev: 513f800cf32041274d0af3c8947a38aa89bbe57f
X-Patchwork-Hint: ignore
Message-Id: <20260530162459.69F0E835C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbpf: fix bpftrace build with
 kernel headers 6.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/513f800cf32041274d0af3c8947a38aa89bbe57f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 97e2f63bdf4cc992787c570b17b099c41c5535d2 bumped
bpftrace from 0.23.3 to 0.24.2.

This release includes upstream commit
https://github.com/bpftrace/bpftrace/commit/7578314df67df6bbdffaf493ff3b4d182b235b34
which was added to version 0.24.0 and makes use of
bpf_iter_link_info.task that was added to the linux kernel in version
6.1:
https://github.com/torvalds/linux/commit/f0d74c4da1f060d2a66976193712a5e6abd361f5

causing build errors when the toolchain contains kernel headers version
6.0 because the libbpf package does not update their headers:

output/build/bpftrace-0.24.2/src/attached_probe.cpp: In static member
 function 'static bpftrace::Result<std::unique_ptr<bpftrace::AttachedIterProbe> >
 bpftrace::AttachedIterProbe::make(bpftrace::Probe&,
 const bpftrace::BpfProgram&, std::optional<int>)':
output/build/bpftrace-0.24.2/src/attached_probe.cpp:1437:11: error:
 'union bpf_iter_link_info' has no member named 'task'
 1437 |     linfo.task.pid = *pid;

The build error can be reproduced with this defconfig

BR2_aarch64=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="6.0.19"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_BPFTRACE=y

on the 2026.02.x branch as of 0be927b89a319c9ac35249354558e9f4cb102fd0.

Fixes:
https://autobuild.buildroot.net/results/146/14671c54fdf0a2e44bcce7ff61ca9b89a925eca9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libbpf/libbpf.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index a141497d6c..5a6d574331 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -18,14 +18,14 @@ define LIBBPF_BUILD_CMDS
 		-C $(@D)/src
 endef
 
-# bpftrace uses btf_enum64 that was added since kernel 6.0 so we need to
-# update some uapi headers in STAGING_DIR if the toolchain is build with
-# linux-headers < 6.0.
+# bpftrace uses bpf_iter_link_info.task that was added since kernel 6.1
+# so we need to update some uapi headers in STAGING_DIR if the toolchain
+# is build with linux-headers < 6.1.
 # Otherwise bpftrace is broken due to out of date linux/bpf.h installed
 # by the toolchain.
-# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=6089fb325cf737eeb2c4d236c94697112ca860da
-# https://github.com/bpftrace/bpftrace/commit/d4f58382270c21b2c718aa0a6574c105f29e77a9
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0),)
+# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f0d74c4da1f060d2a66976193712a5e6abd361f5
+# https://github.com/bpftrace/bpftrace/commit/7578314df67df6bbdffaf493ff3b4d182b235b34
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1),)
 LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
 
 define LIBBPF_FIX_STAGING_PC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
