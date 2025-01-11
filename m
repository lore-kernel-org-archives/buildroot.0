Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04DAE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AD4940355;
	Sat, 11 Jan 2025 15:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RC8-y0JUNks3; Sat, 11 Jan 2025 15:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5222C4038A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5222C4038A;
	Sat, 11 Jan 2025 15:39:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BC1B940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CDB7400F9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiJl9dK9M2B6 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:39:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB542400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB542400B9
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB542400B9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:39:07 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-844d5444b3dso101342039f.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736609946; x=1737214746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iuV48mWN8npMvbIumgzA0/PtGkErKd6Ma2f3uMb7UnI=;
 b=xKVB7UIvBYVUwEoF3XyHd43FTX1aUhAPCEk2sITgKvcMoIq3IYieR6WBoKCR13oEib
 4k9BkfQWkfwxFTvsz0zdQaCFd/1e1O6XiO52Pe3Mmx8hcwaYOCIg6dIaKiGwvduEoOWP
 nRVFbAAxQ44rr3J2uhs27zRc/UiH1kJ20BbjH5a1yuT5GiZPpWDcsRzU8Lt3/N6/hEnd
 4DFqbhFBieiKc4jt/XSJN+y90pw3T0j1ZV1H+AcfzfFyKCPbbif/9BUdZIiMF3nQ+fc2
 uj8cRzQ82rBVXAN2bbroPOypLXxZdK5ZmW/R9VvemapX+d4/YQ7U/85qGV8Wg8rakdGY
 LMPg==
X-Gm-Message-State: AOJu0Yz6A+xnEO4wM+hpPZnp1tUzcrUta0QGa3sk/TdhRMLT9eMgDPfU
 mjht1eCW0rC5y7hIUgAex/ALirUt4sWCj7KZVZb55/CNSHhPs1qxmtsM6rd2/KA=
X-Gm-Gg: ASbGncsK3sEzSrqDCAmRx0gQ3mibP4oDHf0i467Yuw34UnSLqMwX8icPsnGkiux4IZv
 cz+FkWjVofSL36qwXpJW0xrACBhIUAN8Is0hKJXcFb33lk4lrum824DCJE9vlon/12f6z9uIVuX
 Al4nyHjgOXqh+xAk0syCwTVki3QT2f7BCwUVJ+lsFGYDP/YBJrnTVJiiZLzTlylI9hsbt9tRcAK
 qtLd8dBFvtHyyQYZGLvxPDmEb8nIXk7sI1HhZCSeLAKhjHSUWvs8olTinzweT/o/qnIwWtkXtL9
 daQhB9OOatzRJrVX50qyhpTwBoK3hag=
X-Google-Smtp-Source: AGHT+IFuUL3xMH1KrzSTksg/IsUMyYJUj09qBukMJqfC04VIr6Kdzoilc1VS2MlODFUKjZ2yNPQLuQ==
X-Received: by 2002:a5d:961a:0:b0:82c:ec0f:a081 with SMTP id
 ca18e2360f4ac-84cebf70760mr784881239f.4.1736609946557; 
 Sat, 11 Jan 2025 07:39:06 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b62922asm1572880173.78.2025.01.11.07.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:39:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:39:04 -0700
Message-Id: <20250111153904.2850028-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736609946; x=1737214746; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iuV48mWN8npMvbIumgzA0/PtGkErKd6Ma2f3uMb7UnI=;
 b=OgbtZS7UKaoJ4FY17WvoYW5aG5mgR4w9XQs2TJeCCH3tWo8F+YfvHbUTE8HlGpqCML
 mwPl0g5sIhrNbLasOw4m+f3el4MUvliwyKjZQ8OF1Y/Drc+aDau0XlHs1F7XTvC5ROEU
 9BkqvYSzY34j2+/cr3JBWDaKDxiANOB2d4Y+8/wbDCdTNR8qIFHXDaA/o31zf1UzuxOJ
 kCwTZax43/LKa49Cd9TwzlZiZqfD6mPHBIr8EOTeV1YZU2b6R5jTvdFzrojbnkukbhr6
 YNV8G5B4KE57QJdYS2mUhjxzjrihGIuDusNAqVJtE1JrFeBJqW0UbLHOGh1xeTQKk3+I
 6BPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OgbtZS7U
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-settings: bump to
 version 2.7.1
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
 .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 365158a1ec..173293389c 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  d00fcf00e6a5095033031398d96702a3  pydantic_settings-2.7.0.tar.gz
-sha256  ac4bfd4a36831a48dbf8b2d9325425b549a0a6f18cea118436d728eb4f1c4d66  pydantic_settings-2.7.0.tar.gz
+md5  c12f2c0a6e767e4e65665ad6f9641e93  pydantic_settings-2.7.1.tar.gz
+sha256  10c9caad35e64bfb3c2fbf70a078c0e25cc92499782e5200747f942a065dec93  pydantic_settings-2.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index fa14f97cef..d3dc3d8246 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.7.0
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.7.1
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/86/41/19b62b99e7530cfa1d6ccd16199afd9289a12929bef1a03aa4382b22e683
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/73/7b/c58a586cd7d9ac66d2ee4ba60ca2d241fa837c02bca9bea80a9a8c3d22a9
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
