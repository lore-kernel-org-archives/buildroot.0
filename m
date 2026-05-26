Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA85CD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 21:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41180610B2;
	Tue, 26 May 2026 21:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYmm0dOWCHaF; Tue, 26 May 2026 21:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60A67610B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779829841;
	bh=muKsdupTK0Cu+8fbG8rAJJi0GrMSfCBFJZ+j0yhirS0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IyAMkiJUNwCg/XXDCe6ZXnowgh6IcouFEUWvYAtVUsMMkhuSMyeK4/3D2k47m8/YN
	 76gUmg9CFA0whovRtnaVwT3uwyaLbec8Wr1falr/MLSiWTAXpFdLAmr0zDXsmAe2OF
	 QGUmK28FFZ5q8xEPvvsz7S2D4sj3MG+Vjx4HIPZCfkBIXHXXEe1j/RhaNfgdGEFN0e
	 0ta9MyiLbDW2BrJbTmQfKwF6wwSTGv9pORYGyJxlCY0Vu+KvG0A1HmCIheunmTM5L+
	 uHocAKggGsWw3w/ydLwpb2R6kdYadn5Vn8dYICltiwi7dv9O8pBCQaBu+0wnMjtYGJ
	 /7sh4cRZ3oFMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60A67610B4;
	Tue, 26 May 2026 21:10:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BE2F21F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31E6C419F8
 for <buildroot@buildroot.org>; Tue, 26 May 2026 21:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOjcBFvYLWsz for <buildroot@buildroot.org>;
 Tue, 26 May 2026 21:10:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4978A419F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4978A419F7
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4978A419F7
 for <buildroot@buildroot.org>; Tue, 26 May 2026 21:10:39 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7e636d1bedbso2126595a34.0
 for <buildroot@buildroot.org>; Tue, 26 May 2026 14:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779829838; x=1780434638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lGV2cg07mwged2+QLyF4Dae8jVH1T7j3Qkj5uJ92/6o=;
 b=GcVtCbH3Yx8WPavKZndpwg7nOetjzkGksOap2PLjMH1DgGicbGjvdOg/BXIMddCOV7
 yZ8MHEtQUji7GnqkBu3bHLMXf08X/F9jv2evCTo1WMV3wMpDchTcJKK4btbaH9hXyRd2
 4YbFE95X0v4ZsJAWSTI2DlWp8zQdsr6RLV17ZPhNRbR8ho8+xNtb6fCqi71VvGMmiov1
 rnYYUdj9SVQuHL8yTrSgrovEFfVdS8Vbk4hZIs8Z+jI3LAAEuxXJ21qxyITchSnRl9jF
 Jb5If5IGS064Ji9fz5/v2/E2z4qW9yGnjTqN9IBBBUIa5KbWaOySSoqhU3y4Q18+JVdS
 CVXA==
X-Gm-Message-State: AOJu0YwJczzvVeCG1ql405sgz5zKzt2jmPYrn/mr9bbi0FyCcS4sVY8y
 FkgxQhLB0ZjCXxkOJPB24+cZHO99XpfLQmKRqG+f6xVklFogzU0RnLy6cHRHGg==
X-Gm-Gg: Acq92OGzuY5xd3ARs6U1MVqardU8QShA0GhGiZW721ahHl6NBtX5IRFnnZVAWhLzPkV
 0/CBkQP0VV45aNvFZIqj2jCqTLTW7JA9qSH67wOSzJEcjQJKyIBJgaOAv27ey7vRD6vHHtl4xct
 UbQguoSB1kJzRS6TRqHFCYVk4mMTHfllOt6S9Fu5hWsQURNk3opP04LsuixgI3IC6n59K4vS0sg
 XooTtvC6CTfBErq0HPBaHcxhGSuedQf+7gf+30WaqxveEks3jxBXcOWcTsHKLYkmOcZk9dAyzNt
 NPB3r/PsyuOEQA6UkaFGHscgDCVmGEZuBlHqcwaDebZddG8fa7cksoBKKY+WGigKLoWjIVlqpXu
 gt6rQ+3oXKiuZTfT12I1MwfPggdjpRC+5Uhj4e11SKCSU6I7Xadks2hnDMrhQDyFeckDX1e9XrZ
 B4+VRonO9B5pRy17tI3Gh9ZlH0dmUvtKGtREcjm/ju5SeLSzDPdQiQZvp72fvyhbke9zuScOgX3
 0s/+KsIGJ/yZz5Sp3rMrZADen07pcaGrKNWoMztdnKoUNRf8PzbhxY3ePa5uM/plrcPmw==
X-Received: by 2002:a4a:edc5:0:b0:69d:7e73:2d96 with SMTP id
 006d021491bc7-69d7eb44ef5mr11003596eaf.13.1779829838110; 
 Tue, 26 May 2026 14:10:38 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-131-78.hlrn.qwest.net.
 [184.96.131.78]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69d83a8206fsm7398108eaf.13.2026.05.26.14.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 14:10:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 26 May 2026 15:10:35 -0600
Message-ID: <20260526211035.502534-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779829838; x=1780434638; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lGV2cg07mwged2+QLyF4Dae8jVH1T7j3Qkj5uJ92/6o=;
 b=kMFJpo/vj5QrlHpZYPQ5Zl33UCGG01Z9cw+LGGpVUcgmo0wnPKzKouNJ/qy224nmAz
 i+ckenvb7KFZqVnTwyruRPVkQQsAnvskOnwhK9a1+iYNw5o9Gsh12DXXuviun+1/Gpa7
 bNkoBuFqVX67S5UUJTS28qqvxeaUq9vRv0r/lgYongPtNdh8GKKe28lMdFEQODqzmDr7
 7cldlYgnxNb1pFNNk6lboW2Hnoo4Qon+PTDwZRumaH4RbzD/ARmeQMZVxRTvHrXlv2sQ
 hsJ0YwYR8x5jHJkc3ArK+tNsdwpnKb7Bq41jVcVYI+tDU1607UxykNi93U9uVaGbS9ui
 AdEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kMFJpo/v
Subject: [Buildroot] [PATCH 1/1] package/dbus-python: bump to version 1.4.0
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

Migrate from autotools to meson build system.

Update the license file list for upstream's REUSE conversion. Keep the
full set of split license texts in DBUS_PYTHON_LICENSE_FILES so
legal-info can hash them, but leave DBUS_PYTHON_LICENSE unchanged: the
GPL-3.0+ with exception text applies to the unused Autoconf macro, and
the extra dbus-gmain MIT files are not installed.

COPYING hash changed due to REUSE formatting:
https://gitlab.freedesktop.org/dbus/dbus-python/-/commit/f83a62c27203553c04c375ff663d9d99273670c9

subprojects/dbus-gmain/COPYING hash changed due to REUSE formatting:
https://gitlab.freedesktop.org/dbus/dbus-python/-/commit/ab33ebefc5ca34486509e3a87591ad2e883b9549

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/dbus-python/dbus-python.hash | 12 ++++++++---
 package/dbus-python/dbus-python.mk   | 31 ++++++++++++++--------------
 2 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/package/dbus-python/dbus-python.hash b/package/dbus-python/dbus-python.hash
index 8d1609dec7..050e2c8f0d 100644
--- a/package/dbus-python/dbus-python.hash
+++ b/package/dbus-python/dbus-python.hash
@@ -1,6 +1,12 @@
 # Locally calculated after checking pgp signature
-sha256  92bdd1e68b45596c833307a5ff4b217ee6929a1502f5341bae28fd120acf7260  dbus-python-1.2.18.tar.gz
+sha256  c36b28f10ffcc8f1f798aca973bcc132f91f33eb9b6b8904381b4077766043d5  dbus-python-1.4.0.tar.xz
 
 # Locally calculated
-sha256  1e4562245383fdb5203b1769789e5b28bba21af4923aea7e8b2614f7f93623c0  COPYING
-sha256  064523e3ab64d6f03904132b2cc4a1bd8500586edb4cd050c2ff2b96aed4c33b  dbus-gmain/COPYING
+sha256  c5324f0629698cbe01dde8e3b802c3331601ebf98c3c65918520ba5eca66c930  COPYING
+sha256  b6a8bf63ae2c95b0aa256ee774680d7bd18f21f457da75466f7610b3b16acc4e  LICENSES/GPL-3.0-or-later.txt
+sha256  f4d2da1bbeb699a80a1f6d06161ba6625aa766c538dddeaa5a6bb9087462841c  LICENSES/LicenseRef-AutoconfArchiveException.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  118fdd408a78866c5b776864650f4a6006616b5bd0793a63924c91febba0b2b8  subprojects/dbus-gmain/COPYING
+sha256  93bb4f7417aa775bab9026cc3d0af28aeb64451fc5a8ec651876785edd8eaf9b  subprojects/dbus-gmain/LICENSES/AFL-2.1.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  subprojects/dbus-gmain/LICENSES/GPL-2.0-or-later.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  subprojects/dbus-gmain/LICENSES/MIT.txt
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 16b22d4821..7f54d739b8 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -4,25 +4,26 @@
 #
 ################################################################################
 
-DBUS_PYTHON_VERSION = 1.2.18
-DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
+DBUS_PYTHON_VERSION = 1.4.0
+DBUS_PYTHON_SOURCE = dbus-python-$(DBUS_PYTHON_VERSION).tar.xz
+DBUS_PYTHON_SITE = https://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT (dbus-python), AFL-2.1 or GPL-2.0+ (dbus-gmain)
-DBUS_PYTHON_LICENSE_FILES = COPYING dbus-gmain/COPYING
+DBUS_PYTHON_LICENSE_FILES = \
+	COPYING \
+	LICENSES/GPL-3.0-or-later.txt \
+	LICENSES/LicenseRef-AutoconfArchiveException.txt \
+	LICENSES/MIT.txt \
+	subprojects/dbus-gmain/COPYING \
+	subprojects/dbus-gmain/LICENSES/AFL-2.1.txt \
+	subprojects/dbus-gmain/LICENSES/GPL-2.0-or-later.txt \
+	subprojects/dbus-gmain/LICENSES/MIT.txt
 DBUS_PYTHON_DEPENDENCIES = dbus libglib2 python3 host-python3
 HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus host-libglib2 host-python3
 
 DBUS_PYTHON_CONF_ENV = \
-	PYTHON=$(HOST_DIR)/bin/python3 \
-	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
-	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`" \
-	PYTHON_EXTRA_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`"
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
 
-HOST_DBUS_PYTHON_CONF_ENV = \
-	PYTHON=$(HOST_DIR)/bin/python3 \
-	PYTHON_INCLUDES="`$(HOST_DIR)/bin/python3-config --includes`" \
-	PYTHON_LIBS="`$(HOST_DIR)/bin/python3-config --ldflags`" \
-	PYTHON_EXTRA_LIBS="`$(HOST_DIR)/bin/python3-config --libs --embed`"
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
