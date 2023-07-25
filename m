Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9BAC0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 14:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC51A813A0;
	Tue, 25 Jul 2023 14:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC51A813A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MAoUCgR0t5iN; Tue, 25 Jul 2023 14:04:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26A3E81462;
	Tue, 25 Jul 2023 14:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A3E81462
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26F6F1BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F180C81463
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F180C81463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjALPKshI_VM for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 14:04:13 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 012B381462
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 14:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 012B381462
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-348ddac3a09so3049415ab.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 07:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293851; x=1690898651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7o7/Gy14jYFJNJVFqulkVnZ3m3hGeRKmxBA44URytTU=;
 b=aKuMaJigNpITW6RBMVjtzJ4vsLKdQXAPrUq6gV3xZFyZcKs8njv4zac4x5UTMVA9O3
 GJBZxOQH2xPejiCk1JaQqwGj5g9kxAcd9/kDrzwFBhO0vtvSG/2ut0Oh+cVlo0200RuR
 ipg95fKqiQArJqXUKkqNBB6UZvL2SwzyDhzbsJxfgf18Rz8cVuu+RCSB+Qn8t7ZtuY4q
 b+kaPXnfUnrpSgUKdticbH5l3E4AJp9LrNaIpUF4T2weSw75uhynV4tY+c2fvhxHRrGE
 ywu6y2YXCzavMH1vp+MrGVlAtyVhnKCkgiFXI9P8kfhIh9m95/wZ8+5pwXBamYZzLKGH
 Nt5g==
X-Gm-Message-State: ABy/qLaPjqzEdDLKpInRWcQV/49SNbaXQlsRuOzmnxOJ2YScTnTH7U6K
 UpFeMlWhvPMfwEDyYYYoEF2SLFDS6BQ=
X-Google-Smtp-Source: APBJJlE3YuAfLp+talNvACqP0WiFADiK5VC/vO4B/u+pC4JGwRV0DjHicwURBWM2YE6V4qkAKLIvXA==
X-Received: by 2002:a05:6e02:2197:b0:345:fe2d:56f with SMTP id
 j23-20020a056e02219700b00345fe2d056fmr1604729ila.14.1690293851596; 
 Tue, 25 Jul 2023 07:04:11 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm1169355ilo.48.2023.07.25.07.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 07:04:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 08:04:09 -0600
Message-Id: <20230725140409.306444-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690293851; x=1690898651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7o7/Gy14jYFJNJVFqulkVnZ3m3hGeRKmxBA44URytTU=;
 b=CMvqtauN8PHGE+6EBAaC539Za6baqU43EcRC/6ual0wWJuWFIp30pINvqQmHejg26s
 uO0wQT6ep7TOfJ38ifBmeP/j6a6bCn2HcRpGGmvWSU5741Jri3b4yLix8g9bcypXrrc0
 ElOZtpzBb1uWCi/TOM2YHGyob6bggwjrXmFJxSuMfuOE6PIsm57M84wo2DiYZBs/LzlL
 sNwCfCvzLPRr5N5b6hREa9F3s/r2t+60GBcsYYgglkSAd+GDthJlEwVG17aKrjrqfKjA
 v8SYO69jsK71BOcUqvo5m3xKpqQDX+o/73QMFqhDO9KL/qZNfvNOtqrF0ibxtqxYzpaF
 G0IA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CMvqtauN
Subject: [Buildroot] [PATCH 1/1] package/python-pydyf: bump to version 0.7.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydyf/python-pydyf.hash | 4 ++--
 package/python-pydyf/python-pydyf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
index c01270be50..4e52429dfe 100644
--- a/package/python-pydyf/python-pydyf.hash
+++ b/package/python-pydyf/python-pydyf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydyf/json
-md5  6f06b2c08717e25f17de043a02b71062  pydyf-0.6.0.tar.gz
-sha256  b44a38855d7e47b740b3cd31ab63a2f5b9b2793931d50b0ccaed3bb7b86912fc  pydyf-0.6.0.tar.gz
+md5  52a772655c1398e7b60d22e930e13094  pydyf-0.7.0.tar.gz
+sha256  a5a88cb06e5beb64a1ef2147ee879b0e5139f5fdb827fda2fcf14a018c7b11e6  pydyf-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index 8d8cf56889..d941a00a9f 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDYF_VERSION = 0.6.0
+PYTHON_PYDYF_VERSION = 0.7.0
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/9d/c5/d5e4536968c36c0838459b5c482b9228e9aae839847837623d0d04576ba0
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/28/ec/b6b327f2a249a83022501b2f57844ca05b2b26e0cadf28648ea5c0f72aa6
 PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
