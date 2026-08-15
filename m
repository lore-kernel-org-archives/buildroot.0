Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDFBC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 14:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A16B4084A;
	Sat, 15 Aug 2026 14:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xpcxSWbA_RM; Sat, 15 Aug 2026 14:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF42E40855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786802449;
	bh=9x3gJ9mcEUJckeb8j1U+ZLahAC8r7emRo3yYNS7tTBQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EdAOXIU3HcSMBT8pamaNkVf5EaaHX6A+v7qE23l+L2nXfZNWMKMc/+7Tj18S/FQri
	 LigMIGOwmqGIRuTNxi2bFtD0wqMuDThX5UOS6dR2mKYrGesRxYhhAEea9fcNjhsc6e
	 Zh5ctpKwDHiu+Az3xorr0XlOeKraIuw9vDBeZeQHKrfR5XUt+g7A1URG+rEnhjDHew
	 Ndogtt7KTDvMQto/rJ4qWDzzfFTdJsaUUBu/G44NvpWzQ/LdozhHxgNM77pAUvErNO
	 iSL/AAvjTNqNhQ/mMkHknJkbGZAp4Ri2pktzlby3ilJES8kxfR1z7loKso0ys1vmbh
	 VVeOYhTXNzVNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF42E40855;
	Sat, 15 Aug 2026 14:00:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F8E62BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7167B4004D
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-puwmqwAC7g for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 14:00:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 971E740026
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 971E740026
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bi3zuPkJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 971E740026
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786802441;
 bh=X0FKjqpxp3ZmNlZ38JRFP4rpgVZq6u3blbtO9Eq2ASg=;
 h=From:To:Cc:Subject:Date:From;
 b=bi3zuPkJJFQWVip1s1hcYrwMKj76oZOib0rIivgMF9X1FYNVlWHJU5nDbU55Jjgbs
 HnTbZzl1vVOwlbY4K/qVumPBP8PlreWoAj/jmVmVwZD080Ez/RKIuKot3+E0FOz+kj
 nSnb8FAAas0Mhvon7j9rLgrbzDUC1CrQFneIgf8zT+ww8Lq0N5c9GS+ZYUfkXRR+wK
 Sik6j1ng5H5wY5WDnTH57D23SuA2JUQoXpZM0Nl82LZDrbr7mz4U5wH3vbRjlYNv0y
 /1Tq9+Av97jhMlzn3iQd/q5oP2S6UCVQprNdQaSnWkJu39GBqxW0F67zWNcaR9R/He
 AVlSh1q88Iutw==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76EF3A4C4A4B;
 Sat, 15 Aug 2026 16:00:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59186)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvEwC-00000000217-3OOU;
 Sat, 15 Aug 2026 14:00:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Sat, 15 Aug 2026 16:00:41 +0200
Message-ID: <20260815140041.100370-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 18.6
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

https://www.postgresql.org/about/news/postgresql-186-1711-1615-1519-1424-and-19-beta-3-released-3365/
"This release skips PostgreSQL 18 versions from PostgreSQL 18.4 to 18.6.
 18.5 was not shipped due to a regression."

Fixes the following CVEs:

CVE-2026-6464: psql COPY FROM STDIN early failure processes data lines as psql commands (CVSS v3.1: 8.1)
CVE-2026-6469: ALTER TABLE ALTER TYPE resets extended statistics ownership (CVSS v3.1: 3.8)
CVE-2026-6470: Fails to check type USAGE privilege (CVSS v3.1: 4.3)
CVE-2026-6471: Logical decoding can dlopen arbitrary file (CVSS v3.1: 7.2)
CVE-2026-14662: tsvector and tsquery undersize allocations, via integer wraparound (CVSS v3.1: 8.8)
CVE-2026-14663: pgcrypto, for OpenSSL-disabled ciphers, silently encrypts to and decrypts from cleartext (CVSS v3.1: 6.5)
CVE-2026-14664: Regexp heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-14666: Row security caching disregards role modifications (CVSS v3.1: 4.2)
CVE-2026-14668: ctid type confusion in selectivity estimator discloses derivative of arbitrary read (CVSS v3.1: 8.1)
CVE-2026-14669: to_char heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-14670: plperl tied object heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-14671: refint plan cache type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-14672: Observable response discrepancy with non-default scram_iterations provides user existence oracle (CVSS v3.1: 5.3)
CVE-2026-14673: amcheck does not clear untrusted search path (CVSS v3.1: 3.8)
CVE-2026-14676: pg_stat_statements heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-14677: 32-bit pltcl and plperl undersize allocations, via integer wraparound (CVSS v3.1: 8.8)
CVE-2026-14678: pg_trgm picksplit reads past end of buffer (CVSS v3.1: 4.3)
CVE-2026-14679: Stack buffer overflow in argument match writes 0x0 and 0x1 to server memory (CVSS v3.1: 8.2)
CVE-2026-14680: Type confusion via "internal" arguments (CVSS v3.1: 8.8)
CVE-2026-14681: Improper enforcement of GSSAPI encryption when coupled with SSL (CVSS v3.1: 4.2)
CVE-2026-15741: Expression deparse allows SQL injection via EXTRACT argument (CVSS v3.1: 8.8)
CVE-2026-15742: fuzzystrmatch writes effectively-arbitrary addresses, via integer wraparound (CVSS v3.1: 8.8)
CVE-2026-16238: Type confusion in pg_restore_attribute_stats() executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-16239: Type confusion in cursor CLOSE + DECLARE executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-16241: ECPG integer underflow can crash the client (CVSS v3.1: 3.8)
CVE-2026-18024: ascii() function reads past end of buffer (CVSS v3.1: 4.3)
CVE-2026-18408: psql \unrestrict lets superuser of pg_dump origin server execute arbitrary code in psql client (CVSS v3.1: 8.8)
CVE-2026-19385: pg_dump heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b2e8c5fddbe0154ce378f3f27d076e8f123b217b

 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index be57f216f1..da6c37b519 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v18.4/postgresql-18.4.tar.bz2.sha256
-sha256  81a81ec695fb0c7901407defaa1d2f7973617154cf27ba74e3a7ab8e64436094  postgresql-18.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.6/postgresql-18.6.tar.bz2.sha256
+sha256  555610c24d53e4316da5b7d3fc25c279d96856d5e0e23ee308c328c5fa881d9f  postgresql-18.6.tar.bz2
 # License file, Locally calculated
 sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 16ed591df4..d852dc0e1e 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 18.4
+POSTGRESQL_VERSION = 18.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
