Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E440AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 16:29:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EEA961002
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 16:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EEA961002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B33B402EF;
	Mon, 18 Oct 2021 16:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhOjKTSw1P-k; Mon, 18 Oct 2021 16:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27217402B3;
	Mon, 18 Oct 2021 16:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62BAB1BF293
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 16:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5135F4020C
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 16:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkVR_I9W6YVD for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 16:29:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18D5C4018B
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 16:29:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g25so42354778wrb.2
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WF5pFGik5+BUHcDgK2sJuM/9ExOWU3QxyTHKGSQjNw=;
 b=g6uVFe0n3MavSzXoqfIFEvq+DWQqM5BA4Mgk7sMMVVTaOoSAT+NOejkGWeW0Ho70PD
 ecjh7k4CDruVhkbvPvX3kSNPATvOht2VvHhttIqtABiocIWhesxxbYWRPLqBqLFkZNMC
 hCqZrQoXEFul4xLmXehfNyTJaywbJQDD1HMzTcukC/V2qTs6AjQByRbcleaaHCAlnvtY
 Iu6FnFHGwzlQ0d6j+rhN9vDgxQLHxh3HKVAqzJC9Oci7gyHgegtYE72SmvWVriKLidU0
 cbecqWv7dKx7BWnf9YHkeNqoumo3/hmJ73+v36UKxOVZ1eDzEa3Jd3IScI2ifRNeGNmS
 pI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WF5pFGik5+BUHcDgK2sJuM/9ExOWU3QxyTHKGSQjNw=;
 b=ICZvN9Abms6V+AzgsZQz9JyHG7pbnoN7MDLxfQJrd/Igt5OQvUQcmQ/ElHWCpZgrBS
 8rcLHXCbPvDfEXZ+FgeJ08a8vZ3zQ8DOe4uIQQf+Eq5jPGF3p51n/Djy8FHnuKxV1LFb
 qjCCHAN5/2uj//xAtF70JOifwoLu+Wgi52k3PLHBOjflTC/2eq5I0NqrVeSZJ/jt702T
 J0tMeK0npweGS1kVPR+upGka1O7ltm22+K8uJC2ISpbuyFWoSn7ZC9nugW5TH8ywFoVX
 Ny16FDVtmEdddbzhcULjxBu+yKYNU39bntq2WjoD0NZmsMdExVEJVYqAn7tX/YnRTB10
 FM4w==
X-Gm-Message-State: AOAM530BgDOeEKQ4J7mHplBv2tkx4k8vjwCaLM68JYVu9RpXju/evTRT
 MWVrFIeDKECtLW3wEM653ggjzmclAPY=
X-Google-Smtp-Source: ABdhPJz+CmalPumUC5H/VP+qwaF7nN+JUoQR4KM91pcq/61FF4IhXPe9L2bXuc9KFjgDR3BNUjMsbA==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr38000962wrc.25.1634574555924; 
 Mon, 18 Oct 2021 09:29:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id f184sm12283113wmf.22.2021.10.18.09.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:29:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 18:28:02 +0200
Message-Id: <20211018162802.1511716-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv4: bump to version 4.5.4
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

Drop patch (already in version)

https://github.com/opencv/opencv/wiki/ChangeLog#version454

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gument-version-of-SetTotalBytesLimit.patch | 39 -------------------
 package/opencv4/opencv4.hash                  |  2 +-
 package/opencv4/opencv4.mk                    |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch

diff --git a/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch b/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
deleted file mode 100644
index d169e04ef2..0000000000
--- a/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
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
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index b8e38d333a..791ebe3d35 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  77f616ae4bea416674d8c373984b20c8bd55e7db887fd38c6df73463a0647bab  opencv4-4.5.3.tar.gz
+sha256  c20bb83dd790fc69df9f105477e24267706715a9d3c705ca1e7f613c7b3bad3d  opencv4-4.5.4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 040fc63e4e..1859b866dd 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV4_VERSION = 4.5.3
+OPENCV4_VERSION = 4.5.4
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
