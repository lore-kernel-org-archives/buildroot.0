Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320B2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:58:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7B460F9E
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED7B460F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB462402B5;
	Sun, 26 Sep 2021 19:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lcbzg6SX_B3; Sun, 26 Sep 2021 19:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E0A4402B7;
	Sun, 26 Sep 2021 19:58:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77E471BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7FD6071C
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kl5azCQzkkuy for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2A3D60764
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 87FC28D25B; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:29:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29478cac06cf8329dda9a35d803e6cb4a1801692
X-Git-Newrev: 9c66439bb7fce5ac429066d71fd0fe518938fefc
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.87FC28D25B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: fix build with protobuf
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c66439bb7fce5ac429066d71fd0fe518938fefc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 ...ne-argument-version-of-SetTotalBytesLimit.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
