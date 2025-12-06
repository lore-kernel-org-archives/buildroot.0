Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB38D3B7D1
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 11:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E8183DC3;
	Sat,  6 Dec 2025 11:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7nNSw7AeK3F; Sat,  6 Dec 2025 11:13:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C67783E2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765019609;
	bh=GwuuAzelTDBh9X7yvzqmu8aysYMgFXokRi2y709pewM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m4VzqgxhwSdst33/U+Euwb9w5kmL2LxfwSW8ev0Y1fNgMKN1ACTYO6uM7ZsoIM8Y3
	 n3U8FmhzTzgGb1SQiFWKux6z/luFwvvbRgPWwfZTv6WOJRz+JCaMzYRypDVE7fYacq
	 3YASpttkgMGnIyoV/tnkfjpx2fN+ObtnH0+xpwqWWWC+fzNTDgA4gQ6VljDH7nzWvJ
	 W+y4LCv1FqWf1JpwopA75A50dJOHOSZ2LId/Voo1Tx9uXf9kOGRpy/rKvSnpkKUmkm
	 WBG90wpZniS0UPgU5Hoh0AxmwmBZbwY3cQxUR2TAxDhR7EoY9T3VRogi/Dp8ydszlE
	 8qTAxieW8x0UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C67783E2A;
	Sat,  6 Dec 2025 11:13:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B771FE7
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 11:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B51B83E2A
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 11:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDTmrGPYPvYm for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 11:13:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE93F83DC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE93F83DC3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE93F83DC3
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 11:13:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55C2BA4C03BF;
 Sat,  6 Dec 2025 12:13:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43270)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRqE5-000000002kA-2UOq;
 Sat, 06 Dec 2025 11:13:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sat,  6 Dec 2025 12:13:21 +0100
Message-ID: <20251206111321.559370-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765019602;
 bh=mWsmcAP2EBpMPgV/xBE2X1LV3O4JGbLzWdehbat4q9Q=;
 h=From:To:Cc:Subject:Date:From;
 b=S0fLZWopGpAeArt6Bye9KwznXnn1ouvnzI2AQeYyaat3we+MRT5xG14idhHnDjPkc
 qEOBtGbaM7chxZPlgxWcMYGMzVWLOSIIcHi0u1cA1kXFiRKjUkmasQ5gRVh1UQ9feT
 DShKruF/m+PNwlRcM9rqtC/VrnxCZY7CEB7SWN61GFe1HWTk3IZoQ86C/YwKxGTet2
 kz1kbAAEvCcBUwVS1NQ0bamX6hGFbIiTQuLy0vDp2jZC4Y3ZqoLv2sffadRlJlOfqr
 CXuK15mtOqaWZi0RkWF7hQK1XsCIycDdsaBWXmg9YisBfF6dNAjxThwzf4bUVe5lYG
 U0zGPaHhvP7jA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=S0fLZWop
Subject: [Buildroot] [PATCH 1/1] package/shapelib: fix build with gcc-15.x
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

No autobuilder errors recorded yet.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-failure-with-GCC-15-bool-is-keyword.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch

diff --git a/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch b/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch
new file mode 100644
index 0000000000..1fde0c7594
--- /dev/null
+++ b/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch
@@ -0,0 +1,39 @@
+From bf455986557e88cce6a2a85448798e1dc05541f2 Mon Sep 17 00:00:00 2001
+From: Bas Couwenberg <sebastic@debian.org>
+Date: Tue, 23 Sep 2025 15:59:57 -0700
+Subject: [PATCH] Fix build failure with GCC 15 (bool is keyword).
+
+https://gcc.gnu.org/gcc-15/porting_to.html#c23-new-keywords
+
+Upstream: https://github.com/OSGeo/shapelib/commit/bf455986557e88cce6a2a85448798e1dc05541f2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ dbfadd.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/dbfadd.c b/dbfadd.c
+index b464432..e0a6ef5 100644
+--- a/dbfadd.c
++++ b/dbfadd.c
+@@ -45,7 +45,7 @@ int main(int argc, char **argv)
+     const int iRecord = DBFGetRecordCount(hDBF);
+ 
+     SHPDate date;
+-    char bool;
++    char boolean;
+ 
+     // Loop assigning the new field values.
+     for (int i = 0; i < DBFGetFieldCount(hDBF); i++)
+@@ -64,9 +64,9 @@ int main(int argc, char **argv)
+         }
+         else if (DBFGetFieldInfo(hDBF, i, NULL, NULL, NULL) == FTLogical)
+         {
+-            if (1 == sscanf(argv[i + 2], "%c", &bool))
++            if (1 == sscanf(argv[i + 2], "%c", &boolean))
+             {
+-                DBFWriteLogicalAttribute(hDBF, iRecord, i, bool);
++                DBFWriteLogicalAttribute(hDBF, iRecord, i, boolean);
+             }
+         }
+         else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
