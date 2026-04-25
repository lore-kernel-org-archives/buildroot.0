Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5AAFF885C
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 21:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E77D68436E;
	Sat, 25 Apr 2026 21:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOOV_0otnWZ9; Sat, 25 Apr 2026 21:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0789584370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777151847;
	bh=aoiW1KFyQYhBFL19ZzcPZsGNxvmFznR0ohK2nXwvDdg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P4iWKJqrKb31KBy0crEp5KgEpqkpyj6A/5g6a7aivJtlimOTYLMCWz2N7VBKpT1rz
	 LI1D/Mv12UAA2w8szdsJGujf/97fbz7H3cUBUCsD9hAPXrxHv0rYfAkaATbRlOj/gN
	 orn6LZKNQeWtlr5ALXql2sJZeM/pcL4YC/Zuh5PUKz2t2xQ6WqXXMCsVuBULWZfT28
	 iZQ3WBmfMiVr4MkKT8650qOS6M/A82LkYmz3A+NKTquHyV4KTKH1997Sf458JKh7DU
	 TyHdMvM9GAKrQBJdilw+QpRNh8jNtZkIuN/iPB4Cw/H9R2kyF1lmXynb/h21E3R7lS
	 jtSHVpefHrAHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0789584370;
	Sat, 25 Apr 2026 21:17:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 460D0231
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B22261296
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mf5OcvsYaoIX for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 21:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C1BF61295
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C1BF61295
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C1BF61295
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:17:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D22A1A4C0C88;
 Sat, 25 Apr 2026 23:17:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48402)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGkMj-000000004gG-1rOF;
 Sat, 25 Apr 2026 21:16:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Apr 2026 23:16:39 +0200
Message-ID: <20260425211641.479665-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260425211641.479665-1-bernd@kuhls.net>
References: <20260425211641.479665-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777151821;
 bh=+7S0y5FrfXjYbEGWyMWvgOeAXbWqnIVADWByxOGDbk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HZ8ctFRztnF4+OWaHbMBwbd5bLPyZfpVBhmqUEfW8QNfyVDxtzbGl63I2jizqokbG
 BcbIcCDMH+u8dxS5k1GB7xOdZx0C+CzfCKfoe4HV3HBiKlTNThCcbxQTj5P4nZZJmx
 iQEn1ITnm1vLClyvNs+WDYa1WmlNSYE3h93WpFrtD+oDu1zAWER0P8V/N5F2J10KjH
 3z6AOkjmazY2Tl/1tATKhillex5RIOfbhE4wKgrlJ4pDsZ7eTQtu+TsBz8a4xi6/iG
 6PRuaqzLai3UzaowR7tgLUVdyJYxTVDOV77YUWbnZi6R0Wbvw/t9H+ajOn0Fu7zmi1
 SDbhhuobZHuHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HZ8ctFRz
Subject: [Buildroot] [PATCH 6/8] package/libbpf: fix bpftrace build with
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 package/libbpf/libbpf.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index c441522266..d405767988 100644
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
 LIBBPF_POST_INSTALL_STAGING_HOOKS += LIBBPF_FIX_STAGING_PC
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
