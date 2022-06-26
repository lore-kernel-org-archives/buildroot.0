Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35809C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 08:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C88082BBA;
	Sun, 26 Jun 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C88082BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-_lEmsSl9EB; Sun, 26 Jun 2022 08:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F53D82AC8;
	Sun, 26 Jun 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F53D82AC8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8C1E1BF470
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 08:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9305E410A9
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9305E410A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbMjbAv-dWzI for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 08:48:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2772C40999
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2772C40999
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 08:48:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id z9so3600573wmf.3
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 01:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PnGfjOzZKde9xpORAvtexBYPv661aqk1cg5P/8imfC8=;
 b=MGO6NHo01EWlCuvVCQDwpT5ijIxay3IZJ6k+fHcSmmt5kOl2Zm4UJ+lifyef1Bvkes
 gUcLHoR6xtrzUgZVIDbvBuJVxyBygv/VyjryGaS/055depDA1GJhLIXSU1kW6dSzzeUH
 JInajilHWzGTeX3fdgdsmLE4ZTJ6bduQ1yQW962FQm/1kmhdNoCqnIsbErLib8TcRTjo
 N6yc+QsPjBTNlALqhzb0e9M+6A0sgQUhHddFbkkDo+skMrECRzy3BoWabk1vHfDCFFFN
 X+ZTpyDqUN8qowQhsgeiZebd7femJptmIZ+mt60NzJrVgOEjulVTiXf60H5JgbVMC+cP
 OMjQ==
X-Gm-Message-State: AJIora/EIpHdV6AgHOnZt8+U8X9R+8+U54WyHI0X+ZzjXjUyUbk5KjKM
 GIqaN3vY8UoL9Who4E0Z2Nfwd7FglH4=
X-Google-Smtp-Source: AGRyM1t6iLAJxAh6NHLEclxa3EIxd+ByHP7Q0fvdTA/EakpB/LyNni5uAesfwIWB2mEJbP1RexsM5Q==
X-Received: by 2002:a05:600c:3505:b0:39c:93d4:5eec with SMTP id
 h5-20020a05600c350500b0039c93d45eecmr8139647wmq.179.1656233301940; 
 Sun, 26 Jun 2022 01:48:21 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a7bc448000000b003a0332760c0sm8614201wmi.16.2022.06.26.01.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 01:48:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 10:45:17 +0200
Message-Id: <20220626084517.970430-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PnGfjOzZKde9xpORAvtexBYPv661aqk1cg5P/8imfC8=;
 b=j8GY8BV+MjMUarMAUVZEazGf++vgU1XvFAbYQbOPG8Us3fMt0rKzdDST1nc3yZ0/mS
 vlcIyUeqAmd6bj7YRqfRH3DyQEBzXbgUirIOpWYxTI+oqa51n2abcT59DJ6OhBzsfiYK
 7vY4u9uEhwlyrtYIW1hsPzUqvtHuXIcGzSuXzLlmjfLEi/9Yj0Ccda7cbnjMn8qB6uTR
 ANcINrqW52IKhrZMsZIIRRC5AguSvbO9lRBgpi0hPW7G7oNvVAuSW/IMQ3GvrdSLEuNw
 5/L2ukyeWTy7IaxamFlJ3KgvT5p5Iv4Fb7v02tHI7nBlFN10NOHBVPUU10K1u50uMqId
 DB8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j8GY8BV+
Subject: [Buildroot] [PATCH 1/1] package/bayer2rgb-neon: fix build
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/10.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: ./.libs/libbayer2rgb3.so: undefined reference to `__bayer2rgb_missing_convert_dumb_implementation'

Fixes:
 - http://autobuild.buildroot.org/results/69a637b7f1422ce2bf04dda573abb09388b9a02d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-src-convert.c-remove-have_cplusplus.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch

diff --git a/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch b/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch
new file mode 100644
index 0000000000..71a6291a3c
--- /dev/null
+++ b/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch
@@ -0,0 +1,56 @@
+From ca68dadf585aadb8adf582cd94f8fcdd4592e09f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Jun 2022 10:31:49 +0200
+Subject: [PATCH] src/convert.c: remove have_cplusplus
+
+Remove have_cplusplus function for simplicity and to avoid the following
+build failure:
+
+/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/10.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: ./.libs/libbayer2rgb3.so: undefined reference to `__bayer2rgb_missing_convert_dumb_implementation'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/69a637b7f1422ce2bf04dda573abb09388b9a02d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/convert.c | 19 +++++--------------
+ 1 file changed, 5 insertions(+), 14 deletions(-)
+
+diff --git a/src/convert.c b/src/convert.c
+index c852a14..83d631d 100644
+--- a/src/convert.c
++++ b/src/convert.c
+@@ -27,25 +27,16 @@ static bool have_neon()
+ #endif
+ }
+ 
+-static bool have_cplusplus()
+-{
+-#ifdef HAVE_CPLUSPLUS
+-	return true;
+-#else
+-	return false;
+-#endif
+-}
+-
+ void bayer2rgb_convert_dumb(struct image_in const *input,
+ 			    struct image_out const *output,
+ 			    struct image_conversion_info *info)
+ {
++#ifdef HAVE_CPLUSPLUS
++	return bayer2rgb_convert_cc(input, output, info);
++#else
+ 	extern void __bayer2rgb_missing_convert_dumb_implementation();
+-
+-	if (have_cplusplus())
+-		return bayer2rgb_convert_cc(input, output, info);
+-	else
+-		__bayer2rgb_missing_convert_dumb_implementation();
++	__bayer2rgb_missing_convert_dumb_implementation();
++#endif
+ }
+ 
+ void bayer2rgb_convert(struct image_in const *input,
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
