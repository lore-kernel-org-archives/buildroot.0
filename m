Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA107C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 17:08:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54FAF611F0
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 17:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54FAF611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21D366081E;
	Sat, 11 Sep 2021 17:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gD1XQBJcLfOe; Sat, 11 Sep 2021 17:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77E8860814;
	Sat, 11 Sep 2021 17:08:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB4C91BF2CA
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 17:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC3C2401C3
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 17:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHB2-SAM3Gg2 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 17:08:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE84940018
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 17:08:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 69274890E2; Sat, 11 Sep 2021 17:06:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 19:07:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea0a4c610d8fa6dac3b4a6eadbc0ce5c18223845
X-Git-Newrev: f53e59b8e2e04534e0b78a064a8ac1c46fb18ec9
X-Patchwork-Hint: ignore
Message-Id: <20210911170635.69274890E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: fix build with glibc >=
 2.34
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3300003041896410951=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============3300003041896410951==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f53e59b8e2e04534e0b78a064a8ac1c46fb18ec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with glibc >= 2.34:

../glib/gspawn.c: In function 'safe_closefrom':
../glib/gspawn.c:1497:7: error: too few arguments to function 'close_range'
 1497 |   if (close_range (lowfd, G_MAXUINT) != 0 && errno == ENOSYS)
      |       ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/cbc0913fa2cc486deb64b07b5b13341a5a97025e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Tested-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...orrectly-use-3-parameters-for-close_range.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libglib2/0004-correctly-use-3-parameters-for-close_range.patch b/package/libglib2/0004-correctly-use-3-parameters-for-close_range.patch
new file mode 100644
index 0000000000..bfca4b14ef
--- /dev/null
+++ b/package/libglib2/0004-correctly-use-3-parameters-for-close_range.patch
@@ -0,0 +1,33 @@
+From b71117d89434db83d34bc1b981ca03d4be299576 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 8 Jul 2021 17:26:43 -0700
+Subject: [PATCH] correctly use 3 parameters for close_range
+
+libc implementation has 3 parameter e.g.
+https://www.freebsd.org/cgi/man.cgi?query=close_range&sektion=2&format=html
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/glib/-/commit/b71117d89434db83d34bc1b981ca03d4be299576]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ glib/gspawn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/gspawn.c b/glib/gspawn.c
+index 899647c2f..3073a10a4 100644
+--- a/glib/gspawn.c
++++ b/glib/gspawn.c
+@@ -1520,7 +1520,7 @@ safe_closefrom (int lowfd)
+    *
+    * Handle ENOSYS in case it’s supported in libc but not the kernel; if so,
+    * fall back to safe_fdwalk(). */
+-  if (close_range (lowfd, G_MAXUINT) != 0 && errno == ENOSYS)
++  if (close_range (lowfd, G_MAXUINT, 0) != 0 && errno == ENOSYS)
+ #endif  /* HAVE_CLOSE_RANGE */
+   (void) safe_fdwalk (close_func, GINT_TO_POINTER (lowfd));
+ #endif
+-- 
+GitLab
+

--===============3300003041896410951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3300003041896410951==--
