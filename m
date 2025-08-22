Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9769BCA0EED
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 21:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DCE640CC0;
	Fri, 22 Aug 2025 21:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzZxkyt_6cDn; Fri, 22 Aug 2025 21:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02F3640CB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02F3640CB7;
	Fri, 22 Aug 2025 21:48:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD3142E
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAF5760E44
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQ1HOQDxC6r7 for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 21:48:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80F1960E4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80F1960E4A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80F1960E4A
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:48:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B7DF34E40BD2
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:48:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 93A6A604AD
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:48:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 95C2A1C22D815; 
 Fri, 22 Aug 2025 23:48:44 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Aug 2025 23:48:41 +0200
Message-ID: <20250822214842.4059360-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822214842.4059360-1-thomas.petazzoni@bootlin.com>
References: <20250822214842.4059360-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755899324; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=fvggvPKNbAFxyT9TYAAHHaU2MZK5IWG3PMsKU6W4yHs=;
 b=cp8RtIXbGPn3AQ9JPFxCmQ5HNngfld4IQ7hzQxRS3wbo1Y2XjfGbBEquXyp9PkEsQjtPvF
 lTnSttt0cLJnW6Qw+vKELCRRNsubkHta4dpb4byWa2xskQYQ9swi3cybH+NnwEU0F32Cg6
 5Duh+ISpRBhuxhsk7He2eiRpQ+hl/YBC0+x7izsVkxglUZ9G4QlMWcy7mpcgaYio/9GE5o
 uePXN5GripqtyhuOfVPEOKKuv74BpmjLYZzAg7wiK8CwzPBJRb6fY7XB33A7ZqCYFz+XhJ
 b21iN2AzG/bDinRfHyeE4Lv4mGRzERzrh7R0sKasymgpECS29yf6ubhXy6hKtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim
 header.b=cp8RtIXb
Subject: [Buildroot] [PATCH 2/2] package/gdbm: bump to version 1.26
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

1.24 -> 1.25 changes:

  https://puszcza.gnu.org.ua/forum/forum.php?forum_id=1362

1.25 -> 1.26 changes:

  https://puszcza.gnu.org.ua/forum/forum.php?forum_id=1367

We can drop 0001-C23-compatibility-fix.patch as it is upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdbm/0001-C23-compatibility-fix.patch | 158 ------------------
 package/gdbm/gdbm.hash                        |   6 +-
 package/gdbm/gdbm.mk                          |   2 +-
 3 files changed, 4 insertions(+), 162 deletions(-)
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
diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index a9df48908f..7b4a3ce1b3 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,6 +1,6 @@
 # From https://www.gnu.org.ua/software/gdbm/download.html
-md5  c780815649e52317be48331c1773e987  gdbm-1.24.tar.gz
-sha1  7bd455f28c9e4afacc042e0c712aac1b2391fef2  gdbm-1.24.tar.gz
+md5  aaa600665bc89e2febb3c7bd90679115  gdbm-1.26.tar.gz
+sha1  6cee3657de948e691e8df26509157be950cef4d4  gdbm-1.26.tar.gz
 # Locally computed
-sha256  695e9827fdf763513f133910bc7e6cfdb9187943a4fec943e57449723d2b8dbf  gdbm-1.24.tar.gz
+sha256  6a24504a14de4a744103dcb936be976df6fbe88ccff26065e54c1c47946f4a5e  gdbm-1.26.tar.gz
 sha256  690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 1a2c352d71..8c739af662 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.24
+GDBM_VERSION = 1.26
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
