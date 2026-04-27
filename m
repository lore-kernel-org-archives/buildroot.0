Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899A1FF8868
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 20:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43AD381320;
	Mon, 27 Apr 2026 20:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDroQPdF3AGe; Mon, 27 Apr 2026 20:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2312581323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777320977;
	bh=flQlTa9SBS3TlzeCOu+9ddx44+rMll5BRFostiSeIUE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=oOgapBEboAsLbrH8ajrnMte7e3UEEd+h4iKtZuha7dUWJvVc2bcNtn9xnLbLi4vpX
	 dZpZqg/psN2/uIfNxMcemKuy7S3pkY9QtVs+ykEV1t06QiIY4o3hwjg4XfjwH0SVgl
	 AqjZxNl95So6LXFnKt9wjjJ2HtyzzN/b6T+Sb1tuaD3AoE5xel3TCFJHI/TyKoBVkW
	 V7pgyD4+nYfqDiCi07KS7qX7WMStuw6hP8Opoys7DxdEyRThF6FN5aKZqhx9/XBcY2
	 JvTxUb29STs1eFvzYp1A/rnyZ5DhWU9N7WmzLP+p7/3rHxNm7E5k6KamOEtNUSVz23
	 zC/YxxM8k39Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2312581323;
	Mon, 27 Apr 2026 20:16:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C37E1B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51C2681322
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAEYXmeFeeu5 for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 20:16:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3408D81320
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3408D81320
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3408D81320
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:16:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B70B45FFB1;
 Mon, 27 Apr 2026 22:16:10 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 22:16:06 +0200
Message-ID: <20260427201606.896700-1-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777320973;
 bh=t1vjNXX3s/Onk0K+mkbJHzoHTc5F2QYvUv+THEZyLKk=;
 h=From:To:Cc:Subject:Date:From;
 b=LgmPlozJWLgGb9YzlonEzXAQBQLXZwec1uOP9l2YCsCuPfUgL9wf1qOIeFTv+W034
 xFL6nv6qmUwdK+/5LweKggaEMg9Ip0+Lhb8UxxMGrrkzqLjypMrXYkglSqH+yv+KwQ
 d8NC9yiQjslVbWgMjxO9J2Qub4Kcth1FoMl7ddVLkmrlUuS/qQDDUoof256ATNlXr7
 /cMwAMGpCQb9/gUcUWBbWtMM7Yf/dUCd3h+mrC9N5UF/IsUXUvemFU0Ur2sH+4X2R9
 /oN0FLWQGWLknBZCnPwZRoK3q8xQxMqAtOfhRdr3GKIdwx2ivequXzhv161qaN6UGq
 XKvSmiyqPj1qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LgmPlozJ
Subject: [Buildroot] [PATCH 1/1] package/libabseil-cpp: add patch to fix
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...SL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch

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
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
