Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B8FE7DEF0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54FBC40B72;
	Mon,  2 Feb 2026 14:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSPHMeAybKI2; Mon,  2 Feb 2026 14:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66BDD40B6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042034;
	bh=F/oAt/RHDLGW9w6Vai4AqG/cJCX9hwbaUMezcdvPNks=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BHwYH/ZnaQTrDbyrBsQPTb8UXXCNeU4s0eWqRFzrnAequz169OQWbdaFnm5b9uPd5
	 Ao5Jal65AU6QWf4WlMps05W9nI0ddjJPjZQA365gXYIrufQHhfoYDl42BTAxpXLmwP
	 jNDCwquHv9ii/JVeGIKbcR7Kyktp1D933xSu07FQm33tz+i6mie7P9A36XDgr6Dn9z
	 FbZpgsvSu3dqUTwKwR7yVRBhvIFtTBj1lZ4N46Keac6rUFhGZovvHfywdyLeoxsjEa
	 wknyBU2YwR9KmKTRrP5Try2BnTwo0G5saDRB95p7U8h7rrRa7NYH8U//GZrf+FiiCW
	 CpkSxQzz1zf0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66BDD40B6E;
	Mon,  2 Feb 2026 14:20:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E8B1149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C37540A47
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGE1l67C_e7K for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2900940A46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2900940A46
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F57086350; Mon,  2 Feb 2026 14:20:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 15:18:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 926381d360082e926cb6be28cb1e97639d26ea0f
X-Git-Newrev: 42d6c6ab687be17f62219884e74d808ef190deb7
X-Patchwork-Hint: ignore
Message-Id: <20260202142030.0F57086350@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shapelib: fix build with gcc >=
 15.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=42d6c6ab687be17f62219884e74d808ef190deb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://autobuild.buildroot.net/results/ed00b43f56f7fcc7b733059790c04bd15ef30325/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...build-failure-with-GCC-15-bool-is-keyword.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
