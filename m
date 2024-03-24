Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48846C54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 05:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9288407D9;
	Sun, 24 Mar 2024 05:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPlaYdMP0Lb7; Sun, 24 Mar 2024 05:11:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64C15409F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64C15409F7;
	Sun, 24 Mar 2024 05:11:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70BFB1BF5AA
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 05:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D61D82183
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 05:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMEg8q_Qon0x for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 05:11:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3871D8215E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3871D8215E
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3871D8215E
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 05:11:55 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1de0f92e649so23304125ad.0
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 22:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711257115; x=1711861915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2VoKaG0+EKRf0FrK63kCnEF2JjNmGdM4ryFdZ0Emktk=;
 b=Jg59H2DqsIlKh8jwvlqCdu7e01az9oYQ5cN0iZB598IqH9sjaUd4HBmGLY6K9rfmf8
 jnZDapylKF5VZxI4yxQSIhkI1mgQBJg0XP45aQ7Ge+AcSj5riC7P4VShO55TDWhTBrTM
 0FXsm8HVTfS+qwjSDuBzfwdGzdSUfxnXaSiGSrhT9IT+ZiDcX7kz7c1xjMG3Z7vUASxV
 3sZMD2LsQbIBM5tbzsZK8lZZunv5qbaWoY4+//HS0NYe+wogTJDMJmEboBo9X+wvvAdz
 7UuDqOkYt4tctA1ftm4YAEUE6ScAhVGxz+im017kaA3xYkT5DmyROwXfM4vv5n1m/zMi
 NAPQ==
X-Gm-Message-State: AOJu0Yz02+mp/x0eJ6XDXbB7dRo+mzo/22pot9cAnP6os/4VRA/EnzHt
 6eZaQ+6Y03bvi5YHv8M9Tnrgd+/LtYtM8KqIbdVgCvNWURG2n2HM94FQawkb
X-Google-Smtp-Source: AGHT+IH0uQ8vv7NYvyjtqsV6PnpdKptgFA8YiJOY/7i5FpSyU4e168nFAGI9dTOhrvhqe6IOHesxvQ==
X-Received: by 2002:a17:902:ed4c:b0:1dd:1c6f:af45 with SMTP id
 y12-20020a170902ed4c00b001dd1c6faf45mr3207089plb.63.1711257114877; 
 Sat, 23 Mar 2024 22:11:54 -0700 (PDT)
Received: from localhost.localdomain ([2600:8802:2a05:9000:5be:8083:7ea:b94e])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a170902ab9200b001dc8f8730f3sm2376202plr.285.2024.03.23.22.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 22:11:54 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 22:11:51 -0700
Message-Id: <20240324051151.1425508-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711257115; x=1711861915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2VoKaG0+EKRf0FrK63kCnEF2JjNmGdM4ryFdZ0Emktk=;
 b=NX2niWJVjwQKvGM3CA0LTNwkIt1u4VJqVH5xXAYk/UFVTB01UpaLell7qPxm6kVog5
 YCOxuKF1/QQ5XAOMKkDWqoIJ97gObJHUFXbRi34OK3AMAC9m+GD/ayji+GByOdFUsv1s
 efxpBvn3xd0SZyKW/RRy3U71vlEN5rH+dAr5MldINTJqxTveoDb2sC6GMtF5KHdPIc/+
 m4yfH4m2tD5YUImuze1naNIzovTkU1V3bQ86+1B/ZLNnKiGSK0nTYSFEKDx70q7U10NQ
 VIi8C+e/kQE/76n+ypKiu4uzXvZsU+4TInAV2CjPvjUs0urngpB/Voz6QBoREkFegk3C
 zZgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NX2niWJV
Subject: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.25
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes - https://marlam.de/msmtp/news/msmtp-1-8-25/

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
$ cat msmtp.config
BR2_PACKAGE_MSMTP=y

$ ./utils/test-pkg -k -c msmtp.config  -p msmtp
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK
6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

$ utils/docker-run make check-package
398423 lines processed
0 warnings generated

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index c5fe9d9176..ba4ef02746 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.24.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.25.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  bd6644b1aaab17d61b86647993e3efad860b23c54283b00ddc579c1f5110aa59  msmtp-1.8.24.tar.xz
+sha256  2dfe1dbbb397d26fe0b0b6b2e9cd2efdf9d72dd42d18e70d7f363ada2652d738  msmtp-1.8.25.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 93c923a123..b964970bfa 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.24
+MSMTP_VERSION = 1.8.25
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
