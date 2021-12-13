Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEBDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 15:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 326A383E53;
	Mon, 13 Dec 2021 15:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDFfC_fKxakF; Mon, 13 Dec 2021 15:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B9D283E1C;
	Mon, 13 Dec 2021 15:15:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9F71BF371
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 15:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 754476F463
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 15:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=balena.io
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5U3LXcxrctaw for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 15:15:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 826426E3BE
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 15:15:29 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id m25so15411563qtq.13
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 07:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=balena.io; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hxoKxWvYzmKWJcurg0MTiZ5KgfTUy55rNDzMqT43/80=;
 b=PhS3jtwHs4rSk89OMWLF9MgQbjs6F5IzaBJBnNKvreEkNXIc5kXoy70Q0MRmc0+E3M
 16fHpLvWYahHXimxR6C2VUJcSNJpspJylbsf2Qs1Fcsu4tfM/+CKXVjXtvhDpKiQTUkB
 lcxqEuEJkr/e6VpQjIYlvlW7WG6TbHhDZhxqKvfnhg3psHML9h5HlMIxkyUIs6C13eh9
 d/pVpU/QWbwlFhJhpbHKMTCv5ckLRNT92YgOi8+2UDH372+sOiP+TQkOQ8uxDkrFZzj1
 V3IL59JpZJ2zO036ge/+5qy0UVDYwPr7CnEf6An5mMg5xezPydkJ0JQ5gJicCKyWnv1e
 9+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hxoKxWvYzmKWJcurg0MTiZ5KgfTUy55rNDzMqT43/80=;
 b=VTOCgf643MhskRntct06DyHZMolg4431K4UBbfaAjbcNKy17vlBTxXfYmpTyABfGTB
 RpEHSccVcP5y+Ospe3GVYiAmYshoBFTqhizjV/9C6Q5z3SRliVhqVIYmRdj8B3Cqq29Z
 U174SB8CJ3xxFx1DUD1AyYU1GYOy02KtCcornHxo9ntPfsJ9PG7rpRPWGFOrYRNDbwG6
 pXA3W1beeYx5o8eibg3lwfNmzi+21u7S6AbvtBuoBD3nkp7D2sOm8zSIs/XKv5dkSr85
 PyEJWEU73E5rzlT7r/robz02hPJpVupsJiNfsJiiolrCUvwBsA4LJRmUITEJgO8PFQtQ
 1rEw==
X-Gm-Message-State: AOAM532TIuHX4r/XnDi1gCLszDgnGi/fjkogbT/M36qG/xaZLWFv4u/m
 KJKhWduB9Njh0upoTQnO3b3rPZLVZNDot7r7
X-Google-Smtp-Source: ABdhPJzNVKJgsLyjx96ZYpb3+bZ3UnLx4RzRiu2spP62Cs8L3AB2CANmeNFbhqGD8yCLOscMMCuo/Q==
X-Received: by 2002:ac8:5894:: with SMTP id t20mr45816369qta.450.1639408528238; 
 Mon, 13 Dec 2021 07:15:28 -0800 (PST)
Received: from xps-13-9369.lan (198-48-234-199.cpe.pppoe.ca. [198.48.234.199])
 by smtp.gmail.com with ESMTPSA id
 j22sm6145126qko.68.2021.12.13.07.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 07:15:27 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 10:15:14 -0500
Message-Id: <20211213151514.926386-1-kyle@balena.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.14.0
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
From: Kyle Harding via buildroot <buildroot@buildroot.org>
Reply-To: Kyle Harding <kyle@balena.io>
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kyle Harding <kyle@balena.io>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 3c872aedf5..ca6fe174e0 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.13.2.tar.gz.sha256
-sha256  0a13b547f3b92a026b5ebd0423f54c991e5718037fd9f72445817f6a040e1a83  unbound-1.13.2.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.14.0.tar.gz.sha256
+sha256  6ef91cbf02d5299eab39328c0857393de7b4885a2fe7233ddfe3c124ff5a89c8  unbound-1.14.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 37456db416..61fdc5389b 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.13.2
+UNBOUND_VERSION = 1.14.0
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
