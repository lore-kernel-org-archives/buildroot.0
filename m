Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62237CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 16:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20C686F579;
	Sat, 30 May 2026 16:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGj0GbsIE6W0; Sat, 30 May 2026 16:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 339866F5BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780158312;
	bh=QEhtHOfuT2Er+VsRtFDH/0RfFxkXNrW50rA5zsIVsWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jcKe/5Sbrh5s3IMrkNFCBVftvqeOTeOyse67MzWCrD65/sjh1y8QOZD4rFUSDOa0t
	 NHxYiKxWhlF0wwbBkHLBnLUXPHH6kYG67FNDrXyvT7/c2ITmkRKEfQvbFF3m2yEzd2
	 R5hplGiDXpR+ts/BteEauANcBNiqJo+xi0hWwE9clZ0rRVH9+8GFqdPCJKPYz70HI6
	 hQIsS3ZWVnokKMTSgFtw/rbC4/TN4CnWRUvM5h3HBiVoieJzwFuLr414uAV+s1Te4f
	 4xUHSn9Zbvq48TPeTjkz4H0rHZK3+ffbk9JZ4W6GKFOy71i6nR6LAv0LE5Tc6jE08D
	 NJE69buTZvI/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 339866F5BF;
	Sat, 30 May 2026 16:25:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38BF3F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A6C84268A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Mf1QXczfiXM for <buildroot@buildroot.org>;
 Sat, 30 May 2026 16:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61CFF407DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61CFF407DB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:25:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C2678752D; Sat, 30 May 2026 16:24:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 18:06:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e5241e14aab1b6ff31c30bca05f9fa2ce81b6c1
X-Git-Newrev: 7102aa5ffdbb8b9b7f2a7475fffb6486c0cd04fb
X-Patchwork-Hint: ignore
Message-Id: <20260530162456.3C2678752D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbpf: fix bpftrace build with
 kernel headers > 5.11 & < 6.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7102aa5ffdbb8b9b7f2a7475fffb6486c0cd04fb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
