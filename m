Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C757CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4929660F6B;
	Fri,  5 Jun 2026 12:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HP62fxOiVh7Q; Fri,  5 Jun 2026 12:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE77F60F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663269;
	bh=ibNrPfr0kkzNSTl7KxTlOjZ6ZZsK6gH+rLuQprK4azA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qwHAtDZsPxQqyxp8Ypu9Hut/K3plB2TDHHt5nngGbKUUS+5sJTqi+rDN4IMM4Zpg9
	 KouL5q6gYcxYlJfiDf/ynnEnntzPEceSaIDF/4zoE7kuZgqXfUVhXxtXkR2PLQSpN7
	 mE3sQxiKx9I2uoCF+lkM1K+o32aCqDI9OuSlJQHjA80N3/x6vHZLDTLJu+t43YMuFU
	 Rw6fkNnl5pPcWvtArWP5IpAw05a9S7QjT68xMXtz9eiAGP9d8/Y10nGRzsuFchLoz8
	 sagMk3eVA+ZzUFUBCNS63u9kMM7iB7OV2jIVRIAvAZKo47EaaPdggASkWVgN9ytFvm
	 CgvK6HoP/tRyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE77F60F54;
	Fri,  5 Jun 2026 12:41:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DFB8F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 370BD81FF2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJW318DeuSRu for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 903B481FD7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 903B481FD7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA0BC87B39; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:10:03 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 7b9b53d1be767d29c470a633b94fddf03516e976
X-Git-Newrev: 280270c932a35e4b7678677dc37de96ff0e292a3
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.BA0BC87B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libbpf: fix
 bpftrace build with kernel headers > 5.11 & < 6.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/280270c932a35e4b7678677dc37de96ff0e292a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit 97e2f63bdf4cc992787c570b17b099c41c5535d2 in 2026.02-rc1
bumped bpftrace from 0.23.3 to 0.24.2.

This release includes upstream commit
https://github.com/bpftrace/bpftrace/commit/d4f58382270c21b2c718aa0a6574c105f29e77a9

which was added to version 0.24.0 and makes use of btf_enum64 that was
added to the linux kernel in version 6.0:
https://github.com/torvalds/linux/commit/6089fb325cf737eeb2c4d236c94697112ca860da

causing build errors when the toolchain contains kernel headers between
versions 5.12 and 5.19 because the libbpf package does not update their
headers so we need to raise the BR2_TOOLCHAIN_HEADERS_AT_LEAST_ version
number again.

The build error can be reproduced with this defconfig

BR2_aarch64=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="5.11.22"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_BPFTRACE=y

on the 2026.02.x branch as of 0be927b89a319c9ac35249354558e9f4cb102fd0.

Fixes:
https://autobuild.buildroot.net/results/8f7/8f7ce88a070e825ef178275a13d969349f05593b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 7102aa5ffdbb8b9b7f2a7475fffb6486c0cd04fb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libbpf/libbpf.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 4b742ab966..a141497d6c 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -18,14 +18,14 @@ define LIBBPF_BUILD_CMDS
 		-C $(@D)/src
 endef
 
-# bpftrace uses variables from bpf_btf_info that were added since kernel
-# 5.11, so we need to update some uapi headers in STAGING_DIR if the
-# toolchain is build with linux-headers < 5.11.
+# bpftrace uses btf_enum64 that was added since kernel 6.0 so we need to
+# update some uapi headers in STAGING_DIR if the toolchain is build with
+# linux-headers < 6.0.
 # Otherwise bpftrace is broken due to out of date linux/bpf.h installed
 # by the toolchain.
-# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=5329722057d41aebc31e391907a501feaa42f7d9
-# https://github.com/bpftrace/bpftrace/commit/fea31939899db48fa6d28f5ce880bfc39250ec9f
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11),)
+# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=6089fb325cf737eeb2c4d236c94697112ca860da
+# https://github.com/bpftrace/bpftrace/commit/d4f58382270c21b2c718aa0a6574c105f29e77a9
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0),)
 LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
 
 define LIBBPF_FIX_STAGING_PC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
