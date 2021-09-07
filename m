Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11024C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:25:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0CE360EE6
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0CE360EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B07B860034;
	Tue,  7 Sep 2021 12:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Xy2B1oLukDI; Tue,  7 Sep 2021 12:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5E960E93;
	Tue,  7 Sep 2021 12:25:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6BA1BF995
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28C4040235
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PBR-ZAMy2Jsw for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:23:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 165A040510
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:23:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7025A887DD; Tue,  7 Sep 2021 12:22:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 14:20:00 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 87b883563d1f2e6bdf3dab51b01c0cca968c89b4
X-Git-Newrev: 9076d9b41e61fa80b360428be989cfb51a808ac5
X-Patchwork-Hint: ignore
Message-Id: <20210907122202.7025A887DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/ushare: fix build
 without msgfmt
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9076d9b41e61fa80b360428be989cfb51a808ac5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
(cherry picked from commit c4e1a075101914f8e0d47f8bb9c06bea13ba0fd2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
