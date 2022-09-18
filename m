Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29F0C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81F3141E57;
	Sun, 18 Sep 2022 09:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81F3141E57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kRdIwwTls_hA; Sun, 18 Sep 2022 09:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65AB841E24;
	Sun, 18 Sep 2022 09:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65AB841E24
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5691BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2402B41E24
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2402B41E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CTtNehqWzAFw for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:49:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3F0841DD4
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F0841DD4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA86284CF1; Sun, 18 Sep 2022 09:49:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 11:49:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb1e544ad6a7ff31ccfebf0888efcfb29d6bf89c
X-Git-Newrev: 3b395c1574299147b41602aa471a76c98db9a1cc
X-Patchwork-Hint: ignore
Message-Id: <20220918094944.CA86284CF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add qt support for
 SSE/AVX SIMD extensions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b395c1574299147b41602aa471a76c98db9a1cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index b1695c3d27..a04409e1ce 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -35,6 +35,27 @@ QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_zlib=ON \
 	-DFEATURE_system_libb2=ON
 
+# x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it
+# is not clear yet how it maps to all the avx512* options of Qt, so we
+# for now keeps them disabled.
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_sse2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
+	-DFEATURE_sse3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
+	-DFEATURE_sse4_1=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
+	-DFEATURE_sse4_2=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
+	-DFEATURE_ssse3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF) \
+	-DFEATURE_avx=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
+	-DFEATURE_avx2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
+	-DFEATURE_avx512bw=OFF \
+	-DFEATURE_avx512cd=OFF \
+	-DFEATURE_avx512dq=OFF \
+	-DFEATURE_avx512er=OFF \
+	-DFEATURE_avx512f=OFF \
+	-DFEATURE_avx512ifma=OFF \
+	-DFEATURE_avx512pf=OFF \
+	-DFEATURE_avx512vbmi=OFF \
+	-DFEATURE_avx512vl=OFF
+
 define QT6BASE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6BASE_BUILDDIR)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
