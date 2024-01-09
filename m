Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03EDC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65E5041BCD;
	Tue,  9 Jan 2024 07:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65E5041BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bay3OLEAgpSY; Tue,  9 Jan 2024 07:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA43A4194F;
	Tue,  9 Jan 2024 07:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA43A4194F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E47D71BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD3FC41726
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD3FC41726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vjl0Q0k9O3BH for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:16:51 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D69A44194F
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D69A44194F
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7bed8fee278so18246539f.2
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704784609; x=1705389409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ymfd1vzO7IfZXQ2TKOOgAlhXbOt995PLiXmVupDcKiw=;
 b=ej+P1yrEe8Et2KiJYynlMOPlKtxVEvOV+ij6nzaf9IZ5F7qUANqpbDCu+7tBITAWkO
 yK8Oj/FEc4Hwkw49RYPk2m4iD2uNgjfqMgDTFfOxR1KnmMwMC0MyzcUeFclWUB0wtBDn
 u2plAheR9cK2q3gHvV9UL+cYLABR2yA6lwNG+RUCuz8HS8a12s9Hk5TF6mo2z+Woiw+w
 kP3PtLxPo8piTWbXkJz+QmICSVogNYcrXP93NU+hL/kiP53CSwZmOSSkuRFrijaoA2PP
 EU3mQRS3QzqTEAEEgnxZJ4pfbmJUsX85z5PEtQMD1Wpz1C9VZEdWpLmXpiB7woLXlYNi
 6lgQ==
X-Gm-Message-State: AOJu0Yyrx72pVyAChNdhNBKFYGVGdG7yOCa3d2wnsbwm8nATHpzhGPVh
 x2cMVslNiGH4d+T3LvIEsvBHL4Un6n3Ceg==
X-Google-Smtp-Source: AGHT+IEYPPnczgMpsJ+x/FG7ntBPk24lZ+AsnEolIXEX3dKfdi4SDyKUP6T13sa2wy18CWEg6iZq2w==
X-Received: by 2002:a6b:f005:0:b0:7bb:9ed8:b6ee with SMTP id
 w5-20020a6bf005000000b007bb9ed8b6eemr6493735ioc.17.1704784609464; 
 Mon, 08 Jan 2024 23:16:49 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 12-20020a5ea50c000000b007bc3ebacf3esm354206iog.46.2024.01.08.23.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:16:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:16:47 -0700
Message-Id: <20240109071647.4027355-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704784609; x=1705389409; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ymfd1vzO7IfZXQ2TKOOgAlhXbOt995PLiXmVupDcKiw=;
 b=lxN3+HJI0MdZtEdTEWybFCr6ar4TKj/W2eQ2cnp0Pc4jOA/7GJ6hZTNy+w8VxEVBzz
 rUrDMudyINY54mdZeUHxrgd+WqhrIWjg1eW6AjztmZxJbvLw2eg/vFG7GnNqiN4PAzOp
 V3Ooj5cab5xkDlqEWWmhZMs2UPL1I22V1RRpaY4T3lEwbs62TWwVrdgRJX/MnqdGvrmU
 Bs0DeVot4ud7/nRBJd8qDk2bH3HXajfDQkNWecp4KBfQ1rXXvCiEiIB3rC/4Dfyl016Z
 LD76qZndsFWhzSgE0ZmoPCCJNn0zKx5VH+HdQSsI+l+uaYeExRsEiMtxAj6jEO/wEDcj
 0HoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lxN3+HJI
Subject: [Buildroot] [PATCH 1/1] package/python-engineio: bump to version
 4.8.2
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
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 98fe647f68..c1b02350bc 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  45870fb7b12e6e5dca3cb6a828f70928  python-engineio-4.8.0.tar.gz
-sha256  2a32585d8fecd0118264fe0c39788670456ca9aa466d7c026d995cfff68af164  python-engineio-4.8.0.tar.gz
+md5  619e7fce0257a8219187f50aa94844a3  python-engineio-4.8.2.tar.gz
+sha256  f8609e3afdda318fdc336b4ba2de8dd397bb8f9b8a1b43e56c27330e32c2e34c  python-engineio-4.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index e84acee88f..7702b5f294 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.8.0
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/c4/5c/4fa0bf79eb1a433d1e9b69430b3ac818837283c642640658f12949620813
+PYTHON_ENGINEIO_VERSION = 4.8.2
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/e2/24/4a69dd119d10e31c4439f910a2a0f71b540b9f835ab60efa1f0f7bcae0c7
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
