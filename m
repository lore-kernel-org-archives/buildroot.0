Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1E5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 14:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C942361288;
	Mon, 25 Jul 2022 14:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C942361288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPVwnfs7PkOP; Mon, 25 Jul 2022 14:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C65B4610A7;
	Mon, 25 Jul 2022 14:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C65B4610A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FDC61BF3AA
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 14:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4379382AF8
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 14:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4379382AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CE576XLiABX6 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 14:58:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FE7882D75
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FE7882D75
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 14:58:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d13so8697693wrn.10
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 07:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rse89ruqrDVo+I8LBGaoInrEPW4rfVs/gcV6DDUagxo=;
 b=mncPIykmEUgOOfF5DmnMz0GmSmDobEo57ED7n6xK33p2yRGJx7fgvhumde1/De8QDA
 tLztioYYNznLv/z2ctpYewTFV6YX6rmsQlI2wW2KhAt+uakP5DBvLraFTvkV+ziWjuxV
 i2d7G5C/k0DWdBYuoySz9IkLCTSsSGtVm5NL+8MLjc6tDxHhxe0rqOWL8X4l29mNN264
 josj4a9lF4b5RjUnNxNnhGfXRCgBqsKMNUds4eUkGCNPThyV28HRYdr8V8+FpuU6wHsF
 TXvXEdNJSw9ut0XmwKgKldHJ3spOEizRSGv0p37rEsRlvYzMsZIT+ZObha3l3rbCfGdC
 vCGg==
X-Gm-Message-State: AJIora+H0Irh+H0yRMa99tXVn3IsWIyvewwYn9kbt9r7/PS/b5f1fc5R
 E+ougLmgNrwNkMnjQekWKRoYyWMGgcc=
X-Google-Smtp-Source: AGRyM1t1jzCIANU1DPNc5m5br07Sgp0xwQ/5JI6QfIOWjzBKapPbqVeZnTixe0eAHht/7PfrsW2KcQ==
X-Received: by 2002:a5d:4ece:0:b0:21e:7ed1:f195 with SMTP id
 s14-20020a5d4ece000000b0021e7ed1f195mr5687997wrv.662.1658761121858; 
 Mon, 25 Jul 2022 07:58:41 -0700 (PDT)
Received: from kali.home (2a01cb0120169d0bf78f966f9fb21656.ipv6.abo.wanadoo.fr.
 [2a01:cb01:2016:9d0b:f78f:966f:9fb2:1656])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a7bce06000000b003a35516ccc3sm5492871wmc.26.2022.07.25.07.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:58:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 16:58:36 +0200
Message-Id: <20220725145836.11664-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rse89ruqrDVo+I8LBGaoInrEPW4rfVs/gcV6DDUagxo=;
 b=ckVuNZi+e4C36s49fxOibcLYA3LVE1oDZP98VQl8tQivpmgg2H2K1UPQ+A+uMciAOi
 U+ZR1RhyEJBejZap49AEQ/GBR0R4OMTRfhJzfh5Q6I0bvSluV3QUdJtKcw4JBpnyWQJu
 OY3Jn8gZIqw+TcfjBB9Hq5+Ifmgd7UnWyUC5G11dQ06gE0wRzieAenQnf42gzkQYxpr1
 G035fLLHS+MO+lGcF4RLcS5G35Icm0BkShkr0JMG76t6wO32n2QXwtruwqrHz2idwdHB
 UBDdSt+EjcNu+KNX9ggSRMnDVNwQCINTDO62AQGuMmIfuwfVyLISojMFuwB0R5tLx/3R
 SOBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ckVuNZi+
Subject: [Buildroot] [PATCH 1/1] package/pppd: fix build with libressl
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

Fix the following build failure with libressl:

eap-tls.c: In function 'ssl_msg_callback':
eap-tls.c:1284:10: error: 'SSL3_RT_HEADER' undeclared (first use in this function); did you mean 'SSL3_RT_ALERT'?
 1284 |     case SSL3_RT_HEADER:
      |          ^~~~~~~~~~~~~~
      |          SSL3_RT_ALERT

Fixes:
 - http://autobuild.buildroot.org/results/7d721833bddf73531fa03b0a626511af6826d0df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...pd-eap-tls.c-fix-build-with-libressl.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch

diff --git a/package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch b/package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch
new file mode 100644
index 0000000000..aefdc5b7a4
--- /dev/null
+++ b/package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch
@@ -0,0 +1,36 @@
+From b0a011bc4abac8cb3de8dfff42b754ed236ecf0f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 4 Jul 2022 10:07:03 +0200
+Subject: [PATCH] pppd/eap-tls.c: fix build with libressl (#338)
+
+Fix the following build failure with libressl:
+
+eap-tls.c: In function 'ssl_msg_callback':
+eap-tls.c:1284:10: error: 'SSL3_RT_HEADER' undeclared (first use in this function); did you mean 'SSL3_RT_ALERT'?
+ 1284 |     case SSL3_RT_HEADER:
+      |          ^~~~~~~~~~~~~~
+      |          SSL3_RT_ALERT
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7d721833bddf73531fa03b0a626511af6826d0df
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and backported) from:
+https://github.com/ppp-project/ppp/commit/b0a011bc4abac8cb3de8dfff42b754ed236ecf0f]
+---
+ pppd/eap-tls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pppd/eap-tls.c b/pppd/eap-tls.c
+index b9bab842..40796d58 100644
+--- a/pppd/eap-tls.c
++++ b/pppd/eap-tls.c
+@@ -61,7 +61,7 @@
+ #include "mppe.h"
+ #include "pathnames.h"
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 
+ #define TLS_method SSLv23_method
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
