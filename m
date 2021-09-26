Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12853C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 08:15:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5ED61039
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 08:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD5ED61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6156D81B0A;
	Sun, 26 Sep 2021 08:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mmKlzRClU1iK; Sun, 26 Sep 2021 08:15:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC92781AF4;
	Sun, 26 Sep 2021 08:15:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A52461BF37E
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 08:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1FEF40372
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 08:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BRRU0zTo39T for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 08:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8411F40325
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 08:15:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w29so41336462wra.8
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 01:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKwLF9ByJL8a26z1xh3QeywI+Tt5uUkK2uNfotADH0M=;
 b=XRtmxPFeRxkGqa7bl59y/yF5MycrCJO6OnBKkOq6uT4WuVaXQrSxJnpH2NIpUSsdAh
 TJxAycjVlKVdPOFIaeATmNRv9dztzi8yzkRAJx/oNIZQ8vzr0hiFR7I8eMkrYliK6fKg
 oQ0VmmYIYt2KN1K0ML9G27/7MIq+TkWD1cXquK390sd1CeQ2S6qvGajwckpFtNgO7XNx
 By2H7TJ0Vjt/hbjoAQKpntwFDpSQyTI1mhZv9ujNTS5vyCdSLx+lNKV9Yh2fB2021lxT
 wOaIjIm7ScZZQU9jPahsj66NSy0k7GeCPclo2gP4KQiuvUb031feEGkGe/BsPDBFr/sb
 jxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKwLF9ByJL8a26z1xh3QeywI+Tt5uUkK2uNfotADH0M=;
 b=ySLhOYDdYbl7fF6gh+Pa+IEAq72O+kD3MtiSHh5XSixCgZRJwSLO8DudKok59NmUDV
 id9vVVgwgo+o/tEaIsQsy61iR+wU4+I2VLuKW1dFN/mOG13WTr104dw36y7MY33JvAkq
 SiVYhDC5ROlLq2L9b+61DpKSd2+reby2Tt83vt8VbYsBOE5QtYcI1l2RU+nYoOd7qyQE
 o/LOY8O7Fl19cPRIOEIGEmUK/ACQ0HIJIOpywpFKGD3D/6T/u6z3tQHZlJpkK9jKFiAY
 3Gz3SAH/QvQOXFQqIG/S+O2H9F9BUfFePSjhp5pN4r5Yj9PNaJMZI0mE+Rz6QRq5QLOt
 2fuA==
X-Gm-Message-State: AOAM5311dP7fG+90HiYRQBB7SL/O8G5U11HQYvLRzqc3lBMPPRxSyepi
 3FIJ9Lsxgwcrg1OPym9SGEsllPTOCx4=
X-Google-Smtp-Source: ABdhPJzZF72gup9JO4WSQZBT2zW5eCEgt1vbGn47KRlSIhTAJ4Zqr5V6sGih7gTqkyKDzAWeGO8J/A==
X-Received: by 2002:adf:a745:: with SMTP id e5mr20892616wrd.406.1632644133546; 
 Sun, 26 Sep 2021 01:15:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id j7sm16169358wrr.27.2021.09.26.01.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 01:15:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 10:15:11 +0200
Message-Id: <20210926081511.3503079-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv4: fix build with protobuf
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
 - http://autobuild.buildroot.org/results/2856060cb59250f4ef7ab75a848a3dc0be9b821b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gument-version-of-SetTotalBytesLimit.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch

diff --git a/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch b/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
new file mode 100644
index 0000000000..d169e04ef2
--- /dev/null
+++ b/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
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
