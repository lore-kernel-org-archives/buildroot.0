Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50568D5E37E
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 19:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C46A042977;
	Sat,  9 Nov 2024 19:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JxZy7SII3xF; Sat,  9 Nov 2024 19:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 767FB428C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 767FB428C4;
	Sat,  9 Nov 2024 19:28:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9CA8D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B77B240434
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Woeet8zz0Uon for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 19:28:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 961F04049E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 961F04049E
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 961F04049E
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:28:05 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83aad4a05eeso128339339f.1
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 11:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731180484; x=1731785284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SXXXa3Cb21o4izhW9C0FMnv8rMILv/sQ3NWMZKI24cs=;
 b=iadGNMWFlx9SjIGe9FhyztyMAoNQIk3Xp/wygpr/+Nb7X8Lkgv0Kp1QvJr1fsdud6v
 GqfNvqvyK6XhI1GQiLWUlKkYMbcljhDIYviGlYG8nOFveK3gRsLACrfuOe0Drm+zhZJV
 UQSf7RhJ+EC9mJGco7eYc/4jJe7NgNHD+WPMa6lW3dKgGlxPOZIsNiljyV/MGPLedyUR
 d3Mm+x1fMCzaqtAcCEDAbqYv9aLMikV2Zh26itUuw2cTN/Y9J2isBBmS1EXSGScav6EI
 PTNAhAjrBFU97VsFfcrmNoxkbhE2xiASlVi8CMnAFUIDr4HIeWE9KokxdTGpcHaPB4yK
 IYGg==
X-Gm-Message-State: AOJu0YyUJWvJ1sC/hMxKDoSGYJpKxAxh68jBb8hIlwTDNQHGeD0kQyAG
 MRb6OT23sEy5GnKCg2uxATPx5w+oThd0kgj/Zd1dgezNGIo2gI3vd8IIQg==
X-Google-Smtp-Source: AGHT+IHVwpEkPOqfygAcdbtVt+061sbJX21ial2wvMIcNTutIMIQ+sHLqsucaa+1wH6YQd+fFrAYpA==
X-Received: by 2002:a05:6e02:188d:b0:3a4:e823:1cd9 with SMTP id
 e9e14a558f8ab-3a6f1a2f36fmr76869945ab.16.1731180483864; 
 Sat, 09 Nov 2024 11:28:03 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f9820e28sm4655355ab.16.2024.11.09.11.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 11:28:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 12:28:01 -0700
Message-Id: <20241109192801.799966-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731180484; x=1731785284; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SXXXa3Cb21o4izhW9C0FMnv8rMILv/sQ3NWMZKI24cs=;
 b=WF8GQ3IZhJnoOSPMUcQa9Kpx1EF2jWTyIvHSPL0IDpCN5hvzaiQt7CMItqWA/yTmlT
 kLoMEufczthnAscOzSnfIf28VCN3QFPv9cBscf07cvpfTfVUmccmLkF4hr+aZdMiL11B
 dsnYimP2ufdbBf/PDIqb1cuDdemFaDG2Rew7+llejbxuG6w7/vUdhUGZrs6M8H7YuwPq
 M2WiVmUgxTxsDDQIfh/53+oBI+pL8jKNbcfcmO/CA5UORVfh2Ay9jz5wE20QbGHBYiq5
 6HFx8mAV0hGG35b5JpVz/xbTD0kbowIbsfZg5ookT/iQpykSjSbiZOg6dD03FSDH7/yK
 iMwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WF8GQ3IZ
Subject: [Buildroot] [PATCH 1/1] package/python-wheel: bump to version 0.45.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wheel/python-wheel.hash | 4 ++--
 package/python-wheel/python-wheel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
index 1f9a49a44c..35bee60b72 100644
--- a/package/python-wheel/python-wheel.hash
+++ b/package/python-wheel/python-wheel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wheel/json
-md5  440ff4fe51579b7ed16f02af8f8d9494  wheel-0.44.0.tar.gz
-sha256  a29c3f2817e95ab89aa4660681ad547c0e9547f20e75b0562fe7723c9a2a9d49  wheel-0.44.0.tar.gz
+md5  3d1f79ff04a1252fa709dec58aa7249b  wheel-0.45.0.tar.gz
+sha256  a57353941a3183b3d5365346b567a260a0602a0f8a635926a7dede41b94c674a  wheel-0.45.0.tar.gz
 # Locally computed sha256 checksums
 sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index 1802280e24..21060cfc66 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WHEEL_VERSION = 0.44.0
+PYTHON_WHEEL_VERSION = 0.45.0
 PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
-PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/b7/a0/95e9e962c5fd9da11c1e28aa4c0d8210ab277b1ada951d2aee336b505813
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/e7/52/fd4516fb8f7d11a08e3f9cd69eb1558f098ab67e79f32d920c4974ee550f
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
