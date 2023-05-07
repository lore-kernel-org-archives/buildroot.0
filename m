Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9581FC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 22:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF43283B3F;
	Sun,  7 May 2023 22:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF43283B3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id exWToS-cw0nf; Sun,  7 May 2023 22:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DB9C83B2D;
	Sun,  7 May 2023 22:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DB9C83B2D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBBF41BF389
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 22:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A52AA40452
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 22:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A52AA40452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bpi9rFLPps9w for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 22:52:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A924400C1
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A924400C1
 for <buildroot@buildroot.org>; Sun,  7 May 2023 22:52:54 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94ef0a8546fso623412166b.1
 for <buildroot@buildroot.org>; Sun, 07 May 2023 15:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683499972; x=1686091972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+mpjmSmQzyDkFSK6752B1LDWOg5BTbtyzW4Uji6Q6AQ=;
 b=JIC6CBGg/UFqg2RRaKmQ6jk42PBE0scrJI+L16fdfoirGK+JK4MLUkN0RgDvpOxdp3
 1OIpxCDIuP6tB1uGLe057Ez6mA0L38ukcwVwdECPY29J9bh5LggfghOPNX22Auh2qiQ5
 SUQekjZOUsypM3UefAlhNsjuT7n/LkSgi+UodQAaRDiVy1e2MhACCyYgnq5kq06iGlJu
 uEUAaagZybUAlf08bUf2WYEyCXaCJ9kKhY3XwrVjux0DLe+k2g6OauzitNNhFt0EXI1z
 tqnGzsFf8toKL+LCsQqm8u6OF64PD69UWtlWAi1NbyfIdpX4p7yW/bPQfVstW3djVv+e
 K8Bw==
X-Gm-Message-State: AC+VfDzro9xeJKFXT1i14JDndCTg5UvfsR9j4scecXxhILuFSJb3pS6c
 cuIpOObyzbDHB4fpx0iYe+zY+6DssDawno9Q
X-Google-Smtp-Source: ACHHUZ4i59RsTW61ataiK/za8885ya3UcqiAFkMwNG0kj5zMGAJ7zvN2VD43BaG+Nic8gFq1eUlV6g==
X-Received: by 2002:a17:907:1b17:b0:94f:432f:243e with SMTP id
 mp23-20020a1709071b1700b0094f432f243emr7122394ejc.14.1683499971863; 
 Sun, 07 May 2023 15:52:51 -0700 (PDT)
Received: from localhost.localdomain ([151.244.119.49])
 by smtp.gmail.com with ESMTPSA id
 ze16-20020a170906ef9000b00965ec1faf27sm3780406ejb.74.2023.05.07.15.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 15:52:51 -0700 (PDT)
From: Nasser Afshin <afshin.nasser@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 May 2023 02:22:44 +0330
Message-Id: <20230507225244.959609-1-afshin.nasser@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683499972; x=1686091972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+mpjmSmQzyDkFSK6752B1LDWOg5BTbtyzW4Uji6Q6AQ=;
 b=bi38WXUildgvkYOMmG3VOVZzqU9p8VUo+yElpfSfAP2PRACWTfqKzwVlpQWVHBZKo/
 DiMhqJPpvIwuzPxS8mOFs+7kUA0GpTHcDD/Cx+a23e21EavoSc3cnQ88fboIFK1reTq0
 qL0NpcQF+RYY/pX6R5HCVAnu953YAmJljTPebWXdLaPbUYmWTkXzQg73nx0NiR8pj+r8
 OGNMPX1gIeIxDdMNVageGub+xdOf5zNRm0aHjJD+bCpE5K1UPX2hfnBu0glFWSTiIbPZ
 y4eofEL28WAR762pM6zQXB+KmFch6jh1w2sW+2C4BUgx4MXsJLKumUtL7zSQ2f2yCTyY
 TJDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bi38WXUi
Subject: [Buildroot] [PATCH] package/python-pycrate: bump to version 0.6.0
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
Cc: Nasser Afshin <afshin.nasser@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
---
 package/python-pycrate/Config.in           | 3 ++-
 package/python-pycrate/python-pycrate.hash | 6 +++---
 package/python-pycrate/python-pycrate.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
index 193a973f7e..bbd6873938 100644
--- a/package/python-pycrate/Config.in
+++ b/package/python-pycrate/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYCRATE
 	bool "python-pycrate"
 	help
-	  A software suite to handle various data formats.
+	  A software suite to handle various data and protocol
+	  formats.
 
 	  https://github.com/P1sec/pycrate/
diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
index e37fd6743a..fd41274369 100644
--- a/package/python-pycrate/python-pycrate.hash
+++ b/package/python-pycrate/python-pycrate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycrate/json
-md5  075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
-sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
-# Locally computed
+md5  d51fd27d99481990ff85a1e418b1c938  pycrate-0.6.0.tar.gz
+sha256  b49738c02a3f93ba9f76c0dac82b689a5341882814b36c714e9600e9f560daf7  pycrate-0.6.0.tar.gz
+# Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index 6779433556..2f947ab807 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRATE_VERSION = 0.5.5
+PYTHON_PYCRATE_VERSION = 0.6.0
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/fb/7f/5f354100270a5d41350e9806dc9950a33e00a30eb3a7ab5fc9db86326856
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
 PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/$(PYTHON_PYCRATE_VERSION)/license.txt
 PYTHON_PYCRATE_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
