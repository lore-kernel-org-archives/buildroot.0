Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3041C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 17:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FC8D416BC;
	Sun, 21 May 2023 17:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FC8D416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A34MfzYAB1A5; Sun, 21 May 2023 17:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0E514161A;
	Sun, 21 May 2023 17:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0E514161A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B48A81BF3CA
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 17:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B53460E8D
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 17:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B53460E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qgFNJc4lSkf for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 17:49:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5C0D60A71
 for <buildroot@buildroot.org>; Sun, 21 May 2023 17:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C0D60A71
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2E3386738; Sun, 21 May 2023 17:49:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 May 2023 19:48:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4944ff2878733f4f6f837ee0d417423420c663ce
X-Git-Newrev: 62b64c56b8714e159d9f4812fb05e6442d2837f2
X-Patchwork-Hint: ignore
Message-Id: <20230521174915.B2E3386738@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: fix glxinfo crash when
 gles1 is disabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=62b64c56b8714e159d9f4812fb05e6442d2837f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mesa3d 23.1 introduced a regression crashing glxinfo (and some piglit tests)
when gles1 is disabled.
See: https://gitlab.freedesktop.org/mesa/mesa/-/issues/9038

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983490

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr: fix Upstream tag as noticed by Baruch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...xit-early-when-trying-to-create-an-unsupp.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch b/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch
new file mode 100644
index 0000000000..278d75e64a
--- /dev/null
+++ b/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch
@@ -0,0 +1,50 @@
+From 2a6908ff4c94284b39c3cd4c97e1069876720eb7 Mon Sep 17 00:00:00 2001
+From: Jordan Justen <jordan.l.justen@intel.com>
+Date: Tue, 16 May 2023 18:46:50 -0700
+Subject: [PATCH] mesa/main: Exit early when trying to create an unsupported
+ context API
+
+Fixes: adbe8b6c17a ("mesa: optimize out _mesa_is_desktop_gl*() and _mesa_is_gles*() calls when not built")
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/9038
+Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
+Reviewed-by: Eric Engestrom <eric@engestrom.ch>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23068>
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/8bb1ecaa02177720758255bdd7ec34a5d15feca4
+[Romain: backport to 23.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/mesa/main/context.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/src/mesa/main/context.c b/src/mesa/main/context.c
+index d8eea2ea867..2b810b0d863 100644
+--- a/src/mesa/main/context.c
++++ b/src/mesa/main/context.c
+@@ -996,6 +996,24 @@ _mesa_initialize_context(struct gl_context *ctx,
+    struct gl_shared_state *shared;
+    int i;
+ 
++   switch (api) {
++   case API_OPENGL_COMPAT:
++   case API_OPENGL_CORE:
++      if (!HAVE_OPENGL)
++         return GL_FALSE;
++      break;
++   case API_OPENGLES2:
++      if (!HAVE_OPENGL_ES_2)
++         return GL_FALSE;
++      break;
++   case API_OPENGLES:
++      if (!HAVE_OPENGL_ES_1)
++         return GL_FALSE;
++      break;
++   default:
++      return GL_FALSE;
++   }
++
+    ctx->API = api;
+    ctx->DrawBuffer = NULL;
+    ctx->ReadBuffer = NULL;
+-- 
+2.40.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
