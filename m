Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED61FD1358A
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 22:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A34D5405DA;
	Sun, 27 Oct 2024 22:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lg9zS2aCk3NF; Sun, 27 Oct 2024 22:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66B72405BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B72405BA;
	Sun, 27 Oct 2024 22:59:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3787A971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25D836076C
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2Wos7JFUjyz for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 22:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2090D605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2090D605D1
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2090D605D1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:59:31 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a3b8b34be9so14129465ab.2
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 15:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730069971; x=1730674771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JHkBDmwqlO2cQO3mcjI1AFClBGJMySRWvWfJaIIz3nc=;
 b=suyk75Po7jZV/VTrSmuboTDMFYMCwvf2Luqp80D4yNeZ2fr+Ulh6ADn922EIFJaZB3
 LwsWZIoCsh/RZFWtNy+ZSvfw1cbZ+KowGIolCp5mXI2bYyhBMzy5KyK6hfdCuoy3Icwe
 z8vCTOY8rWXFVH9i0LD+KYLgqWnjcHY+ilPjh/XsguQBFd5VGyXgIdsfBjiUQzycYlvf
 +9sYujHQZJ7Jm9DUAN2xEzt2+xZ1wrJxafhpYPHKYZ87JNUG5lcJu5WmEjZAg3TVokuz
 Qxrf/uK0TA47p0EIkt77fr5B8sFXaIRu7bFXOW3jgP2XP3PnGBF5w4PzdPdAhjFbtE76
 JpAQ==
X-Gm-Message-State: AOJu0Yzo6+Ndfto3qQ0RZZ5o7or8+p30pBIjqIvakZLdt+5DTV2B1E4c
 mEMcRiplIbmA0DlPZpdEBcptSGKPriqSDcF3bpLrKUaI3DG6bV2I9SqUkQ==
X-Google-Smtp-Source: AGHT+IEweosWyG9CdEDAGFU4ediiAVtS90jp4GDkk2qyktTT/9qQ6Pgqyt7ky/0HVvnLKUEI49Qcrg==
X-Received: by 2002:a05:6e02:219b:b0:3a0:9b27:7d52 with SMTP id
 e9e14a558f8ab-3a4ed33de2emr49587615ab.20.1730069970803; 
 Sun, 27 Oct 2024 15:59:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6df57ebsm13691865ab.35.2024.10.27.15.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 15:59:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 16:59:28 -0600
Message-Id: <20241027225928.3870886-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730069971; x=1730674771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JHkBDmwqlO2cQO3mcjI1AFClBGJMySRWvWfJaIIz3nc=;
 b=HnxNm9aVp2atcdVRZVp7NFZ/N7DmsVuF4CKCP8LKsBqpBVmZZRHGDUBhsIDw7nygQq
 ebe99LQC5+T8sN872unkv1hCb2ldocwR0yyM3/4q/JwCaqF/BP0aKhk5pK4djUliQeru
 qhnz1gzfK0qrVFuU57kqFrhn3hAUKkvDFBnZhjgO0M26ypIeUN+dlOJjR4rHUek9BZWL
 FfyK/8iGxuJj/vSa3dlsIsZrlzVxf4W9PjY4dIEoSw9tMAWJf/6SuiJr+lFu9G5IGE6Y
 UWOANHaPsSopUOPi69R0+oFVt5ctEvZsCAj7DIN1v5MYs2QsxhccOl7SKgc45ZQ+OcFQ
 +l3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HnxNm9aV
Subject: [Buildroot] [PATCH 1/1] package/python-logbook: bump to version
 1.8.0
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
 package/python-logbook/python-logbook.hash | 4 ++--
 package/python-logbook/python-logbook.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index 8761945de6..361ea9921e 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/logbook/json
-md5  cbb7e5fb2d6325f42a323b0000127393  Logbook-1.7.0.post0.tar.gz
-sha256  a5e8016701ca3beea6a390b0ba1541037f663543ca508ccd36cfdc841639cdd7  Logbook-1.7.0.post0.tar.gz
+md5  d15918a5745349eefab327661454527d  logbook-1.8.0.tar.gz
+sha256  487fa41539787bfa21a51fabd7f3ae8ae7f9e6679bb3e241d0f5f18a2fc37e9c  logbook-1.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index e47e78d26e..f6ccc1aac6 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.7.0.post0
-PYTHON_LOGBOOK_SOURCE = Logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/cc/98/c1d93c1d7593f58515333a6217aa4ae647d9ee9c1aa2dfdf77b28b7bb7c7
+PYTHON_LOGBOOK_VERSION = 1.8.0
+PYTHON_LOGBOOK_SOURCE = logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
+PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/c3/a2/fafcc4ce7bad34093150e14f9ed179aa53e3e60a5c46e840547bdae26674
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
 PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
