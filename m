Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB30ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 19:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F5641B38;
	Sun, 18 Sep 2022 19:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93F5641B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jq7XZ3y2RqQ; Sun, 18 Sep 2022 19:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F51941B37;
	Sun, 18 Sep 2022 19:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F51941B37
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C49D61BF3F6
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 19:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E8CA41A39
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 19:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E8CA41A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IbhacSTtz9X4 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 19:48:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D553241966
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 19:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D553241966
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C04E385389; Sun, 18 Sep 2022 19:48:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 21:48:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e89d78cf0adae86906f89f627d3cd23dd34d4af
X-Git-Newrev: d7561a8c5e107b411d01afa5627cb0bb730abe86
X-Patchwork-Hint: ignore
Message-Id: <20220918194848.C04E385389@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libconfuse: fix CVE-2022-40320
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7561a8c5e107b411d01afa5627cb0bb730abe86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cfg_tilde_expand in confuse.c in libConfuse 3.3 has a heap-based buffer
over-read.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-unterminated-username-used-with-getpwnam.patch | 43 ++++++++++++++++++++++
 package/libconfuse/libconfuse.mk                   |  3 ++
 2 files changed, 46 insertions(+)

diff --git a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
new file mode 100644
index 0000000000..9ff3f5ec1c
--- /dev/null
+++ b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
@@ -0,0 +1,43 @@
+From d73777c2c3566fb2647727bb56d9a2295b81669b Mon Sep 17 00:00:00 2001
+From: Joachim Wiberg <troglobit@gmail.com>
+Date: Fri, 2 Sep 2022 16:12:46 +0200
+Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
+
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+
+[Retrieved (and backported) from:
+https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/confuse.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/confuse.c b/src/confuse.c
+index 6d1fdbd..05566b5 100644
+--- a/src/confuse.c
++++ b/src/confuse.c
+@@ -1894,18 +1894,20 @@ DLLIMPORT char *cfg_tilde_expand(const char *filename)
+ 			passwd = getpwuid(geteuid());
+ 			file = filename + 1;
+ 		} else {
+-			/* ~user or ~user/path */
+-			char *user;
++			char *user; /* ~user or ~user/path */
++			size_t len;
+ 
+ 			file = strchr(filename, '/');
+ 			if (file == 0)
+ 				file = filename + strlen(filename);
+ 
+-			user = malloc(file - filename);
++			len = file - filename - 1;
++			user = malloc(len + 1);
+ 			if (!user)
+ 				return NULL;
+ 
+-			strncpy(user, filename + 1, file - filename - 1);
++			strncpy(user, &filename[1], len);
++			user[len] = 0;
+ 			passwd = getpwnam(user);
+ 			free(user);
+ 		}
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 2beb0e4fbf..e7c2ef0a84 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -14,5 +14,8 @@ LIBCONFUSE_LICENSE_FILES = LICENSE
 LIBCONFUSE_CPE_ID_VENDOR = libconfuse_project
 LIBCONFUSE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
+# 0001-Fix-163-unterminated-username-used-with-getpwnam.patch
+LIBCONFUSE_IGNORE_CVES += CVE-2022-40320
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
