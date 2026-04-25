Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52086FF885C
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 21:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CEDE808AD;
	Sat, 25 Apr 2026 21:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7Gc4xv_ekLH; Sat, 25 Apr 2026 21:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4173D8402A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777151884;
	bh=LOdcrcc+iKd1/uEkUXt3fXYT3kLoSMatj8ZRwZolkmA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKHfY/mIn3wu+hgEmQfhX2H9gFn+hF2Op3ykYl5hsbAbx8g0usF0E8Yd2kN1sIt1/
	 nlUIiREwu00zowZVb2qCpIFiiHezU3S2OLeKcAu9QPXzrLW2+lfJBFFGfsPoo5zFvc
	 LjCKLjVky9MPq2+eEmvDJEPaUr9HG/EfgdfI/t/eO7LHq/ECzDDciZn0AOW/om9Ybb
	 3LJdES1dSViuGSuvrP4SpC27HjYpFbeh/uzRArxXZnhkgAc1YwWhpFw+RThNxIVPXR
	 52k2Hwu+N/oj7HsG468gTkwJX61rTEXg1FnrGgYnCdtzyqafioVoFs5ErE+FRBTN73
	 oCaOiRVnUj8UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4173D8402A;
	Sat, 25 Apr 2026 21:18:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC66231
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01A324026E
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJOimvW1hMry for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 21:18:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE4814026B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE4814026B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE4814026B
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:18:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5141CA4C1006;
 Sat, 25 Apr 2026 23:17:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48402)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGkMj-000000004gG-1T2Z;
 Sat, 25 Apr 2026 21:16:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Apr 2026 23:16:38 +0200
Message-ID: <20260425211641.479665-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260425211641.479665-1-bernd@kuhls.net>
References: <20260425211641.479665-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777151822;
 bh=thN3X4Br6qqLdh+Cbj58kwVVm0fLWUbShdbikBHAhKA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FsgG93vPfKKsHn2I9XAvmXrOVXb+zPPShx2bhg5CK2Zpo47S6vBvqbo2aPq57VjHR
 9VUmR0zyl2ZZQj1oZOQ8Rvg/LrkgYP0pNE8wY48mc2kl+YmGqbc8T5TbkGKPXsWFpP
 G4JsRXsRXFszNKO62rB9B0ni8pNYRUAuGwTV8CCkBm01Tg0HOxSRIOU++VPEmI0AWf
 XQQGAxLzQD9vl1Br54O8AzLEJC+jhX0qdSLfzQZGUszxUTaTez9A5jog/I02CDeCWp
 AiMd3IaN8WCYLz7B83HNq4xaVcp4N5XYV1eAWjHDhA1ManqgEQ6gOG3MLl3rmUZZMC
 Eh53b8pmfokeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FsgG93vP
Subject: [Buildroot] [PATCH 5/8] package/libbpf: fix bpftrace build with
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 97e2f63bdf4cc992787c570b17b099c41c5535d2 bumped
bpftrace from 0.23.3 to 0.24.2.

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
---
 package/libbpf/libbpf.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index cded3734b4..c441522266 100644
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
 LIBBPF_POST_INSTALL_STAGING_HOOKS += LIBBPF_FIX_STAGING_PC
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
