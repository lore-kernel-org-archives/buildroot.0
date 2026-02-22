Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122EDC624D9
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 10:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8577983C2C;
	Sun, 22 Feb 2026 10:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-PL8cINfYoW; Sun, 22 Feb 2026 10:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5EF483C35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771756003;
	bh=HSQl+fGYkEVYSCPBdop1CoNpP4acGY5oZqJgLzgzVro=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=F932PRNejEleFZ3kBBX2K5n+NxoZRhBZ/PD05F4Nu2KQ1yMTd43lCsf9j15lWqBf9
	 DqieiCH2dc4rh0FuldOzQZW3SCO8sUk6mYgaXfn5+sN6NkLvaGspFRv8ZcAh6y+NQi
	 bwrr+Q/u/UKERYshlfDLxI8oJv2ACage1YzY/O215n5R0vMF1lnZqGYtPGaIwxJs+J
	 femW/f5UlUzMj9F8DTbUpf7MftnkK44xKyHUjYJKYMoxOU8Ye1L/rrwqr1BeVUbmm5
	 dO3PEkEulYxVqLZ4U888Ms9mWyTBCCqiAohUcKEdYBKbaMsUY6EK7FH1sYNu0G618t
	 eL3a0Dltl6r9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5EF483C35;
	Sun, 22 Feb 2026 10:26:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21DEB1CE
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 133F883C35
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8v_Wgp9x2LbY for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 10:26:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3267C83C2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3267C83C2C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3267C83C2C
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:26:39 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4833115090dso32433535e9.3
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 02:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771755997; x=1772360797;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bX/TlxPSoUv/FgbMcVA0PfJ9zT4klC3I/jGNmQvFfUo=;
 b=TDqVeXsyqJFi+piBkpyz/7N4vRE0w0960ZijG98mVBQgHvrPGLuWu+HOH9RYNm897q
 sDXVLsFf1RC8ZMhPASljR3GbyTrM2SKEJXa8YvbNUbB009dvF7TH2HInCLwtgz529tP/
 RleLnW4T3PuQYh3sr+DLBenkKgF+G3W9jWGbXNeDmrzJP4AAK0AGHuJzf5FSKIflVRrq
 HelpXCfnHiGZSB68j20KQG/gq7dGYcI3/vRHNz3n25gQcjbKnAg+Rj1Ims6pIBsjXfhi
 Bp0trrwZaPkANnsEZiYcbS3Lhjs5lWJDug2hpegbM/VqLMSM/Stm5Nn0mwfp3Yiu0atT
 GVaQ==
X-Gm-Message-State: AOJu0YzEUkQzWVM0nci/vdlgg0emZCpijBegJoyO6JR7HNOr/u1wBnj7
 9WBRVB3L7WTi0WsQGv8dAfeyTQkwnTQ8I+AM7oQTiaH6dJ65X/x8cIVQMZuhswFlP2iMBooRzOS
 +0LK2
X-Gm-Gg: AZuq6aJ8wOd9r3IQZu5zOUneJ1UXV/scFvXXUxn6ULxyXcfnfUsPvgF5IoEOXhgoS+8
 a39pZyIdaeMBQxb7MiJ0oQsT05R8waFgIN4oHhRGMutjfwqxMQGQqeZZaUamUQOs8JEI8JXUVL7
 7SE9RNtHjWUfb2D1E0s+rieU5i01+7ui8dVVXDxvC5n+667WbAGKe1M+l0IPP1lIxvu4isrwkeR
 Sm+eBlNnhdd3Kf3xrNsJ366BCnrcmSwopXmi1/HNUqOwI3ScB8NE8PQ1BaQg1LXvvZpzK+/gNdf
 OEdPjfDhaJ0wc5BWqTNYWH0SW8DlWrtZx7Yw/R98ky68+kJwspaL2zUM7a+V3JYTtRN4JzZOjl3
 8iVPJh7oVOYU3DlsufS3l/nlNSMHwMV9ft5d5uX7aztt5+QHG6nS/EdaJnB4iXau9T8SRnSQpDl
 gTS8fwgXRSC80P/hQ=
X-Received: by 2002:a05:600c:8a0a:20b0:483:7903:c3b1 with SMTP id
 5b1f17b1804b1-483aaa168b0mr53423625e9.20.1771755996755; 
 Sun, 22 Feb 2026 02:26:36 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31c048bsm197896845e9.7.2026.02.22.02.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 02:26:36 -0800 (PST)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Sun, 22 Feb 2026 11:26:35 +0100
Message-ID: <20260222102635.117276-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771755997; x=1772360797; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bX/TlxPSoUv/FgbMcVA0PfJ9zT4klC3I/jGNmQvFfUo=;
 b=PNM/etN14ooYLGb7L8jUibyyjyB4mDWXk/Pnc2PBUmZC8awpjpNtuMQ2ODWIdjezM4
 QSGCpaQ5m72Z4JdkRK2lcKRf6cRblpAOo1wPtrVrYlxfhMB0f6w+gmUEF9wo7Z8m3ems
 0+YtaLoN25GlIngjxETDea3Ne+xvvN/bJRD+0y93uFoesvUK3Q7efg2/D5T9lchDgIZd
 TnocIFGGa/GLHeXf6sNYpktOljcm43uXw8kIzg6tdKFdqgZnprYY7NgRQ4Xy/OsGCMOk
 5YOjxreGVjdivYkAKlOIug/Dsu9hMlvdSpWQhfh4qgqQr4MyZUROb7GLpH9HwysGggFm
 HN5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PNM/etN1
Subject: [Buildroot] [2025.02.x,
 PATCH] package/postgresql: security bump to v17.8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information about the release, see:
  - https://www.postgresql.org/docs/17/release-17-8.html

Fixes the following vulnerabilities:

- CVE-2026-2003:
    Improper validation of type "oidvector" in PostgreSQL allows a
    database user to disclose a few bytes of server memory.  We have not
    ruled out viability of attacks that arrange for presence of
    confidential information in disclosed bytes, but they seem unlikely.
    Versions before PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are
    affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-2003

- CVE-2026-2004:
    Missing validation of type of input in PostgreSQL intarray extension
    selectivity estimator function allows an object creator to execute
    arbitrary code as the operating system user running the database.
    Versions before PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are
    affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-2004

- CVE-2026-2005:
    Heap buffer overflow in PostgreSQL pgcrypto allows a ciphertext
    provider to execute arbitrary code as the operating system user
    running the database.  Versions before PostgreSQL 18.2, 17.8, 16.12,
    15.16, and 14.21 are affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-2005

- CVE-2026-2006:
    Missing validation of multibyte character length in PostgreSQL text
    manipulation allows a database user to issue crafted queries that
    achieve a buffer overrun.  That suffices to execute arbitrary code as
    the operating system user running the database.  Versions before
    PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-2006

COPYRIGHT year updated in [1].

[1] https://github.com/postgres/postgres/commit/625e4495bf58733f1dac24e363b12e6f95d7e92d

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index efa1b5e751..b7a2397f8f 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.7/postgresql-17.7.tar.bz2.sha256
-sha256  ef9e343302eccd33112f1b2f0247be493cb5768313adeb558b02de8797a2e9b5  postgresql-17.7.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.8/postgresql-17.8.tar.bz2.sha256
+sha256  a88d195dd93730452d0cfa1a11896720d6d1ba084bc2be7d7fc557fa4e4158a0  postgresql-17.8.tar.bz2
 # License file, Locally calculated
-sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
+sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 13abce8330..9856d6423b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.7
+POSTGRESQL_VERSION = 17.8
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
