Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAFBC71148
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 02:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D673D80A72;
	Fri, 13 Jun 2025 02:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsA1zNsM89vZ; Fri, 13 Jun 2025 02:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 161E580A4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 161E580A4F;
	Fri, 13 Jun 2025 02:02:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6867183
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 02:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9F5040057
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 02:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5so1lx4o3n1x for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 02:02:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1789C4051E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1789C4051E
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1789C4051E
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 02:02:33 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e7b3410e122so1512066276.2
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749780152; x=1750384952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g5u8Nn1yEw8zRK6jFPfcykHtLj7lTrWB6NqhiokApOI=;
 b=P9G0cWxSQfUt3gIFhZeFfGE740vrTZooqbMRFC7hQvwoYstnB9PaZpS2VXoKsT5uWD
 3ygAXLVmdepRuEeWLZU4+4N23z20eS8PjNWD6sUpcBi5RS6kOnd1ro8eH91x/HD2lkcC
 aQC34G1mJLmkAWiS7F4I3Jb16l/cHqu7eLeJDNjKV2fJCuH4PTjr8odWaSsRW+3I6t/B
 MUxCFPExto4YuaTpxZuEoG9PxI0YtcJrIHC7HVDLikja+DLWqbhkl8swrL2h2vFd7m3Q
 H6sPkb+XsOBU3zjnwLkgspWX4xKgKy45AkFGSXsdInkyD1yjq0LbpUYm0ne8G8LgtW0R
 +Usg==
X-Gm-Message-State: AOJu0YznTRp4fE3afDbq25FUPvFb48WweZAAdbyjR6GaE4HQdQp8aIfQ
 tSA6k67mdtiqYg49/PoPnGrHqmxc75P1+7R+z9zVojBRlQ8ZeJDoppCn6JU+8A==
X-Gm-Gg: ASbGncvkDRftKQtuGlAkHH/6qAUr2nFR/WLXo+weTl5an40Jd4gC+cMTpfLyEz7TAGl
 y5Va15i3jkXIw4/bsCeI2vKYf2BA8OfHDozA6/sA4XW5ROHczGoHE7C7MagxneMMGCqlduo2iQY
 2tOwJ3Ksag3ZV57wA1+Fqd/UIx2GUHZ4zbcJHDECp9UOlpKW0fT4SvtKSmia4isZKSzxFjCoL+A
 IEPOYZQc6Z1gh4Cv0+76WnwDwKL4rpFPDq/GGCOcrtxEMAqYQQEeFV4CT/wCDK8or5mMGmSL0hj
 Ay398goxDxtCp8GnarHNKzzDo4e5elZAWGqr58kldjOK7ZaSzRlMjPxNBO0=
X-Google-Smtp-Source: AGHT+IGw+BCpmC/g6xFIJ85D95h3imRxUr23J0Mp8f6sU/UIMt7kUUwcY8yulgPV5I6WzNEc/tEjgg==
X-Received: by 2002:a05:690c:7246:b0:70e:7638:a3a9 with SMTP id
 00721157ae682-711637ea388mr24063557b3.18.1749780152272; 
 Thu, 12 Jun 2025 19:02:32 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71151986ff4sm5051287b3.0.2025.06.12.19.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 19:02:31 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 13 Jun 2025 10:02:18 +0800
Message-ID: <20250613020220.462260-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749780152; x=1750384952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g5u8Nn1yEw8zRK6jFPfcykHtLj7lTrWB6NqhiokApOI=;
 b=MxeIgUKrb+nSBW161b3t22el1UbpKM+9V6E2+udX1V19G607gWrP2ZROlmBpvCAEKC
 AIONP1mW0oHcHt7Gqf0a0ntS5QD/JD3bxphJtgG3gI/WLhasHAsRL+TFmmbsZ8iTH8Kw
 Zi6s1vPk5nIO8Nkxlc90xtF0/Z67D7Z/K10QJIdp/pCAQlNYTLDjHG3uXNg4mxdIo5fs
 WL/O1F8u15Ai+6ex+q6VuVuvuizq7B7PxJ2RS2hJH39TyO8z4f6zAs1k/XBa3CILF7Sy
 +sJmyuOk44zADQ4DMXVuyupNhfRkED/qaK8Wfvvc8NW+tN4SN78c/La7tAFeye8FsDXs
 77Xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MxeIgUKr
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.20.3
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

Release notes: https://github.com/timescale/timescaledb/blob/2.20.3/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 4ca325b2d7..440c5a1371 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b6ac4c29ef29e93249fcc25bf193dab2637422797360b12e00fd73067138a953  timescaledb-2.20.0.tar.gz
+sha256  31418d888c2a26cd034cd91fcd51be3bb0108d907de9bf9e8bfebfbf20af7766  timescaledb-2.20.3.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 00e2eb81ea..37c249ee9f 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.20.0
+TIMESCALEDB_VERSION = 2.20.3
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
