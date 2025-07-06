Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7993BC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 11:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31C1A80EE0;
	Sun,  6 Jul 2025 11:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZJZnuym9Hio; Sun,  6 Jul 2025 11:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FD8580F04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FD8580F04;
	Sun,  6 Jul 2025 11:38:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E22FC19C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3E1580F36
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhQD7JbWNxPq for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 11:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28A2080EE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28A2080EE0
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:38:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 044A485F1D; Sun,  6 Jul 2025 11:38:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Jul 2025 13:28:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e8be117f0cc935bf7082ce156d9799b4bd14668
X-Git-Newrev: 196989235e6f0266fca48b6c73c780436c7ebcb0
X-Patchwork-Hint: ignore
Message-Id: <20250706113829.044A485F1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hddtemp: fix build without nls
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
Content-Type: multipart/mixed; boundary="===============8212859226753569114=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8212859226753569114==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=196989235e6f0266fca48b6c73c780436c7ebcb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.org/results/06b44df261318ce1d07f6cb20b26e4ad64222940/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hddtemp/0001-fix-build-without-nls.patch | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/hddtemp/0001-fix-build-without-nls.patch b/package/hddtemp/0001-fix-build-without-nls.patch
new file mode 100644
index 0000000000..356b94b010
--- /dev/null
+++ b/package/hddtemp/0001-fix-build-without-nls.patch
@@ -0,0 +1,40 @@
+From c9d0d249ff013d33cf1fd5a586c16ee30095cc90 Mon Sep 17 00:00:00 2001
+From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+Date: Fri, 14 Feb 2025 10:08:43 +0100
+Subject: [PATCH] fix build without nls
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+> hddtemp.c: In function ‘main’:
+> hddtemp.c:274:3: error: implicit declaration of function ‘bindtextdomain’ [-Wimplicit-function-declaration]
+>   274 |   bindtextdomain (PACKAGE, LOCALEDIR);
+>       |   ^~~~~~~~~~~~~~
+> hddtemp.c:275:3: error: implicit declaration of function ‘textdomain’ [-Wimplicit-function-declaration]
+>   275 |   textdomain (PACKAGE);
+>       |   ^~~~~~~~~~
+> make[2]: *** [Makefile:496: hddtemp-hddtemp.o] Error 1
+
+Upstream: https://github.com/vitlav/hddtemp/pull/16
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/hddtemp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/hddtemp.c b/src/hddtemp.c
+index 64d000e..bfea556 100644
+--- a/src/hddtemp.c
++++ b/src/hddtemp.c
+@@ -270,9 +270,11 @@ int main(int argc, char* argv[]) {
+   backtrace_sigill();
+   backtrace_sigbus();
+ 
++#if ENABLE_NLS
+   setlocale (LC_ALL, "");
+   bindtextdomain (PACKAGE, LOCALEDIR);
+   textdomain (PACKAGE);
++#endif
+ 
+   show_db = debug = numeric = quiet = wakeup = af_hint = syslog_interval = foreground = 0;
+   unit = DEFAULT;

--===============8212859226753569114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8212859226753569114==--
