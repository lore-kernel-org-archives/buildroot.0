Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FFACD4F3C
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 13:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4658D415D7;
	Mon, 18 May 2026 13:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnCc5_gp2z4Y; Mon, 18 May 2026 13:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C3634248C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779112055;
	bh=xn5l1fZQ6FnHxlsiPCpxU0kIQAG6izInnewTeS3uzS4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=iM40gj1N/s69AxJA35ZevcxhsHfm7HHSgJrxL+GhqNkuoAn4EOhhKpK0MAumFVMQv
	 K5SlpGpYySPXSS/Cz4zTU+IceC9Zad0BGQhBk4pJNiVDVc/CZyIU3Teh0eC+ocPXSG
	 em/wczqgUznmIYcqQF+QYGgWrJsHZH7WyBT0uN1SVFmOmTjHQ9/TUmoJlU9Ehyj/55
	 ln0tJ129UrNBsRFHApr9qgrkXheMSFqaA/Q3OrCY5fm7i9alDh1jD1ALgApyEMLK0K
	 M/gmawXVykivcaieflniPbnnAGkl62uuyxOz+aWrH9yArY8iRjkhHvYzGgAb49fLzv
	 hl+xpceJGrlSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C3634248C;
	Mon, 18 May 2026 13:47:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57E26265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 13:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 496E74248C
 for <buildroot@buildroot.org>; Mon, 18 May 2026 13:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyot28q3VKqJ for <buildroot@buildroot.org>;
 Mon, 18 May 2026 13:47:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09E29415D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09E29415D7
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09E29415D7
 for <buildroot@buildroot.org>; Mon, 18 May 2026 13:47:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48e56c1bf5dso10999845e9.3
 for <buildroot@buildroot.org>; Mon, 18 May 2026 06:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779112049; x=1779716849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77jT29Me2wLlPx/vSkcAnCEdKe0rdGxMF50VrYKIZvA=;
 b=RP5SZbBYBrsyZENEpAIl19TxTapyU1BeaAd0RMxrvSupi0+1/3u0W5ClBM5BnzySB4
 KQ3O3rKKi2Jw5Abv07riA/OqUAV6R400jzuoTUh55fLmo5gdtGxHoc2kqdAgrRrvJmX3
 W38/71+t+Pp5KloE0bkZgBSbwNHVNTrc7e6d02R3zFKxGMGuk5dLgTqnxyM6XCC2RPi3
 R7Amvc0uMFcOngNlDj7YYgPt414b6/osOZZkp9RGUzjGME6NuYSkLVWraPMv2eNgQjAi
 kxS68zEIjLzxZ5+Kkv8azAS1H5dZk+XQzJGLA+tHJizYHzzUylTtlcg7+au9D+OdlkXW
 ksCA==
X-Gm-Message-State: AOJu0YztStZptWzSDIoJw2AD0vY7srpEbuEH2/yN88Hk87UScDpoWtix
 HaTvnuSl+SkadWKPOkXUedjb9l/D+A8iduHyod60eDH7CSkdq+ecLBpXRMVFjafpKsnQxktmAZN
 l++2j
X-Gm-Gg: Acq92OGz++YpZklBjeOvLjPhz26+w9PvK/ypLBbFq5YhdrYXykWrrVLwID7tjhyiSbg
 PfibiXgJVg43MI2lWnET7YGo5oAeyfkP3Nt0V87r17CmmKAmao7HgAjfavB2zpDJvH+5YqEL6Ft
 ur6c8Ere7VtVEOxFr+kmEhr+BWjh23UwGiwc6j0JZK/rCrB2AyJqfHUhXgn7bhCibuy++Zo6jC4
 I8EhtMhcH2T02feKPJJOMJc7COgik1AyfpVamPjsDFfQoss6hckt86l+Ltpu94ShY+Mgxxx9oRo
 e25lOFVL2XSq/80eh8anYeulfKG2TgVYQa5X0zgmU1JLwRksSQBAUbMd44hptZKuSYLWS3df8Dj
 xlWZr1mxC3oOsNAohIsKi95ioY+H0v2LVMDdXoY/h5YbePKuh1bQbSTye3fqk2l5+VQ64uwF5Hi
 Zx8Y6vRT9E7f1YhtvRqjnbrPbPLFemF8E1S4jGYSD4IF0mh9cPusZB6tvKrbb6
X-Received: by 2002:a05:600c:34d4:b0:48f:e245:394e with SMTP id
 5b1f17b1804b1-48fe631f631mr243547725e9.27.1779112049382; 
 Mon, 18 May 2026 06:47:29 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53ab671sm257095715e9.1.2026.05.18.06.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 06:47:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Maxim Kochetkov <fido_max@inbox.ru>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Mon, 18 May 2026 15:47:27 +0200
Message-ID: <20260518134727.358152-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779112049; x=1779716849; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=77jT29Me2wLlPx/vSkcAnCEdKe0rdGxMF50VrYKIZvA=;
 b=EITB2cbkbMvSTkCK7K4ChwBsYDVoTsaul5aNJbzK5CWN093xFYanXM4tWO6+rBi0fg
 hHkHja0WNuHC8pjdkSeSaz5Cj0C3dg2Qzlk7iZL6l4mUCmGoUW3bHIt6gRys2SdMfk/a
 ClJwzXj+KMQ38IsBQcKG6ZXVBAnomIYpG2wnIqLTMR37blH3Co2+3X3BwiOP3/3xWfXq
 ByUb2ayMSF224Q1ERLXP4ZKMkCA9zMUNeSDqHm2KuIb4+g5gW51q6gMx+ReYPnyB6d+N
 QntuacA7ZIpUV5T1OVytDY/nTJcPLtWi7OHJpjEtvdwHuJfuvy9aspKTVPfpARp/KUdS
 65fQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EITB2cbk
Subject: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump to
 v17.10
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
  - https://www.postgresql.org/docs/17/release-17-9.html
  - https://www.postgresql.org/docs/17/release-17-10.html

Fixes the following vulnerabilities:

- CVE-2026-6479:

 Prevent unbounded recursion while processing startup packets
 A malicious client could crash the connected backend by alternating
 rejected SSL and GSS encryption requests indefinitely.

- CVE-2026-6473

 Fix assorted integer overflows in memory-allocation calculations
 Various places were incautious about the possibility of integer overflow
 in calculations of how much memory to allocate. Overflow would lead to
 allocating a too-small buffer which the caller would then write past the
 end of. This would at least trigger server crashes, and probably could
 be exploited for arbitrary code execution. In many but by no means all
 cases, the hazard exists only in 32-bit builds.

- CVE-2026-6476
 Properly quote subscription names in pg_createsubscriber

 The given subscription name was inserted into SQL commands without
 quoting, so that SQL injection could be achieved in the (perhaps
 unlikely) case that the subscription name comes from an untrusted
 source.

- CVE-2026-6638

 Properly quote object names in logical replication origin checks
 ALTER SUBSCRIPTION ... REFRESH PUBLICATION interpolated schema and
 relation names into SQL commands without quoting them, allowing
 execution of arbitrary SQL on the publisher.

- CVE-2026-6473

 Reject over-length options in ts_headline()
 The StartSel, StopSel and FragmentDelimiter strings must not exceed 32Kb
 in length, but this was not checked for. An over-length value would
 typically crash the server.

- CVE-2026-6474

 Guard against malicious time zone names in timeofday() and pg_strftime()
 A crafted time zone setting could pass % sequences to snprintf(),
 potentially causing crashes or disclosure of server memory. Another path
 to similar results was to overflow the limited-size output buffer used
 by pg_strftime().

- CVE-2026-6472

 When creating a multirange type, ensure the user has CREATE privilege on
 the schema specified for the multirange type.

 The multirange type can be put into a different schema than its parent
 range type, but we neglected to apply the required privilege check when
 doing so.

- CVE-2026-6478

 Use timing-safe string comparisons in authentication code.

 Use timingsafe_bcmp() instead of memcpy() or strcmp() when checking
 passwords, hashes, etc. It is not known whether the data dependency of
 those functions is usefully exploitable in any of these places, but in
 the interests of safety, replace them.

- CVE-2026-6477

 Mark PQfn() as unsafe, and avoid using it within libpq

 For a non-integral result type, PQfn() is not passed the size of the
 output buffer, so it cannot check that the data returned by the server
 will fit. A malicious server could therefore overwrite client memory.
 This is unfixable without an API change, so mark the function as
 deprecated. Internally to libpq, use a variant version that can apply
 the missing check.

- CVE-2026-6475

 Prevent path traversal in pg_basebackup and pg_rewind

 These applications failed to validate output file paths read from their
 input, so that a malicious source could overwrite any file writable by
 these applications. Constrain where data can be written by rejecting
 paths that are absolute or contain parent-directory references.

- CVE-2026-6473

 Guard against field overflow within contrib/intarray's query_int type
 and contrib/ltree's ltxtquery type.

 Parsing of these query structures did not check for overflow of 16-bit
 fields, so that construction of an invalid query tree was possible.
 This can crash the server when executing the query.

- CVE-2026-6473

 Guard against overly long values of contrib/ltree's lquery type.

 Values with more than 64K items caused internal overflows, potentially
 resulting in stack smashes or wrong answers.

- CVE-2026-6637

 Prevent SQL injection and buffer overruns in contrib/spi.

 check_foreign_key() was insufficiently careful about quoting key
 values, and also used fixed-length buffers for constructing queries.
 While this module is only meant as example code, it still shouldn't
 contain such dangerous errors.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index b7a2397f8f..48bbbd2443 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.8/postgresql-17.8.tar.bz2.sha256
-sha256  a88d195dd93730452d0cfa1a11896720d6d1ba084bc2be7d7fc557fa4e4158a0  postgresql-17.8.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.10/postgresql-17.10.tar.bz2.sha256
+sha256  078a03516dcdbdb705fecaf415ea3d13a956c589e46f09fed68a06fb00598c90  postgresql-17.10.tar.bz2
 # License file, Locally calculated
 sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 9856d6423b..6f6f36702f 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.8
+POSTGRESQL_VERSION = 17.10
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
