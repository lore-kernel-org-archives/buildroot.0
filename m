Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B5EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BEAC41184;
	Thu, 26 May 2022 08:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olunXtJNS4vF; Thu, 26 May 2022 08:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 530AA41183;
	Thu, 26 May 2022 08:47:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5998B1BF9AD
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F8FD40598
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRuNxcXqzuFe for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:46:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60B7340940
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BDA638652D; Thu, 26 May 2022 08:35:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 10:45:47 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b49f39e16c4a4e20910efca4ffdea95ccf82aba1
X-Git-Newrev: 77e9154d0335aa786717d5cc94cafc3b3316e2ba
X-Patchwork-Hint: ignore
Message-Id: <20220526083517.BDA638652D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zlog: fix
 CVE-2021-43521
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

commit: https://git.buildroot.net/buildroot/commit/?id=77e9154d0335aa786717d5cc94cafc3b3316e2ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

A Buffer Overflow vulnerability exists in zlog 1.2.15 via
zlog_conf_build_with_file in src/zlog/src/conf.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6eefe2f8f443df4a284717b0dddf33566956e05a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fer-overflow-at-zlog_conf_build_with_file.patch | 25 ++++++++++++++++++++++
 package/zlog/zlog.mk                               |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch b/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
new file mode 100644
index 0000000000..d5f23e1b26
--- /dev/null
+++ b/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
@@ -0,0 +1,25 @@
+From a5be8b3a8ddc498de4ad041757285136a55d97e3 Mon Sep 17 00:00:00 2001
+From: XiangfeiCH <chenthrone@163.com>
+Date: Tue, 12 Apr 2022 00:13:35 +0800
+Subject: [PATCH] Fix stack-buffer-overflow at zlog_conf_build_with_file
+
+[Retrieved from:
+https://github.com/HardySimpson/zlog/commit/a5be8b3a8ddc498de4ad041757285136a55d97e3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/conf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/conf.c b/src/conf.c
+index 0f862fa..9a4cb75 100644
+--- a/src/conf.c
++++ b/src/conf.c
+@@ -305,7 +305,7 @@ static int zlog_conf_build_with_file(zlog_conf_t * a_conf)
+ 				/* Oops the buffer is full - what now? */
+ 				pline = line;
+ 			} else {
+-				for (p--; isspace((int)*p); --p)
++				for (p--; p >= line && isspace((int)*p); --p)
+ 					/*EMPTY*/;
+ 				p++;
+ 				*p = 0;
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index c7b7035c1f..1929a45a3e 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -11,6 +11,9 @@ ZLOG_LICENSE_FILES = COPYING
 ZLOG_CPE_ID_VENDOR = zlog_project
 ZLOG_INSTALL_STAGING = YES
 
+# 0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
+ZLOG_IGNORE_CVES += CVE-2021-43521
+
 define ZLOG_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 		-C $(@D) all
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
