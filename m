Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE311CAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 15:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5233760ADD;
	Sat,  4 Oct 2025 15:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJTeWC85bpqJ; Sat,  4 Oct 2025 15:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B76860AD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B76860AD6;
	Sat,  4 Oct 2025 15:51:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E4AD226
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 15:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 344BF60AB7
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 15:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5kpJYq6xssn for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 15:51:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B4A0660ABF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4A0660ABF
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4A0660ABF
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 15:51:03 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-62f24b7be4fso5908777a12.0
 for <buildroot@buildroot.org>; Sat, 04 Oct 2025 08:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759593061; x=1760197861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OsEdjeZv+QLYlZddSCOirtlZPzdIHToLh0qq8Y76K0o=;
 b=KKFaoV8YFb8w9EWRR4lukzjidM/9Ab2hSKQLzOVuB9UZjaFOdrfdK2riJlxImA22ov
 b3/uzpSjQmfZpHbgO+kLKq/CjpI6vBT0xGvwd8QlTO/tnncRywWFL0A5a0LTJCnCf0/m
 A5RCXoJ3D/RIgQvLwluE/d93HsrQLoeMF4EnW7EJCa273M2r5rFwtPfpbiZhDmUz2A6L
 iIi1NFf6H3MkdAXdEGXt/jMwSRIgfBcHZTnRYGO8s/B8sow4Itxx6OB3LyFuCOapKhky
 2uZj7rs/rkzvjslCOJgmytrMIKKWGHodT/BAq4mrLE/Kb/VMU8l6RQD/VYhkalJtrFkO
 LRFQ==
X-Gm-Message-State: AOJu0YwB9qsqadXD+mxzdV5Qs0GgW6hC7QRu9etjHxY1NJTkTzlLDFaP
 4Sn6VhZM7BwmkJ8UVka4p2uOHvY+U2Db5LFr/IiHUL3l6MatU3D14Q3yOWjCyEiX+W8O4s2Ky7H
 OJ/2ILiY=
X-Gm-Gg: ASbGncsgkIc6/KR84Tc3E0mVse5sll8IL8g7k1WEoDHQARcTdNFcW+62Wp3qrPWr5DD
 8XM0xgq2VS7le9mzEuRgxZLKwHP4+DzIlEoTds5HBSShdDmCe5e6a4btw9igLyEmUKIf4Jy26b6
 LquOk8L7a97wV7TWtxF3yDYaFfbjyrLolUo+Y1Y5siYaxybvKZ4hvc3II7odN3jT1WB2J92noTu
 2fVhzOGIykdWlHNwHIQtFhT79tQt2FWm0Cz9UnmzZxLFJqzIuUfPH4ZMngAmS1fLTPPpx3jW/XK
 SC7C0+vTimJY8mW02yZeEVc81hrvisWo2OZbArVWAmgAYw8NJaU3HLTMGd3+Uy2ue6etlb1gu6b
 B5uBIS/t40D8TtPPb4wpzVRnizJKp2oj0vJhc1GCQzM319TQMUyRJBxDOwmCYq/fmh6plxsIAFm
 aUUly2iVTt/2QVFF4/iLUYillrZnn3y011Nkw6DJFDqDmYwvc5zssYGvl4f4CyuEwAwvKNJcsxV
 FbUNmqc6EhbcHA=
X-Google-Smtp-Source: AGHT+IGLsHDRBXLnoOL4xPjhcdolECuqnMJZb4orAxjBrd8Y8mq1Tnl9r03I5zJ1pxVRZRaGpaxftQ==
X-Received: by 2002:a17:906:9fc9:b0:b3f:f66b:268a with SMTP id
 a640c23a62f3a-b49c1a6baf3mr777655466b.19.1759593061256; 
 Sat, 04 Oct 2025 08:51:01 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869b4e49esm709515266b.72.2025.10.04.08.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 08:51:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat,  4 Oct 2025 17:50:57 +0200
Message-ID: <20251004155057.1520336-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759593061; x=1760197861;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OsEdjeZv+QLYlZddSCOirtlZPzdIHToLh0qq8Y76K0o=;
 b=VJoX3L7te4ZhcLPvh1beQAHZ4KTOCTVuPasItEdO7tw6K02R1uQYcX0KdQA4OiBQyk
 NR9kA5lmkMmFYleR6VYgPhhnumLb9TbOzAhBFqU2k4GKSmCjHoWvSvkFdUJYnh8dKsNp
 oxr2+7jf5qjo79ynZP+m/GbvId6fB9kuS3gq4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VJoX3L7t
Subject: [Buildroot] [PATCH 1/1] package/fio: bump version to 3.41
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

For change log since 3.38, see:
https://git.kernel.dk/cgit/fio/log/?h=fio-3.41

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/fio/fio.hash | 6 +++---
 package/fio/fio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index 7bc8b76bc97a..015f2e3fbee1 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,8 +1,8 @@
 # From https://brick.kernel.dk/snaps/MD5SUMS
-md5  2223cf30dc799a838d92193aa5aa41d2  fio-3.38.tar.gz
+md5  3cd7ea766be83b560a14c909cdd35889  fio-3.41.tar.gz
 # Locally computed after checking gpg signature from
-# https://brick.kernel.dk/snaps/fio-3.38.tar.gz.asc
+# https://brick.kernel.dk/snaps/fio-3.41.tar.gz.asc
 # with key C0FC392DCADE26D975FA5E4AF7D358FB2971E0A6
-sha256  a5b63518558004292c7ec60fef90163f59957d7e1dce6f4cb87e9dc75d4dfc48  fio-3.38.tar.gz
+sha256  a40b45112005e30a67bab6be4860b198c35104a628b6ec4d15720d62b5d1bab9  fio-3.41.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 57a54dc34ae9..cb456587b034 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.38
+FIO_VERSION = 3.41
 FIO_SITE = https://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
