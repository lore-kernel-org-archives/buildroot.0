Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F5FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0602640A20;
	Thu, 21 Apr 2022 18:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IYWPzhwl6oiL; Thu, 21 Apr 2022 18:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAD8140A2A;
	Thu, 21 Apr 2022 18:03:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17CFC1BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E139B83ED4
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id melSKHKoIkCy for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 888FC83EBC
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9206B83FE8; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:32:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b77600f5082085fa5e223798510502416fbf8035
X-Git-Newrev: 1b47bd987f9d549b3dc5d7127d1773275560196d
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.9206B83FE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liboping: fix build with gcc >= 7
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b47bd987f9d549b3dc5d7127d1773275560196d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace first patch (which is not in master after nearly 4 years) with
a new set of pending patches to fix the following build failure with
gcc >= 7:

liboping.c: In function 'ping_set_ttl':
liboping.c:207:9: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
  207 |    "%s: %s", function, message);
      |         ^~
......
  829 |      sstrerror (ret, errbuf, sizeof (errbuf)));
      |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into a destination of size 256
  206 |  snprintf (obj->errmsg, sizeof (obj->errmsg),
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  207 |    "%s: %s", function, message);
      |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/31083354e9064b2deef86917d67e92a88af0fa46

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...8-support.patch => 0001-fix-utf8-support.patch} |  0
 ...size-to-make-GCC-s-truncation-check-happy.patch | 31 ---------------------
 ...kets-when-adding-hosts-not-when-doing-th.patch} |  0
 ...-with-GCC-7-buffer-overflow-with-snprintf.patch | 28 +++++++++++++++++++
 .../liboping/0004-Fix-compile-error-on-GCC-7.patch | 32 ++++++++++++++++++++++
 5 files changed, 60 insertions(+), 31 deletions(-)

diff --git a/package/liboping/0002-fix-utf8-support.patch b/package/liboping/0001-fix-utf8-support.patch
similarity index 100%
rename from package/liboping/0002-fix-utf8-support.patch
rename to package/liboping/0001-fix-utf8-support.patch
diff --git a/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch b/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch
deleted file mode 100644
index b0aca8a715..0000000000
--- a/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 18ca43507b351f339ff23062541ee8d58e813a53 Mon Sep 17 00:00:00 2001
-From: Florian Forster <ff@octo.it>
-Date: Sun, 29 Jul 2018 14:34:19 +0200
-Subject: [PATCH] ping_host_add: Decrease buffer size to make GCC's truncation
- check happy.
-
-Fixes: #38
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/octo/liboping/commit/18ca43507b351f339ff23062541ee8d58e813a53]
----
- src/liboping.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/src/liboping.c b/src/liboping.c
-index 5253e8c..2470988 100644
---- a/src/liboping.c
-+++ b/src/liboping.c
-@@ -1636,10 +1636,8 @@ int ping_host_add (pingobj_t *obj, const char *host)
- 		}
- 		else
- 		{
--			char errmsg[PING_ERRMSG_LEN];
--
--			snprintf (errmsg, PING_ERRMSG_LEN, "Unknown `ai_family': %i", ai_ptr->ai_family);
--			errmsg[PING_ERRMSG_LEN - 1] = '\0';
-+			char errmsg[64];
-+			snprintf (errmsg, sizeof(errmsg), "Unknown `ai_family': %d", ai_ptr->ai_family);
- 
- 			dprintf ("%s", errmsg);
- 			ping_set_error (obj, "getaddrinfo", errmsg);
diff --git a/package/liboping/0003-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch b/package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
similarity index 100%
rename from package/liboping/0003-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
rename to package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
diff --git a/package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch b/package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch
new file mode 100644
index 0000000000..546f159187
--- /dev/null
+++ b/package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch
@@ -0,0 +1,28 @@
+From 0ad9ee080a7cd8037c341067cc67a84e32e69fea Mon Sep 17 00:00:00 2001
+From: Maurice Smulders <Maurice.Smulders@windtalker.com>
+Date: Thu, 30 Dec 2021 10:45:42 -0700
+Subject: [PATCH] Fix compile break with GCC 7+ - buffer overflow with snprintf
+
+[Retrieved from:
+https://github.com/octo/liboping/pull/64/commits/0ad9ee080a7cd8037c341067cc67a84e32e69fea]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/liboping.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/liboping.c b/src/liboping.c
+index bf9e059..9fd8f53 100644
+--- a/src/liboping.c
++++ b/src/liboping.c
+@@ -203,8 +203,11 @@ static char *sstrerror (int errnum, char *buf, size_t buflen)
+ static void ping_set_error (pingobj_t *obj, const char *function,
+ 	       	const char *message)
+ {
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-truncation"
+ 	snprintf (obj->errmsg, sizeof (obj->errmsg),
+ 			"%s: %s", function, message);
++#pragma GCC diagnostic pop
+ 	obj->errmsg[sizeof (obj->errmsg) - 1] = 0;
+ }
+ 
diff --git a/package/liboping/0004-Fix-compile-error-on-GCC-7.patch b/package/liboping/0004-Fix-compile-error-on-GCC-7.patch
new file mode 100644
index 0000000000..38355be40e
--- /dev/null
+++ b/package/liboping/0004-Fix-compile-error-on-GCC-7.patch
@@ -0,0 +1,32 @@
+From 3d685bdb1a6c655bce6d36cfd96e084be07cd2b1 Mon Sep 17 00:00:00 2001
+From: Maurice Smulders <Maurice.Smulders@windtalker.com>
+Date: Tue, 4 Jan 2022 12:49:36 -0700
+Subject: [PATCH] Fix compile error on GCC < 7
+
+[Retrieved from:
+https://github.com/octo/liboping/pull/64/commits/3d685bdb1a6c655bce6d36cfd96e084be07cd2b1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/liboping.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/liboping.c b/src/liboping.c
+index 9fd8f53..1ccf609 100644
+--- a/src/liboping.c
++++ b/src/liboping.c
+@@ -203,11 +203,15 @@ static char *sstrerror (int errnum, char *buf, size_t buflen)
+ static void ping_set_error (pingobj_t *obj, const char *function,
+ 	       	const char *message)
+ {
++#if __GNUC__ >= 7
+ #pragma GCC diagnostic push
+ #pragma GCC diagnostic ignored "-Wformat-truncation"
++#endif
+ 	snprintf (obj->errmsg, sizeof (obj->errmsg),
+ 			"%s: %s", function, message);
++#if __GNUC__ >= 7
+ #pragma GCC diagnostic pop
++#endif
+ 	obj->errmsg[sizeof (obj->errmsg) - 1] = 0;
+ }
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
