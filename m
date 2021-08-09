Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB1CC4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 21:30:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8715160EBC
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 21:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8715160EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C383605AA;
	Mon,  9 Aug 2021 21:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5U8-4Yuq0l9H; Mon,  9 Aug 2021 21:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAEFC60619;
	Mon,  9 Aug 2021 21:30:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8CB71BF295
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 21:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C86DD60619
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 21:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTH6bII6GCwJ for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 21:30:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19463605AA
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 21:30:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id x17so11510648wmc.5
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 14:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pAEkTR5KutYf7rRBScgMyKOmz8Y4Q74k4hfy1J0Kfdo=;
 b=MYFfCdaR+CigeBM/aENy2abA7N/6wDsUUiRIontEdZdIZkBYMppUW23nkopYZhF74B
 nEutaThH8OVHl5gTxc74TCPFgGbb/fHGnwqmR2mGKmsxJaBU3HyXhy0X4o0IHcCuq6S1
 987A6vJtXj2h5j/xEDvLR04gUUuYTDIIk9NFpeDFv/4CaA4TkJc2KdTySnez7aGFkS3B
 BKpQOJatlJyGYbJdPjcT72TKvRAeqtHIlq5O6sBOMZl4DM/F2/GoqllYu+VLbnh0D55l
 4z8FamnLlHOKH3meUvvEfyGaunXIUAjwJNqORX1IALKn+zrAC1ZYVfLWyYO4aOA3aWxj
 VPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pAEkTR5KutYf7rRBScgMyKOmz8Y4Q74k4hfy1J0Kfdo=;
 b=Qxlta8b8Otdc/qYDc04BkRlizU7Zd4Vv+7mWELfmSYGFlRwgqATiRB//XFrvT4s6E2
 2QoO/bk8Ba/lh2F8I02XmsVH9M8lCA/UyDwWdk7b0QSb/ASkuTjJRpn2tYQF7/6FDj1g
 rd14I1T1tXcpiJmWeqnY0lnXSEKMZFlhmer8OnHbT4K2QP19ojdXl/YbOAjPRHKjsjfg
 GEO36B4j4ihjd9JAVLMrb56+Nk3zB1HBDyEFW02xpPZIP+XOp4IzSI+tcYXTkwEMnmt5
 i06oV4SEO5q8kbINL90YIAOvivHtTRVZKwQvlT3ccnxbQfy1fq2Zm5SFUcExwjdfwn77
 bskA==
X-Gm-Message-State: AOAM533E2Ovbg3MMfzGM4b1kcBTV9l/bmuimQaUE77zoc9VqRdpe6IfL
 G1xOVAG96dxugRaZo3mZ7yIytrnZQFqVdg==
X-Google-Smtp-Source: ABdhPJzfcrf/3WrKBVkH1BW3EX9y0WpOtGv8VlBC3qli9o99SdSCwcY7potfgw398wxO3R8JN8xIug==
X-Received: by 2002:a05:600c:1483:: with SMTP id
 c3mr12817027wmh.131.1628544610827; 
 Mon, 09 Aug 2021 14:30:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id x21sm599328wmi.46.2021.08.09.14.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 14:30:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Aug 2021 23:29:59 +0200
Message-Id: <20210809212959.2716816-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tools: fix build with gcc 4.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 4.8 raised since bump to
version 4.3.2 in commit	91aa6efa8588bf7617cc4a640eb55052b524ceb7:

lib/tpm2_eventlog_yaml.c: In function 'yaml_uefi_var_unicodename':
lib/tpm2_eventlog_yaml.c:130:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for(size_t i = 0; i < data->UnicodeNameLength; ++i, tmp += ret) {
     ^
lib/tpm2_eventlog_yaml.c:130:5: note: use option -std=c99 or -std=gnu99 to compile your code
lib/tpm2_eventlog_yaml.c: In function 'yaml_specid_algs':
lib/tpm2_eventlog_yaml.c:335:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (size_t i = 0; i < count; ++i, ++alg) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/018c75cfbb34006c0bca52dcc255ad6f9cc43b77

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-configure-make-build-gnu99.patch     | 30 +++++++++++++++++++
 package/tpm2-tools/tpm2-tools.mk              |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 package/tpm2-tools/0001-configure-make-build-gnu99.patch

diff --git a/package/tpm2-tools/0001-configure-make-build-gnu99.patch b/package/tpm2-tools/0001-configure-make-build-gnu99.patch
new file mode 100644
index 0000000000..37ca6c5873
--- /dev/null
+++ b/package/tpm2-tools/0001-configure-make-build-gnu99.patch
@@ -0,0 +1,30 @@
+From 521c3cc506b18c5c84d86e1e90d1daee39849b0c Mon Sep 17 00:00:00 2001
+From: William Roberts <william.c.roberts@intel.com>
+Date: Mon, 8 Feb 2021 11:57:28 -0600
+Subject: [PATCH] configure: make build gnu99
+
+Signed-off-by: William Roberts <william.c.roberts@intel.com>
+
+[Retrieved from:
+https://github.com/tpm2-software/tpm2-tools/commit/521c3cc506b18c5c84d86e1e90d1daee39849b0c
+and updated to set gnu99 instead of c99 as done by
+https://github.com/tpm2-software/tpm2-tools/commit/5d0267428e96989afce406d096994ec5091ee107]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index dc15b5595..25039a0d9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -287,6 +287,9 @@ AC_DEFUN([add_c_flag], [
+ # -D_GNU_SOURCE is required for execvpe() in options.c
+ add_c_flag([-D_GNU_SOURCE], [AC_MSG_ERROR([Cannot enable -D_GNU_SOURCE])])
+ 
++# Enable gnu99 mode, since we use some of these features.
++add_c_flag([-std=gnu99], [AC_MSG_ERROR([Cannot enable -std=gnu99])])
++
+ # Best attempt compiler options that are on newer versions of GCC that
+ # we can't widely enforce without killing other peoples builds.
+ # Works with gcc only. Needs to be disabled on BSD and clang
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 981a89a737..41f5bcf201 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -11,6 +11,8 @@ TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
 TPM2_TOOLS_CPE_ID_VENDOR = tpm2-tools_project
 TPM2_TOOLS_SELINUX_MODULES = tpm2
 TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf util-linux
+# We're patching configure.ac
+TPM2_TOOLS_AUTORECONF = YES
 
 # -fstack-protector-all and FORTIFY_SOURCE=2 is used by
 # default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
