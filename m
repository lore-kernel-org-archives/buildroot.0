Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED084C54EE9
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 20:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D90340199;
	Thu, 22 Sep 2022 20:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D90340199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 91L8TaQyYYAK; Thu, 22 Sep 2022 20:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCDDE40158;
	Thu, 22 Sep 2022 20:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCDDE40158
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CAA91BF2CB
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 20:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 238D1408A0
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 20:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 238D1408A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHRvHcpMQQUW for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 20:16:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D01A540861
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D01A540861
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 20:16:25 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id r125so13806656oia.8
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 13:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=3PzNGNrzW/qLoo9KT6Vt6qVgYfKfycUCtOjZgGb8P+o=;
 b=3zkLcN0hLIMTAXS2419zMGnNxKZ+SgooV3mF50m546LWoaabCG+3JNgsK5Wv56dd6c
 gWuZ8puykT4H03KAwlDCaASDlp1hxJHME0lYZrHnqm0tUthT9uvJ8Q7F8shB8HK69TsW
 S5V7nafFHB4W6dD0Aj3ltPf6ZtUmr2ZCZVAOpJmKAVEqj04G8sYP86nB0yx8hcEwlxJB
 FZKG1ZsQizytLHPJftuGnRbNs8/M5FcPLENO51u/6C4f3pXMGeO+gJvIigKWog/K5pjH
 cDYqi773h9yUct1ZdkFP0NhCBkZhZIAkX0LwQi8CrkAPkjeJ6VQp3YEdgKH2DN1hqjSW
 2USA==
X-Gm-Message-State: ACrzQf3EUzZw5s08mkSSlIuWX1x+xryudGyISOKN0YJe8dagjcEp6a5t
 xwTjPKIelPLPf9m+Gu6EMOjaoGwo4eD5Aw==
X-Google-Smtp-Source: AMsMyM5EqwbTI4mIidt10OxdyV4Zgi0P0vetH4xlkINHHpP+N/IzdyDf6yiJ6nO65jFuBNQ2QZPSPw==
X-Received: by 2002:a05:6808:1717:b0:334:9342:63f1 with SMTP id
 bc23-20020a056808171700b00334934263f1mr7692384oib.77.1663877784278; 
 Thu, 22 Sep 2022 13:16:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q3-20020a0568080ec300b00342fc99c5cbsm2873672oiv.54.2022.09.22.13.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 13:16:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 14:16:21 -0600
Message-Id: <20220922201621.11592-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=3PzNGNrzW/qLoo9KT6Vt6qVgYfKfycUCtOjZgGb8P+o=;
 b=hnnzg8MxbXz8/Hy830M5WINx/aqJAk5/tRoYS5Wi38DVM3+Ekx1OaaUL3mwRTtrIHC
 XThGrYLMt2ULNS7MLUvT/PMDMC9Q4frp8PJn5gFnQpzglLaPzbH8WWl/5X0zm8iR/7Gd
 YYq/A1gZrHyGu74901xNgYicWxs+4UA27os6LobjG08Qj3sxn/FZo1ekXvKgF5/MYoK2
 AK+9IdrcT88rj22Gw+pAUPXDIi9gCeOA+vfiV52vlmIPpSwCDRN3MuHPr+cv0KgOCePC
 yePAxVfqcHEyoNompUrVVAyQts1G9I9L8iCXntHGTyrV+0MBw4ew5nrhlPogLr0EqiQm
 x5aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hnnzg8Mx
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.8.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash change due to year update:
https://github.com/aio-libs/aiohttp/commit/afe2280fd3520c914b35bfe52a7118017344966b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/python-aiohttp.hash | 6 +++---
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index b2b0f8c937..e59b6969e6 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  faf7726dc65a940272874c0f441e8ec6  aiohttp-3.8.1.tar.gz
-sha256  fc5471e1a54de15ef71c1bc6ebe80d4dc681ea600e68bfd1cbce40427f0b7578  aiohttp-3.8.1.tar.gz
+md5  642653db642be1508e50fcdeafe0f928  aiohttp-3.8.3.tar.gz
+sha256  3828fb41b7203176b82fe5d699e0d845435f2374750a44b480ea6b930f6be269  aiohttp-3.8.3.tar.gz
 # Locally computed sha256 checksums
-sha256  383c70c090b60ae81e035fe4fafed689b45c4421cd3bc355f1bd41ac208ccf3f  LICENSE.txt
+sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 5a2d306438..8b0b15f13b 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.8.1
+PYTHON_AIOHTTP_VERSION = 3.8.3
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/5a/86/5f63de7a202550269a617a5d57859a2961f3396ecd1739a70b92224766bc
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/ff/4f/62d9859b7d4e6dc32feda67815c5f5ab4421e6909e48cbc970b6a40d60b7
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
