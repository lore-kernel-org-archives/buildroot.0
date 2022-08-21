Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBFCC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 11:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB218127C;
	Sun, 21 Aug 2022 11:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EB218127C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hG3mZqrpVVN0; Sun, 21 Aug 2022 11:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87D9180EF1;
	Sun, 21 Aug 2022 11:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87D9180EF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AB571BF3A7
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45C3560A9E
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45C3560A9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pj3NMoWBdxeR for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 11:23:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E32296068D
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E32296068D
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 11:23:26 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b5so5764386wrr.5
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 04:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=he0QTYLVntP5KfdwnxMbBw0L6avoY4suQcsvxQ2PzBw=;
 b=rAKXIokjjn8OEQDtDtgMe5xZnazZON0F1MIZBNV4rewhOHMo9oqBzJFMm6ZaHh2WHy
 skgz+72P7reqH30fHGHlTPU/I2jEByxPUhvdI7TN8Ofr2BsBi3biCa8uHyd68CskzeTl
 Hi4GMRQFSxdAXqYfzNJJtBNTZIWNACBG4Y4IdgH+36kLoPIYJP6WRwPH7071D9Qo9xUV
 iI9GKZpf1GqyCb+XgSlpLlTBgrq2WSclesh9C/fQmsbhXI1rOIzji2xsS7ckQQ+9ittv
 QqbJk/bFzWU1xGJnO8ZqAjEiWkvCeDhXZa+YVJAcvap/FGN6UsxwDDwUmYiUboiaoEID
 Tqng==
X-Gm-Message-State: ACgBeo3kDUYHAzN+61RqKpSj2MV6aJrLhce5VgEYOW7sUxbII2U7iSRn
 PO+QDpSnnTASK31sk9LYl1mEBVha6MI=
X-Google-Smtp-Source: AA6agR69f+j8FQdNh5lw3KRLsUQnfdvZsr6zYPNCORST085RtkKdc4o4Yh2yNDdoGqEMyPk/EwSUQQ==
X-Received: by 2002:adf:f909:0:b0:225:c35:8242 with SMTP id
 b9-20020adff909000000b002250c358242mr8230843wrr.550.1661081004924; 
 Sun, 21 Aug 2022 04:23:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n12-20020a5d420c000000b0021e4edba1e5sm8626470wrq.111.2022.08.21.04.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 04:23:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 13:23:19 +0200
Message-Id: <20220821112319.3445-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=he0QTYLVntP5KfdwnxMbBw0L6avoY4suQcsvxQ2PzBw=;
 b=ZKLl+tOOkp7dUojrRxcImZg1dtM3NtQR3mxSMxqhqjtLTN4LEJb5oBHfNJ8FmELUTA
 XLTFHlPbm4QUTIyWDkjWtAmPZ+RSG3piNiYUK5ZSHJxlQ0FIWG7m86orAomX9KRLb/f9
 yjp2kiRglCLT/8N7YuWcIIkCXQfjDbponnJ7bZIx1W5SmCCHyyLQwNZ9JcqoE5YfNM2K
 UbFAx1pD1P8w0n4PxdjjwzfNO2bbjie5fs/5xyCZ42TUgtFLQoyxDo3cZJWCHqKsgRFt
 8wgoeowOnIN5Ey7yIIGXBXDHaQ1GPcCLYg8neYPutRVfctWvQcDcl5nXs3P8UNU2fqdR
 Mysw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZKLl+tOO
Subject: [Buildroot] [PATCH 1/1] package/tesseract-ocr: fix aarch64_be build
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following aarch64_be build failure probably raised since the
addition of the package:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/10.3.1/../../../../aarch64_be-none-linux-gnu/bin/ld: ./.libs/libtesseract.so: undefined reference to `tesseract::IntSimdMatrix::intSimdMatrixNEON'

Fixes:
 - http://autobuild.buildroot.org/results/b9246a37fcf6be4fabfc491daddadfb09e0a320a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...configure.ac-fix-build-on-aarch64_be.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch

diff --git a/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch b/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch
new file mode 100644
index 0000000000..20b8d5ce76
--- /dev/null
+++ b/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch
@@ -0,0 +1,32 @@
+From cffb8a36a987cd0d013d73501dd20c553ff69c77 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Aug 2022 10:21:43 +0200
+Subject: [PATCH] configure.ac: fix build on aarch64_be
+
+Fix the following build failure on aarch64_be:
+
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/10.3.1/../../../../aarch64_be-none-linux-gnu/bin/ld: ./.libs/libtesseract.so: undefined reference to `tesseract::IntSimdMatrix::intSimdMatrixNEON'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b9246a37fcf6be4fabfc491daddadfb09e0a320a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and backported) from:
+https://github.com/tesseract-ocr/tesseract/commit/cffb8a36a987cd0d013d73501dd20c553ff69c77]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 63579c954f..2b05052395 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -170,7 +170,7 @@ case "${host_cpu}" in
+ 
+     ;;
+ 
+-  aarch64)
++  aarch64*)
+ 
+     # ARMv8 always has NEON and does not need special compiler flags.
+     AM_CONDITIONAL([HAVE_NEON], true)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
