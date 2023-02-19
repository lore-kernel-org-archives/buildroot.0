Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3148C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 14:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51BD840A37;
	Sun, 19 Feb 2023 14:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51BD840A37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6JrVxZFC052; Sun, 19 Feb 2023 14:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92B1640474;
	Sun, 19 Feb 2023 14:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92B1640474
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E44F11BF285
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 14:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD56660C06
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 14:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD56660C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vMmh3jCBynd for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 14:00:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83D1960BFC
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83D1960BFC
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 14:00:59 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g7so339349wrd.3
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 06:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QQ3TdFzBshEfqH8UkptRG3wV2Yqf8cos5lyVZLzcjEc=;
 b=gqd7bqDJuMmEabbDT6HA6OuEfawkQuNDsmDCqSybXdE6rO763bUQJIzOFImO1j4m3c
 OGsd077oILD6MlHzU5ZitQgLMo2uUCnhnV//uTcJNbzps3F1F0JLI5VP/IRQ+EQwsNQK
 ZtoCY7RyVv/zqown4nDlyMfaKfNVksir6d7q/OV2q/cuj009ZUEIqhcznQeORVVdei0b
 phIV9lJobykZl8uonVaSA+T3Oa+Jgyo/2TVO3Vl7SYIa/axUHWE/W6FfKjq0Vv5G2Wg1
 qdEuiuSr5DoG82c5dTr9WHeyCV6rmD5P4j1r2RhtHmE3EQYra6Kqdb1oSQ2pVg6aZrzL
 N3FQ==
X-Gm-Message-State: AO0yUKV4Qu+TaKrUKBFFW1E2MBcMC+IE1U3CrQMLMnSyGRDxWLdFC27q
 /Tizhic9cdOn6GbvSrsbd3Fk+iD1Y0U=
X-Google-Smtp-Source: AK7set+tKUe2Ml1bmssuDZPSBFsObRlu0nJ24+sgUXpVprhL21VTbbSG/gQH3FFxBYwNwm4D+vP65w==
X-Received: by 2002:a5d:4521:0:b0:2c5:9fb3:ec0a with SMTP id
 j1-20020a5d4521000000b002c59fb3ec0amr786143wra.34.1676815257089; 
 Sun, 19 Feb 2023 06:00:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d6b4d000000b002c6e8af1037sm1659333wrw.104.2023.02.19.06.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 06:00:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 15:00:49 +0100
Message-Id: <20230219140051.80647-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QQ3TdFzBshEfqH8UkptRG3wV2Yqf8cos5lyVZLzcjEc=;
 b=ezX2Ps9b6lUZoHwEbSk5srubcK/OhRFvzdDUDwkLmEiU4lbYRtcKYjyh46N1g2FJdm
 sD+wJqIgWhzJCe4Fm3KgtbE8JFaYKudeN7koqxfgqDgUUciwkpThYop1MB0FLeaaK2bG
 UwDZdhx/cvlj2xxRm/YkUnDoGZE2h/8EqjT6gYeZHzDKhsDtZbYS1PHVU0txlW1REBLb
 eSw97qvmiXT2k/Cd6225oimAw6D7d/46Was0pKxLDtWL3eWJ+VBPMLYvVYlanoAv5wQ7
 mSdVRqjWU4EXn3Bk+//q4PYeEGXpGGpZf+dTcbIOwGowPnHpSUlQpsMw+bEsYcpjQMd6
 f3lQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ezX2Ps9b
Subject: [Buildroot] [PATCH 1/3] package/libjxl: fix build with libjpeg
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
 package/libjxl/libjxl.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index cc24ba258c..02a93ac5d9 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -30,4 +30,11 @@ LIBJXL_CONF_OPTS = \
 	-DJPEGXL_ENABLE_SJPEG=OFF \
 	-DJPEGXL_ENABLE_SKCMS=OFF
 
+ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
+LIBJXL_DEPENDENCIES += jpeg-turbo
+LIBJXL_CONF_OPTS += -DJPEGXL_ENABLE_TOOLS=ON
+else
+LIBJXL_CONF_OPTS += -DJPEGXL_ENABLE_TOOLS=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
