Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA3ECAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60FDE80710;
	Mon,  8 Sep 2025 14:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVDMHhYinmx3; Mon,  8 Sep 2025 14:17:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E812806D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E812806D5;
	Mon,  8 Sep 2025 14:17:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24BE5279
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AD7B4021A
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fb6k1UI4LpI for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA65840210
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA65840210
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBC3883916; Mon,  8 Sep 2025 14:16:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 23:24:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67422b9d9cd02d29393081d83af4dd16093c43b1
X-Git-Newrev: bbec805717167714ee6b22b8c8b2ddddcce47ea4
X-Patchwork-Hint: ignore
Message-Id: <20250908141623.BBC3883916@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdbm: add upstream patch to fix
 GCC 15.x issues
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bbec805717167714ee6b22b8c8b2ddddcce47ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://autobuild.buildroot.net/results/3bffec1eba130b3ad7ec270d870c04c2659fce8d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gdbm/0001-C23-compatibility-fix.patch | 158 ++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
