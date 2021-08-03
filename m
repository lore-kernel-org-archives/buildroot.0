Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6130AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:24:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F71601FD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15F71601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD8A560797;
	Tue,  3 Aug 2021 14:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lyMxw_Rurhzz; Tue,  3 Aug 2021 14:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4326660723;
	Tue,  3 Aug 2021 14:24:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E12EC1BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA47D404A9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLPX3vhUfVeW for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:23:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB84540483
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:23:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l18so25503518wrv.5
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=91GFgLoPS73OJpTiA6bTF65yDiu5oWX83lWkXfOVhYY=;
 b=ELZapIx5Lgdd2VKujvRXgpR4cNxJwFPRzfDTdmKOXfR5UuuawttTJDwczcI+qsMwYX
 4he9PcxQU5S0lHpZcq+c7Fe+5K2vw0qVTfZtusAGeDdiyjcrvBT7K4D1i/Wm3n4ASPLv
 RmsCU0WLULTuD4eFk3NUgRsAGwJQ0X1z0I69g1IX/+BxoCx5S4QkUv+2E8S9DPbZXZwY
 AHuUKcLieHNFlk5dVC7O39ncq8SYwV13w2Xb2yLLAPPCUqOhwug9XgWcdtQR2EbZx/eC
 rdM+T/QqQBzAZ5I9KO9HDmHO3d9U275A9IygzJdd2psPOLk+oUoO/qDvfMUqdkNkfUv5
 MDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=91GFgLoPS73OJpTiA6bTF65yDiu5oWX83lWkXfOVhYY=;
 b=Z1mkgwt555W4RlD0c5lV1e9GPbwhB6o/FKHZiqcFAXyn8V/yPGIeuZYTqMfBwqfzSy
 3oohM/uX9yCWpKbLTac6I5e9O31yyUA8/vp42Y20nIRErsNmK6hNF998f9qdH8r02K2c
 B31B5VZMYe5ulmRJcugjumsNv/N6IwCuvkwvWDvSgOwzAdpaKrURLB2qgjMGGWhCkAFl
 raAVRwHESkY+ztmXRly2qoYoCDuW1Dzq+6WvqBEqLnaoe8JAFrXxu9dX70vyxTc1qLH2
 FIJHCWqGZRXr5HSBINSL4LnewvpooE1+LneSewUatK3Vv4TOb5T9lyPXTlIaq7XjpUAz
 eHCw==
X-Gm-Message-State: AOAM530jeQ7wltRIBcZLEuhkh8z/8JgeFUfP13cjRlGWbS3MTP2NQU/3
 l80zg7LDqfETMSOevb0pt3J2OzGxdQWPWg==
X-Google-Smtp-Source: ABdhPJwRln4pRLor0a54MoOzXD4RTHeLOIEnzUW86NJ/eeejE5Ap2wPFN+sX9T9paf3iHwQgzuhvrQ==
X-Received: by 2002:adf:e0c4:: with SMTP id m4mr23374707wri.312.1628000635768; 
 Tue, 03 Aug 2021 07:23:55 -0700 (PDT)
Received: from kali.home (pop.92-184-97-73.mobile.abo.orange.fr.
 [92.184.97.73])
 by smtp.gmail.com with ESMTPSA id j14sm14753557wrr.16.2021.08.03.07.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:23:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 16:23:47 +0200
Message-Id: <20210803142347.168625-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: fix build with gcc
 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

/tmp/instance-7/output-1/build/azure-iot-sdk-c-LTS_01_2021_Ref01/c-utility/src/hmac.c:211:43: error: argument 2 of type 'uint8_t *' {aka 'unsigned char *'} declared as a pointer [-Werror=array-parameter=]
  211 | int hmacResult(HMACContext *ctx, uint8_t *digest)
      |                                  ~~~~~~~~~^~~~~~
In file included from /tmp/instance-7/output-1/build/azure-iot-sdk-c-LTS_01_2021_Ref01/c-utility/src/hmac.c:13:
/tmp/instance-7/output-1/build/azure-iot-sdk-c-LTS_01_2021_Ref01/c-utility/inc/azure_c_shared_utility/sha.h:252:42: note: previously declared as an array 'uint8_t[64]' {aka 'unsigned char[64]'}
  252 | int hmacResult(HMACContext *ctx, uint8_t digest[USHAMaxHashSize]);
      |                                  ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/11a6eebd0deea679683a93a5c8355d00acdfe51e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-fix-mismatching-function-prototype.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch

diff --git a/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch b/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
new file mode 100644
index 0000000000..0c262e6c46
--- /dev/null
+++ b/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
@@ -0,0 +1,35 @@
+From 3a7997af72e7a4f70109d1639e6725b39046443e Mon Sep 17 00:00:00 2001
+From: Francesco Giancane <30423178+fgiancane8@users.noreply.github.com>
+Date: Fri, 2 Jul 2021 20:47:38 +0200
+Subject: [PATCH] hmac.c: fix mismatching function prototype (#537)
+
+The reported function raises a warning when compilers assert the flag
+`-Warray-parameter=`, signaling that an array-type argument was promoted
+to a pointer-type argument.
+
+While in practice in most C implementations this is correct, fixing the
+warning (and, in this case, indicating the maximum size for the array)
+would represent a best-practice for finding out-of-bound accesses or
+identifying wrongly-sized arrays passed in the function.
+
+Signed-off-by: Francesco Giancane <francesco.giancane@accenture.com>
+[Retrieved from:
+https://github.com/Azure/azure-c-shared-utility/commit/3a7997af72e7a4f70109d1639e6725b39046443e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/hmac.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hmac.c b/src/hmac.c
+index 53f2411f8..160af9d2f 100644
+--- a/c-utility/src/hmac.c
++++ b/c-utility/src/hmac.c
+@@ -208,7 +208,7 @@ int hmacFinalBits(HMACContext *ctx,
+ *   sha Error Code.
+ *
+ */
+-int hmacResult(HMACContext *ctx, uint8_t *digest)
++int hmacResult(HMACContext *ctx, uint8_t digest[USHAMaxHashSize])
+ {
+     if (!ctx) return shaNull;
+ 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
