Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374ABC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03F9041D75;
	Tue,  6 Feb 2024 22:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HATThGxz1ydS; Tue,  6 Feb 2024 22:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2030E41D7D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2030E41D7D;
	Tue,  6 Feb 2024 22:07:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 833DF1BF276
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B29D401B1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:07:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGK4f7UCN3a2 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE362400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE362400D3
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE362400D3
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:07:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33b4b0a3bddso4662f8f.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 14:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707257248; x=1707862048;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=biKZoH/Y9J4Mha51XhUJf4EjPcEK6NSwN9SJRJSXpI4=;
 b=vmLg1oZsWNkDD0mjh18dw3YtIGJwYHn2G9eKgpLKBH5W43JhWzQyQ0qXV573Eyi2gY
 /ClO1BBty9dYFsRb4UY7eeQ03lROvlNA2Mpj0sfJgaiMQ8L32IchMtQglbzD8mR5wMCR
 YuW5q+Zbz+zFfhQ4D2WZsJhkenU+Ouu29uHr3yJm85nuxQCTHoaxgJ6ivfnlC0YWh5kz
 4IH+3iLWLVrWLEHdhfxmOXnLQCOaf3lqwlcnQUyXdzDSJLsOOrX/N1JH5/Ca/iQmWrFw
 xGo5dpjgrPYd2R/f1FuKt8/jHcdBFKHv9f7J2Fd30DJbT3WNgXQ5O923N5Kt8qdmLzoY
 qJuw==
X-Gm-Message-State: AOJu0Yz6u4RGqpMs6u1P3twnKJGaZWp5BhG3CWXh6WKfi+FGNORAS4hq
 r+KsifwRRsWz/zqICNFr6f3hCxcGihqd0c1wU+nUQI1gKECGQeYMePBzBxYB8m8=
X-Google-Smtp-Source: AGHT+IHHnM9eWUFzWwtcp3S3KGTWt+bupgOruWUPB8ofEbz6G5IPb/bhUpfY3mF5HobuUaglGvT+4Q==
X-Received: by 2002:adf:a3d0:0:b0:33b:1ae4:10bb with SMTP id
 m16-20020adfa3d0000000b0033b1ae410bbmr1901049wrb.56.1707257247941; 
 Tue, 06 Feb 2024 14:07:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXCy3aBboEZgjRdUc7Y6rfl663XCMIYPlCT9MHuRooV5LclRv9uQwdVxc5U8HeBx9vJ6AgwinSyfeSQJzTcYmowbnAdwZ9TSRCV1YppXigvanZ/UZqhUhCUPoS5ZXt5QuzViFgKPBnbaY/eSwWvO1+TwrBJsKs/Yv8uEcAdFClAdSBZiZKFtb5MuLA=
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d484a000000b0033b43d7394bsm15009wrs.55.2024.02.06.14.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 14:07:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 23:07:25 +0100
Message-ID: <20240206220725.910499-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707257248; x=1707862048; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=biKZoH/Y9J4Mha51XhUJf4EjPcEK6NSwN9SJRJSXpI4=;
 b=Bfm8yFvw/muJJ2S5AXCD7LGFCIXGs66oaTp6565vAyG44fMz8mvC/xGN0Y8QTlkEqI
 V6bHvXlyrFRpebeTUtqvwB5N5niCD4WIuajB36dL0ExuHSSBcJQRN6ClINwn7OG8b9E2
 i4rAk4+zfpgjNWx6J0iLbdXFNe/LcnQ5DlfitSZqJV3pUbh+IGUE/MrVJXbvjlDVu4jr
 oOlMgCmHcWk6CHnr64rp4ggJHKm98mNCNHeOiZNhwFnk4aQUx9O815rZ+IDUsuS/z8Cx
 As1oXeDrU7v9uKqi6oIXZLJFwU8aFHsgnHrg4ewlYCqWZyv2pWV/UPWO3NfMkRgpUyCJ
 /zZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Bfm8yFvw
Subject: [Buildroot] [PATCH 1/1] package/python-lmdb: add CPE variables
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:py-lmdb_project:py-lmdb is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/AFE6D0BA-D905-43F6-81FE-308D591A82B8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-lmdb/python-lmdb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 52617b6ed0..7906d388ae 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -9,6 +9,8 @@ PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
 PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/de/13/dd9b0c1924f0becc93e0bacd123a4e7a347966e3e74753ace3b1e85acc39
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
+PYTHON_LMDB_CPE_ID_VENDOR = py-lmdb_project
+PYTHON_LMDB_CPE_ID_PRODUCT = py-lmdb
 PYTHON_LMDB_SETUP_TYPE = setuptools
 PYTHON_LMDB_DEPENDENCIES = host-python-cffi
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
