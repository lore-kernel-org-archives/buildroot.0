Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65254C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AEE7401C5;
	Mon, 22 Jul 2024 16:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIuRffP2ZzK2; Mon, 22 Jul 2024 16:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB220401BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB220401BC;
	Mon, 22 Jul 2024 16:23:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C43F1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED51A401BC
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bs7fz6XBeJ1k for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01DB1401B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01DB1401B0
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:23:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E05F787093; Mon, 22 Jul 2024 16:23:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 18:23:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec052de2fb744ebfa3de700b0d7a900e509cd660
X-Git-Newrev: f40757781ffca285053ef2fa8ea9e0971fd65678
X-Patchwork-Hint: ignore
Message-Id: <20240722162336.E05F787093@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson: support building both
 libraries
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f40757781ffca285053ef2fa8ea9e0971fd65678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

meson supports building both libraries (i.e. static and shared).
This will avoid the following build failure with flashrom and
BR2_SHARED_STATIC_LIBS raised since bump to version 1.4.0-rc2 in commit
8637884057ddc3c1aeb9f0dd285fc6fcf378c26b:

../output-1/build/flashrom-1.4.0-rc2/meson.build:18:2: ERROR: Problem encountered:
    Cannot build cli_classic with shared libflashrom. Use \'-Dclassic_cli=disabled\' to disable the cli,
    or use \'--default-library=both\' to also build the classic_cli

Fixes: 8637884057ddc3c1aeb9f0dd285fc6fcf378c26b
 - http://autobuild.buildroot.org/results/6d484857ff1674bf81986505827e54f3f1b9aaec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-meson.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 65cabf23ba..bc805b799c 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -82,6 +82,14 @@ else
 PKG_MESON_TARGET_FC = /bin/false
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+PKG_MESON_DEFAULT_LIBRARY=static
+else ifeq ($(BR2_SHARED_LIBS),y)
+PKG_MESON_DEFAULT_LIBRARY=shared
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+PKG_MESON_DEFAULT_LIBRARY=both
+endif
+
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
@@ -152,7 +160,7 @@ define $(2)_CONFIGURE_CMDS
 	$$(MESON) setup \
 		--prefix=/usr \
 		--libdir=lib \
-		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
+		--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
 		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
 		-Db_pie=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
