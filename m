Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA413C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 12:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7687E6128F;
	Fri, 27 Jan 2023 12:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7687E6128F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjyTMQQvVGE2; Fri, 27 Jan 2023 12:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C164B61296;
	Fri, 27 Jan 2023 12:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C164B61296
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C92E81BF263
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FD8C82B51
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FD8C82B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDB4vL36U-BS for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 12:26:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E27B982BC4
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E27B982BC4
 for <buildroot@busybox.net>; Fri, 27 Jan 2023 12:26:06 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z5so4819025wrt.6
 for <buildroot@busybox.net>; Fri, 27 Jan 2023 04:26:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t/HcadLJ5UkPrOhVIBH3emjU+YKfTEswydh4Ol2/v7Y=;
 b=CLJQwFO4DtB25/Y/g3KrOHDKHB6XR+nzZOrEaGtos9EzuaMTcB0LUwAk53fL2BFqcC
 1VPZrT27/5rQTnQnNa3i6SFzH/cYCo6DGTOAT2tjTs7i18POCeKy7KUQKbCuT83b2oKW
 FnZHhKZLI7TK/FTGzGUdX0AO9II5Cto54kpMVlHJ41PB0kx0BZb5fQPsmDE6zsVMQlVo
 Y9q5Ujl82K3wZquHxdC2cek2zzfuWS2xp2iP918u1T25m8y0hV3MlLev38uDRcVu9H5e
 uAT85y9/eNyQ6JA3geWkU7ZqhVg/A39WB48d5AxeaJdCAypqG1UTGzvukiQwnP6eJrFo
 y+3Q==
X-Gm-Message-State: AO0yUKU7+5+yBmeJYgEvPf29moepASd2x3BVNUXFr0TEoIldlQwPDe52
 v+RG77jOlQdSpNMvRyiK0yzhbOtGpmg=
X-Google-Smtp-Source: AK7set8lPWMuUEcZdeNivbpQBOclEoBvmPwyMQxzM4Z35C6QU3teRCibQ8RXUtrwRWOfJxF9qDEH4Q==
X-Received: by 2002:a05:6000:1542:b0:2bf:c319:c83f with SMTP id
 2-20020a056000154200b002bfc319c83fmr7957285wry.21.1674822365075; 
 Fri, 27 Jan 2023 04:26:05 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 y8-20020adfdf08000000b002bfb31bda06sm4107654wrl.76.2023.01.27.04.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 04:26:04 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 27 Jan 2023 13:26:02 +0100
Message-Id: <20230127122602.236054-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t/HcadLJ5UkPrOhVIBH3emjU+YKfTEswydh4Ol2/v7Y=;
 b=He/GpmxlHHKB/I2Jj7mGnWPUhDHBvzg53mG+ZOAYV2otenRLk9Uw4DsVzthEghco7b
 yG1gpz1+QNCClVPZ4Bfy0pomiEeVcpPvvG2aLogVbgvyehIW6G0XBcRlxp2qI63N+s9k
 6g/jGx47vNGBs92M7YZg1+vcsQNSpAfsW0oyngStMM9WbWw6gjoWKef2AwoglWdSgwi4
 dlN3hHOb57e1yZxz9UgjV2LJctN9uCTMgxAMZsdwAqhI9MRhpBTwyN96l1SovVqCURFt
 dipMeqMznw/sqLEaLy/4ifHmWE18wTdwVDkUxgUw9vUYLk98IgpUKS3YHeIJHIaZ04rc
 p8eA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=He/Gpmxl
Subject: [Buildroot] [PATCH] package/luajit: bump to version
 d0e88930ddde28ff662503f9f20facf34f7265aa
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index d00cea4ee..c655e9931 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  19a911fdd77af69e48fa50749606a9009696f543cc88e898b4480d8d3c8828f5  luajit-6c4826f12c4d33b8b978004bc681eb1eef2be977.tar.gz
+sha256  aa354d1265814db5a1ee9dfff6049e19b148e1fd818f1ecfa4fcf2b19f6e4dd9  luajit-d0e88930ddde28ff662503f9f20facf34f7265aa.tar.gz
 
 # Locally calculated
 sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index c79f18bf6..09bde3590 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 6c4826f12c4d33b8b978004bc681eb1eef2be977
+LUAJIT_VERSION = d0e88930ddde28ff662503f9f20facf34f7265aa
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
