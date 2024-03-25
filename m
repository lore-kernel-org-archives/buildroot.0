Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F41C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 18:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68EC740759;
	Mon, 25 Mar 2024 18:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39ZKucXRY1CV; Mon, 25 Mar 2024 18:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61031407EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61031407EF;
	Mon, 25 Mar 2024 18:18:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F79B1BF263
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 352E281975
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXZc0FQHBP64 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 18:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B7C819D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64B7C819D1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 18:17:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 534C283FE7; Mon, 25 Mar 2024 18:17:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 19:10:50 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 69cc76cb0dcc2e0587c9f8d0a33133298f93159c
X-Git-Newrev: f332cb245388ff314a8c7a6a9c8ca302b0d11552
X-Patchwork-Hint: ignore
Message-Id: <20240325181756.534C283FE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/privoxy: fix
 build with root
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

commit: https://git.buildroot.net/buildroot/commit/?id=f332cb245388ff314a8c7a6a9c8ca302b0d11552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure when the configuration files are
installed as root:

id: 'privoxy': no such user
******************************************************************
 WARNING! WARNING! installing config files as root!
 It is strongly recommended to run privoxy as a non-root user,
 and to install the config files as that user and/or group!
 Please read INSTALL, and create a privoxy user and group!
*******************************************************************
make[1]: *** [GNUmakefile:861: install] Error 1

This failure is probably raised since the addition of the package in
commit f8a263fe361ab37ec6765b9ff6478c3b15e3d139 and
https://www.privoxy.org/gitweb/?p=privoxy.git;a=commit;h=26baf6bcc0b5db47b8cf5c55eece0614712b5180

Fixes:
 - http://autobuild.buildroot.org/results/28d8ca6f0e2d81d62196a0958c9274ad2c8c9871

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit b6816034ebddd522a8fef9daa454c28fa1230dd6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-in-Don-t-exit-if-configuration-files-are.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch b/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch
new file mode 100644
index 0000000000..e04d191ce0
--- /dev/null
+++ b/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch
@@ -0,0 +1,30 @@
+From 4b3b267db159dc23314de3062859481b7c397e32 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Mar 2024 12:36:31 +0100
+Subject: [PATCH] GNUmakefile.in: Don't exit if configuration files are
+ installed as root
+
+... as this can be considered acceptable when cross-compiling
+Privoxy inside an autobuilder with only a root user.
+
+Upstream: https://www.privoxy.org/gitweb/?p=privoxy.git;a=commit;h=4b3b267db159dc23314de3062859481b7c397e32
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ GNUmakefile.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/GNUmakefile.in b/GNUmakefile.in
+index 04cceb15..cf79aae1 100644
+--- a/GNUmakefile.in
++++ b/GNUmakefile.in
+@@ -927,7 +927,6 @@ install: CONF_DEST LOG_DEST PID_DEST check_doc GROUP_T
+ 					$(ECHO)  " and to install the config files as that user and/or group!" ;\
+ 					$(ECHO)  " Please read INSTALL, and create a privoxy user and group!" ;\
+ 					$(ECHO)  "*******************************************************************" ;\
+-					exit 1 ;\
+ 				fi ;\
+ 			else \
+ 				GROUP_T=$(GROUP) ;\
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
