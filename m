Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1207CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:43:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE37F610A3
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE37F610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAF804055C;
	Wed,  6 Oct 2021 15:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id La9INAaKE8ne; Wed,  6 Oct 2021 15:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAB634057B;
	Wed,  6 Oct 2021 15:43:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAC211BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAFF0405FB
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HOMElK3d8tAc for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:43:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1BD2405A4
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:43:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o20so10140034wro.3
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 08:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SgXZBdCkIRvY6jT5V7xMGzDPkv1udXV9NmxRUEeJYws=;
 b=WmpL3kQwyO5r5pdS0u4vCVYixBqqJlaEVGZzZfWtET4+t1ltWbiLXzl3+HwxCcDh6A
 doI/RR/fLU3qdSsH2uslyu9htjd5B9MxXWztl7QzAE9auersGUSeoZNXP5NYbbK3hBw0
 hBN40LiihJh0cekzGecreaw2ZULZAwQoi4CJgNTO+rOrwGNwygLhyR5xeVZqDE6ljZ2Q
 m4M5NdFxJQrcviYQHgIeNmisZtBoQ5d+9BFuZY5nRaU7r3tY0vGT2iODDZYy2SV2R4/E
 IOZ1z4080WwyAcGozl0nPeQuY12UnP+OQZw8IPD6OA9oG09dFJ3daWCBlPL07KdAL7sM
 K2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SgXZBdCkIRvY6jT5V7xMGzDPkv1udXV9NmxRUEeJYws=;
 b=z0uGUhUzK+Ez4K6FL9RVu7/mAb9iGPQlD3S6IlIfrxwEgKdRDrp+aybLbAdhDbqoV8
 wFPDDs/HjRHFTOjJpnkI5pUIZPAV3zdCDSJaGujh3IlNFhAZ4w7B7+5Q+FQosQs3yAXX
 /1zC+Kj5gImTEbKV/9b1baQDltervhB22oOlzAgOFCPABNcbxUZwZS2+lH0qW8QVCTHj
 p4Jt0hsVZY0OzAvvp65+Isoak4v7Gtx8hv2vdtFALrLMKqXmPjvU4ccKWClLN+f991KX
 yJvTZvlDGPTM7zaNeSKwydBXTaWsnkXx31dpyV/5eq/mO5p74KDunf3CUCT01GlM9vOI
 NC/g==
X-Gm-Message-State: AOAM530ggnF9KD31SHZjNI4FDYHtVF8K1C9AtIvhbuqeZCcrtQC/hmTd
 JAfmO1Fo5YhHuxmGsMisPgX+YkuQC1M=
X-Google-Smtp-Source: ABdhPJzlrc2VgTjjj8CI9WlMAhC4TKsshVlzfOuEwM7D5RPAtz75XyS5oSSbOb0nUmEX9NYiQhRKQQ==
X-Received: by 2002:a05:600c:ac1:: with SMTP id
 c1mr10776758wmr.99.1633535003950; 
 Wed, 06 Oct 2021 08:43:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id f7sm3254400wmj.20.2021.10.06.08.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:43:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 17:42:36 +0200
Message-Id: <20211006154236.2243657-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apr: fix build with autoconf >= 2.70
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

configure: error: could not determine the string function for int64_t

Fixes:
 - http://autobuild.buildroot.org/results/640bbe5b19d6e046cebd5208b37293e03714cd21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../apr/0003-Merge-r1887279-from-trunk.patch  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 package/apr/0003-Merge-r1887279-from-trunk.patch

diff --git a/package/apr/0003-Merge-r1887279-from-trunk.patch b/package/apr/0003-Merge-r1887279-from-trunk.patch
new file mode 100644
index 0000000000..444b9d2b06
--- /dev/null
+++ b/package/apr/0003-Merge-r1887279-from-trunk.patch
@@ -0,0 +1,69 @@
+From a15958a37a06f71c42c690278f9c958b93b7ee20 Mon Sep 17 00:00:00 2001
+From: Yann Ylavic <ylavic@apache.org>
+Date: Thu, 11 Mar 2021 14:10:21 +0000
+Subject: [PATCH] Merge r1887279 from trunk:
+
+build/apr_common.m4: avoid explicit inclusion of "confdefs.h"
+
+The failure is observed on `autoconf-2.69d` (soon to be released
+as `autoconf-2.70`). There `int64_t` detection fails as:
+
+$ autoreconf && ./configure
+checking whether int64_t and int use fmt %d... no
+checking whether int64_t and long use fmt %ld... no
+checking whether int64_t and long long use fmt %lld... no
+configure: error: could not determine the string function for int64_t
+```
+
+This happens because `./configure` always stumbles on warning:
+
+configure:3350: gcc -c -g -O2 -Werror  conftest.c >&5
+In file included from conftest.c:31:
+confdefs.h:22: error: "__STDC_WANT_IEC_60559_ATTRIBS_EXT__" redefined [-Werror]
+   22 | #define __STDC_WANT_IEC_60559_ATTRIBS_EXT__ 1
+      |
+
+It's triggered by double inclusion of `"confdefs.h"` contents:
+explicitly in `APR_TRY_COMPILE_NO_WARNING` macro and implicitly
+via `AC_LANG_SOURCE` use.
+
+To fix it and avoid having to define `main()` declaration the change
+uses `AC_LANG_PROGRAM` instead.
+
+Tested on both `autoconf-2.69` and `autoconf-2.69d`.
+
+
+Github: closes #25
+Submitted by: Sergei Trofimovich <slyfox gentoo.org>
+Reviewed by: ylavic
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1887485 13f79535-47bb-0310-9956-ffa450edef68
+
+[Retrieved from:
+https://github.com/apache/apr/commit/0a763c5e500f4304b7c534fae0fad430d64982e8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ build/apr_common.m4 | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/build/apr_common.m4 b/build/apr_common.m4
+index 297dd32cf75..b67a8608abe 100644
+--- a/build/apr_common.m4
++++ b/build/apr_common.m4
+@@ -467,13 +467,9 @@ AC_DEFUN([APR_TRY_COMPILE_NO_WARNING],
+    CFLAGS="$CFLAGS -Werror"
+  fi
+  AC_COMPILE_IFELSE(
+-  [AC_LANG_SOURCE(
+-   [#include "confdefs.h"
+-   ]
+-   [[$1]]
+-   [int main(int argc, const char *const *argv) {]
++  [AC_LANG_PROGRAM(
++   [[$1]],
+    [[$2]]
+-   [   return 0; }]
+   )], [CFLAGS=$apr_save_CFLAGS
+ $3],  [CFLAGS=$apr_save_CFLAGS
+ $4])
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
