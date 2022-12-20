Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7144AC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 174424EE2A;
	Mon, 20 Feb 2023 22:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 174424EE2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgyFx7_1oFmC; Mon, 20 Feb 2023 22:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF0284F0BC;
	Mon, 20 Feb 2023 22:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF0284F0BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 612811BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B9EC416E5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B9EC416E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwQnRcVolga7 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85F95416E8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85F95416E8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 836F086494; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 08:16:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3ddf15854deb5f03a4c98afa6c86f9f3b4d6893c
X-Git-Newrev: 7dbe844bae38aba8e6080da3b650b89f702c0f1c
X-Patchwork-Hint: ignore
Message-Id: <20230220205213.836F086494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/unifdef: add new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7dbe844bae38aba8e6080da3b650b89f702c0f1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A small package that does "Selectively remove C preprocessor conditionals".

The package will be needed for the upcoming webkitgtk 2.40.0 release.
I personally added it to get started with 2.39.2.

See: https://github.com/WebKit/WebKit/commit/f76a7e30e5749af897b83cc75b2534b1afa32552
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Peter: use prefix=]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Makefile-fix-error-on-install.patch       | 31 ++++++++++++++++++++++
 package/unifdef/unifdef.hash                       |  3 +++
 package/unifdef/unifdef.mk                         | 20 ++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/package/unifdef/0001-Makefile-fix-error-on-install.patch b/package/unifdef/0001-Makefile-fix-error-on-install.patch
new file mode 100644
index 0000000000..c959a41c5a
--- /dev/null
+++ b/package/unifdef/0001-Makefile-fix-error-on-install.patch
@@ -0,0 +1,31 @@
+From b5e4229918c13bc0c11a523105cdb3a464337b37 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Mon, 12 Dec 2022 12:59:59 +0100
+Subject: [PATCH] Makefile: fix error on install
+
+ln: failed to create symbolic link '/home/thomas/Documents/buildroot/output/host/share/man/man1/unifdefall.1': File exists
+
+Seen while trying to add this package to buildroot.org.
+
+(upstream: https://github.com/fanf2/unifdef/pull/16)
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 36c7028..485927a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -28,7 +28,7 @@ install: unifdef unifdefall.sh unifdef.1
+ 	: manual
+ 	install -m 755 -d  ${man1dest}
+ 	install -m 644 unifdef.1  ${man1dest}/
+-	ln -s unifdef.1  ${man1dest}/unifdefall.1
++	ln -f -s unifdef.1  ${man1dest}/unifdefall.1
+ 
+ clean:
+ 	rm -f unifdef version.h
+-- 
+2.38.1
+
diff --git a/package/unifdef/unifdef.hash b/package/unifdef/unifdef.hash
new file mode 100644
index 0000000000..c3a6b7465c
--- /dev/null
+++ b/package/unifdef/unifdef.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  fba564a24db7b97ebe9329713ac970627b902e5e9e8b14e19e024eb6e278d10b  unifdef-2.12.tar.gz
+sha256  37ed46a39446b15b08af418fda23b75c27a769d5aad236d817ee7522cc9caeee  COPYING
diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
new file mode 100644
index 0000000000..7d10595d1b
--- /dev/null
+++ b/package/unifdef/unifdef.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# unifdef
+#
+################################################################################
+
+UNIFDEF_VERSION = 2.12
+UNIFDEF_SITE = https://dotat.at/prog/unifdef
+UNIFDEF_LICENSE = BSD-2-Clause
+UNIFDEF_LICENSE_FILES = COPYING
+
+define HOST_UNIFDEF_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define HOST_UNIFDEF_INSTALL_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
