Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F684C2A069
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 18:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 443BB40312;
	Sun,  4 Jan 2026 18:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uG_d8LLD9WRI; Sun,  4 Jan 2026 18:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62E9340323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767552101;
	bh=Lt+dye1CVwQejXJshvdFwxceebYVgmMKy+D/Wix/e/g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dNiO4FebhJwEF7hK5LcKjQ6+DVVGStHqoU5VnSYu7Cm+b+8UlfjPN2uswCenpwHXW
	 hzFHBaPVFMWIGBmRF9QmavkEGhrlYgwsDCNT63wzuwQhC8AXiREkNiBoquuACM2+vV
	 PtSH6iMdnZ5YES+JO0kSC3wjz98j0PoQmJ52h6GWCmw6CavZhKw4wdNUs/txHqFDpP
	 nJ6y/TV0ByIsBxTA8mk22PWPXCQvEc7Za9Fqy2HwApbpPg0VB4wNk8tW5Gxaq4x6g2
	 dBfbn2fbuCa+QfMZaCtZfRE0VocIEkAgFec3f3n1k+aSrTGBPs/l1ssmCtIK5tGghD
	 Jx8DuOZDn/wCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62E9340323;
	Sun,  4 Jan 2026 18:41:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 061082DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 18:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAD986072F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 18:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0Kq_cJe3zUN for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 18:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3335D60728
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3335D60728
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3335D60728
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 18:41:39 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-459a516592eso4626367b6e.1
 for <buildroot@buildroot.org>; Sun, 04 Jan 2026 10:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767552098; x=1768156898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fxzo2fMbo83dN2wrTuQVfTRkit6+YMT/b3ZZ1fb27Nw=;
 b=wsjK5ceLVtbKu2nm+vFGv/lfqiqLFV8Uf2+NpO+47VC+4s90tb4/cHvQJqw1arZI3c
 +w6tjgKqV6aNUYtj1kseYRVj39LbwOHZY4Bpbr4aY95Lcyix4cQKNJ778c7hmGineDeV
 ei8UvGSBjZ1PGH9SBa3aT5OBcqG4Zt/edfXZ2FaCo33Pj8J6Me/Jzsn+XfKiJgMoxEIx
 IssuBrcoA56xfWGJeHt/QCjQCrWR/YiIA/Ffkb/btWuSPb1fX3fDuRdbun4J+AQ1fuU6
 7LfPjXx3kWBjayDR7Pq4btARCFIAj8vCCDZuzaQ9Ei+tHisjxOwmfp4m0HS8Qb5aqLcL
 dbQg==
X-Gm-Message-State: AOJu0Yx6xzeELiJDR7IYqTdMHjrCbPUdbmiSUFaBurjCbcMadDSAApHM
 fmHSC3jDEEqpnUoihTATae5gOjqQ4qUHmsqIY2LRFQm6dFmcDp6BlTYe6jfj8OTLVXZKlQ==
X-Gm-Gg: AY/fxX5Xi6bLegGqI4fnqAt0uKryEWC02ysdFqaNPQQdBhB3oeJASHpW8Xyo3R9wDLQ
 6SiPrs+5W1Sp1JxBFbA53U6Uj7Vg51unqmcsjfEYMRH0E3WCgwlan+aMGtCFGXDMlWwf5kJdUqZ
 jOZFyyo/5p8Hwi1nTeAtReeG0443Cfbt0MeI1VKYc7wa8I67+S1yECCQw2hU99vHbwLn/SeOAz+
 tTsweYpDkf1OrT8yJWOC9ztAglYX89KawOHWJpoeYgGewgvimQsC30+t89GAXNra+uICDtZf8+v
 IYgsJ+xZsQUz99KrAZijKh5LwVjkBYQJHEkBxDm/q1UWhEkEwE86uo+AVm49PoDgfvSw7/2cZ+U
 0eRyzxmli8d+EKx8W4LHHtPuVNJmaAEi7MdC40eWpkBiE0O6hwkntv7+6oxoZqx94m7fXsERXH3
 PtkoeuPU9TS9ThF4qJUuUP+H4NCiGsu9TVlTAkHKjO2Dd8ZiI9PScAMd5JQcZ4ad8YvaroAVrMV
 G+t6tqv8bU1ok3KP6YdAhNZrIX+6gbwVCMvioTyLCaeFtwJHTA1yVLlwjK+vXEEYQ==
X-Google-Smtp-Source: AGHT+IHmhcHbPKxBI9hyNvtJCEJFInQN2nCFQZsVIqf/VStUvUD0B0TW+MBjIIlnmmZ3MBm6fqoZnQ==
X-Received: by 2002:a05:6808:1205:b0:450:3534:dcb7 with SMTP id
 5614622812f47-457b21601e9mr21096735b6e.23.1767552097819; 
 Sun, 04 Jan 2026 10:41:37 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3ba4221sm22032464b6e.3.2026.01.04.10.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jan 2026 10:41:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jan 2026 11:41:34 -0700
Message-ID: <20260104184134.4078200-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767552098; x=1768156898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fxzo2fMbo83dN2wrTuQVfTRkit6+YMT/b3ZZ1fb27Nw=;
 b=YSr4enyk22UH8uvHF1vLQz/noumh9PNVIfjzfHAx186sUPp9XhQH/bHoxOg7bzpNNu
 P+F7H6X7YjTSf/MrGTh6oEL30KjAYR+at0SLplhWsBS6/6L/ECSfx+pL+f25EL4POwZk
 dr7yz75V2vUueQdeam90oPYJm02eLeo2uflc8guQmlVMs3DsXwMWiK8vGK9vN+Pwd0RW
 MXd8mIPdw57FgK/VOU7VXuW2klVK/TDb5GDS3/ju0UyXus1jEi9R4VKwIhaS4reVjHpd
 W8pPYzXgV+7epDt4iyY9+7rTLQQW6zGjSHszr1is60MULOHb3FzUcQEGf5UHDG+wVjgB
 2vBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YSr4enyk
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 12.1.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 22d1f3fe7f..257be2bebb 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a7432f8c473441996d72efdefbc49d40  pillow-12.0.0.tar.gz
-sha256  87d4f8125c9988bfbed67af47dd7a953e2fc7b0cc1e7800ec6d2080d490bb353  pillow-12.0.0.tar.gz
+md5  7be15203f5fe63d857814da49a51b616  pillow-12.1.0.tar.gz
+sha256  5c5ae0a06e9ea030ab786b0251b32c7e4ce10e58d983c0d5c56029455180b5b9  pillow-12.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  17f240ae101143707e5e7303a5d800450d9ccc7475b463cedb555cefdb3c6ece  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 19e3f8e279..4656872fe1 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 12.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/5a/b0/cace85a1b0c9775a9f8f5d5423c8261c858760e2466c79b2dd184638b056
+PYTHON_PILLOW_VERSION = 12.1.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/d0/02/d52c733a2452ef1ffcc123b68e6606d07276b0e358db70eabad7e40042b7
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
