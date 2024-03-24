Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851DBC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 526B740B0C;
	Sun, 24 Mar 2024 15:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hkm_2CTaG0bw; Sun, 24 Mar 2024 15:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F1EB40469
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F1EB40469;
	Sun, 24 Mar 2024 15:55:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3365C1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B85160725
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrVfGFtHJf8M for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 626D56076C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 626D56076C
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11E7883B98; Sun, 24 Mar 2024 15:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:38:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e511539cd29015f08d7417094cbf202a861ad533
X-Git-Newrev: 1455d5241b288770aeea7f5ba6dcd1ea31966ba1
X-Patchwork-Hint: ignore
Message-Id: <20240324155538.11E7883B98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cvs: fix build without editor
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1455d5241b288770aeea7f5ba6dcd1ea31966ba1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set default editor to /bin/vi to fix the following build failure when no
editor is found on host:

configure:40833: checking for vim
configure:40862: result: no
configure:40833: checking for vi
configure:40862: result: no
configure:40833: checking for emacs
configure:40862: result: no
configure:40833: checking for nano
configure:40862: result: no
configure:40833: checking for pico
configure:40862: result: no
configure:40833: checking for edit
configure:40862: result: no
configure:40874: error:
    Failed to find a text file editor.  CVS cannot be compiled
    without a default log message editor.  Searched for
    `vim vi emacs nano pico edit'.  Try `configure --with-editor'.

While at it, drop CVS_CONFIGURE_ARGS variable for simplicity

Fixes:
 - http://autobuild.buildroot.org/results/5b8a747698bc2e64eb1f001e87577e86e4cb8d14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/cvs/cvs.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index bd1e04eee0..64c15f16fe 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -18,18 +18,18 @@ CVS_CONF_ENV = \
 	ac_cv_func_working_mktime=yes \
 	cvs_cv_func_printf_ptr=yes
 
-CVS_CONFIGURE_ARGS = --disable-old-info-format-support
+CVS_CONF_OPTS = \
+	--disable-old-info-format-support \
+	--with-editor=/bin/vi
 ifeq ($(BR2_PACKAGE_CVS_SERVER),y)
-CVS_CONFIGURE_ARGS += --enable-server
+CVS_CONF_OPTS += --enable-server
 else
-CVS_CONFIGURE_ARGS += --disable-server
+CVS_CONF_OPTS += --disable-server
 endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-CVS_CONFIGURE_ARGS += --with-external-zlib
+CVS_CONF_OPTS += --with-external-zlib
 endif
 
-CVS_CONF_OPTS = $(CVS_CONFIGURE_ARGS)
-
 define CVS_BZIP_UNPACK
 	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	rm -f $(@D)/cvs-$(CVS_VERSION).tar.bz2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
