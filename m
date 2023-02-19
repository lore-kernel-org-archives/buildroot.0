Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6E4C61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 16:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D68FE401AE;
	Sun, 19 Feb 2023 16:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D68FE401AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g04OlOkI0gRy; Sun, 19 Feb 2023 16:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE6F9404F4;
	Sun, 19 Feb 2023 16:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE6F9404F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 238D31BF287
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A870812E1
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A870812E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D78r4g7GGXj8 for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 16:48:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEC318129B
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEC318129B
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 16:48:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id bg33so1014362wmb.1
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 08:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ejbiC1TgaQGildHwbv7gd1/VpRknUc6fPANzgaik4/Y=;
 b=JhvqDw/pHCAr9YNSCa1d/bkY9PEEk0LdOCkXFyDrxKNBDSG6DSKdBzc4vr2G7GZc79
 06VnnWVAPybcCsaZtH7gUW4bkEGoHnWJy6KkPNfWyHlYkn8PqPmIgHMdj1SCEJuWgG6q
 ku9UkCGIKWnIyyxP9gPTysXha6zH9hGX5YQUMDzzNpJ2XObPKyLtNnY0z+OqBYfT6L54
 484eILKMU94eIFMYk9CCoehykdTpRHAhbAVrsHWD8mbxoMBL4RTNzaMQmsrrnLLwNJLD
 YU7aF/pgGui50cWxYsutT9psDF0suCCQtS5QQAxwv1aq256GUosilRYDVZDSpiTTi+3M
 mxDw==
X-Gm-Message-State: AO0yUKX1uVXMAK1789Ngwp2yTLDCMYtTKhikbdpGihFooNz2UcUKyMkg
 123A2SAEt0st0dhvTRQbC8nAir6kpWI=
X-Google-Smtp-Source: AK7set9i3TagGn1WnW7Xq/wlqq/bZoKHyhGgRahiXDwGSFPx+56aIoUBpqZ7pyalsIOnAuCANcMhjQ==
X-Received: by 2002:a05:600c:4b10:b0:3e2:9b4:4303 with SMTP id
 i16-20020a05600c4b1000b003e209b44303mr10128269wmp.19.1676825305669; 
 Sun, 19 Feb 2023 08:48:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b003e2232d0960sm8064404wmp.23.2023.02.19.08.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 08:48:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 17:48:20 +0100
Message-Id: <20230219164822.142283-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ejbiC1TgaQGildHwbv7gd1/VpRknUc6fPANzgaik4/Y=;
 b=Vi8ZX2+7yhE2FbAs16LaYnnesaBuISyB6JFI+zjh69eoxXZguJJiq28oQX6mnif3v1
 VLCEiZY+DocyT8XMmDelYPE4RVeAvOOuJzCJOw7jTkDP2x8t3dJ7ppj1YLQtqNbkR4JB
 k4AyeDeXEk5ma68fFgmJb/x/69TUWOfLQMGmoXD7TgOHhNeAiUFLJM1vd4Ovc6ykZDN6
 5HBkOR3WFXGHCPbFHZFZat+qGZfCbpSflEq1nEyfxkmIMnacg2RI5O3Lc5G3E5+lSuJH
 o9DvbFjTFdvtWGHZjgcQ7lqQRvpsN2A7M3pcC2R0+ZL5f7FjHMwcauiHM/A31h5vUmc3
 sfhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Vi8ZX2+7
Subject: [Buildroot] [PATCH v2,1/3] package/libjxl: fix build with libjpeg
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Changes v1 -> v2 (after review of Julien Olivain:
 - Keep tools enabled and only disable jpeg subset of tools if
   jpeg-turbo is not available

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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
