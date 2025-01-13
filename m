Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8797E77188
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 00:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E1F24061D;
	Mon, 13 Jan 2025 00:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTh8b3ngd5OA; Mon, 13 Jan 2025 00:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E37A40626
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E37A40626;
	Mon, 13 Jan 2025 00:16:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CB1F95D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 00:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 581E7812E5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 00:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLE9MVyBZ25C for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 00:16:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8FD8D812F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FD8D812F1
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FD8D812F1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 00:16:48 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2166022c5caso56427125ad.2
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 16:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736727408; x=1737332208;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cbM4WCSmiharqsicpRld9gy9jCmaYdKxAhEIXMKdcv4=;
 b=soBZ2O2pI1GwBC8LNkABBoDlfdihYRT0nxfjwRUzgwfyDZrn/4fItQBD+ez6wnpTH3
 y1iFOdvUazH7t2Lo0IHcViLs4YONsQYWvYG1H4nsnc6Q/P+KY8sPw1axJZKyhsdciLjE
 dVHCywZ1G6ZdCzhYoUtovgHEQirlnZnRgVxLmCXtmx5E6EP7yymhJDm+W5H6JcfGQwAz
 P65xNsi0VCAi2cHbLzj9MTeB8JHpwHI6ktckWPG7VxYq+95f/HXXqZHbVJ5JavMTYc5G
 dwtT/qTr0gwcZKbfmY0fNuRyGNgGX/VIIt/AYt+qNa0RNCer02PQ3wjJXyPZDVEYS5q8
 dE8Q==
X-Gm-Message-State: AOJu0YxczdWk0YKLg4NhWdemL9LLjrziythshGNlmG9UxcKKUQrIatDy
 85md4rnPBmomzEOYYiv6s7OIhgeyiSRDxBMb71engxLb4dCaWib5AOLBITYn
X-Gm-Gg: ASbGnctyZW/idNIhGjtz+EJ/WOQ2xtuV1+cTZYrfjvTtiJmfM9W87ATGpE1oGieynD8
 Y6c9R3ByEk2R750PdI0WILOrITFuz0n6OFr062knrH80eGKg5wF39Q0JHzCFKHAsalYfrKzLhHB
 +Psg6o8DZBhg7inTCD9mxJDtvO+p6f77AWZ7C63QDz1HSYVW1RHF9T4wSWqG6F4su+MlOU5HbN+
 Vb7/gx7J7Um+3wY/rUCiYTtjbhnsvgfhuj63IFOvh+XMnpgmddUpcAak/ZcBHx6IV97CSW1zFHY
 vEP1RIKTIoQzo86osERMFvHRclhO+HJBJurpBJwN
X-Google-Smtp-Source: AGHT+IEay5jHoTAXKlK2y8s52rJlckA1raeEId0o8dUx3eOm9FHR53subyRcGArlThCmM6oifXMp9w==
X-Received: by 2002:a05:6a20:2453:b0:1e1:9662:a6f2 with SMTP id
 adf61e73a8af0-1e88d0bffe4mr34422030637.35.1736727407629; 
 Sun, 12 Jan 2025 16:16:47 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d406584e7sm4894602b3a.94.2025.01.12.16.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 16:16:47 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun, 12 Jan 2025 16:16:44 -0800
Message-Id: <20250113001644.772560-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736727408; x=1737332208; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cbM4WCSmiharqsicpRld9gy9jCmaYdKxAhEIXMKdcv4=;
 b=j2YJoG7IS2+aLTUMMdBsw0rTn7uoTszpPX33qcG6FyP2TJ5zN6hAmvRF3fbfefXKqo
 iCczijPr+J+oGgOZyMAkadjeQWKxaAHVev/clsUDhznI25kwzEfIyIoCEIkqNRupLvES
 vSVwg6cV48Eu8EOxmIwY33jVi+3E9I0zHXwvyrxvHQgqweK0jeT9Hc9sehM06J41H+eS
 PJhgN/J6qvXt5gZwb9kDBlrGv3tEDJuHZKJHUWo8t2xESO9vRukClGP2HNJ+eY/eAIaI
 VJ8mQskcR1/bnGwk0jmLUhrTRb5Qyq3lhtFlTQI3Hoxyw5nSXeqc3NKa3upaALY0LRM8
 0EbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j2YJoG7I
Subject: [Buildroot] [PATCH 1/1] package/haveged: bump version to 1.9.19
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/jirka-h/haveged/releases/tag/v1.9.19

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 61bf6cc9a1..066e21c132 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b835fa02b52ee7d06276e028571cadcb14d08f5e5a4b5767adf81451f70561c7  haveged-1.9.18.tar.gz
+sha256  acbb05776668657012273be9bb3310e3140b79959aa4538e4cca8d30d40c0b8f  haveged-1.9.19.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index fbf72a96ad..0e377d36ce 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.18
+HAVEGED_VERSION = 1.9.19
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
