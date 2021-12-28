Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD274C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 13:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C050402B2;
	Tue, 28 Dec 2021 13:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXRnPdYXpAFm; Tue, 28 Dec 2021 13:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C730F4028F;
	Tue, 28 Dec 2021 13:58:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6341BF363
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21E5140145
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXQPalyniIHH for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 13:58:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1C394013A
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 13:58:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id g132so11691513wmg.2
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 05:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vp4uhVGNzSeP03RYhgYaQykSpREndRFUYcC1qhyqXzg=;
 b=Dif2i1HT27aTY/jIYBZqY+cr2tsFfXENjVbi/ntGyN/RxKmq04aXx+iJrkwrrdUOhU
 IN3nbBWFYETnbaUs4DjH/iqgp72grZhK+ByqU5uctlGEUDg9gJGjDgMPooZBXPDSexmD
 qyEUmXiunfBfFX1ierdbv2FDRUR8rr8ocvRuTSVARgBSkSXT/Ht87xOPA0J7kSFBxOrf
 JrDUYghiLjzJYM51bGpR3Jv9cpN5tXaojM5Bf893uFhVnzukXeGizqxecousx2aIARuB
 dmWD0U9j5XbTFI2N+avNrbuvOH3TEWIqf+YI6n/4ZLAtOXg+4uI4OlOfPWH2bKK2C2G3
 CAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vp4uhVGNzSeP03RYhgYaQykSpREndRFUYcC1qhyqXzg=;
 b=ff4hdkzluAH3F+zBxlh5tKXNn9HpSnLr6K6SK//dKTOIHM3c2KZuQ9sOA+E3Gd8EkO
 lHnnzhVB6+1a19ZoJ5VLKh81H6u9yHe33C8qREHSCMSjg5BDeRmhRiQAPGySBsLtXRPM
 fKmGp0uQiitemjFaRYoFqIGuVhWhL6qf15dN6JTWC8XTey8T95njRDlZHq3ZIAWnK2gG
 Mmr2W7oJMTZZSybf27YXJsKLisJLnwV+eMG3PB1qWTBMa5rOI1TuAa9dGMlMe/V4xQWc
 T1TiVI/C/pzCOfo43/e2m//zYDgQEjMdJkgo1JPEADHJ7oJAc08Ts7I8aZFnb2HfbNvE
 7T8g==
X-Gm-Message-State: AOAM530KuD3VwS4RkD3Ijo8/fUSfg+YeisbWykFYS/IThNQ+zbm3TJtJ
 OZ7i/V6wRVRF3BvmO4F/owCBo0REkxHWgA==
X-Google-Smtp-Source: ABdhPJwcvK+leJmgUjet73Tw0FouKHJVFFlA0gkmCrrEB/di8jVa09exgTGv32kXJ7SAsNm5iy1HJg==
X-Received: by 2002:a05:600c:1e87:: with SMTP id
 be7mr17104160wmb.171.1640699925867; 
 Tue, 28 Dec 2021 05:58:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id c11sm24340333wmq.48.2021.12.28.05.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 05:58:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 14:58:03 +0100
Message-Id: <20211228135803.3700709-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv3: bump to version 3.4.17
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/opencv/opencv/wiki/ChangeLog#version3417

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gument-version-of-SetTotalBytesLimit.patch | 39 -------------------
 package/opencv3/opencv3.hash                  |  2 +-
 package/opencv3/opencv3.mk                    |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch

diff --git a/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch b/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
deleted file mode 100644
index d169e04ef2..0000000000
--- a/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9cfa84313c5833d7295fcf57be93d5d2aaadfd88 Mon Sep 17 00:00:00 2001
-From: Vincent Rabaud <vrabaud@google.com>
-Date: Sat, 10 Jul 2021 00:21:52 +0200
-Subject: [PATCH] Use the one argument version of SetTotalBytesLimit.
-
-The two argument versions has been deprecated, cf
-https://developers.google.com/protocol-buffers/docs/reference/cpp/google.protobuf.io.coded_stream
-
-[Retrieved from:
-https://github.com/opencv/opencv/commit/9cfa84313c5833d7295fcf57be93d5d2aaadfd88]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- modules/dnn/src/caffe/caffe_io.cpp | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/caffe_io.cpp
-index 2fc4d84f4604..ebecf95eea3a 100644
---- a/modules/dnn/src/caffe/caffe_io.cpp
-+++ b/modules/dnn/src/caffe/caffe_io.cpp
-@@ -92,6 +92,7 @@
- #ifdef HAVE_PROTOBUF
- #include <google/protobuf/io/coded_stream.h>
- #include <google/protobuf/io/zero_copy_stream_impl.h>
-+#include <google/protobuf/stubs/common.h>
- #include <google/protobuf/text_format.h>
- 
- #include <opencv2/core.hpp>
-@@ -1111,7 +1112,11 @@ static const int kProtoReadBytesLimit = INT_MAX;  // Max size of 2 GB minus 1 by
- 
- bool ReadProtoFromBinary(ZeroCopyInputStream* input, Message *proto) {
-     CodedInputStream coded_input(input);
-+#if GOOGLE_PROTOBUF_VERSION >= 3006000
-+    coded_input.SetTotalBytesLimit(kProtoReadBytesLimit);
-+#else
-     coded_input.SetTotalBytesLimit(kProtoReadBytesLimit, 536870912);
-+#endif
- 
-     return proto->ParseFromCodedStream(&coded_input);
- }
diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 59af557198..30308188aa 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b1e8470b18e9e793bf70b4ae051bbc9bf81fa45f8cbfee1e6c88858c90be8ff7  opencv3-3.4.15.tar.gz
+sha256  1353eec67849aadb20df71d8bae18b83708e18fc5da080fe5efeabb1e99b2ee8  opencv3-3.4.17.tar.gz
 sha256  9076d3d934839a2f8e7bfe549abda6faea4751f1edd6e9460ff703559890ad5f  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index f3511bbcb9..8e4c90786e 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.15
+OPENCV3_VERSION = 3.4.17
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
