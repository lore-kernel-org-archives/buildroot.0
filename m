Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5F1C5B56A
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 12:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5792B608F4;
	Wed, 12 Aug 2026 12:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYODPmdid1gx; Wed, 12 Aug 2026 12:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AA13608FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786538120;
	bh=cfMgHvKuO6jUtgaW/09VfRY/rGAgEBYrxtB13G8EwIc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=nDl5vCeC62CTLheI9PbCWezdnQGC9EYrfA9twroF28J8L02dEMos6p7BY6jDdE0C7
	 hL2+G2E0+qi4k1wnCVPdZuC/BCk4mQz7RIQvEEZ3ZUOe5TnWnNsDTzcLz31dTqeZiv
	 kgwa3YsVotwXzn+RcQFqMEWPqn6y99eKHMqiiDmC1v16nv91UTYPBe1R9Cb4+7E9kl
	 6KIBdYOZaYlJlkK6Dh6m7sJgQP3KP00FcL54Uf0j4uDdax/AE6FT/416s/frugkUdd
	 NP5zKJjiuAtjfTzHHYGd9FoViZpboU3XZizeOWmeE/k+/p45FgWRIMAk7HivD0tSJ3
	 fD8k5u9WbdNSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA13608FA;
	Wed, 12 Aug 2026 12:35:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE00B3A4
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 12:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FF08608FA
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 12:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9TYMiD-Kqe4 for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 12:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4AE97608F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE97608F4
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AE97608F4
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 12:35:17 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47de008b020so542785f8f.1
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 05:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786538116; x=1787142916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/+HAGl/2tP3IoszlteTNA7zJTesBGx/vN4wrcIRo7yQ=;
 b=dfZuo3+X3dc6Hq2OyCGL4Ofk53V4eK1BR87fiDxdb/ruPQRuIQvtKPYL1wgVY84M/H
 jtuExER3BhZpxZnMCFJ3ySAj2e/HIZAMvtqztLYfD4n68hWHk6GQFVaYNor4yxesXSwl
 Kmz6Ag5Hn19s7ScsnNNkkd9aRDMgNarC8F0sHzB0m2e86dqQXaVGdq17fjDsbceKiw4e
 UBFaagzejrSU56ywrntGFHgnYRDLzQa3GPnui4SJClZnkqlNctScGkrN3+Tho5Odresv
 /UiKcybpJXZO8G38kVBz1rvI+aBE1DEjvVz7GipodZH7JH9p5IekxAJTzbQQEWIDdkJg
 D2Gg==
X-Gm-Message-State: AOJu0YwrhgB36uuYR2fz0RXhmQpn6Ej2C2OOPrTyE2WqT598COQQ7Rd+
 DYNFQwe4RBDydR7FEb3akRBQL4Gxkz8rOqzjWS/45fv2hN/xXuZHSfcLg4rJNs5+btprWqA5Kff
 IG4gW
X-Gm-Gg: AR+sD112IyZ0OQkXU8UpCz3uCDWCZpPBfbAlZkxfqOJ7I+qHMVVHpuF3gvQgpAGwkzl
 hmxn6BXVuasfPKGh+PDsctDeBwM2wXombSHU9Z02zlhhLbtKxjhB38RV67JZe01LEcTf+lTq76w
 BIiHLYleVfEgaxy3cgnPNlqGTgk/y+dvxcCpTuVjy3nD2hygdIh+qsmCvyxH2TBHeX2SHwxrnHN
 sIal77iFHrzzmcJ+mgAmnRvig4PuhGOolq1g9y8x6t1RHUIco5UC56ky42jPs8i9GnJTb39uHrJ
 NIgQ5nOL+nBFvhNfq8VEf7SH4uxsY066D3wJFbgxoyqBl+ZtQt/ht3HSzoXv5cIBmfQa6Zu0hvR
 XZ/Q6rxQXHs80/xkT7KFwBBMAHWUCAy5MheH2TAvXcmDJIbZoaBxeRGDRoK+vkBKD2YnsLvqxrI
 4dGLmk1DtMEVWm96vg2yiFEhcvl0f3Tka9sb9O1roaaicD/SKsX/Y1
X-Received: by 2002:adf:f3d0:0:b0:47f:8b0f:7172 with SMTP id
 ffacd0b85a97d-4814fed60e9mr7443703f8f.6.1786538115839; 
 Wed, 12 Aug 2026 05:35:15 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150bf5f27sm6874711f8f.1.2026.08.12.05.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 05:35:15 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 12 Aug 2026 14:35:15 +0200
Message-ID: <20260812123515.177856-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786538116; x=1787142916; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/+HAGl/2tP3IoszlteTNA7zJTesBGx/vN4wrcIRo7yQ=;
 b=ChuxDUTVFT1jaNhputJIFEoEsXtC1WEZKXNjk2EVhsyoHHpWHL39w4mHhVybpCIs2S
 jTB0YIcbc6urZRrc4sjEzc9uoRTJJmFz26FYzed9RYFi5YpNUeWBI8xcK+t7x9aA4khA
 /VqPvqA1S4myX2Epo6NbG3xC1++lLULyR3mVpQ+R7W2y0+TgQBrF1YVjILQAr6Mhpj0p
 PL9w9APMMpUDNmpdg0Vrjiu7rKDDn3JE7ur0ipnscqlnhv+LMisbdTpNGuRjD/MDmMW6
 HdlJZlD9tzHSRsD9RljsrGcCaRYPFBNfEaFKgOJfXt24LIZpPUrn8ga9JRao8+NWX67+
 kNMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ChuxDUTV
Subject: [Buildroot] [PATCH 2025.02.x] package/sqlite: backport patch for
 CVE-2026-1182{2, 4}
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

- CVE-2026-11822:
    SQLite before 3.53.2 contains memory corruption vulnerabilities in the
    FTS5 full-text search extension that allow attackers to cause process
    crashes, memory exhaustion, or arbitrary code execution by supplying a
    crafted database with malformed FTS5 page data. Attackers can trigger
    an out-of-bounds read in fts5LeafSeek() via an attacker-controlled
    loop bound and a heap buffer overflow write in fts5ChunkIterate()
    through a crafted continuation page causing an integer underflow,
    exploitable when an FTS5 MATCH query is executed against the malicious
    database.

- CVE-2026-11824:
    SQLite before 3.53.2 contains a heap-based buffer overflow
    vulnerability in the FTS5 full-text search extension that allows
    attackers to cause a crash or execute arbitrary code by supplying a
    crafted database with malicious continuation page metadata specifying
    a szLeaf value smaller than 4. Attackers can trigger an integer
    underflow in fts5ChunkIterate() causing an inflated remaining byte
    count during FTS5 MATCH query processing, leading to a heap buffer
    overflow of attacker-controlled data in applications compiled with
    SQLITE_ENABLE_FTS5.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-11822
 - https://www.cve.org/CVERecord?id=CVE-2026-11824
 - https://sqlite.org/src/info/061febcf41ca
 - https://github.com/sqlite/sqlite/commit/e0b995b2a62b78979eb65bb8dadfa912eaa8e62f

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sqlite/0003-CVE-2026-11822.patch | 29 ++++++++++++++++++++++++
 package/sqlite/sqlite.mk                 |  3 +++
 2 files changed, 32 insertions(+)
 create mode 100644 package/sqlite/0003-CVE-2026-11822.patch

diff --git a/package/sqlite/0003-CVE-2026-11822.patch b/package/sqlite/0003-CVE-2026-11822.patch
new file mode 100644
index 0000000000..c7386c0a9b
--- /dev/null
+++ b/package/sqlite/0003-CVE-2026-11822.patch
@@ -0,0 +1,29 @@
+From e0b995b2a62b78979eb65bb8dadfa912eaa8e62f Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 11 May 2026 12:00:19 +0000
+Subject: [PATCH] Fix potential buffer overwrite that could occur in fts5 when
+ processing corrupt records.
+
+CVE: CVE-2026-11822
+CVE: CVE-2026-11824
+Upstream: https://sqlite.org/src/info/061febcf41ca
+Upstream: https://github.com/sqlite/sqlite/commit/e0b995b2a62b78979eb65bb8dadfa912eaa8e62f
+[thomas: backport and remove tests]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ ext/fts5/fts5_index.c           |  2 +-
+ 1 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/fts5/fts5_index.c b/ext/fts5/fts5_index.c
+index 164d613881..29be766042 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -245146,7 +245146,7 @@ static void fts5DataRelease(Fts5Data *pData){
+ static Fts5Data *fts5LeafRead(Fts5Index *p, i64 iRowid){
+   Fts5Data *pRet = fts5DataRead(p, iRowid);
+   if( pRet ){
+-    if( pRet->nn<4 || pRet->szLeaf>pRet->nn ){
++    if( pRet->szLeaf<4 || pRet->szLeaf>pRet->nn ){
+       p->rc = FTS5_CORRUPT;
+       fts5DataRelease(pRet);
+       pRet = 0;
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 1335d0dbb2..9b0a396c7b 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -16,6 +16,9 @@ SQLITE_INSTALL_STAGING = YES
 # 0002-CVE-2025-70873.patch
 SQLITE_IGNORE_CVES += CVE-2025-70873
 
+# 0003-CVE-2026-11822.patch
+SQLITE_IGNORE_CVES += CVE-2026-11822 CVE-2026-11824
+
 ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
