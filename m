Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA4BC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 09:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57CF081E53;
	Mon, 25 Mar 2024 09:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzra9uaYZw3D; Mon, 25 Mar 2024 09:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F50D81E58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F50D81E58;
	Mon, 25 Mar 2024 09:06:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30E221BF370
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C68A4032C
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZP6u_lIovx37 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 09:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3175A40179
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3175A40179
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 09:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F27983DA9; Mon, 25 Mar 2024 09:06:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 10:00:39 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 64673eb1e604cca2627b5487714fae1b168ae0ec
X-Git-Newrev: aaaeff35506af1ba775074ef0aeeb57a3b5d7e6c
X-Patchwork-Hint: ignore
Message-Id: <20240325090652.1F27983DA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/cvs: fix build
 without editor
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

commit: https://git.buildroot.net/buildroot/commit/?id=aaaeff35506af1ba775074ef0aeeb57a3b5d7e6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 1455d5241b288770aeea7f5ba6dcd1ea31966ba1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
