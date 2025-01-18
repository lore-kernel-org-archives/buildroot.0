Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9C5C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 10:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0543D40518;
	Sat, 18 Jan 2025 10:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovIs_5epdnd3; Sat, 18 Jan 2025 10:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B633E40574
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B633E40574;
	Sat, 18 Jan 2025 10:02:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7058FB89
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 10:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D9F76071D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 10:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIay4FheLf2t for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 10:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BF106061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BF106061E
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BF106061E
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 10:02:47 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2166651f752so70201715ad.3
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 02:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737194566; x=1737799366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y7o/+63KqIlCNffz1j1ohipGGb4ayeBvnk9jtQKLKZU=;
 b=GvcjngzyfWUwq1ijULGEgGNP2Jb1Sj6HyfxgU7ujgFYvBXpRfEzT73JRQVYN9sqe8k
 DGGKjQchzoCOW+5oanggM6ZD1jZMkfyy9EmvnywRj1UV9tXzSu/RzzPiChi5ZZbOR6Yb
 jlU4+O51SnjMk7XxcFhB/DFRtX9cD8zi53q0QgkjFX7Z4MQPUf4KlySHo7bwqqJvXJYZ
 JKldcbCcLMjW04COdUGG0hFfqfUEyMZGZUajrGL7e/2EP3HZTZKyK0H2MGOvokxzTIZy
 NPC+gGMiqJJz6kggee00jao0GXYIb143urJQ8PsY6rB5XC0zaoJ22J6M6Ol5DmnnHTdF
 L7sA==
X-Gm-Message-State: AOJu0YzuY1cWqOv+3FFhQzv6yOINNebbAGtg6fdIk8dVC4qwlaqemWeR
 9cAtDePSPnVABQ1C0JscZp3GheNh8kv7pe/E9YVEqq6dNpM6Z46WqzT2rXjB
X-Gm-Gg: ASbGncuUtn5YknLYcS35pPm+DaeWJE1IjZ1A5eY+jF+14wikc8sI0D6uQGf1HbXXYa+
 hk4Kh+935Cdds/+ik8Cvr7FgpK5etzJA0pXBvS+Y+FmRvOYw+6JCOTusPo7Pogtk/ZXNO3KeSdT
 cHXIldGWL8FfghR6ngo9oPlAodGILKqF5tPdDjfT8+Jf1JLXmDKPdaBaZFD+2ct66Klh9UAvkNe
 g95SaOVMPQBmRGvJnVty9AamuVy8XrzscRHv2yqes83ZcDpyeksZOzpolauMlCi0n7qWBdRjQWe
 9gJqCZ0qUm2matc/kwkAFnMBtuhSZ2PX2C+FQ5ZH4dgaVaDu5OZVUw==
X-Google-Smtp-Source: AGHT+IF6LWbJhIB6VcJ2R6JNCPikM1QsAtiHTZfC0U0VuKNlMeu99qnnzOISQL0vbaulYm6Wrw/isw==
X-Received: by 2002:a17:903:41c4:b0:216:4122:925f with SMTP id
 d9443c01a7336-21c3550ecb0mr83724245ad.14.1737194565033; 
 Sat, 18 Jan 2025 02:02:45 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2ce9e9fesm28759375ad.39.2025.01.18.02.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2025 02:02:44 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 18 Jan 2025 02:02:40 -0800
Message-Id: <20250118100240.882277-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737194566; x=1737799366; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y7o/+63KqIlCNffz1j1ohipGGb4ayeBvnk9jtQKLKZU=;
 b=jPk7l9F67/ec1TJXYXEvYhuYvExF1aRv8WixPt0Za4JPXmapz6wuQ7ZBb/Nwn5b+lh
 rurQR/KhreLjFCXT1Jofc7WgCmRwVJzB+klMy4eWuiS+TcxktjxK08LdYZ5jweU0UpcO
 cDEDqNpnHk0dQQ95QSCVCdUnlTvL9wfRtUxKEog46xZ7o9bVoBjWS0Y1ko+ONTZ5C98a
 UefrlXIC7KlyB9DzfVo+WjYFDI+jpvgbE68snUkoxwnRFjzn4isqSoPMZqiR262eTfoE
 BDbShEX6O4daODmXdWiF0k/VAHyIEKJGHsZF8JakrUYi9gLzbaawH8hqWVFmaG6sWL/Y
 NtLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jPk7l9F6
Subject: [Buildroot] [PATCH 1/1] package/nettle: bump to version 3.10.1
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
https://lists.gnu.org/archive/html/info-gnu/2024-12/msg00008.html

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/nettle/nettle.hash | 4 ++--
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index 5b11cd0daf..6fb79defbe 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.10.tar.gz.sig
-sha256  b4c518adb174e484cb4acea54118f02380c7133771e7e9beb98a0787194ee47c  nettle-3.10.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.10.1.tar.gz.sig
+sha256  b0fcdd7fc0cdea6e80dcf1dd85ba794af0d5b4a57e26397eee3bc193272d9132  nettle-3.10.1.tar.gz
 # Locally calculated
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 3f30fd761d..477ec71867 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.10
+NETTLE_VERSION = 3.10.1
 NETTLE_SITE = $(BR2_GNU_MIRROR)/nettle
 NETTLE_DEPENDENCIES = host-m4 gmp
 NETTLE_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
