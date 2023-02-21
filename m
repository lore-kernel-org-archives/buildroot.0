Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B559C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 15:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804F58208F;
	Tue, 21 Feb 2023 15:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804F58208F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XP24Lb-MkkYa; Tue, 21 Feb 2023 15:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1D0A82034;
	Tue, 21 Feb 2023 15:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1D0A82034
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CA371BF390
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 15:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4288429D2
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 15:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4288429D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jhn0ob3QGO8T for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 15:48:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 944D541DA1
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 944D541DA1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 15:48:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c12so4934352wrw.1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 07:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qz8grjliOhVoDR24ETmQzsMys9iYTjyyVbhDRuoZEno=;
 b=CDXwKIt8pVjDLURreh4C//nIuM+rAkqR9+9cKn/wlnRHJAZq5PnOHXAv/kAAF8fMD5
 UN/+3nnRPDgbR73m0iaza6zVGmIe50tOSkrlro50noDKaEU4r74cZa6yUXSXnv31PBzJ
 QWCfMczFXf8xX1QpeLrLPP+zrhflhOUMI3VKJyBGfUFuUvRXbcn2irr/kPXFCktXdKkK
 oOp7W9+fJ1Yaw2wSDOfswmsbmkmAa1qk8DlrUvZp+yyTSJXbfEMjDsplkjVdms2hn1W7
 6tePMFVM9LPcE0aNmjbb+p9+Uzn4ZuUe0fF455mEgOY30uO7EZ/A+cb20PyYPtdJfkwi
 TvNw==
X-Gm-Message-State: AO0yUKUJg+mJ4VyOBna8ExmBb5j/6dUDSmnhYBQAgoLH3eSSjobSQiKU
 WCqUjwpHCUPzWaYc/0+TpyBbdDyYmRQ=
X-Google-Smtp-Source: AK7set++0v+ZdkpcVX50QS3oTALxfvd+ijUOSKyftAys3fI9sNdgeKN6PC1LVY5qfDGUajsYPgcDrA==
X-Received: by 2002:a05:6000:103:b0:2c5:4ffa:ba55 with SMTP id
 o3-20020a056000010300b002c54ffaba55mr4682899wrx.69.1676994531390; 
 Tue, 21 Feb 2023 07:48:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s14-20020a5d510e000000b002c569acab1esm5182170wrt.73.2023.02.21.07.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 07:48:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 16:48:45 +0100
Message-Id: <20230221154845.2896796-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qz8grjliOhVoDR24ETmQzsMys9iYTjyyVbhDRuoZEno=;
 b=NYElpoOn/gvCCxRyXRHhDNmr7lvDe/Vr/uHFOxhYAMS9Pp9SR3YlHsgn3vUvvXZgQo
 U/7+nHuvbSZrKMq6TVsAYm422iBq5+nzoboW5FUCMPwoGKlpxX3Aj2jQreAAnNGFwQT+
 UVllhNeWOEMFi071VPLThX5pI6TBgxi0u3sYbvvTA8Z1smdYBN3MEgDZkZbuD9O7C1kq
 LbXDv5JgDAnWa0S/A8vA0h0qBCUXskL25p3k7jm1C+wdiTSwex9fQxuT2IBt7vN9kVmm
 C2JvQCsXKolXOtb+UC4fmGXRSYploxSw+bqlwwgOQO4yTHUSmg3Ee5auEb3842bYw0nF
 BVLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NYElpoOn
Subject: [Buildroot] [PATCH 1/1] package/janet: fix build without threads
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without threads raised since bump to
version 1.26.0 in commit 5c6f32bd255fc97823d464beacfa905a141066ec:

ffi.c:(.text+0x9d8): undefined reference to `janet_abstract_threaded'

Fixes:
 - http://autobuild.buildroot.org/results/20108e76990d8af7f47d474eadbbea8562ef6728

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Update-for-more-minimal-builds.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/janet/0001-Update-for-more-minimal-builds.patch

diff --git a/package/janet/0001-Update-for-more-minimal-builds.patch b/package/janet/0001-Update-for-more-minimal-builds.patch
new file mode 100644
index 0000000000..ba36a9beba
--- /dev/null
+++ b/package/janet/0001-Update-for-more-minimal-builds.patch
@@ -0,0 +1,29 @@
+From 746ff5307d309536984b648460e7b5c5dac44453 Mon Sep 17 00:00:00 2001
+From: Calvin Rose <calsrose@gmail.com>
+Date: Sun, 12 Feb 2023 12:14:11 -0600
+Subject: [PATCH] Update for more minimal builds.
+
+[Retrieved (and backported) from:
+https://github.com/janet-lang/janet/commit/746ff5307d309536984b648460e7b5c5dac44453]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/core/ffi.c   | 4 ++++
+ src/core/marsh.c | 2 ++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/core/ffi.c b/src/core/ffi.c
+index 45a498c7..b453f1f6 100644
+--- a/src/core/ffi.c
++++ b/src/core/ffi.c
+@@ -1311,7 +1311,11 @@ JANET_CORE_FN(cfun_ffi_jitfn,
+     size_t alloc_size = ((size_t) bytes.len + FFI_PAGE_MASK) & ~FFI_PAGE_MASK;
+ 
+ #ifdef JANET_FFI_JIT
++#ifdef JANET_EV
+     JanetFFIJittedFn *fn = janet_abstract_threaded(&janet_type_ffijit, sizeof(JanetFFIJittedFn));
++#else
++    JanetFFIJittedFn *fn = janet_abstract(&janet_type_ffijit, sizeof(JanetFFIJittedFn));
++#endif
+     fn->function_pointer = NULL;
+     fn->size = 0;
+ #ifdef JANET_WINDOWS
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
