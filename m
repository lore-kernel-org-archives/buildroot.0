Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77297CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48B03615A5;
	Fri, 15 May 2026 13:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wettZgA-h0q8; Fri, 15 May 2026 13:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89442615BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851747;
	bh=6CyrcX8IY3QVRVufdp5trebQv5oznC1PiNxtgiDubtk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IhTbYvg+4lFo7s9LwCJsTbQFJ2kinMAVBnVsX1PzT9WjHHK6hOiS5a3NSv5X0zIgc
	 HsTUh28bj+Wj563rrlyKy9HKAfEaHoCtt4yDscHXdZ2Loeu06T0JCQnJn1dE75wvKC
	 jwFyGEdcacM5ogY9I4GLSEZPcWinKMordyfJ8i+MDIjVax/+n9IP4VNUfJq+rEACiF
	 gzOp7UwrQilZqxMDbdmj1VQ9T8UlyPH80CqEq8u3UNJY+j9v6VB0qxOvTbv1GnZnin
	 fi4SlbAw9K264Ag2Fy5iK8eLurOpHY1rfVFkY92A/eMH1eZCwWZqFXBba6VAR5KsXA
	 ra+WOP4y/xpvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89442615BE;
	Fri, 15 May 2026 13:29:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03D8F36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA1796156A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gIAd9mBkyZai for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 318DB6156E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 318DB6156E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 829FC8634F; Fri, 15 May 2026 13:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 14:27:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9dace9acd583c473557c78dc0305cbbab7269cf8
X-Git-Newrev: 10e2083e2ddfa79130eb1ff77d5d7b5ac2715154
X-Patchwork-Hint: ignore
Message-Id: <20260515132817.829FC8634F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sqlite: patch
 CVE-2025-70873
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10e2083e2ddfa79130eb1ff77d5d7b5ac2715154
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2025-70873:
    An information disclosure issue in the zipfileInflate function in the
    zipfile extension in SQLite v3.51.1 and earlier allows attackers to
    obtain heap memory via supplying a crafted ZIP file.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-70873
  - https://sqlite.org/src/info/9766b47beb9ec72f
  - https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sqlite/0002-CVE-2025-70873.patch | 30 ++++++++++++++++++++++++++++++
 package/sqlite/sqlite.mk                 |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/package/sqlite/0002-CVE-2025-70873.patch b/package/sqlite/0002-CVE-2025-70873.patch
new file mode 100644
index 0000000000..a5b8c901a5
--- /dev/null
+++ b/package/sqlite/0002-CVE-2025-70873.patch
@@ -0,0 +1,30 @@
+From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sat, 6 Dec 2025 20:41:24 +0000
+Subject: [PATCH] In the zipfile extension, only return as many bytes as
+ Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
+ 761eac3c82]. Adjust ./configure so that it builds zipfile into testfixture if
+ ZLIB is available, so that tests get run on unix platforms.
+
+Upstream: https://sqlite.org/src/info/9766b47beb9ec72f
+Upstream: https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a
+CVE: CVE-2025-70873
+[thomas: backport to 3.50.4]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ shell.c |  2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/shell.c b/shell.c
+index de401b89ec..e2640fd874 100644
+--- a/shell.c
++++ b/shell.c
+@@ -11184,7 +11184,7 @@ static void zipfileInflate(
+       if( err!=Z_STREAM_END ){
+         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
+       }else{
+-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree);
+         aRes = 0;
+       }
+     }
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 667ee8d70e..1335d0dbb2 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -13,6 +13,9 @@ SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
 SQLITE_INSTALL_STAGING = YES
 
+# 0002-CVE-2025-70873.patch
+SQLITE_IGNORE_CVES += CVE-2025-70873
+
 ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
