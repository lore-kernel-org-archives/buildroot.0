Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A545C369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 09:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBBF481826;
	Wed, 30 Apr 2025 09:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlkpcshliBTh; Wed, 30 Apr 2025 09:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04ED68204F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04ED68204F;
	Wed, 30 Apr 2025 09:53:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E2F2943
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 09:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FE928204F
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 09:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWY_JsU6Dvh5 for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 09:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 761E081826
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 761E081826
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 761E081826
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 09:53:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39ee651e419so3662131f8f.3
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 02:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746006805; x=1746611605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I7hU6Y35BtEkZKZW/U50p5tafK1xVH2NgfMhS5wLNv0=;
 b=C/2EFbgmDu3pikPMGDttkciylf1w0boChQhDKJ6f7Gks6ICgAz2PqsPpXo3Rzs4pbM
 CzZIZvsuzOmmbnqpnSs6GPS4zd24bla2PsjVdRvSqkWBSjZvN4Nic7rVAIyF6l0gAyfm
 98uYqavj3Cr0UegiOr62r1Cx3VQkdO/u9FlGVWbBOMUWh3wUX8ZzD4MGhXk9LP/nt5Gg
 8TH7IWOt6KE7suHQWxnjr0GzCMgSlqJNBpJcoNQyOhKrIv8CLFZBliVbZo4RsHSv5tN5
 sONEiALjWVCfeQKr0/gJ15KLxuzjjmIOqMNPyQq4aRqY5seMpTqq/KmtkH+t+9JyOBiE
 kmTg==
X-Gm-Message-State: AOJu0YxpFpGFcfnLUxo6YXnSLH7h5IZHvH+CEdLmGyR1+6ATM1A35e4x
 sWMh0RrcyegXgPtuTjN82mFZg5k0ZNExjYlNStAL13NNi2wDEeMLdxSSAtOc/aNl8tEJDaiwcPF
 zMp4=
X-Gm-Gg: ASbGncsri0dFTS3aybBmcwIHo70B4iO3okLBIWMmvBIiq1sh79MH7eu8NB7+kMfyxJj
 2RWfS9Ae4Bd6mhoBzYBKfL6AjJOroKAuSqAt7vN3S8kULcX18Bi5ZW9h5nNVBShbjaEoMVMUXUk
 o++BXrJGrx1epTLSsGNmU+l/AK9EhEmLi1YbZzEa8yyahLVrK/EVWjb3Ppe4kSuHPY7mqOIyNWe
 e9pj4KZPg61gST8l+4/Dd0grlGeBZZEJKCOk2tFEpSTCUIV9TMnyrVqeK9NeVM5H6hJZFGlwOaI
 reFsmoHYEM21OZ2ISG2FOqVEApbIx9ndUPDtzgaC80uUOPc/LEdZ/Ek5ShLTEB/PPfo2I3Zw9i1
 fukByr+vytTSw1TfmhH40W5mqbshqRSW3VA==
X-Google-Smtp-Source: AGHT+IE292+KnGC+W0GBpIpGmJUtpxyhRtFbOPkjzcgB3qGNRe88bExJEUQW3YIq2mRwKOsVEXEG4w==
X-Received: by 2002:adf:cf03:0:b0:3a0:90be:fe79 with SMTP id
 ffacd0b85a97d-3a090befe7cmr802946f8f.9.1746006804770; 
 Wed, 30 Apr 2025 02:53:24 -0700 (PDT)
Received: from dragon.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e4698csm16617475f8f.62.2025.04.30.02.53.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 02:53:24 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 30 Apr 2025 11:53:12 +0200
Message-ID: <20250430095312.104032-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430091523.96309-1-titouan.christophe@mind.be>
References: <20250430091523.96309-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746006805; x=1746611605; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I7hU6Y35BtEkZKZW/U50p5tafK1xVH2NgfMhS5wLNv0=;
 b=GooVb31Eb+htmGdpuCshISaijfHMU4xmPkNSnfSOw9Y8lWFSMr3Rg04ArwmJAJqlX8
 RchaGu9VrLnONk0R7xFq7tkPFgowWZlDRDOANo+hsG0SMUD7ozz6rSdDSnYml2MHU8OR
 xqJWPRHWe7PtOC4vhl056c/jLHbn2eCAWYoD4wBy331hLYj1Q1tClmRrJ2Y3gwr0grD6
 JM82BQC8DSXBgXKmBYbdHr9fdVi9Cfkt1MpCAjPmGR+yDOxhza/kxv7Mgk/0XfywK/1Z
 kTwlps5GNjpKvFnGGtxuRS1X8hNS4Jier0aHDVVWYNOgJaj16208HAfPSEEVFEh+7Dq+
 Vevg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GooVb31E
Subject: [Buildroot] [PATCH v2] package/yasm: add patch for CVE-2021-33454
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes a potential NULL pointer dereference

As a side note, this package has many opened CVEs, but upstream doesn't seem
to really consider them as security issues, see their disclaimer here:
https://github.com/yasm/yasm/blob/master/SECURITY.md

We could speculate that this disclaimer has been written as a consequence of
the many small CVEs opened in a short time, that don't have a substantial
security impact (besides the command line tool crashing). All of these small
CVEs have been opened for bug reports issued by a third party who used a
fuzzy tester to manipulate the assembler input

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Change v1->v2:
* Fix patch location: in package's directory instead of patches/ subdir
---
 ...-dereference-in-yasm_expr_get_intnum.patch | 32 +++++++++++++++++++
 package/yasm/yasm.mk                          |  3 ++
 2 files changed, 35 insertions(+)
 create mode 100644 package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch

diff --git a/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
new file mode 100644
index 0000000000..976c2f7a13
--- /dev/null
+++ b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
@@ -0,0 +1,32 @@
+From 48ced849ed621a05cec4c04d4567323af3a76e81 Mon Sep 17 00:00:00 2001
+From: dataisland <dataisland@outlook.com>
+Date: Fri, 15 Sep 2023 18:20:49 +0000
+Subject: [PATCH] Fix null-pointer-dereference in yasm_expr_get_intnum
+
+Fixes the following CVE:
+  - CVE-2021-33454: NULL pointer dereference in yasm_expr_get_intnum() in libyasm/expr.c
+
+For more info see:
+  - https://nvd.nist.gov/vuln/detail/CVE-2021-33454
+  - https://github.com/yasm/yasm/pull/244
+
+Upstream: https://github.com/yasm/yasm/pull/244
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libyasm/expr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libyasm/expr.c b/libyasm/expr.c
+index c2c868ede..6838eca56 100644
+--- a/libyasm/expr.c
++++ b/libyasm/expr.c
+@@ -1260,7 +1260,7 @@ yasm_expr_get_intnum(yasm_expr **ep, int calc_bc_dist)
+ {
+     *ep = yasm_expr_simplify(*ep, calc_bc_dist);
+ 
+-    if ((*ep)->op == YASM_EXPR_IDENT && (*ep)->terms[0].type == YASM_EXPR_INT)
++    if (*ep && (*ep)->op == YASM_EXPR_IDENT && (*ep)->terms[0].type == YASM_EXPR_INT)
+         return (*ep)->terms[0].data.intn;
+     else
+         return (yasm_intnum *)NULL;
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index cdb8e15bee..766d29df3b 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -10,6 +10,9 @@ YASM_LICENSE = BSD-2-Clause, BSD-3-Clause, Artistic, GPL-2.0, LGPL-2.0
 YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
 YASM_CPE_ID_VENDOR = tortall
 
+# 0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
+YASM_IGNORE_CVES += CVE-2021-33454
+
 # This sed prevents it compiling 2 programs (vsyasm and ytasm)
 # that are only of use on Microsoft Windows.
 define YASM_PRE_CONFIGURE_FIXUP
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
