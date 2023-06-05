Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CABC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 08:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C269A82342;
	Mon,  5 Jun 2023 08:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C269A82342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8l7tUOlZf0qH; Mon,  5 Jun 2023 08:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7B3482348;
	Mon,  5 Jun 2023 08:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7B3482348
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6B861BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CACF360F17
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CACF360F17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ds1PRBdjpg7l for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 08:00:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B67607A4
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5B67607A4
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 08:00:27 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-777b0dd72d8so29247939f.1
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 01:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685952027; x=1688544027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YHtj/B1eYikav6oy/4cYKfULNctbyt9pjHXeJftj72U=;
 b=j1EjfuiG2JPYI12NBb9VNbs78GcgyjkFIkhsgI3iEg1QBeyZYgGIRxEQEkoy/zUxdr
 CkjFUVz3//XEBbFbRk53Kxk5Zx9/O/D2iBNIA3UvNKz1ZXjd2Lvx2r13EPHC+ZxOFB8t
 IjFKmYqDSM9G1EMxRv4gsZdw5A85Yd05Y5wAOuZYKf1u9wsl1BBZ7kIMVLeY9S2yRxlm
 joG2c0NVAl9v8HtbEKx8oy7ni7FM/bLq3iX8FLoddO48vJT808Moge2vgYvWxkYcQSeg
 swT0Y82uY6KGMMElgSffnRjF+1aJJRqqCJXz9i+gSYYoSAdWgX737gGdMv6bSGUl2v9+
 ljGQ==
X-Gm-Message-State: AC+VfDyjyl8dZhof4lTCqCH7czc+coE+RGyvcolkc7rxqwW3Y7LEnKYA
 W253C/gYphtBcFC2YgckriCBreflURVGjQ==
X-Google-Smtp-Source: ACHHUZ4GgCnKfvZix5WJ0GaEa5OS4fyrXxzoOBdd0GN4fsgg3S/W98c1fv0G6+6Ywnqk1jQFIeeCAA==
X-Received: by 2002:a5d:884c:0:b0:774:9116:3836 with SMTP id
 t12-20020a5d884c000000b0077491163836mr6975035ios.13.1685952026798; 
 Mon, 05 Jun 2023 01:00:26 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 y11-20020a6bd80b000000b00777b3bfc406sm660442iob.49.2023.06.05.01.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 01:00:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 02:00:25 -0600
Message-Id: <20230605080025.1925464-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685952027; x=1688544027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YHtj/B1eYikav6oy/4cYKfULNctbyt9pjHXeJftj72U=;
 b=qEi8mqZsWwtEutNY4g38bIAjQDlODqYngZCTLfL57mhDO4dbKN+7PYyL/+d8gdFR9X
 CyaV5idbCZ4HL+3rZbipDp4/jX0/x37J5F4gR04WyZc7wbK1QuBr/7NvBmPZaVyd0M5Y
 laEetbD8MC5lG337YxRGSlt96uC3N7PAJFfBXEx/kyk6m2k6nxHrDGLHOLKtzi068vA+
 bhU/RX6QEli2/KUzBFHUIEanyeNO36/V0mPLnGHVebW5FaJNYn9iDRtlbitAzdO6sF9a
 g/dpL+j4tKm+bycR+/xrO3AV7KS/QJHbwSDgiwYgqsGyLI2cQdDeTasbvFCOTPCZqoOz
 WesA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qEi8mqZs
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version 9.5.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to wording update:
https://github.com/python-pillow/Pillow/commit/997932bc93c778919fe22f4838ef0929482fe520

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index d514bdfe56..43bb824b6a 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  ee6e9a6c729ed9e9a78ccd3f6e9d7143  Pillow-9.4.0.tar.gz
-sha256  a1c2d7780448eb93fbcc3789bf3916aa5720d942e37945f4056680317f1cd23e  Pillow-9.4.0.tar.gz
+md5  ed80942ad1ade1aab0fcf3790d0be3ec  Pillow-9.5.0.tar.gz
+sha256  bf548479d336726d7a0eceb6e767e179fbde37833ae42794602631a070d630f1  Pillow-9.5.0.tar.gz
 
 # Locally computed sha256 checksums
-sha256  4e1755595052d843e2f350c930759f945ecf707bf812883948d181016b12dd0f  LICENSE
+sha256  0fdb68ffb39062553be40be4e6eaea9700b4f5e870a720ae86b8925d67613ddd  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index c02968610f..b69d329cde 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.4.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/bc/07/830784e061fb94d67649f3e438ff63cfb902dec6d48ac75aeaaac7c7c30e
+PYTHON_PILLOW_VERSION = 9.5.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/00/d5/4903f310765e0ff2b8e91ffe55031ac6af77d982f0156061e20a4d1a8b2d
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
