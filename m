Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFDEC87FCB
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 17:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53AE480734;
	Sun,  3 Aug 2025 17:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cwUQ3v6ZjGH; Sun,  3 Aug 2025 17:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74DEE80737
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74DEE80737;
	Sun,  3 Aug 2025 17:04:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA8B0118
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 17:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88AE880737
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 17:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0qv_7IH_ei2 for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 17:04:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78F4A80734
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78F4A80734
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78F4A80734
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 17:04:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso7242775e9.3
 for <buildroot@buildroot.org>; Sun, 03 Aug 2025 10:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754240671; x=1754845471;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o+q9XJ9EUpQLHb9F+T4R4XSTEFHW1mJQXQTUZOCfYg0=;
 b=odLOxuACzUgPnhNiTawzoaiwqnwQF/dVuJOK58/2NxwPs5S2z4ow+KIbMQZzvQ8qfE
 6vtniC2cYV/zTRJR60rUqNj5ilR8W/lbUTBIJKNboD2k/dPawaTG5QV/kjbJ2iG8fBaL
 jRuIeXDNy22b6feAWbhc2VzqgLePRyYqN0PaWzU08K/NWplzFdwZcCyA7RLqvWsmRcPz
 xzwIGTVkhbEJPlwxD8ELGT7Re8ImYl5ZBYK9ZRxH2Y8ZqrMDJrRgg9GmHeYuUNMa5g+k
 NA51H7PotyUFnejyLPl44j1Y72LjCU4oehvujCVmW4mGA9/GbzcpGdy6+Hsjve+GaiIC
 7Vyw==
X-Gm-Message-State: AOJu0YwBnDgOjoG5b19uPtMwhMO25mzGmlwdiW6PjyiPoJRnAVxJfZ/6
 4dkwg65AuN+iv6dUrL7VIcnMtTKp+J2xCZ7RrNx+2xBxehsQDQ7ZSdlu+9lR5g==
X-Gm-Gg: ASbGncsPzFC2Jh5+oGFPdQs9DNXZydrVXc+vdXaOMoF9hPnsG8wND1xtpamDJt3bV+B
 OoPqqcRrJWRwwMaH/Rd4thJpjL/A+/YUN0YZOVgczMyUdIOnmZqxFmKvXON3glCFplLarhPTjYf
 SexJTq309LBQcNfky/n2Yab3dCpXXeanZQrRl2k350BNr5mobGYgl2x1NuNb+j7acWGTI3SZ+kK
 GjGx1PNJvm0oeO+8T7o6Fuaq5eoUurr/RQSshZFMM1p6dpwjki0XZLaX8ejKAySsdgJnH8DnPBI
 ylPGgdHC76e6Q4hlmGHBKBe6TZkcj5STMjv6MEq8cTKH3HUSBiFoxlnqzejwIR4BMYwrXWETUKf
 kuM/y2bq/sjhJPo9Ns6RcveFfT0n3JI4iALmCzXsjEdvXphc=
X-Google-Smtp-Source: AGHT+IEGmh75j+9uGn3J52ySW40JwEepbZe+5Z+NpduuKxMH87HxxEeycq5ABOCuxRZ+g7Hm48kIVA==
X-Received: by 2002:a05:6000:2289:b0:3a5:52b2:fa65 with SMTP id
 ffacd0b85a97d-3b8d946a541mr5339001f8f.5.1754240670944; 
 Sun, 03 Aug 2025 10:04:30 -0700 (PDT)
Received: from localhost.localdomain ([91.243.185.204])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b73868a4sm66097445e9.11.2025.08.03.10.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 10:04:30 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun,  3 Aug 2025 19:04:27 +0200
Message-Id: <20250803170427.273284-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754240671; x=1754845471; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o+q9XJ9EUpQLHb9F+T4R4XSTEFHW1mJQXQTUZOCfYg0=;
 b=AL0CtFPtrITnqNbwkJ5ej3hnSQJObUt3V6eERmV1WvkFPQdcOskrKTNcSpLPrlGUDc
 oZ5gsxM20ZiwXvRgKNxZLLyYnoRnDKaGbPhOqxtT8dbQ15Mhkuqo7yNMA0CMPsIHYJ1G
 1Aq6oC3cgfMhOoOZ5B5CB8mLMRCloEWOVz0EnkBZsx+oABdgVaw2aB1o7aR/SnR1PPUy
 sZI4eGmC/4ZftiTdDWGEwJQ1yEufavOPU0TWV0i8chXYDkbFVDMECRAGm1Jz3+E61EZ/
 sH7NtvK+AvOZIVz0etmycwBIG29ZCdATph4NfkWx4kKuFz3TBePldrpQmWcrZ9o9c5OL
 vKig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AL0CtFPt
Subject: [Buildroot] [PATCH] package/python-pillow: security bump to version
 11.3.0
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

Changelog:
https://pillow.readthedocs.io/en/stable/releasenotes/11.3.0.html

Fixes the following security issues:
CVE 2025-48379

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index abc5a4bf2e..d9077daaf7 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  ede5dce0bbbeff02099e2e297919a82a  pillow-11.1.0.tar.gz
-sha256  368da70808b36d73b4b390a8ffac11069f8a5c85f29eff1f1b01bcf3ef5b2a20  pillow-11.1.0.tar.gz
+md5  9464f92bed3be9c68293cb399ec1ec1a  pillow-11.3.0.tar.gz
+sha256  3828ee7586cd0b2091b6209e5ad53e20d0649bbe87164a459d0676e035e8f523  pillow-11.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  17f240ae101143707e5e7303a5d800450d9ccc7475b463cedb555cefdb3c6ece  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 1053bec5d6..80961b92a5 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 11.1.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/f3/af/c097e544e7bd278333db77933e535098c259609c4eb3b85381109602fb5b
+PYTHON_PILLOW_VERSION = 11.3.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/f3/0d/d0d6dea55cd152ce3d6767bb38a8fc10e33796ba4ba210cbab9354b6d238
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
