Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AF0E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 13:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA2238391F;
	Sat, 11 Jan 2025 13:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMCsqUxHZAj2; Sat, 11 Jan 2025 13:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D413583926
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D413583926;
	Sat, 11 Jan 2025 13:05:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C261A952
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2ADA60E35
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Br9bSBcZQcJ3 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 13:05:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF2746072D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF2746072D
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF2746072D
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:05:36 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3ad272538e8so13552915ab.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 05:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736600735; x=1737205535;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Txu4od4aDE6YT38McaBKMBDKSw7R9otprRL1KZLLnbY=;
 b=j/Xy8P5XIPKYCqr7yYnEmeiNCTlb5RxjHjBvfVO9h1Irynjg+qPH1PxD50q7cB+0rh
 JCB1y227AEFcftI69eHpHzby4btF/ynXaEgEBk3MPQLmbyAvL3Em7N00ZyW35v/yumpl
 OFaAnsY96Em1gWDExIUvo9Uvwo2AAymaOAYyhI0Kbge6s3NZgXIDM7HaOWRMRkhlYkVR
 oATlutsedGnAy05YO55GD3zlivVZ0RQ946gltXeu/p1beAIRxa/jiXTsqlnyiRPA+pfv
 y/78axj7t3FlSbzvCWyqFOds3yvIMM/tN8FwxJA1a3zxOvYr2x5bXdSaNbSW/0yX44gw
 y+Og==
X-Gm-Message-State: AOJu0YzW/YGybNAaeqQX3p8RnhvK6u6AISEgVsxMRksfZBjdnD4TZOuK
 dQvVY/5vwwcyUA2n2T3SL+ga4hYl83haSKkP+uCTsD32gwoVGDJK96oMgfR1YzU=
X-Gm-Gg: ASbGncvQ5yiXCpKwnneZ1Pq9DP8Sg0nRCL6/ip1x97Vh0GFFBKLSzSHaQyC5omk3CC+
 tIo0OFQpxP9AWmWcFZnaWSCFKcKk5+HJ/NEmiN8EZFR2fLDxVM6TdwK1w2ZfHU62HJj6dAhcb70
 SefisgVnxwYbkmYvQFdyydtJXU1y6g+fmhFHZOCWibThJBYaIRagQEVh9DRfAcSmZ50wo3jCrh8
 m/5TbGtnhxGaSp6HnkFZg/SMf7pVCQIJwhdFYgBGoTNW5z/oEBKBI1RAVZchOSQUDJC/UMPxH1b
 0kEZdsN/iSIoXwqjfjkrXsozXw+TtLs=
X-Google-Smtp-Source: AGHT+IHJctYkV+iuA9GPMntcYkjVMd7ymz8wp+qUxe5i6cTW2ttIsHt9G+3uRUv7fBh+45Klb5t6xA==
X-Received: by 2002:a05:6e02:12c1:b0:3a7:c81e:825f with SMTP id
 e9e14a558f8ab-3ce4b0b97demr62033685ab.9.1736600735444; 
 Sat, 11 Jan 2025 05:05:35 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4ad93a60sm15373075ab.14.2025.01.11.05.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 05:05:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 06:05:33 -0700
Message-Id: <20250111130533.2459830-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736600735; x=1737205535; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Txu4od4aDE6YT38McaBKMBDKSw7R9otprRL1KZLLnbY=;
 b=SzpmqaTfQd94QsyWPTBjqOq2r39IEAhDpLeBbL7xt4P/RTYye2x5gNvl+OXRU9WGra
 5Dyd+0gtyPOl74G2S98s/RwJZiFWpGfVAZm+Ep8WLBVKFUzUG59m7rTWatnIjaCa5IVh
 /VrdiceVbpt0Vle6t3GwgktJ/pn6rJnkTn37WyO4tsYfJB5QZNyPXPMbsHKzvMgiCG2L
 upKMrxf9vBP6Y+j3rYrJU2g7V/GiG+I9GvCgcb1YpMV1HxHjvooSjjB9QEJmFf6Wq7cp
 UQBxsX19vUjcBY/25JD1t4iCghInoUs22aVDNCwfjHLn1toYJxF57yK0p3MJzMsgG55Z
 Szlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SzpmqaTf
Subject: [Buildroot] [PATCH 1/1] package/python-mako: bump to version 1.3.8
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
Cc: Bernd Kuhls <bernd@kuhls.net>, James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mako/python-mako.hash | 4 ++--
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index 0a39db7db9..580c90da35 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  ca119a43eb3eff532bd5d55d585d1caa  mako-1.3.6.tar.gz
-sha256  9ec3a1583713479fae654f83ed9fa8c9a4c16b7bb0daba0e6bbebff50c0d983d  mako-1.3.6.tar.gz
+md5  8e6f349493b5c545795e4f6451e070dd  mako-1.3.8.tar.gz
+sha256  577b97e414580d3e088d47c2dbbe9594aa7a5146ed2875d4dfa9075af2dd3cc8  mako-1.3.8.tar.gz
 # Locally computed sha256 checksums
 sha256  15627b36b38d0729cdd686df9abf606503d99d624b2f5ec5cb254a75d5afa891  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 68cfc98bc2..19cd2fc6f1 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.3.6
+PYTHON_MAKO_VERSION = 1.3.8
 PYTHON_MAKO_SOURCE = mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/fa/0b/29bc5a230948bf209d3ed3165006d257e547c02c3c2a96f6286320dfe8dc
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/5f/d9/8518279534ed7dace1795d5a47e49d5299dd0994eed1053996402a8902f9
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
