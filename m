Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BAEC19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 14:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F6A41868;
	Sun,  2 Mar 2025 14:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alPQdHnga2O1; Sun,  2 Mar 2025 14:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4096141810
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4096141810;
	Sun,  2 Mar 2025 14:38:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54C42182
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 14:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 386154067C
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 14:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAappaujBhqN for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 14:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BE1A416D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BE1A416D3
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BE1A416D3
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 14:38:21 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e549be93d5eso4100032276.1
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 06:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740926299; x=1741531099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MwlTPKofa8c4R/SLSmvzCht6QbtiXG0YuOZHEpGZ4vA=;
 b=qdvA0WPmalhbOkMAhL/wngp8GObjGHdOGmPYJpEPkl3qMWuBD19wyt/jK8r8izN1kL
 CHQc+G9ezwPknaZ6wOEfqRKA1MGeGiyPfTGKlW0Zp1aYm1jwi1buPYHFYorM3nMLHhUU
 GaMUInB/dO5x6DAoP7IT8i5UgljdkLJ+fUfXqWyBzZjoYNTNGOUu09OPVn5Hg2gQ4Uiu
 F4PfJVW0WwKhbXLwnGRFA7EjLezJGlqw/ujn1cUbpUy+ogTXXMlIHbDNuFlX95oZzaTL
 ypzsbrOP6p9+dDkAXF7PX2llkhipomqODcxpxbREXbNANdoi7cYpkrME2wDiv0mA/CIn
 Fc4w==
X-Gm-Message-State: AOJu0YxD7glN7d6j24/eHkP8zgSAX/diVz8zhYfdkY0B5NSKSQYg4ytv
 FLDmUldrKiTmTQx6nSuoIQ3X3ErBBRth7KvZNInwWfoedv4wdxiJ//HjZw==
X-Gm-Gg: ASbGncuQuDhwu/loAhwQvbRg9cEjjFlaR74Ba1MuMHPwsvWhv4mbfKDAkp3agc8KAIa
 2SQ2oe+OunyrFhjlBpCvLvkOJSnf6Jdr7a476bLM3vxEgTFmjAp10Goq+RCftofDhR/C9chqIzq
 2vYMdg4RIapm/dvLXBV1n7snx94a5yfaXbq3KKwQ2Wge0aEW+Uy//8xS/Zlyp4DzL+2JZurhAGq
 FL9vhSHVgD5Myk7ISiBTR7/YKIKkF9XD9U8/ZTGrMpOdBGEfOnn08xJz924xSuPxPKPsPQvZwCx
 DTtzaETc8AUlxVuKW9ZTRNY3DagbJZGQLH4md8XnEQ==
X-Google-Smtp-Source: AGHT+IEBAptELHmc/hLJl5a3/KPSjSBnPYKWC4IRuiEyfpu261SpsxLNvV0R5OZ3sWDD8tftltddNQ==
X-Received: by 2002:a05:6902:1691:b0:e60:a3c1:6ec1 with SMTP id
 3f1490d57ef6-e60b2e9b587mr12011746276.19.1740926299425; 
 Sun, 02 Mar 2025 06:38:19 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e60a3aa4ef5sm2327076276.40.2025.03.02.06.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 06:38:18 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Sun,  2 Mar 2025 22:37:56 +0800
Message-ID: <20250302143758.300057-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740926299; x=1741531099; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MwlTPKofa8c4R/SLSmvzCht6QbtiXG0YuOZHEpGZ4vA=;
 b=kfBRbO3O1UIdk6f4xNUoceKJn1CDFIt1Rpq8iPOCmc9xDkhKwC6Nv03JgBxQs7DjEA
 RAJ//q/v9PaOUu2iGzQFP6IVKnRGjluN2Yd/LBgIz+NyrUaFDdts+C7e6Mze7KMFmjs9
 +oWtePQ7WjGGcBEcKYjoRMdKI+riGHXkjqjcv54E7DLkicdSNolF6Dbsb0JBXxRjLIyu
 jy5mN/A7WSlcMPw+sSFmD+ZW2oidg2+d/i7lMju/vAoVw4NBrtvYGN8v0qVLZ4XscH6q
 WZ6WapXufZgltbxIrW76EsFs5s+7K/YOflk9afyhfvE6FnIFC9g4zXYMv3XbtLwOh8Qz
 JApg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kfBRbO3O
Subject: [Buildroot] [PATCH 2024.02.x] package/postgresql: bump version to
 16.8
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

Release notes:
https://www.postgresql.org/docs/release/16.8/
https://www.postgresql.org/about/news/postgresql-174-168-1512-1417-and-1320-released-3018/

Updated license hash due to copyright year bump:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=759620716adb347c1d8c8b2e6f7d88b947a54c98

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 11c0e77b05..5c7a466a8f 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.7/postgresql-16.7.tar.bz2.sha256
-sha256  62e02f77ebfc4a37f1700c20cc3ccd85ff797b5613766ebf949a7899bb2113fe  postgresql-16.7.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v16.8/postgresql-16.8.tar.bz2.sha256
+sha256  9468083a56ce0ee7d294601b74dad3dd9fc69d87aff61f0a9fb63c813ff7efd8  postgresql-16.8.tar.bz2
 # License file, Locally calculated
-sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
+sha256  e3822c4797fadcab31a3fc73f75c28ac20c73d72b565da91e9974cf9398ef4d2  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index f4b384ed82..49f0c0de70 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.7
+POSTGRESQL_VERSION = 16.8
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
