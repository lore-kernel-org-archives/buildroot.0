Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C34CAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 02:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E88C98169E;
	Tue, 16 Sep 2025 02:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-5MyEAHd8Og; Tue, 16 Sep 2025 02:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2714816A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2714816A0;
	Tue, 16 Sep 2025 02:03:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8CFA12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 02:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F15B40AB6
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 02:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iExJ1R1S3n7n for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 02:03:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2E3940AA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E3940AA7
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2E3940AA7
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 02:03:10 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-88cdb27571eso157993739f.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 19:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757988189; x=1758592989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BpumDC3IodKnxgVhOBD294hXOTx3doQ4JZpC614XRZo=;
 b=koc54jueJQPNO1FmxdM8gMNaS4T3gSfA1sXcHrpRlhMx+Y+3m0HJMfSWdtYK5fEnHI
 NMyFVfHgzIJ+bEhGb/MiDRR3MXNNh0Kdm8p9wV2NOmjTrEgMHoe9fcLjNgZLgMaBmNd+
 v/YD7ErD2N/zS7yVX0RgNnLaBC1MYlFHAieVj/m7ngJb2DQUkAXnloTv2Tx0LOTZYdbi
 UghCzs1MevHe1zbWdxZNyCMSC6OqPji4qjhLQ5aV3r+ajvZ3dKlPqO+PLELUZdVODkIO
 tQGvwgszz94FO2wF1JrvfvgcWhFQgdu2wPFKo5OtqPQUybPFYKaZpuTMhY3xwIcI11IF
 Rm6g==
X-Gm-Message-State: AOJu0YzMEmlyGWlRS5V6hRnMRUWpIvvR2Q4rhD8G9+BeN9jfZFt/OfF0
 9dWvZ0qgqsJ4GGT0NR75Di4kF6tnhH9SM4e/YHbXUHlGfIZYRVwb/GgXQehJwA==
X-Gm-Gg: ASbGncsFM1U0n9UM3b5gA4jZEJED/ou8PYKGZT5bWJ65Oy+qo5cGgY+ZHLYikC2lO9j
 Ugu7G3u8hZ2koLPuGwl5n5IFSFb1S5o2onPUr2fjYmv7ghgdgRnNI22wVCOgAKtuDVmbimGScY/
 1Qa8eN45KeYiBL3qkYrn2yudZ61mPsYlyHSj3lLJSumI0tY4RMmL87HuBElTVv0q7A24cS4wKkq
 +LyAAAoAWT0GjWwmRSqdCFW+rxbOLsjNMWEgHTTi1TCKq6150t1ig+EjrG54H/zrSJxTUE9d5n7
 CXvHf72xj2uCTpkiagIHmbHCW0mIAwPnIMqOYR38Vqp5mAlo5xgJpATrzXpAC+SB8fBn92gQPKo
 hxEZl2KpBXHgYxE6ysWnrk+RB7T130ZQO3W/d6bFUiu+/BdmW+tTm6enG3V7xyrY91PA35N8AIp
 BLKsxZDLHeyGw=
X-Google-Smtp-Source: AGHT+IH7VraMmU8h7BZFYNoPrmvz8YH6k/Pj+ciN0yPrik9yVlcVlSav57j9n7O7ffK501p6MIhfMw==
X-Received: by 2002:a05:6e02:12c4:b0:424:826:4f03 with SMTP id
 e9e14a558f8ab-42408264f9cmr39281625ab.17.1757988189393; 
 Mon, 15 Sep 2025 19:03:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-511f3062bc3sm5552125173.47.2025.09.15.19.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 19:03:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 20:03:07 -0600
Message-ID: <20250916020307.2631042-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757988189; x=1758592989; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BpumDC3IodKnxgVhOBD294hXOTx3doQ4JZpC614XRZo=;
 b=WCLeTM45s1gHwv/L1xjmb3JTITK6Ng+02Dk6Lwsc9Cy+ThxNYsro6nfA/DX/Mddiw3
 9VcI34rMQ6cx0lkbLdhINQOoAyqvNXZIgP12kKMiH1m+k1mGVelX4693mdypSlUUFlVP
 B1RPvEQq9QEfkGcJfhEJD/iJZWTKCfvnEb+/EHJSSppfZNyrAQhY1z9tUVBJLHtqpZD+
 GPnmxp7RIKSBTBcZ5QBDZElElJwj4O2UbapQnRgBjZFGY8imC6wRRiNzO2h3ijLcXMKN
 aZNy4fbbtsbhlA2c7hntFWo3GBMgUZBRS8P8km1BX+Yarc12OYsHJ1211bH9zWYVKrSX
 1hzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WCLeTM45
Subject: [Buildroot] [PATCH 1/1] package/python-expandvars: bump to version
 1.1.2
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
 package/python-expandvars/python-expandvars.hash | 4 ++--
 package/python-expandvars/python-expandvars.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-expandvars/python-expandvars.hash b/package/python-expandvars/python-expandvars.hash
index 0123ed5420..cd091f75b0 100644
--- a/package/python-expandvars/python-expandvars.hash
+++ b/package/python-expandvars/python-expandvars.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/expandvars/json
-md5  8091f578a547e2b4b9df59100a179266  expandvars-0.12.0.tar.gz
-sha256  7d1adfa55728cf4b5d812ece3d087703faea953e0c0a1a78415de9df5024d844  expandvars-0.12.0.tar.gz
+md5  6afc7c8f9c35241333408f34e598f458  expandvars-1.1.2.tar.gz
+sha256  6c5822b7b756a99a356b915dd1267f52ab8a4efaa135963bd7f4bd5d368f71d7  expandvars-1.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b8a43c35080fc5855e4f8171e4d0d002f6ff1633d8cfc0b5dee0ac4ced2deac7  LICENSE
diff --git a/package/python-expandvars/python-expandvars.mk b/package/python-expandvars/python-expandvars.mk
index 0a72601b5a..33dc09e181 100644
--- a/package/python-expandvars/python-expandvars.mk
+++ b/package/python-expandvars/python-expandvars.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EXPANDVARS_VERSION = 0.12.0
+PYTHON_EXPANDVARS_VERSION = 1.1.2
 PYTHON_EXPANDVARS_SOURCE = expandvars-$(PYTHON_EXPANDVARS_VERSION).tar.gz
-PYTHON_EXPANDVARS_SITE = https://files.pythonhosted.org/packages/2b/a5/46d1f58edcae1d632fafdfee313e378240e002ae45d26502bac938bd8751
+PYTHON_EXPANDVARS_SITE = https://files.pythonhosted.org/packages/9c/64/a9d8ea289d663a44b346203a24bf798507463db1e76679eaa72ee6de1c7a
 PYTHON_EXPANDVARS_SETUP_TYPE = hatch
 PYTHON_EXPANDVARS_LICENSE = MIT
 PYTHON_EXPANDVARS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
