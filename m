Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E348C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 19:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D9481447;
	Mon, 25 Dec 2023 19:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D9481447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evh2SBMwIxCZ; Mon, 25 Dec 2023 19:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3704581440;
	Mon, 25 Dec 2023 19:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3704581440
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 135741BF28C
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 19:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD67881394
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 19:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD67881394
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bK78WXtgEmyP for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 19:38:58 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF4F581429
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 19:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF4F581429
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d4ee4cbbcso25591265e9.2
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 11:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703533136; x=1704137936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OIjA+IHKV0TNOhLIq4/a4a6u5CEWhcowvdKNBUOrXNQ=;
 b=adZxlXlsP6eVeVWjwNeG/Ic4Tu5itjiDXoDgB6aiYn4zRBHtgLli5idQ+m1KmeSv+J
 03fcRqKpYOYeemSNhksaA9qRU+IqsH91uaIOtG/mIP8r2q+2mL3YRLdoY0ozG3ItiLrZ
 zhkBOoTQNEvv0CcKpwLnoE2qzZfGxBRExT532ibl0zalUgSAqqqgR6TmORvhvVKeSfG1
 hj7uplOCW6TopcwK6o/wZ76fafLY3QMQYRpf/FVXMRUy7IO873g1kzScEQv21JS/R3dd
 ISln+R4645opEhJo8/AS+BHbpy8n0QV+FdSfAzbrW/pguJmNGsc5v73/jdbRBWOV9/mc
 zwxQ==
X-Gm-Message-State: AOJu0YxYfa70GxvdKhKVT+G56L62ICuKpDPmchuQwJs74cIEUzDZEH8C
 zN6jzjc1NB7nn1DlXHKpGW0jxIL+7h8=
X-Google-Smtp-Source: AGHT+IG/QiN1tnbBXNm8ZqZyHU9H0zRK6Fk3mf2QdFqDyxrZK4ttlVtVYZhfusH3SOqaOFG2N4o/kw==
X-Received: by 2002:a7b:ca55:0:b0:40d:4908:277a with SMTP id
 m21-20020a7bca55000000b0040d4908277amr3198857wml.131.1703533135629; 
 Mon, 25 Dec 2023 11:38:55 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q11-20020a05600c46cb00b0040d2d33312csm18256168wmo.2.2023.12.25.11.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Dec 2023 11:38:55 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Dec 2023 20:38:52 +0100
Message-Id: <20231225193852.87983-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703533136; x=1704137936; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OIjA+IHKV0TNOhLIq4/a4a6u5CEWhcowvdKNBUOrXNQ=;
 b=JDfTd9fEHW2eHnLlz0RIiQ7iNbQp1yPMPh/RSxbJL8Kn+WtedocrtuhytiZP9B2xCh
 v9q2u+mMr5g/tPgY1pkGWkFsf+aSF2mtnSgWV8Kan5LH/mSbiqujAdM2nACLl70aBoVX
 nuLpH0mXteWKXgLectftbOzom/KriMSUL4hBhqng8BWnsx4GetipdItOYqtQYPezRh/m
 Q00nQggiMqrI48eBpq4BvHBT6U03fB8hJHFNULg6f/u3PZjz7Lv++U4AS4Blikcem+Na
 FGhtlGptSwfHt8na8hR4tXbCVlTuGarR94X7c0F2eD7AL37qpMOBN1Bcn11+xNEcHXKF
 zfuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JDfTd9fE
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.39
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
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 4d6c210c6..c62dd8257 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.38.sha256sum
-sha256  ce11decf018b25bdd8505544a4f87242854ec88be054d9ade5f3a20444dd8ee7  gtk+-3.24.38.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.39.sha256sum
+sha256  1cac3e566b9b2f3653a458c08c2dcdfdca9f908037ac03c9d8564b4295778d79  gtk+-3.24.39.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 6655a0d09..00a7672c6 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).38
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).39
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
