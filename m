Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D34C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 08:15:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3001460FDC
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 08:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3001460FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C60EB80DE1;
	Sun, 26 Sep 2021 08:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IbHpSuUSMF_K; Sun, 26 Sep 2021 08:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 149C080DC6;
	Sun, 26 Sep 2021 08:15:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3A271BF37E
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 08:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 922B1400D0
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 08:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PGOT4KHUrSo for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 08:15:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 374DE400C9
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 08:15:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g16so41485157wrb.3
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+YrSESlt3NJfxVXsNXyu6bRaUzXRgaUn0DzfiufUoQ=;
 b=RK1YRH37lP4ySngwwYhWcvuE423aXCFgT5H+T6amEtteHAPKjb+RspnPBjlV1Jk1u6
 PxPLQD+sQkV0q83PB0c+HmS4tVLYSWs4RVVG0ioJiAvFVvx8emGsDLsABSouVG9A8D/5
 Ovs6H1Jka4o9/QAKVV6VMhxetsAl5GGieFA7OjLjRMC9Vg7rouI9lpKOkT+BkGFrp/Gt
 o+9+sM67YtS6kU2P0Bsdyh+lN/7pG1C6u5nH3S8zQCMMYqWw68zf0lkHVX5PwLUty7Vv
 uA1STYUz9DWtY5wIRt1czf+OUcwrjAZHGErK2XQBawE9IoypeYuO/Hn3z6JvwOp9uVfQ
 JZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+YrSESlt3NJfxVXsNXyu6bRaUzXRgaUn0DzfiufUoQ=;
 b=ProL16Mfin/Xk1hNK9uL/iewrWgoo0zRCCCsG8hUV9+TZOHfVGPFO/D39zCTX0GAQs
 xh5U+uOyV30x5EgqMwcb0Z+Cwg9GyU9Ld5+kXTW06oTYxtAd1oh/YBvdhnchCnErfe5f
 I9EuDDTyz7qc16QBZMPwwizwxUnEScSAmvFrrSju1xdVQCNhyvLmd2leWtj3y4H1aY2w
 nu1kj+mGRwYPFwQnStM+7OlqdKAbD+mvI2uoHNRjZzVCU+uQ8mwT+FY+V6eZ3i0osZzR
 AAfzL9FLJBZN30SFjEn8Whhc4wQdDD9rOgnQAPpNDu/oB9eycPGpeF62XBX/VdxwcBHZ
 v6yQ==
X-Gm-Message-State: AOAM532JPXEmcBYLcoIlvaeKT5+hAVxygwxSP7VKzbLr5sm1uh0qNima
 hY5gILVC7z8gXuhulLb3xDR5jffA+1o=
X-Google-Smtp-Source: ABdhPJyid3cAbE412GAld/oj91/XdkJBY40NIcoXZVgVDoV8oH+p6XmqIP9OD9Vu3Lx4pS5QWXjisQ==
X-Received: by 2002:a05:600c:4999:: with SMTP id
 h25mr7015082wmp.107.1632644118142; 
 Sun, 26 Sep 2021 01:15:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id e28sm13509800wrc.10.2021.09.26.01.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 01:15:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 10:14:50 +0200
Message-Id: <20210926081450.3502798-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix build with protobuf
 3.18.0
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

Fix the following build failure raised since bump of protobuf to version
3.18.0 in commit c28924920d6df13a61879e3b301f71dd5edf2880:

/home/giuliobenetti/autobuild/run/instance-0/output-1/build/opencv3-3.4.15/modules/dnn/src/caffe/caffe_io.cpp: In function 'bool cv::dnn::ReadProtoFromBinary(google::protobuf::io::ZeroCopyInputStream*, google::protobuf::Message*)':
/home/giuliobenetti/autobuild/run/instance-0/output-1/build/opencv3-3.4.15/modules/dnn/src/caffe/caffe_io.cpp:1114:67: error: no matching function for call to 'google::protobuf::io::CodedInputStream::SetTotalBytesLimit(const int&, int)'
 1114 |     coded_input.SetTotalBytesLimit(kProtoReadBytesLimit, 536870912);
      |                                                                   ^
In file included from /home/giuliobenetti/autobuild/run/instance-0/output-1/build/opencv3-3.4.15/modules/dnn/src/caffe/caffe_io.cpp:93:
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/google/protobuf/io/coded_stream.h:401:8: note: candidate: 'void google::protobuf::io::CodedInputStream::SetTotalBytesLimit(int)'
  401 |   void SetTotalBytesLimit(int total_bytes_limit);
      |        ^~~~~~~~~~~~~~~~~~
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/google/protobuf/io/coded_stream.h:401:8: note:   candidate expects 1 argument, 2 provided

Fixes:
 - http://autobuild.buildroot.org/results/4f2a4e769c826d44fdec61b049d3d30a7e39a4d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gument-version-of-SetTotalBytesLimit.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch

diff --git a/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch b/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
new file mode 100644
index 0000000000..d169e04ef2
--- /dev/null
+++ b/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
@@ -0,0 +1,39 @@
+From 9cfa84313c5833d7295fcf57be93d5d2aaadfd88 Mon Sep 17 00:00:00 2001
+From: Vincent Rabaud <vrabaud@google.com>
+Date: Sat, 10 Jul 2021 00:21:52 +0200
+Subject: [PATCH] Use the one argument version of SetTotalBytesLimit.
+
+The two argument versions has been deprecated, cf
+https://developers.google.com/protocol-buffers/docs/reference/cpp/google.protobuf.io.coded_stream
+
+[Retrieved from:
+https://github.com/opencv/opencv/commit/9cfa84313c5833d7295fcf57be93d5d2aaadfd88]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ modules/dnn/src/caffe/caffe_io.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/caffe_io.cpp
+index 2fc4d84f4604..ebecf95eea3a 100644
+--- a/modules/dnn/src/caffe/caffe_io.cpp
++++ b/modules/dnn/src/caffe/caffe_io.cpp
+@@ -92,6 +92,7 @@
+ #ifdef HAVE_PROTOBUF
+ #include <google/protobuf/io/coded_stream.h>
+ #include <google/protobuf/io/zero_copy_stream_impl.h>
++#include <google/protobuf/stubs/common.h>
+ #include <google/protobuf/text_format.h>
+ 
+ #include <opencv2/core.hpp>
+@@ -1111,7 +1112,11 @@ static const int kProtoReadBytesLimit = INT_MAX;  // Max size of 2 GB minus 1 by
+ 
+ bool ReadProtoFromBinary(ZeroCopyInputStream* input, Message *proto) {
+     CodedInputStream coded_input(input);
++#if GOOGLE_PROTOBUF_VERSION >= 3006000
++    coded_input.SetTotalBytesLimit(kProtoReadBytesLimit);
++#else
+     coded_input.SetTotalBytesLimit(kProtoReadBytesLimit, 536870912);
++#endif
+ 
+     return proto->ParseFromCodedStream(&coded_input);
+ }
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
