Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CD6C02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 21:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E02D480F37;
	Mon, 27 Jan 2025 21:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6YYbyuhLggJ; Mon, 27 Jan 2025 21:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D36FF80F3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D36FF80F3D;
	Mon, 27 Jan 2025 21:54:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B34A394A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 21:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A094760646
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 21:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qo1knEvUjnnI for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 21:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C34096067B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C34096067B
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C34096067B
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 21:54:11 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-71e157a79c8so1292782a34.2
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 13:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738014850; x=1738619650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nBrmSHHHkQotaM5knnMx0tmJ0Qw/C1Flv5QxZJizg/w=;
 b=JmbHc6g+DDH059OGDfakCpq2CSHWCJLzpOp4SVK+w+Q+cFMU2iXuzPMZBECD3bAqxb
 kdQP+vVDJrQcxqmDWpWxior5s/mlOFCim2lOfaSvT7Wq9xI+TiFRjB8x28Zy5kMIiSB1
 xdVxi7SrA9kVRLenH59y5mg0IFmC+UYiOy3e608xWw9SWyUeeNVMWrbRsXX4okND4d69
 pHoUysR32qLyP8giCFmv8dza+M6MnWgHNeu93395dxER6in5hPwwE9f5xVSkghYi89RG
 HM8TI6s4po3Qgn0Tb24Hk0TSDKyQSL6RJvlTaXkMlOBFUpzFv6EZ1fZXAAVAuiRpicXb
 iPOA==
X-Gm-Message-State: AOJu0Yxl7G6kvDQdd8xhKj2prVm7Ek9Y9hRgMslEW1lfo36vO7k/O5Xd
 nURvm/DET7rNQLOYc4wSAH6bueVwXUkgQLRpetooaibjDe+trlUuOiwEyKk4KES7xOiG5cJMY6c
 mxg==
X-Gm-Gg: ASbGncvATQ55we0DEfBETDn+RyXezXmJP1IyuFWDWltxUaj57Og+IjXrZggPB+P2iYw
 QeE/9oN9blLBt0FSvscpMKcnYZBLBQpcdAqChTnJ9a3lQen3Vis4bYOz2NGu4COMYymqn3K4Dgk
 7gAN8n0iTEfL69EvXxiJ6Xr6ZbSyJZnGLPqZZ9Y5bgmYazU4QvumeoC9tzgamVkA55j96Vt8KGE
 aF1bhCZjRPGoJ0eV1fmD1YaR1Qf3wvcZXZAlbBLUkFAHOqrsKrLXtealNlR9q+5cigAOr177Eyv
 Iqe6lUZkrr57kqBoEoWz///cWKSVn/+66BBhE9FpHXGPJdSqTWfYIXoSVU8iktfqY4wxm1m/YQ=
 =
X-Google-Smtp-Source: AGHT+IFBbuiAW9DRSZE7/ZgmzXVUPXLMw6o+kolHpIazDFPH0mZWIQtqV5MhT/sjLZboP6N/ciyF4Q==
X-Received: by 2002:a05:6830:6087:b0:723:28c2:aa84 with SMTP id
 46e09a7af769-7249da89f3bmr29263355a34.13.1738014850408; 
 Mon, 27 Jan 2025 13:54:10 -0800 (PST)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-724ecf86079sm2505558a34.55.2025.01.27.13.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 13:54:09 -0800 (PST)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id BDF5FE98; Mon, 27 Jan 2025 13:54:07 -0800 (PST)
To: Buildroot Mailing List <buildroot@buildroot.org>
Cc: Markus Mayer <mmayer@broadcom.com>
Date: Mon, 27 Jan 2025 13:53:54 -0800
Message-ID: <20250127215356.3175741-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1738014850; x=1738619650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nBrmSHHHkQotaM5knnMx0tmJ0Qw/C1Flv5QxZJizg/w=;
 b=aC39ajy3UZKLBr+JSrBrGkpfmlfIqY2HdpNi0TrtyLmZRXRt1jCSgCZ15Wrpvgwjr8
 dgfIKGyUE8K/zYv2YEB4tmr0bqnWQ6xwXieK93HnnPQE2f2Hl0WbENmBP4YaEULWOy1u
 EqAvbz187DtXbaHfzCnhOK3dMrZp/FvdeRKX0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=aC39ajy3
Subject: [Buildroot] [PATCH] support/scripts/apply-patches.sh: introduce
 envvar BR_PATCH_ARGS
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduce the environment variable BR_PATCH_ARGS as a means for the
caller to pass additional arguments to the patch(1) command. These
arguments can be new arguments not originally used -- or they can
override one of the default arguments.

In addition, provide a mechanism to add patch parameters on a
per-package basis using the <PACKAGENAME>_PATCH_ARGS makefile variable,
for example "PROCPS_NG_PATCH_ARGS". This allows individual packages to
specify extra arguments or override defaults while not affecting any
other part of the build environment.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/Makefile.in              | 4 +++-
 support/scripts/apply-patches.sh | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 829636900ba9..9df66670c8d3 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -256,7 +256,9 @@ endif
 INSTALL := $(shell which install || type -p install)
 UNZIP := $(shell which unzip || type -p unzip) -q
 
-APPLY_PATCHES = TAR="$(TAR)" PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
+APPLY_PATCHES = TAR="$(TAR)" PATH=$(HOST_DIR)/bin:$$PATH \
+	BR_PATCH_ARGS=$($(PKG)_PATCH_ARGS) \
+	support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/include
 HOST_CFLAGS   ?= -O2
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 2acaa63e9fd3..26e7a4a37bb1 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -116,7 +116,8 @@ function apply_patch {
         exit 1
     fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -F0 -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
+    ${uncomp} "${path}/$patch" | patch -F0 -g0 -p1 --no-backup-if-mismatch \
+		-d "${builddir}" -t -N $silent $BR_PATCH_ARGS
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
         exit 1
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
