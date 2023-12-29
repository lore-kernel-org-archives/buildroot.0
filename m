Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2219BC46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 896614017B;
	Fri, 29 Dec 2023 21:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 896614017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id II9EPyEU0lQu; Fri, 29 Dec 2023 21:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7224B402A7;
	Fri, 29 Dec 2023 21:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7224B402A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 054521BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0E5B402A7
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0E5B402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgyEbNO0ml26 for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:54:06 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E18E4017B
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E18E4017B
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d560818b8so46451755e9.1
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 13:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703886844; x=1704491644;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mTR6FDfi6qMhUNmKlydsZuVfZnfMciMBzg7cHdBIbas=;
 b=TkuCza6yAcBoTAyDFW/unjaOz9wlPHbSL36D3GvSRXGwl0a+Df7FfPj2gbApw5ePxP
 s/jeA8BtUIafyWkHxqZoaq99wvXC81BMcg+2vlG5jWELxsLNvGKory8s8FwfPkx7zx0C
 CD9WQJlzcYcWgvSZiyhz0xW7rAjpe+R3ypZy9ocm++CceZ4AptSiQS+06L6GB7yw522M
 F3GiHx5Vf1CTGeTEJappesMnQRJMWc47ppxHOLbjCdPISJBcpXFWHBzpz9NIjJJJW/vX
 RWGeofYDym11FrckDOhd76LtjdyL/VDt+FganO/BG+Vjz3o8gQ3up+FUc9ekSCKIZkqH
 4xOg==
X-Gm-Message-State: AOJu0YxXYHC9nMMy8z8lEkTfYrJ/LgayHoAPXiOvz4aL9dRDQAhPIjJg
 VSXMcdUsdfc0y2qdKaHK2Qznh/AjFDU=
X-Google-Smtp-Source: AGHT+IHbZQJzVqX5187bQ4dUbAQP/YvbhWgXXPqlYayvPrU7wdsCR9SyBRTPizu3B6VLobxj79HI5A==
X-Received: by 2002:a05:600c:4ca7:b0:40c:3417:239 with SMTP id
 g39-20020a05600c4ca700b0040c34170239mr6412024wmp.129.1703886843701; 
 Fri, 29 Dec 2023 13:54:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 he3-20020a05600c540300b00405d9a950a2sm39300705wmb.28.2023.12.29.13.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 13:54:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 22:54:01 +0100
Message-ID: <20231229215401.24620-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703886844; x=1704491644; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mTR6FDfi6qMhUNmKlydsZuVfZnfMciMBzg7cHdBIbas=;
 b=HHLLKS5x0u3GiHdn0PH6jROyfhCS/75pf/YwEjqlSgK2vBdLWlE7uFV17wx07r+Nsf
 nbGJZmfYmg9h1HObJ7p2clrqzKOUr//7q2Z0cJpiupjKgkYZEZFB75a7c2yDQpSni/FO
 vRdqx0daBgxZN/cb4CsUh9DnC+2hQ8tq2TBDwcsh6QZRwd/0FWh7xBVhUN9KgTcCuh3L
 tmmoymkKadpZRzaQ+ISyPM5s7K3nDHWvCIaVnGgNfC8FbAkSdP7zHfxFSFgqTsGTsQ8f
 ay3iYjFanx20AvCAmrqJOPJzBPT7Ag9YsLp7SqoYvIJj+OUC4nauL67v4aVeBX2Ai4zi
 D00w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HHLLKS5x
Subject: [Buildroot] [PATCH 1/1] package/ncdu: bump to version 1.19
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
Cc: Bogdan Radulescu <bogdan@nimblex.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of COPYING (update in year:
https://code.blicky.net/yorhel/ncdu/commit/c08340ee08120244834adb59fcee2abfeb8456a6)

https://dev.yorhel.nl/ncdu/changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncdu/ncdu.hash | 8 ++++----
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 1e31eaea8e..553e128ed1 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,7 +1,7 @@
 # From https://dev.yorhel.nl/ncdu
-md5  4186b5be477cc3a0944619ade81f123b  ncdu-1.18.tar.gz
-sha1  d47ce3cdf317adadc1426817d07899c90b767aba  ncdu-1.18.tar.gz
-sha256  3c37a1a96580c9c5d2cc352dc3c5eef0d909158c05f1cc29db4712544c8b9f95  ncdu-1.18.tar.gz
+md5  7986451d5b222b8a99b5382f33a30831  ncdu-1.19.tar.gz
+sha1  3ee7aff60bdaa1c79eb4f27e3d277fc2d76e0043  ncdu-1.19.tar.gz
+sha256  30363019180cde0752c7fb006c12e154920412f4e1b5dc3090654698496bb17d  ncdu-1.19.tar.gz
 
 # computed locally
-sha256  4590cb935ff8a50cee76ce12c2cb0411c0b06e84c267b478579785dcf328660d  COPYING
+sha256  40372b6016a489b69a5d198526e0a1c284680900f48a8b725de440452098a97b  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 240ef9d8ea..f14f61fec5 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.18
+NCDU_VERSION = 1.19
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
