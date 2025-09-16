Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FD4CAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 02:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 637C1813CC;
	Tue, 16 Sep 2025 02:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxWyw_jWYlzH; Tue, 16 Sep 2025 02:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E161813CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E161813CF;
	Tue, 16 Sep 2025 02:06:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 099AC12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 02:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E381F813B5
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 02:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1Z_f78FOW3J for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 02:05:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BA89B813AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA89B813AB
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA89B813AB
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 02:05:57 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-4240d243340so10065435ab.2
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 19:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757988356; x=1758593156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=esjbnmTXY8w1uWWy6OZmgVHZrpmqTX8vh7xk5soXZag=;
 b=ZnkjFUK0yShCazWXCyN9lbbx7NJfX9YzQ96BF5IDbVDywVYF/EJkB16pKQTBu2mn4F
 PSK+AakbmKkdHJjO7FVC+SE4zCfp8b04ZZfLS1TVPcfyBiHs63Z+HjPLCS68k5QmJG49
 c+mjBHvzHzBFLDm4u1GwfiCC7sshYSwRR4r6UYosf+AzCwgBsy4KhqZuXBTmAxwFaLkU
 sJLeGIGQk5v8RR4XxRFpV+7tIH/QaT/dyfZtBYgGNPgNNe4DzfhGksWXaBF4uy42xDS5
 wrLLmahxmJFzQzr4NkDZ6ZQNxLZrrB7gdu1Y2S6REl5ZvgxJEYLNnChpNXHnKrR/4Ae/
 gPbg==
X-Gm-Message-State: AOJu0YxghHmKj0pXZm7XJV3nJ0DTt1Wkb9ZDFyd1qCG5q+bQUMhnGv7E
 j0p69vAChrzEifNgmtYn/SOoxLLIHQf3AYi8wFJsX34WIb45dJfbj52CQzdfUA==
X-Gm-Gg: ASbGncte3ismHmkuT9YZ39+9bJPbmcpGfaxOR+cTYV5F4FeicVEeS9wP6Dzde6MmeW8
 oIVqtgPNG84pZ0e9yg5xbph8R5xyE2LNGBEQhHu8Ous2vx8now9mlFIofybm9xP5DLM6gNqd9O9
 jb5eVKFU2GVDBBUJxZT/zjHuqVJqOa11CX1xMAIdKnqeOTSwtpvDBWiwTTmIsqgOyeSkArAhzcS
 soR8eTQBZRRGxd2qBTZZarWKBXFimJYw8/6K8WKrzOGhhSvpt4BkFPVy8/Y7YKEqQ/qb2g6ZI0+
 OtAhchSAWVD8+ESTnI+irxPInuASRrTX+WC59WavDqn079NO6WKjHYAatiYLpHePjHBRTbWC9r9
 GGMOpI3xHMM6C+n7/M59pwl9CVWYUt3tS0tPCOynRwVTzg7evKQK2DOpn+1PdweRUGmiMCQGSDa
 Gp
X-Google-Smtp-Source: AGHT+IF2l/Tka6Iuj+e+qkyEvsv/wSnLFIugGsZzQ3IzbB1EZycVOLG9CbE31M9iifNE881Of2SzKQ==
X-Received: by 2002:a05:6e02:1185:b0:421:7d1:7af8 with SMTP id
 e9e14a558f8ab-42107d17b7emr102600625ab.26.1757988356410; 
 Mon, 15 Sep 2025 19:05:56 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-42404a5674fsm24769645ab.30.2025.09.15.19.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 19:05:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 20:05:54 -0600
Message-ID: <20250916020554.2634258-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757988356; x=1758593156; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=esjbnmTXY8w1uWWy6OZmgVHZrpmqTX8vh7xk5soXZag=;
 b=hL2sd4BrPAsKxv1UW5MP5q1qEiLtYRodX2sLKytEeNCf7Ud0HlOpr/AFBt62keKC7w
 WEiRncnj3KF9JKBdhx8WtE+IxGnDsdVk4uV51CBVq34hG7zzWswnvJnX/asoVBalbmAu
 dMl6ci5uqvor9Tr247byrI/7Sxa3FmfaQ7ZNjJ9lJ8NvX6pVCS3ISlsUwCvcmUkFPAEt
 G9ygxYfnWcaMGSkh8egqgfL2EnJ9ng9KxrpiToXKku7eO7FiMB9Bj4dcrA/lX7LC/09R
 aqRpbWgzt/Kz/kKr7gAz53mEBc3q15bTL8BzDSrRgh4/0RDx2ZzYJ36/iE3Nf1uIdrw+
 v5eg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hL2sd4Br
Subject: [Buildroot] [PATCH 1/1] package/python-distlib: bump to version
 0.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-distlib/python-distlib.hash | 4 ++--
 package/python-distlib/python-distlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-distlib/python-distlib.hash b/package/python-distlib/python-distlib.hash
index 6cf3715865..d31ab90f09 100644
--- a/package/python-distlib/python-distlib.hash
+++ b/package/python-distlib/python-distlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/distlib/json
-md5  958df85785458fa326a07af4f9c1c328  distlib-0.3.9.tar.gz
-sha256  a60f20dea646b8a33f3e7772f74dc0b2d0772d2837ee1342a00645c81edf9403  distlib-0.3.9.tar.gz
+md5  555fd6076016da3a89ff9b959677eaa6  distlib-0.4.0.tar.gz
+sha256  feec40075be03a04501a973d81f633735b4b69f98b05450592310c0f401a4e0d  distlib-0.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  808e10c8a6ab8deb149ff9b3fb19f447a808094606d712a9ca57fead3552599d  LICENSE.txt
diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
index e95c28c518..d71896237d 100644
--- a/package/python-distlib/python-distlib.mk
+++ b/package/python-distlib/python-distlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DISTLIB_VERSION = 0.3.9
+PYTHON_DISTLIB_VERSION = 0.4.0
 PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
-PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/0d/dd/1bec4c5ddb504ca60fc29472f3d27e8d4da1257a854e1d96742f15c1d02d
+PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/96/8e/709914eb2b5749865801041647dc7f4e6d00b549cfe88b65ca192995f07c
 PYTHON_DISTLIB_SETUP_TYPE = setuptools
 PYTHON_DISTLIB_LICENSE = PSF-2.0
 PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
