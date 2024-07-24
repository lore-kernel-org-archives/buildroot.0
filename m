Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62731C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 20:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D1BC40242;
	Wed, 24 Jul 2024 20:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8EdigVGHt6T; Wed, 24 Jul 2024 20:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8EB44052A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8EB44052A;
	Wed, 24 Jul 2024 20:03:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 378281BF2C8
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 258614052A
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id civf7TyCujfr for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 20:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC95D40242
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC95D40242
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 20:03:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D633A8744F; Wed, 24 Jul 2024 20:03:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 22:03:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee00cfd09e4ffa97019c4e9384cc761995912e28
X-Git-Newrev: 3720250420d6b35bd217950d7a0648a0ecd0a2b5
X-Patchwork-Hint: ignore
Message-Id: <20240724200339.D633A8744F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/can-utils: fix build with gcc >= 14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3720250420d6b35bd217950d7a0648a0ecd0a2b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 14:

j1939acd.c: In function 'main':
j1939acd.c:489:38: error: passing argument 1 of 'asprintf' from incompatible pointer type [-Wincompatible-pointer-types]
  489 |                         if (asprintf(&program_invocation_name, "%s.%s",
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                      |
      |                                      const char **

Fixes:
 - http://autobuild.buildroot.org/results/1e2a533a936624249cd79d34983c889c3c4c2e3b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...legacy-poption-prefix-to-use-when-logging.patch | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch b/package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch
new file mode 100644
index 0000000000..36c96d59e4
--- /dev/null
+++ b/package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch
@@ -0,0 +1,79 @@
+From d337863d9189501dbbb15467cc3dcba85946a2a3 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 22 Jul 2024 16:12:04 +0200
+Subject: [PATCH] j1939acd: remove legacy '-p' option (prefix to use when
+ logging)
+
+- remove legacy '-p' option (prefix to use when logging), fixes uclibc
+  compile
+
+Fixes:
+
+  j1939acd.c: In function 'main':
+  j1939acd.c:489:38: error: passing argument 1 of 'asprintf' from incompatible pointer type [-Wincompatible-pointer-types]
+    489 |                         if (asprintf(&program_invocation_name, "%s.%s",
+        |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
+        |                                      |
+        |                                      const char **
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Upstream: https://github.com/linux-can/can-utils/commit/d337863d9189501dbbb15467cc3dcba85946a2a3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ j1939acd.c | 16 +---------------
+ 1 file changed, 1 insertion(+), 15 deletions(-)
+
+diff --git a/j1939acd.c b/j1939acd.c
+index 44bb826c..ae4e58ac 100644
+--- a/j1939acd.c
++++ b/j1939acd.c
+@@ -38,7 +38,6 @@ static const char help_msg[] =
+ 	"			e.g. 80,50-100,200-210 (defaults to 0-253)" "\n"
+ 	"  -c, --cache=FILE	Cache file to save/restore the source address" "\n"
+ 	"  -a, --address=ADDRESS	Start with Source Address ADDRESS" "\n"
+-	"  -p, --prefix=STR	Prefix to use when logging" "\n"
+ 	"\n"
+ 	"NAME is the 64bit nodename" "\n"
+ 	"\n"
+@@ -54,14 +53,13 @@ static struct option long_opts[] = {
+ 	{ "range", required_argument, NULL, 'r', },
+ 	{ "cache", required_argument, NULL, 'c', },
+ 	{ "address", required_argument, NULL, 'a', },
+-	{ "prefix", required_argument, NULL, 'p', },
+ 	{ },
+ };
+ #else
+ #define getopt_long(argc, argv, optstring, longopts, longindex) \
+ 	getopt((argc), (argv), (optstring))
+ #endif
+-static const char optstring[] = "vr:c:a:p:?";
++static const char optstring[] = "vr:c:a:?";
+ 
+ /* byte swap functions */
+ static inline int host_is_little_endian(void)
+@@ -466,9 +464,6 @@ int main(int argc, char *argv[])
+ 	struct sockaddr_can saddr;
+ 	uint64_t cmd_name;
+ 
+-#ifdef _GNU_SOURCE
+-	program_invocation_name = program_invocation_short_name;
+-#endif
+ 	/* argument parsing */
+ 	while ((opt = getopt_long(argc, argv, optstring, long_opts, NULL)) != -1)
+ 		switch (opt) {
+@@ -484,15 +479,6 @@ int main(int argc, char *argv[])
+ 		case 'a':
+ 			s.current_sa = strtoul(optarg, 0, 0);
+ 			break;
+-		case 'p':
+-#ifdef _GNU_SOURCE
+-			if (asprintf(&program_invocation_name, "%s.%s",
+-				     program_invocation_short_name, optarg) < 0)
+-				err(1, "asprintf(program invocation name)");
+-#else
+-			err(0, "compile with -D_GNU_SOURCE to use -p");
+-#endif
+-			break;
+ 		default:
+ 			fputs(help_msg, stderr);
+ 			exit(1);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
