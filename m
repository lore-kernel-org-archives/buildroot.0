Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF16EC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 17:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5325840135;
	Sun,  3 Mar 2024 17:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cf5UAu1ZRYau; Sun,  3 Mar 2024 17:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15AC94020B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15AC94020B;
	Sun,  3 Mar 2024 17:39:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 936E91BF4D7
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 17:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80DB4407D0
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 17:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7RLzc1Y4bgG for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 17:38:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6886C407CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6886C407CF
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6886C407CF
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 17:38:56 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33e2774bdc7so1409832f8f.0
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 09:38:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709487533; x=1710092333;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2jKKYTtTliYublVzOxCG2yaL4QjH3Nf3T8elzx1oMl0=;
 b=m3Mq4TXq985vITB4s30cqn4QbuGTYIpLFDDURwyt+ghR21wHGygzntWk3j4qVK50vA
 amIQZ0KpWKAQMp4m9kDMAZTZXaLfjfknEBY3LkMgwnfsNMYeKepoIhzGjm9BprJIOtzF
 jemzZUtNw5UpZNO24KA04V3yBzJBRaeEkS2f3L2GZwKXmPNDsxrGDsBuNvNVmHI78aDV
 RKZeoAom2lPXa/3j3k9YA6QWjeo5lhrfURQjXCPhp15U+sJS+G501y4aqhAk5bltbmp5
 YuTnyIlwJz9+FhCZYdsbVaPmNe7kDrbkXFQlhSlz5hfbd/5om4nQWEr7ND2DTrOd8gxr
 Zewg==
X-Gm-Message-State: AOJu0YzQqgh5nEDM0UfZ2MyDehtpvPeN22lD/fPyIuevELtzVCW6fTgS
 lLgkH8sdyxJfuamPm7zHYvfNNNHMxdvJoaKdgelG9W0dOoVmWCk6KdhGRCFT
X-Google-Smtp-Source: AGHT+IFgCyVW1GAr9eaCULFkJeJQzkK7+EB3OmbjFODXR0ylWDzDuRgPSEBMfjyVFxFQQwcs+QXxXw==
X-Received: by 2002:a5d:6b8a:0:b0:33e:340a:b2a4 with SMTP id
 n10-20020a5d6b8a000000b0033e340ab2a4mr1069395wrx.28.1709487533506; 
 Sun, 03 Mar 2024 09:38:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d594d000000b0033e12b2e567sm9302919wri.35.2024.03.03.09.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 09:38:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 18:38:51 +0100
Message-ID: <20240303173851.788985-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709487533; x=1710092333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2jKKYTtTliYublVzOxCG2yaL4QjH3Nf3T8elzx1oMl0=;
 b=kpKnOC278usM70DhY2v29cgs2Y0arMtS9TtA2RatWdkMsXkAyORzpo/ezAkwNAkYvm
 6dxFpF9to7GKZTB2yKSvn039FMRUcOXZMsjtHd/fCcFwYTntBlHDkNJ4+1wSRhxOCEh1
 UfmNhTXkeP6m7HDTep+WjtJIJO9f4O+xkCI9KmFPNbxClb/hRWszaF0etwBSeqpfk+4X
 +ZySPbJ9xmcpcSfkbFbRL4hyLv4nESM7fvR6HtZ8ivTeV1nFNv/2B4b2kzGI5KkcwZwT
 wKcDTRBhZ6YRW8DObMOyakBEBDM/AokxbdXMbBNV4WK+bW7Cc2XGdC764yUuslmyYd0f
 e8CQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kpKnOC27
Subject: [Buildroot] [PATCH v2,1/1] package/libtracefs: fix musl build
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since the addition of the
package in commit b1dbd3f679e6660325472e3fdca72127d74e6929 if cunit is
found:

../utest/tracefs-utest.c: In function 'test_uprobes_instance':
../utest/tracefs-utest.c:2492:19: error: 'PATH_MAX' undeclared (first use in this function)
 2492 |         char self[PATH_MAX] = { 0 };
      |                   ^~~~~~~~

Fixes: b1dbd3f679e6660325472e3fdca72127d74e6929
 - http://autobuild.buildroot.org/results/1a01883231dbc8a7688de26db9a08751165fe8fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Fix build instead of disabling utest

 ...ATH_MAX-if-it-is-not-already-defined.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch

diff --git a/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch b/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch
new file mode 100644
index 0000000000..121fee5adf
--- /dev/null
+++ b/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch
@@ -0,0 +1,40 @@
+From ba750812f68f0f3314494558496c23f934f8faff Mon Sep 17 00:00:00 2001
+From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
+Date: Thu, 22 Feb 2024 11:02:46 -0500
+Subject: libtracefs utest: Add PATH_MAX if it is not already defined
+
+In some setups PATH_MAX may not be defined (it is usually defined in
+linux/limits.h), but we just use PATH_MAX as something to hold the paths
+to the tracing files. In that case, just define it to 1024 if it's not
+already defined.
+
+Link: https://lore.kernel.org/linux-trace-devel/20240222-utest-fixes-v2-1-7b8ee8dca0b7@gmail.com/
+
+Fixes: 845f16976929 ("libtracefs: Add unit tests")
+Reported-by: Miko Larsson <mikoxyzzz@gmail.com>
+Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
+
+Upstream: https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=ba750812f68f0f3314494558496c23f934f8faff
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ utest/tracefs-utest.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/utest/tracefs-utest.c b/utest/tracefs-utest.c
+index 963fac7..07ecd32 100644
+--- a/utest/tracefs-utest.c
++++ b/utest/tracefs-utest.c
+@@ -26,6 +26,10 @@
+ 
+ #define gettid() syscall(__NR_gettid)
+ 
++#ifndef PATH_MAX
++#define PATH_MAX 1024
++#endif
++
+ #define TRACEFS_SUITE		"tracefs library"
+ #define TEST_INSTANCE_NAME	"cunit_test_iter"
+ #define TEST_TRACE_DIR		"/tmp/trace_utest.XXXXXX"
+-- 
+cgit 1.2.3-korg
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
