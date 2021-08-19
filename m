Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B096AC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:39:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6452C60231
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6452C60231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2510A40176;
	Thu, 19 Aug 2021 21:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41aLfQRWdvIb; Thu, 19 Aug 2021 21:39:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8037F401BB;
	Thu, 19 Aug 2021 21:39:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F095B1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBEDE403BF
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PbOAD2u4iGG8 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:39:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69542403B4
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:39:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 10B928D692; Thu, 19 Aug 2021 21:38:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 23:35:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b05d81030b650444465c4e2ea9e5067b711f5616
X-Git-Newrev: d1fc0690addd850674e77dc3e96a0cfa6b0ef19b
X-Patchwork-Hint: ignore
Message-Id: <20210819213820.10B928D692@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: fix dependencies on
 kernel headers
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d1fc0690addd850674e77dc3e96a0cfa6b0ef19b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In ccfc90e1010e (package/libvirt: new package), last-minute changes
missed the depenecny on kernel headers; headers >= 3.12 are required for
all architectures, but AArch64, which requires 4.11 for HWCAP_CPUID:

    ../src/cpu/cpu_arm.c: In function 'virCPUarmCpuDataFromRegs':
    ../src/cpu/cpu_arm.c:562:20: error: 'HWCAP_CPUID' undeclared (first use in this function); did you mean 'HWCAP_PMULL'?
         if (!(hwcaps & HWCAP_CPUID)) {
                        ^~~~~~~~~~~
                        HWCAP_PMULL

Fixes:
 - http://autobuild.buildroot.org/results/85bf7b4dad73a748bf439e63874eb64d9a53088f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - move AArch64 4.11 req. from _ARCH_SUPPORTS to BR2_PACKAGE_LIBVIRT
  - add missing dependency on headers 3.12 for the rest
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvirt/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 2f191882cc..ee042e3cd8 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -14,6 +14,8 @@ comment "libvirt needs udev /dev management, a toolchain w/ threads, dynamic lib
 config BR2_PACKAGE_LIBVIRT
 	bool "libvirt"
 	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
