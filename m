Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF7BC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:09:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB05C600EF
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB05C600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29F2540764;
	Thu, 26 Aug 2021 21:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GyH2ITNr0dfc; Thu, 26 Aug 2021 21:09:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAA3240765;
	Thu, 26 Aug 2021 21:09:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB5801BF2A6
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB22F425EE
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkGOGqjRJHyF for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 21:08:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FEE4425E7
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 21:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 983E38CA5B; Thu, 26 Aug 2021 21:07:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 22:53:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edcf8b6d5fc9e6e15e4153a7bd9a479696a6e408
X-Git-Newrev: c4e1a075101914f8e0d47f8bb9c06bea13ba0fd2
X-Patchwork-Hint: ignore
Message-Id: <20210826210744.983E38CA5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ushare: fix build without msgfmt
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=c4e1a075101914f8e0d47f8bb9c06bea13ba0fd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without /usr/bin/msgfmt raised since the
addition of ushare in commit 74097fd659154499612f21fabeda4e3e7c8fdbfc:

make[3]: Entering directory `/home/buildroot/autobuild/run/instance-3/output-1/build/ushare-2.1/po'
/usr/bin/msgfmt -c --statistics -o fr.gmo fr.po
make[3]: /usr/bin/msgfmt: Command not found

To fix this build failure, set GMSGFMT to $(HOST_DIR)/bin/msgfmt and
don't build po files if NLS is disabled

Fixes:
 - http://autobuild.buildroot.org/results/9f6b5b8f38386135bacd2d8f6e97c1fea77bbe69

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...1-Don-t-build-po-files-if-NLS-is-disabled.patch | 47 ++++++++++++++++++++++
 package/ushare/ushare.mk                           |  9 ++++-
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
new file mode 100644
index 0000000000..f0fa89998f
--- /dev/null
+++ b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
@@ -0,0 +1,47 @@
+From 977171781f5d49e61b46c0241fb67cbb7d666498 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 22 Aug 2021 10:44:48 +0200
+Subject: [PATCH] Don't build po files if NLS is disabled
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ddugovic/uShare/pull/12]
+---
+ Makefile  | 7 +++++--
+ configure | 1 +
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ebd8f91..6686cfd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -14,10 +14,13 @@ EXTRADIST = AUTHORS \
+ 	    THANKS \
+ 	    TODO \
+ 
+-SUBDIRS = po \
+-	  scripts \
++SUBDIRS = scripts \
+ 	  src \
+ 
++ifeq ($(NLS),yes)
++SUBDIRS += po
++endif
++
+ all:
+ 	for subdir in $(SUBDIRS); do \
+ 	  $(MAKE) -C $$subdir $@; \
+diff --git a/configure b/configure
+index 4a3efe0..162a776 100755
+--- a/configure
++++ b/configure
+@@ -723,6 +723,7 @@ append_config "LDFLAGS=$LDFLAGS"
+ append_config "INSTALL=$INSTALL"
+ 
+ append_config "DEBUG=$debug"
++append_config "NLS=$nls"
+ 
+ 
+ echolog "Creating $CONFIG_H ..."
+-- 
+2.32.0
+
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index a4c9711600..df9da223ec 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -18,7 +18,12 @@ USHARE_CONF_OPTS = \
 	--sysconfdir=/etc \
 	--disable-strip
 
-ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+USHARE_MAKE_OPTS = LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)"
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+USHARE_CONF_OPTS += --enable-nls
+USHARE_MAKE_OPTS += GMSGFMT="$(HOST_DIR)/bin/msgfmt"
+else
 USHARE_CONF_OPTS += --disable-nls
 endif
 
@@ -31,7 +36,7 @@ define USHARE_CONFIGURE_CMDS
 endef
 
 define USHARE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(USHARE_MAKE_OPTS) -C $(@D)
 endef
 
 define USHARE_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
