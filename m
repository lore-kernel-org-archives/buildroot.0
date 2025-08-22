Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED752CA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 21:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D31840CAA;
	Fri, 22 Aug 2025 21:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9OGd5Vx42dw; Fri, 22 Aug 2025 21:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD77840CA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD77840CA4;
	Fri, 22 Aug 2025 21:48:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ABCE11C7
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9268760E46
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmegVvvOF33w for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 21:48:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80EFC60E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80EFC60E44
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80EFC60E44
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:48:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9E4064E40BD1
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:48:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5D841604AD
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:48:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 636E01C22C887; 
 Fri, 22 Aug 2025 23:48:43 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Aug 2025 23:48:40 +0200
Message-ID: <20250822214842.4059360-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755899323; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=7JRqgsTTd/O5jhSz+9DsnyAkksxp86p3cAhjATBIYVA=;
 b=z+MQiSkRwOMH+oiQZIubKpNcQPcEmF+O9D/twT9wXDYmGJ4QCTYg1JUlehWsYChfCvbgl6
 3tvIzU+mh7nkKlgtB0nrC6Hwg462QoWblC7HEwk77Ki0qdFusf0qTAOHU6w9JEbJpDBqJU
 59IrEt3RQboEsHKy33bx+tiG1+oBjdjaLA//C7Slc0c+pv/W/wN5OjW+7jNNKFqxmcmUsQ
 erPlE+4h5z6AhU7TURLjRVCdbx7fz0BFET5YmN5fL8vs8KzYd0gSTPFWqBdCIJvluzp5hN
 DL0nRiJJzIvE/Xipx4w18bSplKJCv+denp8CRzGDQG9Ps24z1V/erjY0VP7aqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=z+MQiSkR
Subject: [Buildroot] [PATCH 1/2] package/gdbm: add upstream patch to fix GCC
 15.x issues
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

Fixes:

  https://autobuild.buildroot.net/results/3bffec1eba130b3ad7ec270d870c04c2659fce8d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdbm/0001-C23-compatibility-fix.patch | 158 ++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 package/gdbm/0001-C23-compatibility-fix.patch

diff --git a/package/gdbm/0001-C23-compatibility-fix.patch b/package/gdbm/0001-C23-compatibility-fix.patch
new file mode 100644
index 0000000000..87fd94e196
--- /dev/null
+++ b/package/gdbm/0001-C23-compatibility-fix.patch
@@ -0,0 +1,158 @@
+From 238315e9f4f547dff4f5b9dff2f903385a8048cb Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sun, 17 Nov 2024 22:58:54 +0200
+Subject: [PATCH] C23 compatibility fix
+
+This fixes https://puszcza.gnu.org.ua/bugs/?642
+
+* tools/var.c (union value): Rename bool to b.
+
+Upstream: 734f69451392ffb6280d8a3aef51e2673c9b8554
+[Thomas: needed a few backporting adjustements]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ tools/var.c | 32 ++++++++++++++++----------------
+ 1 file changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/tools/var.c b/tools/var.c
+index 0f285f1..c553ae5 100644
+--- a/tools/var.c
++++ b/tools/var.c
+@@ -27,7 +27,7 @@
+ union value
+ {
+   char *string;
+-  int bool;
++  int b;
+   int num;
+ };
+ 
+@@ -90,7 +90,7 @@ static struct variable vartab[] = {
+     .name = "confirm",
+     .type = VART_BOOL,
+     .flags = VARF_INIT,
+-    .init = { .bool = 1 }
++    .init = { .b = 1 }
+   },
+   {
+     .name = "cachesize",
+@@ -114,32 +114,32 @@ static struct variable vartab[] = {
+     .name = "lock",
+     .type = VART_BOOL,
+     .flags = VARF_INIT,
+-    .init = { .bool = 1 }
++    .init = { .b = 1 }
+   },
+   {
+     .name = "mmap",
+     .type = VART_BOOL,
+     .flags = VARF_INIT,
+-    .init = { .bool = 1 }
++    .init = { .b = 1 }
+   },
+   {
+     .name = "sync",
+     .type = VART_BOOL,
+     .flags = VARF_INIT,
+-    .init = { .bool = 0 }
++    .init = { .b = 0 }
+   },
+   {
+     .name = "coalesce",
+     .type = VART_BOOL,
+     .flags = VARF_INIT,
+-    .init = { .bool = 0 },
++    .init = { .b = 0 },
+     .sethook = coalesce_sethook
+   },
+   {
+     .name = "centfree",
+     .type = VART_BOOL,
+     .flags = VARF_INIT,
+-    .init = { .bool = 0 },
++    .init = { .b = 0 },
+     .sethook = centfree_sethook
+   },
+   {
+@@ -252,21 +252,21 @@ s2b (union value *vp, void *val, int flags)
+   for (i = 0; trueval[i]; i++)
+     if (strcasecmp (trueval[i], val) == 0)
+       {
+-	vp->bool = 1;
++	vp->b = 1;
+ 	return VAR_OK;
+       }
+   
+   for (i = 0; falseval[i]; i++)
+     if (strcasecmp (falseval[i], val) == 0)
+       {
+-	vp->bool = 0;
++	vp->b = 0;
+ 	return VAR_OK;
+       }
+   
+   n = strtoul (val, &p, 0);
+   if (*p)
+     return VAR_ERR_BADTYPE;
+-  vp->bool = !!n;
++  vp->b = !!n;
+   return VAR_OK;
+ }
+   
+@@ -286,7 +286,7 @@ s2i (union value *vp, void *val, int flags)
+ static int
+ b2b (union value *vp, void *val, int flags)
+ {
+-  vp->bool = !!*(int*)val;
++  vp->b = !!*(int*)val;
+   return VAR_OK;
+ }
+ 
+@@ -307,7 +307,7 @@ i2i (union value *vp, void *val, int flags)
+ static int
+ i2b (union value *vp, void *val, int flags)
+ {
+-  vp->bool = *(int*)val;
++  vp->b = *(int*)val;
+   return VAR_OK;
+ }
+ 
+@@ -414,7 +414,7 @@ variable_get (const char *name, int type, void **val)
+       break;
+ 
+     case VART_BOOL:
+-      *(int*)val = vp->v.bool;
++      *(int*)val = vp->v.b;
+       break;
+       
+     case VART_INT:
+@@ -461,7 +461,7 @@ variable_print_all (FILE *fp)
+ 	      break;
+ 	      
+ 	    case VART_BOOL:
+-	      fprintf (fp, "%s%s", vp->v.bool ? "" : "no", vp->name);
++	      fprintf (fp, "%s%s", vp->v.b ? "" : "no", vp->name);
+ 	      break;
+ 	      
+ 	    case VART_STRING:
+@@ -647,7 +647,7 @@ centfree_sethook (struct variable *var, union value *v)
+ {
+   if (!v)
+     return VAR_OK;
+-  return gdbmshell_setopt ("GDBM_SETCENTFREE", GDBM_SETCENTFREE, v->bool) == 0
++  return gdbmshell_setopt ("GDBM_SETCENTFREE", GDBM_SETCENTFREE, v->b) == 0
+          ? VAR_OK : VAR_ERR_GDBM;
+ }
+ 
+@@ -656,7 +656,7 @@ coalesce_sethook (struct variable *var, union value *v)
+ {
+   if (!v)
+     return VAR_OK;
+-  return gdbmshell_setopt ("GDBM_SETCOALESCEBLKS", GDBM_SETCOALESCEBLKS, v->bool) == 0
++  return gdbmshell_setopt ("GDBM_SETCOALESCEBLKS", GDBM_SETCOALESCEBLKS, v->b) == 0
+          ? VAR_OK : VAR_ERR_GDBM;
+ }
+ 
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
