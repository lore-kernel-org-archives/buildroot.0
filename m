Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ACFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B96A4050D;
	Tue, 30 Nov 2021 16:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x48iswgenpnK; Tue, 30 Nov 2021 16:25:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7F5A4045C;
	Tue, 30 Nov 2021 16:25:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6F8A1BF2F0
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5E4E400F0
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5GlogNvSpMI for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:25:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9804400C6
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5021A920E5; Tue, 30 Nov 2021 16:20:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:16:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9c7e5e3698ca7d25353ecfa8a443e1a91d3ad48
X-Git-Newrev: a12d079e3c484c65af35c4eecf1cdff5c6d4007b
X-Patchwork-Hint: ignore
Message-Id: <20211130162032.5021A920E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xscreensaver: add xdg SELinux
 module
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

commit: https://git.buildroot.net/buildroot/commit/?id=a12d079e3c484c65af35c4eecf1cdff5c6d4007b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xdg SELinux module is needed to avoid the following build failure raised
since commit 62b4fa2d7b543cfbacbc8fa112a88fa575b23eb3:

 Compiling targeted policy.31
 env LD_LIBRARY_PATH="/home/buildroot/autobuild/instance-2/output-1/host/lib:/home/buildroot/autobuild/instance-2/output-1/host/usr/lib" /home/buildroot/autobuild/instance-2/output-1/host/usr/bin/checkpolicy -c 31 -U deny -S -O -E policy.conf -o policy.31
 policy/modules/services/xserver.te:116:ERROR 'attribute xdg_cache_type is not declared' at token ';' on line 656367:
 #line 116
	typeattribute user_fonts_cache_t xdg_cache_type;
 checkpolicy:  error(s) encountered while parsing configuration

Fixes:
 - http://autobuild.buildroot.org/results/610484c288fa1923d9ee28a3cb780dcb67579eee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xscreensaver/xscreensaver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 79062e49ba..f73a75bf14 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -11,7 +11,7 @@ XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 XSCREENSAVER_CPE_ID_VENDOR = xscreensaver_project
-XSCREENSAVER_SELINUX_MODULES = xscreensaver xserver
+XSCREENSAVER_SELINUX_MODULES = xdg xscreensaver xserver
 
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
