Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498DCC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC97F60759;
	Mon,  9 Jan 2023 05:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC97F60759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efGy_-beTgHw; Mon,  9 Jan 2023 05:46:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3337060B20;
	Mon,  9 Jan 2023 05:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3337060B20
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63A2B1BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C5CF4033F
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C5CF4033F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BwEjE868RMTK for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:46:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 504DC4032E
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 504DC4032E
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:46:31 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id h26so4418799ila.11
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9L5s58buO1sK6tLf3l/nY9GVvA6rrW1Efj1tXUD8OJo=;
 b=gp/fbzIeuLHsN0Y/mznlE/lP3I37M1thA2C5eMSEam+bss6Opa/w3RraqYfktDwjrZ
 fEZWOphCrrMZyZbgocnthoTs17KVX9J6B+HzvFKFivF6PAkXKfZGr1x/f2hEkehTQHcv
 htpaGMllZadrkg+Pv+fk5tNXIvQ/sNpJK+K5A+PORb1BTehWzlFQ785/Yg9KAjPz0Ae0
 M2YHx+iHn3mAWalLv5lgy+4WDugXHzHd/cEUem8RLgkZhPY/m+y9GpC2HmTRi8itdKfN
 AqMOkAIXNhx+ddjokRKTYqI3LNX4BOT7zELRj/ffi3lDL/H1G14uSv3Atrbqpo2CF5OM
 5hzg==
X-Gm-Message-State: AFqh2kpEr8/9yqThj7gDbizbjL8Dt51fXTPeOSmtew2GAOi9RWKm6+D5
 WmIfLjcB48we83lKuzDY+7YfAV6m7uXDB7wd
X-Google-Smtp-Source: AMrXdXvVkiopQk7ckZD9WvlNTdPiv3sBWe+FQqmUO8a46p81lbpnyGGNrhcKUo9clZo4ZlYijEOzWQ==
X-Received: by 2002:a92:bf0c:0:b0:30c:3c0:7a56 with SMTP id
 z12-20020a92bf0c000000b0030c03c07a56mr30474666ilh.5.1673243190053; 
 Sun, 08 Jan 2023 21:46:30 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 a17-20020a92d591000000b0030be6c79645sm2435027iln.68.2023.01.08.21.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:46:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:46:28 -0700
Message-Id: <20230109054628.2728954-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9L5s58buO1sK6tLf3l/nY9GVvA6rrW1Efj1tXUD8OJo=;
 b=LLMPFSrHnmm0HV2V4Z4bdW5r8Cm+xXJ7eSzk3o2M3cJhOt3AeVLnIY1xSBIdwLrk/g
 UOTGHz4L58OjPIAIWkIigMyHq/xiwfdFu7eq8y9DPtlODXWZGH0psgmzvRRGF9boYf5b
 /EIi2QGz6HlJoFvRmAdxZ6ZX5bXhGrry8I7ys3Poynt62vMjE1PI/mWaL8L2zHbi/o7I
 QNtfr6f3Yi3lkBCF1BQrLSOFohAu6CkOGkO7veKkwGiPnS4PqFjA67sS9dOOLEnWCa3t
 W5QOijIXgxXT/nILNPZSC0qPRUwv1CRdsNZ0gJM3l+YEafGLT4rOjI3Ma4zqNaTrm7SC
 b/cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LLMPFSrH
Subject: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version 2022.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index e71e77e5b7..6d6e1b606c 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  bf46b54a7e9bcb65ea38f54646181979  pytz-2022.6.tar.gz
-sha256  e89512406b793ca39f5971bc999cc538ce125c0e51c27941bef4568b460095e2  pytz-2022.6.tar.gz
+md5  3b9356e4dcd441df922cc01e8eb15983  pytz-2022.7.tar.gz
+sha256  7ccfae7b4b2c067464a6733c6261673fdb8fd1be905460396b97a073e9fa683a  pytz-2022.7.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 58f06e1993..057a3ef173 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2022.6
+PYTHON_PYTZ_VERSION = 2022.7
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/76/63/1be349ff0a44e4795d9712cc0b2d806f5e063d4d34631b71b832fac715a8
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/6d/37/54f2d7c147e42dc85ffbc6910862bb4f141fb3fc14d9a88efaa1a76c7df2
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
