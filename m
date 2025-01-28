Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F8DC282D1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87C1085850;
	Fri, 28 Feb 2025 17:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5CUzVIAwGkeN; Fri, 28 Feb 2025 17:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7446385805
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7446385805;
	Fri, 28 Feb 2025 17:06:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1941D1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E98D42884
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKsHKbm-yAlx for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 245FF42ED9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 245FF42ED9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E4DB867B4; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Jan 2025 19:04:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fbbfc35c2d0133cc9318348c74fbf1a1221ee454
X-Git-Newrev: 6a630519312f39faceb0039e7cf3ef2635a00101
X-Patchwork-Hint: ignore
Message-Id: <20250228163022.1E4DB867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uclibc: deactivate
 time64 support for older kernel's
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a630519312f39faceb0039e7cf3ef2635a00101
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For Linux systems older then 5.1.0 we need to disable time64 support
in uClibc-ng to avoid compilation failure.

Fixes Buildroot's arcturus_ucp1020_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840027

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien:
 - fix check-package errors
 - add link to a build failure
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uclibc/uclibc.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index fdd5850874..12b597f03b 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -72,6 +72,15 @@ define UCLIBC_BINFMT_CONFIG
 endef
 endif
 
+#
+# 64-bit time_t is enabled by default but needs headers >= 5.1.0
+#
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1),)
+define UCLIBC_DISABLE_TIME64
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_USE_TIME64)
+endef
+endif
+
 #
 # AArch64 definitions
 #
@@ -398,6 +407,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_DISABLE_OPT,DOSTRIP)
 	$(UCLIBC_MMU_CONFIG)
 	$(UCLIBC_BINFMT_CONFIG)
+	$(UCLIBC_DISABLE_TIME64)
 	$(UCLIBC_AARCH64_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARC_ATOMICS_CONFIG)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
