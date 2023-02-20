Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2820C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B185822D1;
	Mon, 20 Feb 2023 20:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B185822D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLl3XireLgvn; Mon, 20 Feb 2023 20:50:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B23AD822C2;
	Mon, 20 Feb 2023 20:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B23AD822C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15BBD1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3E854015F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3E854015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AddE-FakrIvn for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 236C5400AF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 236C5400AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1212286487; Mon, 20 Feb 2023 20:50:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 21:50:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d29799914d5df6fb372284d8c3408809e00d0b4
X-Git-Newrev: 92c4589b904cfbc4cd633a92729ecd98a50851ff
X-Patchwork-Hint: ignore
Message-Id: <20230220205040.1212286487@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjxl: fix build with libjpeg
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=92c4589b904cfbc4cd633a92729ecd98a50851ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building with libjpeg will raise the following build failure on some
architectures since the addition of the package in commit
e648d399d8bd609697e78f13f7fa76be06d91a57:

/tmp/instance-14/output-1/build/libjxl-0.7.0/lib/extras/enc/jpg.cc: In function 'jxl::Status jxl::extras::{anonymous}::EncodeWithLibJpeg(const jxl::extras::PackedImage&, const JxlBasicInfo&, const std::vector<unsigned char>&, std::vector<unsigned char>, size_t, const string&, std::vector<unsigned char>*)':
/tmp/instance-14/output-1/build/libjxl-0.7.0/lib/extras/enc/jpg.cc:126:34: error: invalid conversion from 'long unsigned int*' to 'size_t*' {aka 'unsigned int*'} [-fpermissive]
  126 |   jpeg_mem_dest(&cinfo, &buffer, &size);
      |                                  ^~~~~
      |                                  |
      |                                  long unsigned int*

Upstream advocates to use jpeg-turbo:
https://github.com/libjxl/libjxl/issues/1802

Fixes:
 - http://autobuild.buildroot.org/results/9a2a7c6072876f2562609bf98f32a1ce93631a75

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libjxl/libjxl.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index cc24ba258c..1257928efd 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -30,4 +30,11 @@ LIBJXL_CONF_OPTS = \
 	-DJPEGXL_ENABLE_SJPEG=OFF \
 	-DJPEGXL_ENABLE_SKCMS=OFF
 
+ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
+LIBJXL_DEPENDENCIES += jpeg-turbo
+LIBJXL_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_JPEG=OFF
+else
+LIBJXL_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_JPEG=ON
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
