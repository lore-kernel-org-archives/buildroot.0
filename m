Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2426CCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC5A983BAD;
	Fri, 29 May 2026 08:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFOv5CFDcgEY; Fri, 29 May 2026 08:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD29383B7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043159;
	bh=onrhrNER7MmtvW2wLiC5oZsRWPOhUZXR/oCOxtDtBqQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZwktkA6tlbZWpP2Iw40UG5HBFrQRH1hoR2MeXX9RBnrOoyhmwqi5O0HrxtW+NSkfO
	 j13UdIjKBKjNbgPjUF4xynS0TG+pMXlGwp6fifjhLIHNesaiz8uiKW7Yo/YVelbdUa
	 WjDLn9s2vn+L08YYOvs6SEwM5OZCayiXLdqcKLRePRfPyzTg+5I52SY98o9/o+hrvc
	 TbGtxQzzAm+xe0AaWcg5/Ghy76Uu9f4Sb0ZxP9OAZu1arOfPIK5Gn6/IPb6NBkIXlu
	 pLyPwGlr7mIaAuXg4p+Yo75O41PDb3ZA5F3lz3x4ji7J7EEZY3qwkiTl9rv43Q29/C
	 AOn3phgBSsU/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD29383B7E;
	Fri, 29 May 2026 08:25:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12093288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69B5841F68
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lzckRxNXCU7n for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0176F41F6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0176F41F6B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 954AB87171; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:20:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 49c08d575fb9479f67776e9c78e7f957ecba0fd3
X-Git-Newrev: 0e61ee1db0af3a1bb226b8363a922107c970b5de
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.954AB87171@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libabseil-cpp:
 add patch to fix build with gcc <= 12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e61ee1db0af3a1bb226b8363a922107c970b5de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

libabseil-cpp headers can break some packages build, like protobuf,
when compiled with gcc 12. See [1] [2]. The issue has been reported
in protobuf upstream, in [3].

The issue is due to gcc <= 12 not supporting the mix of standard
C++ attributes with GNU attributes. See [4].

Gcc 12 has been removed from Buildroot internal toolchains in
commit [5], but gcc 12 can still be present in external toolchains
or on the host. This is currently the case of the Buildroot Docker
reference image, based on Debian 12 (Bookworm).

This commit fixes the issue by adding a package patch.

Fixes:
- [1] [2] and many more.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066346
[2] https://autobuild.buildroot.org/results/33f6cfd37cb48c15a53b3e7123d5ce8388a0f2ab
[3] https://github.com/protocolbuffers/protobuf/issues/26383
[4] https://gcc.gnu.org/PR69585
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/58cf7c51da3ae4804332f68ee934e153d695d047
[6] https://github.com/abseil/abseil-cpp/pull/2044

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 955fb2f7c41f49e8d7fc8c60b8557f6f7c1d84c4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch b/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch
new file mode 100644
index 0000000000..8f5e255795
--- /dev/null
+++ b/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch
@@ -0,0 +1,55 @@
+From 77326826119439c06e341c9d090633ecd9b520d6 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Mon, 27 Apr 2026 19:38:19 +0200
+Subject: [PATCH] base: fix ABSL_ATTRIBUTE_WARN_UNUSED with gcc <= 12
+
+Gcc <= 12 does not support mixing standard C++ attributes with
+GNU attributes. See [1].
+
+This can lead to build failures such as [2] [3] and [4]. In those
+situations, the compilation fails with error such as:
+
+    /usr/include/absl/base/attributes.h:1076:36: error: expected identifier before '[' token
+
+Gcc maintainers mentioned in [1] comment 9 that this bugfix will
+not be backported in Gcc 12. Gcc 12 is still used in LTS
+distributions. For example, it is included in Debian 12 (Bookworm),
+which is still supported until 2028. See [5].
+
+This commit adds a workaround for gcc <= 12 which uses
+__attribute__ in that case, which fixes the compilation failure.
+
+[1] https://gcc.gnu.org/PR69585
+[2] https://github.com/protocolbuffers/protobuf/issues/26383
+[3] https://autobuild.buildroot.org/results/33f6cfd37cb48c15a53b3e7123d5ce8388a0f2ab/build-end.log
+[4] https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066346
+[5] https://www.debian.org/releases/bookworm/
+
+Upstream: https://github.com/abseil/abseil-cpp/pull/2044
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ absl/base/attributes.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/absl/base/attributes.h b/absl/base/attributes.h
+index 5887fcaf..a26143e1 100644
+--- a/absl/base/attributes.h
++++ b/absl/base/attributes.h
+@@ -1092,7 +1092,14 @@ struct AbslInternal_YouForgotToExplicitlyInitializeAField {
+ // See https://clang.llvm.org/docs/AttributeReference.html#warn-unused and
+ // https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Attributes.html#index-warn_005funused-type-attribute
+ #if ABSL_HAVE_CPP_ATTRIBUTE(gnu::warn_unused)
++// Only GCC >= 13 allows mixing standard and gnu attributes.
++// In case of gcc < 13, fallback on using __attribute__.
++// https://gcc.gnu.org/PR69585
++#if defined(__GNUC__) && !defined(__clang__) && __GNUC__ < 13
++#define ABSL_ATTRIBUTE_WARN_UNUSED __attribute__((warn_unused))
++#else
+ #define ABSL_ATTRIBUTE_WARN_UNUSED [[gnu::warn_unused]]
++#endif
+ #else
+ #define ABSL_ATTRIBUTE_WARN_UNUSED
+ #endif
+-- 
+2.54.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
