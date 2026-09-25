Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B030FC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 06:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77395607E4;
	Fri, 25 Sep 2026 06:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_HK3zbGscou; Fri, 25 Sep 2026 06:43:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7E08C60BC2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790318605;
	b=ZgwxSmD6kK9WQsPOUi3OD0kp0I5fTySMc4xXh/nCwSLsoPdXFz5HmXlz3nM0kqSxQxAS
	 VWfnAiKv6Krqmbv+RSi/kVHIunGRAv9ex91VxUfX+l6ZpWQ1B3E4/t2sL6lb+ZGwKWrNy
	 NqmHszhK5KzI4ZhkZkT7imlGaA1pPm8Bw9iqqtRO8o5/XzpeVXFpN6mODP9C4tziR944/
	 iddwOw/OqdZkr+1DOgYYxZYP5kGeS+P5L5VHUjjYF0KdRD3Hm+YqDzX7p1KmfXVDMsZSk
	 ABc+qLkqfoBQD2dHPeSxKG6yIBT7p5hM/6NddcC1r2iwn85ZDemyTaIKPKM4q9/zyaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790318605;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=bm5acVu6AE8E8HG23U0fTuJ36N3cpNTlyddYZs+dahg=;
	b=GvKlFlyzIrv0FSyZASVDAOd9Exw4pcPnUsdor3qRuMq8MYdYLpWZsqwXjgL2oZdzjXKL
	 +0r0m71ODnXUHtmq8H/P99Hk7am5cwoweATQe1v+DpmDEB+3BdYTMKvYq+8EQFvglnxLU
	 g8uXGYbuRWRQe4R7ca818m43IbsH1A89dZgqbtA2ns7Uc32l8bq4NgGG5oCJiF4Bme+Nb
	 r3EqcK2BJ+khKs/rELAyFfHggXlwIu+byLGCFIx7z5IS8RIqangVMz1k2c9QWcvC2kX2a
	 I2qPSDUaBoYz+6k4JOWiygiSvk9E12y3rIK/ILFL3nc3Vu4F5bp8aSuAgY75BnR/v/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790318605;
	bh=bm5acVu6AE8E8HG23U0fTuJ36N3cpNTlyddYZs+dahg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aW9vgIffyqlDXfzdhub3hukZ0CCP7+R/zMxW1r9awdfrYDBRd4Sb+LqjfRU4egy8t
	 8PiG6ZD51l5Xhnj9o+3qN4cBLM9hqELQG8N9ZJ3STAh790bAchRWhxkqmJxbRAkcs2
	 c/qAY4/uQFB2G85NXYdkvkMjIfNUgY/3mc4NSAuldhAihOuXWPyCKtuxSHmqjObPWW
	 ezgPBiNnLHWGcGTR+T+CWhxWVQN3G2DIkAeXJgDDHM9r/ZRRvNKNUOdPTM5fJXqurJ
	 dpmkPH8qgziYr1peiGmsdF8R3NKGZayL4Me8nUpSOPtPnd0eWn4paWzSbZAr2Ta909
	 Jo3v6n0YrIoUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E08C60BC2;
	Fri, 25 Sep 2026 06:43:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A50732F
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BF5F4083D
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkSthk6FZb6c for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 06:43:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7095640B10
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790318601;
 b=A1FCWhfVMMNNI3L8F7mxeJRHuecjkJHdjrI5gZMvkvUj7VULUPTjcmd332Ftsyl98PVr
 AgfzcoFiv5SDihsfvR7g+QxnqfUdZYX8JXRMXSt4DTs3vxqW3PveJMTeOvPTrUxKPIsGb
 06Lue1WGde2J9NIqjl1uMbr+PJg1dogNq1khy9tjA4BeDcUijQlTrQ+XfdGs4DNMQJIT1
 OICuMzlLxmSznLRNUVhHcBq8KcaU7kaqTI8JjMs3bloE2vuwD/jXzZGclV4idGmX/QDKp
 uMqbdbRIiSSaYc6uqBjUbcIysA2jmLLMOPwqyLkZJn682+8h4F70f2z6rtgKpyIEs5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790318601;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Er2259if0WDm3M/tB1lV1fsxt9V1wPAGIbTL3MVuwlw=;
 b=DbXAa1VTaN1eYLth1dqC9AOQxPPjKzk+lPw/vqD2gDbz/8WtNCgnrffxqmGjHBWaj7nn
 V0HYpkKPsQIi6cqHLsre9BnwLEPXQOm6HKmKIB+B/xTgGaNX4tVUzJ6lVHQ7Rr5WaqpZo
 0WsOGWKeaSc1ChnxRw5BZRYx+bef6ltsyd3w8S+PSHJv7Oi08g28N5/6lFR4049sUjac1
 c76IJm87afVqdrCf7zaUC7+6GdjcjZj58juD71AuYoVc6bVccoNVVjxnofTxAxMb0DE88
 aZ+182f6KGIljgXfVaANcQOHEN4HvqNDoLdZpjFEp47fp36i607NDF6zPe0hdKvGWcg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=cEGbCQ+7; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cEGbCQ+7
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7095640B10
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:21 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd38e0e5dso6964975e9.2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 23:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1790318599; x=1790923399;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Er2259if0WDm3M/tB1lV1fsxt9V1wPAGIbTL3MVuwlw=;
 b=cEGbCQ+7x0MLPt7Hw9xPrapTroBRwG7VNc0ZRML8xhK0J0+R4pi3dM+DoKAvmuTXE4
 h/CBCO4xb5nLWNW1nuGzhWSWJv0xD7bW0L8ANw/B2xHl+6Bu7qSdWimQk1gRGdX4IG29
 y8bRRLBU6zcTDi4BpyW8RkB37EmatLJ1IFD4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790318599; x=1790923399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Er2259if0WDm3M/tB1lV1fsxt9V1wPAGIbTL3MVuwlw=;
 b=xz82tKT6DsRSctMgmIxUut/8yvRYzt0/h+/dF+y/r4qChXtjR4neecIQZx5oEfVJQl
 1sWP2fslaQ5r5dHG4P4q0XhEU+4cMWTodYHkzFsovNmfbBHuRTw1Zz77AIsLFeBJSjgd
 kl0JFYYBavuyJqHGQsjxY3duVE3KqJR9wvuHL3HefknZZYGqfqid2snCKt+BLnyj+Yu5
 053/Ifd8+QdAqLCnUXQJvUkEgwvELfeyLoGan5HdkUPZzRyaZStsSH/YszcQHj5lZlVm
 oenvkkxiujM2irEDdQGwp39p61rZ3QtZrm3REpw1/BuvM/T+Kmj362K206ywSMMEZJgT
 srzg==
X-Gm-Message-State: AFuF++l28fjrHsEwTUROGWrBrXxL1u/Kv1Dgl4toX9Vm2rryJUh4P1kc
 22iZZ35txjxAxoeeWhMnqqiUl0M9KSG/xmOlqISv5I55DOZ2mpg9+qqNNZ5PmUzbpOE8bgcQc2X
 fwb2rxAo=
X-Gm-Gg: AYBFou2GP8M91gfvD5RPwpcQuLw0TZVG2HJ1diexvbVH4HWdgd4pT+vk/iZt3TFNukC
 TSLmLfik7YyNHOd7jujKdu5ugXOZ4OoC96luR1BjcfkWrl6ofQhdAvbOCXblRbEBXuyLp7Gd6wy
 Dm7Ye925NFZ6LNDKv2oJoQoXfKdGZp0H0/AcHZJnpRCc6Yy7tPAybIqr+1pXpmBg6YRqDHZ5ukD
 qy2GZmYe84pdO4/k6NREbu9bLh1rxaKNKgGLKIU8ZBze2N6BHKnsFUbo7HKzS4x+RyJuElClBtN
 cHvz3s/8uJ7clo/lhFb/PGRjOG/cIP+1s35QFO1q6K9BRa6h4IDK0mG6I146VKrlSFKrzyWMAyD
 0xO6oPhwBFbvdaJfzDd3bqVd6orki2j+nr5ZfSDDjCBIRMAm/ixDXMluy1Dz2dlWr5I/itPXsCc
 Qvcj33Rm/JKsmuBNnhLp2TwWZndrRKNDn5k0vQL7NCZmoNc46jycAK7oagcC3wJewbOgkNUTE8R
 L+ix9k8+9HnPla88Zb842H1AGnbR9ncv02KFM0nXd6M6vQQATNf9lSj2n8fmDh7T0Bk+tOO/2qO
 nkXBSxTlSa8v8ZKZ99WrBd/cDByIOtu/SwsfOWYLrzUS7Emnzh2fs7Q3DnDS0pCF713gSfU=
X-Received: by 2002:a05:600c:4e49:b0:49d:1cc7:5ec3 with SMTP id
 5b1f17b1804b1-49fe66d456cmr75178495e9.9.1790318599602; 
 Thu, 24 Sep 2026 23:43:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5df44f9sm115584445e9.11.2026.09.24.23.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 23:43:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 08:42:57 +0200
Message-ID: <20260925064257.1162394-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
References: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 6/6] package/cutekeyboard: enable build with
 Qt6
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard GENOUD <richard.genoud@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable building of cutekeyboard with Qt6. With the merge of
QuickControls2 into qtdeclarative, the corresponding Kconfig option has
also disappeared in Buildroot.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---

Changes v5 -> v6:
  - Drop the redundant select of BR2_PACKAGE_QT6BASE_GUI, already
    selected by BR2_PACKAGE_QT6DECLARATIVE_QUICK (Andrea Ricchi)
  - Add Reviewed-by of Andrea Ricchi
  - Rebase on version 1.7.0

Changes v4 -> v5:
  - Rebase on version 1.6.0

Added in v2

 package/cutekeyboard/Config.in       | 12 +++++++-----
 package/cutekeyboard/cutekeyboard.mk |  6 +++++-
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.in
index bd661b0cd42e..ee8017def034 100644
--- a/package/cutekeyboard/Config.in
+++ b/package/cutekeyboard/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_CUTEKEYBOARD
 	bool "cutekeyboard"
-	depends on BR2_PACKAGE_QT5
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
-	select BR2_PACKAGE_QT5QUICKCONTROLS2
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE || BR2_PACKAGE_QT6 # qt5declarative
+	select BR2_PACKAGE_QT5DECLARATIVE if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5QUICKCONTROLS2 if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6DECLARATIVE if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE_QUICK if BR2_PACKAGE_QT6
 	help
 	  CuteKeyboard is a Qt virtual keyboard plugin for
 	  embedded applications.
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 2b0f5a9f2c2c..baaf371f977d 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -6,7 +6,11 @@
 
 CUTEKEYBOARD_VERSION = 1.7.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
-CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
+ifeq ($(BR2_PACKAGE_QT5),y)
+CUTEKEYBOARD_DEPENDENCIES += qt5declarative qt5quickcontrols2
+else
+CUTEKEYBOARD_DEPENDENCIES += qt6declarative
+endif
 CUTEKEYBOARD_INSTALL_STAGING = YES
 CUTEKEYBOARD_LICENSE = MIT
 CUTEKEYBOARD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
