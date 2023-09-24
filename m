Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640E3CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 12:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E571A60ADA;
	Sun, 24 Sep 2023 12:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E571A60ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ySZTjKbM6AQa; Sun, 24 Sep 2023 12:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45FA2607B0;
	Sun, 24 Sep 2023 12:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45FA2607B0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31CBE1BF3EC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 075CE41702
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 075CE41702
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wX-n-YfAsI24 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 12:34:13 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6AC941600
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 12:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6AC941600
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31c5cac3ae2so4527166f8f.3
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 05:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695558850; x=1696163650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5kKtE8k5JbvwAd5roJpwkQZmQQEIJvihr5SardHFHI=;
 b=XFcLvAQF0hIoBXYJmT5Crms8unq/l5qYvai5p07FreSaZ8YuEqwTcq0HoIrXHQ73cA
 3TStIzOU50NrgCCoGGEK1BsswZH/qO/eTR7WLt4FnLk5AKon43Iwwpsl29OJo3qVCUug
 wHCocPneSzxL7rO0Je2tDKnJToLLX7LUIqNUNXCJ/9M5DG7zOcwbkSXNkxKd5lptl1gR
 JdfO64ZA5LyYFFHVFHqehk/FGJ1V1C1GXzKqvOipWk+A3IiFSok3mCI1dDJi3d2JLXtv
 GDsBgQel5npdRAXqQpNvtusfAlDQjKaVBcCg56Ub4rdvzQl6+WHKu1IvV0qEjsK7Sqhd
 Qn0g==
X-Gm-Message-State: AOJu0YzUBunVhbfX+lgQ6D6FExpW7IPUMTSuhoqtfJF/06P8kT2MAnUh
 RUr7M6bO6A5sRxzGqw1g4kRVjBfVork=
X-Google-Smtp-Source: AGHT+IESMdkucvornxdLppKkuJyRDgbB+YrOD3xPPLzYlkP68kzsiQ43yHWRQjwzLqmtFUbES9QVTQ==
X-Received: by 2002:a05:6000:1819:b0:317:64f4:5536 with SMTP id
 m25-20020a056000181900b0031764f45536mr3800917wrh.44.1695558850265; 
 Sun, 24 Sep 2023 05:34:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v2-20020adff682000000b0030647449730sm9198881wrp.74.2023.09.24.05.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 05:34:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 14:34:08 +0200
Message-Id: <20230924123408.152650-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695558850; x=1696163650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B5kKtE8k5JbvwAd5roJpwkQZmQQEIJvihr5SardHFHI=;
 b=M17fzwueaTWKOyac1ggddv74l+e4/28uyEuMGvcFQtFjCZbRk3kYDs4xrOm1rcn5CM
 p/FgxDpc4r/Rgz9rqQESDQMGz9DhLiL8V5CN1/BvphFgXzCYcli7eGn5nperxVo4mRCa
 P/yf69GLGK8bSLfuJzxVwAEVO99TKzxvWC3SHAuEDnR20tkspIKtw/l2txdKrrh5U3+9
 qTJifzStC0cgTPP/jCFTB6jXO1hq2wVVtgwbTWCJE+iyJmfTdzPQxLlcUcAzbuhGc536
 s9k/UzBti0l0EH8S/ha+HD2YXg9sW0vhCUYUGFHMqDMsxZY7tGkEUNx6kRd6WMZZdgPW
 DHbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M17fzwue
Subject: [Buildroot] [PATCH 1/1] package/nanomsg: bump to version 1.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/nanomsg/nanomsg/releases/tag/1.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nanomsg/nanomsg.hash | 2 +-
 package/nanomsg/nanomsg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nanomsg/nanomsg.hash b/package/nanomsg/nanomsg.hash
index 04b658e8d8..abf117a572 100644
--- a/package/nanomsg/nanomsg.hash
+++ b/package/nanomsg/nanomsg.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  218b31ae1534ab897cb5c419973603de9ca1a5f54df2e724ab4a188eb416df5a  nanomsg-1.1.5.tar.gz
+sha256  6ef7282e833df6a364f3617692ef21e59d5c4878acea4f2d7d36e21c8858de67  nanomsg-1.2.tar.gz
 
 # Hash for license file:
 sha256  4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a  COPYING
diff --git a/package/nanomsg/nanomsg.mk b/package/nanomsg/nanomsg.mk
index b86e8c128a..e5c576ef2c 100644
--- a/package/nanomsg/nanomsg.mk
+++ b/package/nanomsg/nanomsg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANOMSG_VERSION = 1.1.5
+NANOMSG_VERSION = 1.2
 NANOMSG_SITE = $(call github,nanomsg,nanomsg,$(NANOMSG_VERSION))
 NANOMSG_INSTALL_STAGING = YES
 NANOMSG_LICENSE = MIT
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
