Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1897C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 08:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59FF360F3D;
	Thu, 28 Jul 2022 08:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59FF360F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7X7jfH0d4QQq; Thu, 28 Jul 2022 08:24:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8269160F36;
	Thu, 28 Jul 2022 08:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8269160F36
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1616D1BF2BC
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 08:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1EB982ACD
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 08:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1EB982ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8z1HGefxONn for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 08:24:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0424B80D18
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0424B80D18
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 08:24:47 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q18so1209887wrx.8
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 01:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7fU71vexP44Po/sOSX8BS/drpLCztUR2EteYd48S8g=;
 b=il/zyM9A4Vp8zqRvp0/dHyADJ1rJ3xXx3n25E8rpKv9dvhm5YegDwQ5wl/eelkde1l
 dEEbPYU8tG+yOyNk5XoyDpYFAaFjroeZxbhEW1xe/mIZqX0+myX5F0tkrZxV2pIQHltP
 s983SyQ6iHrTkYCMEiciTXxIjzRra4ESmM777krNl9j33I0x7uV70p7Mow+M/NVg2JMd
 gXLn86NaPC0mRgNzK6qrqqsVSMb8UE/PXlCt/mNTqN/FzeGSTfLnqBwG/4vZTJMqNFJY
 36LyqPPLNo6O0LfuI+A747UNDdgR5XDeG0/Ug6gfWbs+2VeWadDLuaMX7cleU7IvwBSa
 aTpA==
X-Gm-Message-State: AJIora9d5nwS+PdOO/VxpiQ6eSLpzZ143bAWFu8XBZH+HV7ujzsWSXE6
 EjsZ0VqjS895yc54gRM9HNyKqNyMecQ=
X-Google-Smtp-Source: AGRyM1taFpssWviBibvNO0WT6THOVESvF+OH1rqVvGtBYA9fQ9csEMuJrkzeL82H8+n8+w0WzOnCnw==
X-Received: by 2002:a05:6000:186f:b0:21d:969e:c80e with SMTP id
 d15-20020a056000186f00b0021d969ec80emr15861504wri.129.1658996685618; 
 Thu, 28 Jul 2022 01:24:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a1c5441000000b003a2e27fc275sm453631wmi.12.2022.07.28.01.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 01:24:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 10:24:38 +0200
Message-Id: <20220728082438.1697487-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7fU71vexP44Po/sOSX8BS/drpLCztUR2EteYd48S8g=;
 b=C2Urc7BjbWyaBX3l/V/SwxaH+oFnk1ztK6YbjtMfnjN3rhDTcydT9BHLpKIo+Stzai
 pt5C8DLOVFeDp4rC0KUmwe0HLvbRTMCh4+FJFj1bB+B59wWgnsIdgZehIDQhFVrbcBFg
 6EdbK6AvwezJExsdUwia3zvK69QsaeP6OVMifkD9TCbIRob3iRGLjd/tgw2T7gpH8/RN
 MJguGPzgtSfoS3tP9rbeRWxWXvSw2DjiYHZMJs2LHEkfcailRRyia3MRs7fEz3BPt/r1
 C+ftEl+QoO6qvM9BSZzSIrLSlBUBzSaSCu8BodYrVx7+D23K9PALIhnbEQLfgBtVfA7N
 +Wxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C2Urc7Bj
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: requires MD4 in
 openssl
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable MD4 in openssl to avoid the following build failure raised since
the addition of the package in commit
736c4c1655d93652a9a7e79235bbe726b3d46176:

In file included from src/lib/md4.c:16:
src/lib/md4.c: In function 'fr_md4_calc':
src/freeradius-devel/md4.h:76:33: error: unknown type name 'MD4_CTX'; did you mean 'FR_MD4_CTX'?
   76 | #  define FR_MD4_CTX            MD4_CTX
      |                                 ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a8aa12a8129056391f975820ea3d1d62241ac051

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-server/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
index 52a50bd3a7..d51d92714d 100644
--- a/package/freeradius-server/Config.in
+++ b/package/freeradius-server/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_FREERADIUS_SERVER
 	depends on !BR2_STATIC_LIBS # libtalloc
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBTALLOC
 	help
 	  FreeRADIUS is an open source server which implements
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
