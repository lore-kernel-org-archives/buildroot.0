Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A713EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ECC241FD4;
	Fri, 13 Feb 2026 19:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdZq5Ck8oUI9; Fri, 13 Feb 2026 19:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EBA841FE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011486;
	bh=4ihFgjDjeW/aLKorfhSkwl+/MPQowwkPeY7xbiDr0P4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IrfIUcF5MjrpsqZUXq9A1KHgalXT9+ezOoMB8Su9wboj/ENLhKMgyW8E883+CTZ1O
	 Qw9gHZnFBNSmzn0zahGyNiKs2Z2/RvKSjMHGZ0OaK3bt+gQeySP5RFWRhLXwlm1SjG
	 Q5W7XKY6kRj7dezpl2uQfsHb5w9Zu00idXGpc5N37FcDI09m1yL5TlYVd5vF8y4KPJ
	 Yr0JjH14Cx3t9FJao4m7wAELjSo4DaAgFfySUFXvxrxFSr7ELWqfUGIsM+F1SXBrOM
	 vkSNhvb8wNX/2nKAn4gXUgCKXG08SKnf9FSPe1oIRNGne4/YjyzO8y7YL3VDM9MN2O
	 F3EqmaSaP85xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EBA841FE8;
	Fri, 13 Feb 2026 19:38:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DAC63EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20040412D9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dmrciwekBii for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5810041280
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5810041280
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C291840C2; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:17:21 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 40bd55e736b50a78e4eccadbc259e69fc45e563a
X-Git-Newrev: 5746e771d402a9334bf220713a79551770cc74ef
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.4C291840C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/shapelib: fix
 build with gcc >= 15.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5746e771d402a9334bf220713a79551770cc74ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes:

  https://autobuild.buildroot.net/results/ed00b43f56f7fcc7b733059790c04bd15ef30325/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 42d6c6ab687be17f62219884e74d808ef190deb7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
