Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B6BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:59:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C5EA61051
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C5EA61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08F6E404C5;
	Fri, 12 Nov 2021 18:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xe8v59NGf9ZV; Fri, 12 Nov 2021 18:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F90A40249;
	Fri, 12 Nov 2021 18:59:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 715D21BF289
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6093B61543
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lh5xBfrTMbde for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 18:59:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B2A76153E
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 18:59:24 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id a2so9353571qtx.11
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 10:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1EkqXZD/RTKoArKN3pDb5ocIX1H5Te1bICehQB9hsmw=;
 b=V732l5YjeJMZvFEjFTMzVokhm+vvaV/dtGOzMySCUVuu/ZxZunFmbbn0Ig/NKr2JwN
 QINGRR4P1ONpsJ6bHdiceBi/u40ZHqBU6ZnyoW+cN1jBpHdY9H5lIYc809rs6/FWtUYf
 AyMXyWZuPjMuB0y/Baveafr0aEFghG4MHfHXvE4TNeo3S5F0ANbprz4GJlFKzj26WYT3
 5QdgKQxnxW6bcn/vU2qzvjgo98M5rf8TstLF/Kie+4xMsgRUlZOSc7ComNMvTVT4BYAu
 Z6ez9aqrWtIH7GhsSYsqxGeZkr2j8W+tvNkHLqyH4LXwHydWB4q8diP6vyRitZNFx5Do
 Qjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1EkqXZD/RTKoArKN3pDb5ocIX1H5Te1bICehQB9hsmw=;
 b=eC4f7bc6rAdq4UDE/R6DmvLs9TNm7opGa1aC0dUj0BTNZf0f+n6lCP/OyiyMbmfKBq
 W3/iNMpcYIVe4kSeQoENMZoc1s3Mp1ERhNjakjT5x/hZb8ByXunFJ3M4yt93UjFoBeQP
 7nTUW2/GJia2TKOg0jVrqae7Q3SUsmNHJ3/D2fKB+qlQMHv4pxEdcv0U6OotcXK741Je
 AEBye7IvlS2yRRZTADIiRaFJu3UVJzgegZzD4TyV+M7AUGRFMRzNN97rpQ9wZFceA7kS
 OEwmDBSHIp+fgh0uhXdaJBt4ishKy/cqZTcQBJ4zSibE22wVRvCQsTgS9p7LLyECC6LW
 u4CA==
X-Gm-Message-State: AOAM532R3h5oFw9I67U9nNXNu5A7W6+oi+MNFwlbn2APOL7WkimFIkh5
 1czswaipbX78n1AQyQdqyrtXE7R4yPw=
X-Google-Smtp-Source: ABdhPJz8KQ9hnSdo0BHk4H56mAgU+OkeYnXtRlNVcUZydXLtBKedbOuRC+jXZr3zSiZreODGIVd+AA==
X-Received: by 2002:a05:622a:93:: with SMTP id
 o19mr18378890qtw.104.1636743562969; 
 Fri, 12 Nov 2021 10:59:22 -0800 (PST)
Received: from casantos.remote.csb ([177.18.149.34])
 by smtp.gmail.com with ESMTPSA id i18sm672137qko.57.2021.11.12.10.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 10:59:22 -0800 (PST)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 15:59:09 -0300
Message-Id: <20211112185909.1324077-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mksh: fix project URL in Config.in
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
Cc: Carlos Santos <unixmania@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

It's https://www.mirbsd.org/mksh.htm

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/mksh/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mksh/Config.in b/package/mksh/Config.in
index e6ccc90646..098f9840e5 100644
--- a/package/mksh/Config.in
+++ b/package/mksh/Config.in
@@ -22,4 +22,4 @@ config BR2_PACKAGE_MKSH
 	  operating environments
 	  (thus including patches from pdksh on e.g. Debian).
 
-	  http://mirbsd.de/mksh
+	  https://www.mirbsd.org/mksh.htm
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
