Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3091C47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 13:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 369DA400D7;
	Tue,  2 Jan 2024 13:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 369DA400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nT3FDEmEEIS2; Tue,  2 Jan 2024 13:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B30C401DF;
	Tue,  2 Jan 2024 13:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B30C401DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2265E1BF314
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0909F4033D
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0909F4033D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bX8Ir1I0rBlO for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 13:12:14 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E852940309
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 13:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E852940309
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336788cb261so8523020f8f.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 05:12:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704201131; x=1704805931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pLjC+l6FatVnivJAlLrZm42CtuqOUfztKgV+MFq7JnY=;
 b=rJ0Pyhp+aosaoUSrqeM58sYGzAoweIl4FR0r3VsxYVDJD5hq7Mr0d3xMJe3ao+psm2
 YPpumyBU8bMfofU7y0QDgwUUren/c4xJLWlPJ7hYBea7wXYkw5RRhEPJzZVimhCYVOL+
 qQUPe5pK6sCPMRZFqSlqCYYjK4YrORR1WO0ylQPVpj0P9saQeTdjewm5OwUI+iNWlJDd
 4CiuSxS9+eWAJrzcMTamq5A+Gm5Nuh++HGo7ATwd1dPHKZ6k2cI4QznFCoX8/QFDFj5x
 o9gZEcX3WsSTsW9Q5oWktmGelqiLXx8RQrkT3xscDJx+ix2TvFFQ1xlkK+TgiqqAt0jg
 4gmQ==
X-Gm-Message-State: AOJu0Yzc26ixMUiJxekWexEqSycIyp/CsXa48GEsOn1Ctqfozd74N3BT
 6o+XFeOw6+iwKLLfjvT7hIn3ODhbHCQ=
X-Google-Smtp-Source: AGHT+IEVwj1GXgn+1t+rSa5jqtvM9WTbqKk9/VFcY5pyaCVvLJXtsOwC1OAXSCiirR2oqfe4Rw6h3Q==
X-Received: by 2002:adf:e442:0:b0:337:2b68:142b with SMTP id
 t2-20020adfe442000000b003372b68142bmr2711284wrm.16.1704201130946; 
 Tue, 02 Jan 2024 05:12:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t12-20020adfe10c000000b00336f43fa654sm15459116wrz.22.2024.01.02.05.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 05:12:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 14:12:08 +0100
Message-ID: <20240102131208.1216988-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704201131; x=1704805931; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pLjC+l6FatVnivJAlLrZm42CtuqOUfztKgV+MFq7JnY=;
 b=HrJpX/3sj9yoq/1jqSCb74m5kJpQ9LtXgoFq7/0RPp4yxElZasqsObHhVc0tq1zX34
 78DcWxDl4HEwC0m9siw1SRLHsL8ymZWf2IjRmwkWVEcTTIaagOSrKOqq3yt+NbsvNvuE
 vsYwL2VvL//IOxaoIR0VsUCwdR7O8mjmbvQqA2qrXUeskug1PTCm1tEuJUdsb8hybiN8
 BSl2ywFuFtG3l0+RQKfJh6+Tu5QK5JVHz68jWLcJfVMT+DBHSjqBBH2BS4/cQmMUzvNu
 C/Q+AIIuW0rt5dvpG4SZIFw8DWDlP59wQ6KXseGnT0KCvfGfCsnfknApYdIhdvNWEOU7
 7ftw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HrJpX/3s
Subject: [Buildroot] [PATCH 1/1] package/hidapi: bump to version 0.14.0
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

https://github.com/libusb/hidapi/releases/tag/hidapi-0.14.0
https://github.com/libusb/hidapi/releases/tag/hidapi-0.13.1
https://github.com/libusb/hidapi/releases/tag/hidapi-0.13.0
https://github.com/libusb/hidapi/releases/tag/hidapi-0.12.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hidapi/hidapi.hash | 2 +-
 package/hidapi/hidapi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hidapi/hidapi.hash b/package/hidapi/hidapi.hash
index 95046386a7..cc2d13214d 100644
--- a/package/hidapi/hidapi.hash
+++ b/package/hidapi/hidapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  391d8e52f2d6a5cf76e2b0c079cfefe25497ba1d4659131297081fc0cd744632  hidapi-0.11.0.tar.gz
+sha256  a5714234abe6e1f53647dd8cba7d69f65f71c558b7896ed218864ffcf405bcbd  hidapi-0.14.0.tar.gz
 sha256  7d3b087c34f35d4d538e3bcddd1ff8f66e92f9ef336881999482800ddf840913  LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-gpl3.txt
 sha256  30eb1bef29b46f8ba7ab8b416035dbd93cb034a45481dd97815b944284582cd2  LICENSE-bsd.txt
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index 9341f0186c..9f5c0a3df2 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIDAPI_VERSION = 0.11.0
+HIDAPI_VERSION = 0.14.0
 HIDAPI_SITE = $(call github,libusb,hidapi,hidapi-$(HIDAPI_VERSION))
 HIDAPI_INSTALL_STAGING = YES
 # No configure provided, so we need to autoreconf.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
