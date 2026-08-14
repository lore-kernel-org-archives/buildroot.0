Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58160C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E9E381300;
	Fri, 14 Aug 2026 13:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgPD7EmGHM3p; Fri, 14 Aug 2026 13:20:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C04A81371
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713622;
	bh=U6HtIpuhTapLOghuFVNDHA7PCUB3fpjVAtXh17ylxms=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZxQq861wwr/TPqtgi90NBmjG8YghJAOEAy4SfGadC3M6EvVfLsMT6D9aDryTDDcxE
	 N27VKVjovEzyK2N3YKI/AAg2nx1Tc8wD5Sc4OE91DzHj22rR2i4jjagA0TwDrljUGW
	 PqCuuYqDdtLSOroVnYEdM8ojuq5/4AKZEtMQdoE3dB5KxOj0gUyHmuVQRfKqdURq57
	 VlLzjpRgLVPbEj4Om4gzXBd/kjKUiW3G9oAGCq5+LaePudkg3W4zuFXiFSXi1AX0ME
	 pATS7Hk4FMMr+H9fyfWsXW3IdbefR9j99nDNj74xeSNXqocheqnWeaegkX7bQtxM+i
	 jeJ8Cm3St4WiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C04A81371;
	Fri, 14 Aug 2026 13:20:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3E4033B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 964826068A
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gudOiud-bN7p for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A146C60817
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A146C60817
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A589A8D667; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:44:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d94c3fa54a99cbd2560d9f7c2f3c0edd50d1f534
X-Git-Newrev: 4cc800effef9297f90c8bd845c7777cd99789157
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.A589A8D667@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sqlite: backport
 patch for CVE-2026-1182{2, 4}
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4cc800effef9297f90c8bd845c7777cd99789157
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/sqlite/0003-CVE-2026-11822.patch | 29 +++++++++++++++++++++++++++++
 package/sqlite/sqlite.mk                 |  3 +++
 2 files changed, 32 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
