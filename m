Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4E8C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 13:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C54402BD;
	Sat,  4 Mar 2023 13:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05C54402BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SCjPJcWe4xIN; Sat,  4 Mar 2023 13:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB82D40474;
	Sat,  4 Mar 2023 13:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB82D40474
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 035791BF3E3
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEE3E81C58
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEE3E81C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VWyhCVI7ecs for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 13:53:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E99B281B71
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E99B281B71
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 13:53:46 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l1so4710244wry.12
 for <buildroot@buildroot.org>; Sat, 04 Mar 2023 05:53:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677938025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=47IRhhWNXUCEVZJJMwcWfUmXhgeiVojGe1iBX1zT+Cw=;
 b=rGIGSSznLG7eIoNwNHDJysV++4vohkRyg2WrjAyvSNSRNua9Wvqwh8hx/CcZiYJnNi
 4QFKYN0XqVMf4J/eKi1hXMhinrkHPA/Pp6cdeajH8Gmwfrf5tbX1ZzYhuAjoQFWzLS5E
 Yz6EqDLs0PCXRRO/vJYZL8axJ9fU5RDR6MyRGwfjmYW0QfeBhkvdNmqwh486atctHHR3
 +Wmiey3xbw1NZJoWx5U5UyzKFsu9x5jikJIMvxqGpTnAKzQ+BbqfALKb9/Y9p3b0vA41
 qDiSR0GbNMd+JCezJvrZYAszOu60Y49JsuSlCVGSq5xohLuewPROQXU2M/NBVTIcjIZi
 1W1Q==
X-Gm-Message-State: AO0yUKUPFZi0pdClPTUvljzzYawMM+IvEcXOYH3lpmouGzXZARCZRaLs
 VCHbJhqgk9RsR2ftjBo14YswTp0upz0=
X-Google-Smtp-Source: AK7set8SMXTtBdQj7q+RSNBhNOIFB4B+AjG02EMYWCY3w3NUyxu3hyTKJ/nOlHUajVq9K2SNX0VRYQ==
X-Received: by 2002:adf:fc52:0:b0:2c5:4a22:937c with SMTP id
 e18-20020adffc52000000b002c54a22937cmr6011734wrs.27.1677938024730; 
 Sat, 04 Mar 2023 05:53:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x8-20020adff648000000b002c3dc4131f5sm5076620wrp.18.2023.03.04.05.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 05:53:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Mar 2023 14:53:41 +0100
Message-Id: <20230304135341.25447-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677938025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=47IRhhWNXUCEVZJJMwcWfUmXhgeiVojGe1iBX1zT+Cw=;
 b=bzXPN8G1xnL9GHPqzLa2i7o/P0ESJXZzX/Zt5euV8az3Vwklel9JpQIZPVsU3iqd9W
 3uNN0RQPRF+kEiZEMAvXDMY//q6MPtC/kADVPgFvRJbXmaW1UMnknzUBG61rgw+Hhra9
 CKkjI04cLwnkhBIes3GFMlu3J4ew15HsygTvVyj6wj3jBJb31BdU/2L5Fh71Qq+sfsKQ
 cMLG6DEmVIVYUnPc/DRTSK4u5VStlLNYYjpL7ZkHLw5MAp4h2I2wOQz7mYJhw7QWApsD
 uizs/pCNKZHKz4gYKpJhBemmwi9a3j2yPICAkEpbD8dQoEtadx6p8npIkGiaA03ZcQL2
 nqHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bzXPN8G1
Subject: [Buildroot] [PATCH 1/1] package/exfat-utils: security bump to
 version 1.4.0
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

Fix CVE-2022-29973: relan exFAT 1.3.0 allows local users to obtain
sensitive information (data from deleted files in the filesystem) in
certain situations involving offsets beyond ValidDataLength.

https://github.com/relan/exfat/releases/tag/v1.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exfat-utils/exfat-utils.hash | 2 +-
 package/exfat-utils/exfat-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exfat-utils/exfat-utils.hash b/package/exfat-utils/exfat-utils.hash
index 6c6e09ccf0..b4ed8bc568 100644
--- a/package/exfat-utils/exfat-utils.hash
+++ b/package/exfat-utils/exfat-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dfebd07a7b907e2d603d3a9626e6440bd43ec6c4e8c07ccfc57ce9502b724835  exfat-utils-1.3.0.tar.gz
+sha256  241575fa93104406a47e79e53e4d907bae69886f11621f70a45276c62b75bf69  exfat-utils-1.4.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index fa471952f2..c02cefb0c5 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_UTILS_VERSION = 1.3.0
+EXFAT_UTILS_VERSION = 1.4.0
 EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
 EXFAT_UTILS_LICENSE = GPL-2.0+
 EXFAT_UTILS_LICENSE_FILES = COPYING
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
