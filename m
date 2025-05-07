Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537B5C3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 13:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0AA083281;
	Wed,  7 May 2025 13:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEYYDUOZWqMZ; Wed,  7 May 2025 13:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 097A281FBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 097A281FBF;
	Wed,  7 May 2025 13:01:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41D6A950
 for <buildroot@buildroot.org>; Wed,  7 May 2025 13:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 276D660FBD
 for <buildroot@buildroot.org>; Wed,  7 May 2025 13:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VhQ1hU4MVbY for <buildroot@buildroot.org>;
 Wed,  7 May 2025 13:01:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2A1060B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2A1060B6B
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2A1060B6B
 for <buildroot@buildroot.org>; Wed,  7 May 2025 13:01:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so185144666b.1
 for <buildroot@buildroot.org>; Wed, 07 May 2025 06:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746622873; x=1747227673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PDmJyd52NNDNHa5IGOuWxdc6aBTxQ+bL1aFuUNVIF0E=;
 b=SBF31y8Bnd8NKe0wsgf3eUKaUJwlc9MWhPq7WRSkM07J8Pgq5imHBmMzjkeo3OBIRM
 3W0f5paDW6YzkHjk7um/sRck+4gLUWuFsMclasqdkkjH2jVGUnUshU9qkd2BB/OegpPz
 TZt2L7xxpUELss2FOKv3QhEz6om0NKqTZ+0kaiJGu1CcDQLRzd4rMmNsftC5U8am8/af
 j7UwLUaeartsIZi+eQcJRTDF0EmgMaIaCgjrWs2x+kqE7ScDdW/QlgKpH5926CxRLqhI
 eNYmJde/DaogfbkNkmuzu2+qX8aDT40U+tG1hymU7d1tTXnUoE+22MVBpI3s5qzSX6Da
 x1Yw==
X-Gm-Message-State: AOJu0YwX8SNoHZqCOBEt+YE/nImMadXEjvrIi6CmIKmHzhllGhqYNMOV
 53nmZ4OE+m5HY0ExUvIq8cq+ZprRZ+x62n84OtH1aUb65wL2pnBlaSUruiwsc+sJiI7Kza7QPhA
 hgIs=
X-Gm-Gg: ASbGnctShUHKC9HEJOM+6vBDH7iwETVjSP4hlra2FRhSDfFZQ7pbvV2wPvQ8+eLtgPc
 tu1pkOl9U+UUeFzG1zyk9t6xPbl6JyGciB7pPfSZTRwWJ1BYCQprcRnLD9erqIDUPoGltqERSXh
 nqHnSnRyqFfwPXR9bMolk3aWc9HdM9hMsmSjWBaw7Fejv4aN8JK3ZwJtJwqkYtcCA/bEOopHwJj
 fTLfALvz0y0/sPhAbb5Vjvzc3Qi9lBN/WPoGmojHRcdDfQVPry+DM9jGeDr0vArQL69sNTeXDkv
 XZ1XVX5h4a6F9DJ0LUrnjiZ7Shbd5Ga3VEUl+4ZKb+5e/h6pEQvU4w==
X-Google-Smtp-Source: AGHT+IF+Cob9/V7FkPMypD4pKgjGkhDf5V+0NEcE7lkaHvAwk/AUTmht01SwNjdjMP6hvLr1X5nU0g==
X-Received: by 2002:a17:907:9494:b0:ad1:e67c:790 with SMTP id
 a640c23a62f3a-ad1eaf5cfb0mr316608666b.7.1746622872543; 
 Wed, 07 May 2025 06:01:12 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c02f3sm917776866b.92.2025.05.07.06.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:01:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Wed,  7 May 2025 15:00:44 +0200
Message-ID: <20250507130044.1040159-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746622873; x=1747227673; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PDmJyd52NNDNHa5IGOuWxdc6aBTxQ+bL1aFuUNVIF0E=;
 b=cqPdlOOyxOdfgvlMtG7FTqKEW9tu5/4sSO9DjO0u6H0mpSRr+F+BLRwIdJjG5Ib6fl
 LA9yf6hHiLLOII1K98vKc0zJBh24AMm/zDsAH6SuhR+mNPJU0UzZVQSA9qUurayKsD2H
 4x49nwi8C5BQy5FKe86YVpNQ5B75AULDEJsPHBfq5cYrXJaWIukb2ckIOp/BXMmVpG2B
 +ZbeBAYruQvO9A15Q2UZ+GiGRo6AbN2dwOGHfANuHpGe9EdnV2zwSagzCED16AVDqbci
 rU/EXlNcsDIQVVSIKQyB7TnCG7IB7jk8e8OciBkhPQu1sZK1M9bbZLGaw/Syw6ee2YQn
 yZYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cqPdlOOy
Subject: [Buildroot] [PATCH] package/sqlite: add patch to fix CVE-2025-29087
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch was commited upstream, and released as part of sqlite 3.49.1

However, the configuration system changed between sqlite 3.48 and 3.49
from autotools to autosetup, and this has proven challenging to support
in Buildroot (see `git log package/sqlite`), hence why we are still on
sqlite 3.48.

Therefore, until the package build infrastructure correctly supports
building sqlite 3.49, let's simply import the upstream patch to address
the CVE.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...ast-to-avoid-32-bit-integer-overflow.patch | 33 +++++++++++++++++++
 package/sqlite/sqlite.mk                      |  3 ++
 2 files changed, 36 insertions(+)
 create mode 100644 package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow.patch

diff --git a/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow.patch b/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow.patch
new file mode 100644
index 0000000000..b9904785c1
--- /dev/null
+++ b/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow.patch
@@ -0,0 +1,33 @@
+From f4fc2ee20311a0a5141726c71d318ab52001c974 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 16 Feb 2025 10:57:25 +0000
+Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
+ concat_ws() function with an enormous separator values and many arguments.
+
+Fixes the following CVE:
+  - CVE-2025-29087: In SQLite 3.44.0 through 3.49.0 before 3.49.1,
+                    the concat_ws() SQL function can cause memory to be
+                    written beyond the end of a malloc-allocated buffer.
+
+For more info see https://nvd.nist.gov/vuln/detail/CVE-2025-29087
+
+Upstream: https://sqlite.org/src/info/498e3f1cf57f164f
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/func.c    |  2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/manifest b/manifest
+index 2f7a6368f8..9f03427425 100644
+--- a/src/func.c
++++ b/src/func.c
+@@ -1570,7 +1570,7 @@ static void concatFuncCore(
+   for(i=0; i<argc; i++){
+     n += sqlite3_value_bytes(argv[i]);
+   }
+-  n += (argc-1)*nSep;
++  n += (argc-1)*(i64)nSep;
+   z = sqlite3_malloc64(n+1);
+   if( z==0 ){
+     sqlite3_result_error_nomem(context);
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 218b3f0a1d..05e305ac17 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -13,6 +13,9 @@ SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
 SQLITE_INSTALL_STAGING = YES
 
+# 0002-Add-a-typecast-to-avoid-32-bit-integer-overflow.patch
+SQLITE_IGNORE_CVES = CVE-2025-29087
+
 ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
 endif
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
