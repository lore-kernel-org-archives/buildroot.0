Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35567C25B77
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 06:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E39641980;
	Wed, 15 May 2024 06:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jt4lc-c5J0uX; Wed, 15 May 2024 06:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C22DA41A36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C22DA41A36;
	Wed, 15 May 2024 06:16:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 288C81BF59A
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1E8C40443
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLENV7lrIEIL for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 06:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAE1C419DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAE1C419DB
 for <buildroot@buildroot.org>; Wed, 15 May 2024 06:16:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B78CF8714A; Wed, 15 May 2024 06:16:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 08:10:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58ccc55bff54d4c6c289a2d348f18b1b6dfde62d
X-Git-Newrev: 93864cef0b1ec94c44498a4edd31de92725b28b2
X-Patchwork-Hint: ignore
Message-Id: <20240515061605.B78CF8714A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuplot: fix readline dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=93864cef0b1ec94c44498a4edd31de92725b28b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--without-readline is interpreted as --with-readline=builtin since bump
to version 5.4.0 in commit 263da09323e83bb3d6552b70b739523b66459df8 and
https://github.com/gnuplot/gnuplot/commit/b492ea63bd604081ffb9dee3843e295b0b29df85
so add a mandatory dependency to readline or libedit to gnuplot

As a side-effect, this will avoid the following build failure with
builtin readline raised since bump to version 6.0.0 in commit
5f11ce4aeaba99917778c384b236d267e78a7b29:

/home/autobuild/autobuild/instance-14/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.2.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: history.o: in function `read_history':
history.c:(.text+0xa8): undefined reference to `gp_read_history'

Fixes: 5f11ce4aeaba99917778c384b236d267e78a7b29
 - http://autobuild.buildroot.org/results/5e45dd8f9071694110c8481f222b9b07b6a97ef3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuplot/Config.in  | 1 +
 package/gnuplot/gnuplot.mk | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gnuplot/Config.in b/package/gnuplot/Config.in
index 603c194fe5..8068a7283b 100644
--- a/package/gnuplot/Config.in
+++ b/package/gnuplot/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GNUPLOT
 	bool "gnuplot"
+	select BR2_PACKAGE_READLINE if !BR2_PACKAGE_LIBEDIT
 	help
 	  A portable command-line driven graphing utility.
 
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 26b2daaf24..e34dd2a60b 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -41,8 +41,9 @@ endif
 ifeq ($(BR2_PACKAGE_READLINE),y)
 GNUPLOT_CONF_OPTS += --with-readline=gnu
 GNUPLOT_DEPENDENCIES += readline
-else
-GNUPLOT_CONF_OPTS += --without-readline
+else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+GNUPLOT_CONF_OPTS += --with-readline=bsd
+GNUPLOT_DEPENDENCIES += libedit
 endif
 
 # Remove Javascript scripts, lua scripts, PostScript files
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
