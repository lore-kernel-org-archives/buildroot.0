Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C482BE77188
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 00:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F81960598;
	Tue,  7 Jan 2025 00:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYKqbjcaswto; Tue,  7 Jan 2025 00:27:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62D976088C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62D976088C;
	Tue,  7 Jan 2025 00:27:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AE70DB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 00:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EAF340BD8
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 00:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_7yu91bFcVg for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 00:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E102440108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E102440108
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E102440108
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 00:27:07 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2163dc5155fso213551215ad.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 16:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736209627; x=1736814427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=41F99J3CNvHhxgYU1REKY1Yryi4LFlsAZcTibqPgzAw=;
 b=Rgbw4812cB2h8B3tLpofi9Eq6QYfH113afe7QeYl0kB6cOu4NJYDTLk7Rmvk+Bee3m
 dqMI16cdGyMl8zwKXo0kdD8wb1QEodIYE3A/zeCSaFCB5v/YyVEzatkox84gwJNzHa1P
 GDqmFsBmJCQsCZfgrJRP5530d+3Le53DrKAYMbbhkWGUfL5LSO6pz04AKcKGTs2RCByJ
 qwQAcu4FZOPC9ldD8mMUZD5IvKJmbcHT3o0k1wvx7y2tWe09ZT9Tgta+jkrvRZXrPDV8
 Z1P+je41vbMEWxqriIY305JtFcKuuaBiCEmdP9CGJOUNf/iCS45vfMRZgkqrMOwdz4FM
 8JYA==
X-Gm-Message-State: AOJu0YwT2jT5mvBTCQrUbSt9jxA664/xjxqCaMlk/CbS1QHgjUPAEOWk
 OZMK2HWF/+Q7OfPYXe5OTiLr25/l6xaVzagDroTEMqExxQocUClK5CGYpQ==
X-Gm-Gg: ASbGncvc6GwPlCFWvSqJlpeyorpRLp5pvQzOjYfVHXexlGATbHwhxuM8ktgAcRH676i
 KlTt7vQA0QPxDMo+aZPClBFaE4P3SgxahzFFINPXaGgbIQdimNg2O/H5rI1nWDoxPJRXRLlPx6F
 GjUFnVeAT6UC+wELre9A7sGnDaiVlRn/q+UxDMFpOzbIs6jXq2MvzYxD/3BJbWg+wYEIQb8wz2z
 Hg8dLx0Gfa6v3s1nyNCi5LEpUPo74elQaKvEp1fBjiRBxiSkhZQJQ1iYVDbDQqraHOECOqtQigC
 e+LmFmaXWZ8QWJTsPK0OhRiBGfU0x1yfIqMMIp1Q
X-Google-Smtp-Source: AGHT+IG1TXt7H+4izlAsf1fMwCia5btHvGxBzuuCAPfdpBcEkay9T4zOFeCVhjz5hARnhepstW9rfw==
X-Received: by 2002:a17:902:d501:b0:215:5c1a:f369 with SMTP id
 d9443c01a7336-219e6e8c4c1mr891459535ad.11.1736209626903; 
 Mon, 06 Jan 2025 16:27:06 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9d4c73sm290031145ad.121.2025.01.06.16.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 16:27:06 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Richard Braun <rbraun@sceen.net>, Martin Bark <martin@barkynet.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon,  6 Jan 2025 16:27:01 -0800
Message-Id: <20250107002702.191013-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736209627; x=1736814427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=41F99J3CNvHhxgYU1REKY1Yryi4LFlsAZcTibqPgzAw=;
 b=cE2wg20zxngD+saSg5KhnVx//Wc76PI/oXWkQey+U9AFD2farPWHwj+cpBc4+FyIEo
 5kFtoU6s9Fw9aj9QyfA0CxcqkXqVE0bjgp9ySbCX44Qrlqrd3FwOSf7lF7w9ZXBH6NQj
 35fHOrVegB2YP8VFqPGJWdzMKi9HJwRNv16ti3kwdbZnncSRg9K0+KRLGKHv9e0g6OEZ
 jetsMTfIEykWin+PDENjgq4650RMe5sStmi0EmSJCtNqsOvcCgn1GOVwB9UM+IQlps4g
 GxUroZKP7aPGF4XtAjYzhlBveppSXVx6wD7tKDppZE8OA/tm5LjwopFRRPW1cvy3tfPN
 B4Ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cE2wg20z
Subject: [Buildroot] [PATCH 1/2] package/zic: bump version to 2024b
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
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/IZ7AO6WRE3W3TWBL5IR6PMQUL433BQIE/

Rebased the patch and updated the hash URL.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../0001-remove-dependency-check-on-version-file.patch    | 8 ++++----
 package/zic/zic.hash                                      | 4 ++--
 package/zic/zic.mk                                        | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/zic/0001-remove-dependency-check-on-version-file.patch b/package/zic/0001-remove-dependency-check-on-version-file.patch
index cba7ed679e..1eb1074c31 100644
--- a/package/zic/0001-remove-dependency-check-on-version-file.patch
+++ b/package/zic/0001-remove-dependency-check-on-version-file.patch
@@ -15,18 +15,18 @@ Signed-off-by: Martin Bark <martin@barkynet.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 1b714a8..00d2c09 100644
+index 0087b459..4773a977 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -615,7 +615,7 @@ INSTALL:	ALL install date.1
+@@ -673,7 +673,7 @@ INSTALL:	ALL install date.1
  # Otherwise, use $(VERSION) unless it is "unknown" and there is already
  # a 'version' file, in which case reuse the existing 'version' contents
  # and append "-dirty" if the contents do not already end in "-dirty".
 -version:	$(VERSION_DEPS)
 +version:
  		{ (type git) >/dev/null 2>&1 && \
- 		  V=`git describe --match '[0-9][0-9][0-9][0-9][a-z]*' \
- 				--abbrev=7 --dirty` || \
+ 		  V=$$(git describe --match '[0-9][0-9][0-9][0-9][a-z]*' \
+ 				--abbrev=7 --dirty) || \
 -- 
 2.7.4
 
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 80c96ed793..124b724e6e 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2024-February/000081.html
-sha512  46da8bfa762c7d109db93e5c060789097fc0e1e38bdad5bb8fec886ef47f138bd03b913a743cd5f7e23dc359a72bfd63e7ffc0de199d2b51e6a174361dbdc43c  tzcode2024a.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/IZ7AO6WRE3W3TWBL5IR6PMQUL433BQIE/
+sha512  0e4e872d6c6d9e2ce8c4e567fcbb7658942b8544157d1e48673d9cb989f3af3379fa58e7a71ab98f4a8f2ac6727de1f8c4cd1981053409ebd8989345dc640026  tzcode2024b.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 8abcec9360..9382fa4187 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2024a
+ZIC_VERSION = 2024b
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
