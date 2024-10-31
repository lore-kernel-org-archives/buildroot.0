Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B7DE67489
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 22:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC1860B2B;
	Thu, 31 Oct 2024 22:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5Hdc383-tWv; Thu, 31 Oct 2024 22:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D8FB60B23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D8FB60B23;
	Thu, 31 Oct 2024 22:40:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21B755E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 032E1407CD
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtc_KSCygpzn for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 22:40:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2699A407C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2699A407C0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2699A407C0
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:40:40 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-83aacecc8efso75643439f.0
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 15:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730414440; x=1731019240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Plf5EuZ9n2JMgNRRmAnhsGwaIkQM5AaztoQpnyFyopA=;
 b=NFp80dQZ5DYc5iYx/haCHc8yE20Cl61kAYswPH/9hwKmZ2SN8I4I/wxFpVzT2u7ocZ
 BuKZgA24YjgfdzhlKXhEDUxvCxa1UUYy649GjT8m2YrdIEyWlPrK7gC385JU3rFjZ/NA
 RS2qCHd2/3Akg87wY3gjpx8Fhc4tYJIHYOHof6EPglKkc+sTZTP1l1lSt2mUsVP5R59z
 jAvK7clGPOP+Reox93dlBd8tN/hwJdFQlfXysMmifvlgys5WJzsndVdT/I2wubv9zcXe
 U4kf9M0KiidKLnJ71TgQX51IKrTR/b0u9pBbrBUIUMD1V4jBY4ie6qQDi1Wzo72YiRt9
 S9hQ==
X-Gm-Message-State: AOJu0Yy4qvTaV8PJlCKvfxbLqAPfWaGG8GANGZ+XPhnSg2j88jLYqlkG
 52qTAOWH8Yxym7YiMG1aXPNYr9iufnPuDt2nevcVRmB0FjzAbKIeHD2hFA==
X-Google-Smtp-Source: AGHT+IGpGMpck8t/ks/Pkh5l9VqcmnIaGqWXgi4ucRjsGmeqNepRGYez7MF5GZCx2jtVW0JUhv37kA==
X-Received: by 2002:a92:ce8a:0:b0:3a4:f87a:18b3 with SMTP id
 e9e14a558f8ab-3a6aff50d9fmr11911625ab.10.1730414439726; 
 Thu, 31 Oct 2024 15:40:39 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048881a0sm472661173.35.2024.10.31.15.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 15:40:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 16:40:26 -0600
Message-Id: <20241031224026.359215-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730414440; x=1731019240; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Plf5EuZ9n2JMgNRRmAnhsGwaIkQM5AaztoQpnyFyopA=;
 b=IwzAnbV0CHZ86JnlVIu5/E9iYxv/FzsOUPHPEvFpG2KHmrYge5o9ZLo9CCFQkN1t5d
 m0I+YCT1Qtp8p/MOmwqghM46Mftv938w41XO7+XjdnA2glG3QVgk1S7dAWIt9yXWv/LZ
 hYDBJQ7QIw2wF3xxZjlzDvpfuTm8xQw9WlHLvzygwld0v4lWO0KGMjdPgj0SKPTE3ZFY
 kJi+tki+nPmzK9767gd/9tJ8F6bOzX1FxJjVBSAuyu7r2A7ynqhGn6cBypYF0OlfXVR8
 1eBKBO3LK8pI2Mym3jgT3/NmtUhio/fCV51f+CGgASFBtQFQgW0pXqq8XchT1slQKkis
 DjUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IwzAnbV0
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: set new build options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Explicitly set new imagequant raqm and zlib build options.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index e87c817c68..4f4d2ec933 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -14,7 +14,10 @@ PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
 
 PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
-PYTHON_PILLOW_BUILD_OPTS = -Cplatform-guessing=disable
+PYTHON_PILLOW_BUILD_OPTS = \
+	-Cplatform-guessing=disable \
+	-Cimagequant=disable \
+	-Craqm=disable
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 PYTHON_PILLOW_DEPENDENCIES += freetype
@@ -70,4 +73,11 @@ else
 PYTHON_PILLOW_BUILD_OPTS += -Cwebp=disable -Cwebpmux=disable
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+PYTHON_PILLOW_DEPENDENCIES += zlib
+PYTHON_PILLOW_BUILD_OPTS += -Czlib=enable
+else
+PYTHON_PILLOW_BUILD_OPTS += -Czlib=disable
+endif
+
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
