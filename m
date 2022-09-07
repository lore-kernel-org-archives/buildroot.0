Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF34FC54EE9
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 12:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F6B4815CD;
	Wed,  7 Sep 2022 12:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F6B4815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ac4Y8r48rCsh; Wed,  7 Sep 2022 12:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FA39814B8;
	Wed,  7 Sep 2022 12:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FA39814B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F9551BF59E
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 12:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B458814B8
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 12:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B458814B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFkFwZ3vnDXt for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 12:24:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E481C8130C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E481C8130C
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 12:24:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t7so15107293wrm.10
 for <buildroot@buildroot.org>; Wed, 07 Sep 2022 05:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=2Ur7uvzzQlDhq/E/sbR13Lvsl87hNPEeLxvtKpuXtTo=;
 b=PbB14ssacUNnfQG4M7FrJUpL4TbH82cq+Fzt7+tQ4TcgAv+OqCiglA9GCE9v27xiSW
 MH1tgRMnOQChuF3R1kOTgWsVah8025x3rJOLZUQ8Jlw7XyTFC+PZz8JX+D3HE/4Tq/A6
 bajNSrlJ1755T2mqocp6SW2V9yCx4cy/n81nJ+YT9caZXPF0iJV6M19jVI7LNtH2MJf9
 NFpdukX+9Bpskkqfim5SLzz7lPkU4z47PoeRu74yzoxToQlG4yAPchlvZDH35fnUUO+s
 LKKSD+GWW/Rf0y2NmQGBeXzNOGUvY1gZXL3BW6vWfR7iDSVfqGbSh/yTvStB5lf7mevB
 bN0g==
X-Gm-Message-State: ACgBeo0vqMTCVP0Vr23cpHo6UTByt2QsZr44qdlduP+FYRj7vTPMS6eF
 YCFJfgmLPvTEuJUgXfGFgMzqJJvqpjBjrQ==
X-Google-Smtp-Source: AA6agR5tW1Qc1N75uhKFMM1ihfhnaoucOCY0EcTEAJmV0ZZp96O/xbchUI74uf04Pqnm4xPKNVeKZg==
X-Received: by 2002:adf:eb10:0:b0:225:70d5:e994 with SMTP id
 s16-20020adfeb10000000b0022570d5e994mr1930175wrn.425.1662553470878; 
 Wed, 07 Sep 2022 05:24:30 -0700 (PDT)
Received: from sprado-office.spo.virtua.com.br ([2804:14c:46:297c::32fd])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056000008a00b00228db6b9406sm7685110wrx.45.2022.09.07.05.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 05:24:30 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  7 Sep 2022 09:24:23 -0300
Message-Id: <20220907122423.1783908-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=e-labworks-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=2Ur7uvzzQlDhq/E/sbR13Lvsl87hNPEeLxvtKpuXtTo=;
 b=4a1Q5KkA2+4sMP1xwxEL4cLyOROs2pPnpbhOS7v+cXYaGNCk4xDx9NhKrIQKb/qMr5
 uTROhx/EXCXGq6jyqfcviHFQ8YOp0ATW+UZhETjX5yhOobqmOMrsfkmqcv9k6JUmu5o4
 MGkZDj/G03KfL7HV7A7uaj2jpdJ5R0UIpgc31FEw27ogfbEuqfCeBqbb5HADwFTJls7v
 x0eVBOErZQKj1FKpQSN+c3VqHvJsNTSI6eYprGtAiydXi/RmhSZTkkfLqnq6iymWA47s
 XolT0u+QN83kB6TSByw/iWOLIcVcuY8iWTMdIYJ7N7hG+1Lv6gzycKx71Lbwktabw/dL
 rGCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=e-labworks-com.20210112.gappssmtp.com
 header.i=@e-labworks-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4a1Q5KkA
Subject: [Buildroot] [PATCH] package/snort: bump to version 2.9.20
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
From: Sergio Prado via buildroot <buildroot@buildroot.org>
Reply-To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.snort.org/downloads/snort/release_notes_2.9.20.txt

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/snort/snort.hash | 4 ++--
 package/snort/snort.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index ac098564aa5e..a807d051d977 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,8 +1,8 @@
 # From https://www.snort.org/downloads/snort/md5s
-md5  b0350425e0c1e9c044c25aa13b47edf8  snort-2.9.19.tar.gz
+md5  b52cdf14e97ef953c800c3ef123beaa5  snort-2.9.20.tar.gz
 
 # Locally computed:
-sha256  b12fc6db72afb58987a2bf1954b8f45bde02047c235513c7663857b9506369c7  snort-2.9.19.tar.gz
+sha256  29400e13f53b1831e0b8b10ec1224a1cbaa6dc1533a5322a20dd80bb84b4981c  snort-2.9.20.tar.gz
 
 # Hash for license files:
 sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 41f450541f84..8ce8ed5fa641 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.19
+SNORT_VERSION = 2.9.20
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
