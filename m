Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F1BCA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 876FD61500;
	Wed, 10 Sep 2025 21:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STNSbtxubybR; Wed, 10 Sep 2025 21:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABE07614D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABE07614D7;
	Wed, 10 Sep 2025 21:38:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EFFA92BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E20B9843BF
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDwZnIIuusf9 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:38:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7782843B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7782843B9
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7782843B9
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:38:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 487584E40BA4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:38:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0D594606D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:38:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E8FF102F2A7C; 
 Wed, 10 Sep 2025 23:38:31 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Sep 2025 23:38:28 +0200
Message-ID: <20250910213829.1532317-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540311; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Fbm0KKA1/VEEBtBNIlA810qthbkGULvzINHZgqiPkGY=;
 b=OWODAbbDmZeDA0HvxETGtTt3VBMlwpF575+8EX/t2a5xD98hyF4e8ycb1ZZzGNbUVlokN4
 gkqFLhdfSaJRAe/9bjH0X9RAnGDZKJFnv64owJWj8nByqveig5RISQAsqyT/N30xyZPBLO
 26XmgH3brCI2HTVj83PZIfmWpALxwuu4Y5mV4Xnwv0wVaDL68kHBRLmcQfEzWUBN4NLWAi
 dHL3N+kBmUUjPTBVBitaDaZFZ0xTl7ARdw8SJ6LtzBdAQLIA5xB2DKVC+WkNW9ZSrPd2Ib
 mRDIhUkZW5Snx19PWi1wvGaUA621i0BxjqodhWOLHkZRXmn+PJTD5sPqDtzFdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim
 header.b=OWODAbbD
Subject: [Buildroot] [PATCH] package/gdbm: drop patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0001-C23-compatibility-fix.patch was added by commit
bbec805717167714ee6b22b8c8b2ddddcce47ea4, then removed by commit
2dd20212f2edb3a763d9251dce157956245bec09 that bumped to version 1.26,
but for some reason 25918f455c61b487cc29e3cfb8ece0e35db96aa1 re-added
it, probably due to some issues in the next -> master merge.

Let's drop the patch to fix build issues.

Fixes:

  https://autobuild.buildroot.net/results/0341d8284d9a069533b55103c1666b90467306d4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdbm/0001-C23-compatibility-fix.patch | 158 ------------------
 1 file changed, 158 deletions(-)
 delete mode 100644 package/gdbm/0001-C23-compatibility-fix.patch

diff --git a/package/gdbm/0001-C23-compatibility-fix.patch b/package/gdbm/0001-C23-compatibility-fix.patch
deleted file mode 100644
index 87fd94e196..0000000000
--- a/package/gdbm/0001-C23-compatibility-fix.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 238315e9f4f547dff4f5b9dff2f903385a8048cb Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Sun, 17 Nov 2024 22:58:54 +0200
-Subject: [PATCH] C23 compatibility fix
-
-This fixes https://puszcza.gnu.org.ua/bugs/?642
-
-* tools/var.c (union value): Rename bool to b.
-
-Upstream: 734f69451392ffb6280d8a3aef51e2673c9b8554
-[Thomas: needed a few backporting adjustements]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- tools/var.c | 32 ++++++++++++++++----------------
- 1 file changed, 16 insertions(+), 16 deletions(-)
-
-diff --git a/tools/var.c b/tools/var.c
-index 0f285f1..c553ae5 100644
---- a/tools/var.c
-+++ b/tools/var.c
-@@ -27,7 +27,7 @@
- union value
- {
-   char *string;
--  int bool;
-+  int b;
-   int num;
- };
- 
-@@ -90,7 +90,7 @@ static struct variable vartab[] = {
-     .name = "confirm",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 1 }
-+    .init = { .b = 1 }
-   },
-   {
-     .name = "cachesize",
-@@ -114,32 +114,32 @@ static struct variable vartab[] = {
-     .name = "lock",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 1 }
-+    .init = { .b = 1 }
-   },
-   {
-     .name = "mmap",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 1 }
-+    .init = { .b = 1 }
-   },
-   {
-     .name = "sync",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 0 }
-+    .init = { .b = 0 }
-   },
-   {
-     .name = "coalesce",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 0 },
-+    .init = { .b = 0 },
-     .sethook = coalesce_sethook
-   },
-   {
-     .name = "centfree",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 0 },
-+    .init = { .b = 0 },
-     .sethook = centfree_sethook
-   },
-   {
-@@ -252,21 +252,21 @@ s2b (union value *vp, void *val, int flags)
-   for (i = 0; trueval[i]; i++)
-     if (strcasecmp (trueval[i], val) == 0)
-       {
--	vp->bool = 1;
-+	vp->b = 1;
- 	return VAR_OK;
-       }
-   
-   for (i = 0; falseval[i]; i++)
-     if (strcasecmp (falseval[i], val) == 0)
-       {
--	vp->bool = 0;
-+	vp->b = 0;
- 	return VAR_OK;
-       }
-   
-   n = strtoul (val, &p, 0);
-   if (*p)
-     return VAR_ERR_BADTYPE;
--  vp->bool = !!n;
-+  vp->b = !!n;
-   return VAR_OK;
- }
-   
-@@ -286,7 +286,7 @@ s2i (union value *vp, void *val, int flags)
- static int
- b2b (union value *vp, void *val, int flags)
- {
--  vp->bool = !!*(int*)val;
-+  vp->b = !!*(int*)val;
-   return VAR_OK;
- }
- 
-@@ -307,7 +307,7 @@ i2i (union value *vp, void *val, int flags)
- static int
- i2b (union value *vp, void *val, int flags)
- {
--  vp->bool = *(int*)val;
-+  vp->b = *(int*)val;
-   return VAR_OK;
- }
- 
-@@ -414,7 +414,7 @@ variable_get (const char *name, int type, void **val)
-       break;
- 
-     case VART_BOOL:
--      *(int*)val = vp->v.bool;
-+      *(int*)val = vp->v.b;
-       break;
-       
-     case VART_INT:
-@@ -461,7 +461,7 @@ variable_print_all (FILE *fp)
- 	      break;
- 	      
- 	    case VART_BOOL:
--	      fprintf (fp, "%s%s", vp->v.bool ? "" : "no", vp->name);
-+	      fprintf (fp, "%s%s", vp->v.b ? "" : "no", vp->name);
- 	      break;
- 	      
- 	    case VART_STRING:
-@@ -647,7 +647,7 @@ centfree_sethook (struct variable *var, union value *v)
- {
-   if (!v)
-     return VAR_OK;
--  return gdbmshell_setopt ("GDBM_SETCENTFREE", GDBM_SETCENTFREE, v->bool) == 0
-+  return gdbmshell_setopt ("GDBM_SETCENTFREE", GDBM_SETCENTFREE, v->b) == 0
-          ? VAR_OK : VAR_ERR_GDBM;
- }
- 
-@@ -656,7 +656,7 @@ coalesce_sethook (struct variable *var, union value *v)
- {
-   if (!v)
-     return VAR_OK;
--  return gdbmshell_setopt ("GDBM_SETCOALESCEBLKS", GDBM_SETCOALESCEBLKS, v->bool) == 0
-+  return gdbmshell_setopt ("GDBM_SETCOALESCEBLKS", GDBM_SETCOALESCEBLKS, v->b) == 0
-          ? VAR_OK : VAR_ERR_GDBM;
- }
- 
--- 
-2.50.1
-
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
