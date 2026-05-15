Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1017CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 16:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71A7880DF4;
	Fri, 15 May 2026 16:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2SQIxl04P9w; Fri, 15 May 2026 16:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93F1284420
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778863330;
	bh=APqiZnX02gIQOQOTRHw5u+zvE6mS4bxBIW0kgL7xsXw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NLWuH1fJkIEI4yaA0pYxaxSMySM+fmhR/fH/LMfBqt1OTzciicnUgwzRL3OHPM2PR
	 t298kAYy8A2UxuafezBub93oV4h8OTZETyupHWXbTBR+7FVc7PH/mU2bCK2TufSu/0
	 DvXXy0lofXJPc9g8w2VEQS2c97LO76q7+bZ1ruLyDdvro/Sjpegvgo9cqfXt39r3vb
	 TK/3fh/2XqpLFD+wkHm3a7h9aeLQ39cAkyJQg+z2KJqOL5G+fAmkoY04m4ao8r0AYN
	 zczOPuGfdcRZOpvYIoP13FXG+4WSfWqVYdQCyyDAbqEI9WX3PN1fflCzYekEn6esbz
	 cAz8iDwugA37Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F1284420;
	Fri, 15 May 2026 16:42:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33AC7282
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1071040EEC
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMpPu5It9g8L for <buildroot@buildroot.org>;
 Fri, 15 May 2026 16:42:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18D964049D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18D964049D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:42:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A362863B2; Fri, 15 May 2026 16:42:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 18:38:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40e9341b0b2955c0ed2fc7454a1a392e565d6e2d
X-Git-Newrev: 955fb2f7c41f49e8d7fc8c60b8557f6f7c1d84c4
X-Patchwork-Hint: ignore
Message-Id: <20260515164201.4A362863B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: add patch to fix
 build with gcc <= 12
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/955fb2f7c41f49e8d7fc8c60b8557f6f7c1d84c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
