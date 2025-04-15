Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79364C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 21:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2463940DC6;
	Tue, 15 Apr 2025 21:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZqpH_FDz4yKm; Tue, 15 Apr 2025 21:40:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B1F14040B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B1F14040B;
	Tue, 15 Apr 2025 21:40:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7F0A6B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D455E83506
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EshzwcHuUJhW for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 21:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21416834C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21416834C7
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C1B084C6B; Tue, 15 Apr 2025 21:40:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 22:37:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2eb2ee58b9f70ebb83231537cca19bd28fa48de
X-Git-Newrev: 36b0a3ef9c088117a32227df20226a86d1568465
X-Patchwork-Hint: ignore
Message-Id: <20250415214009.0C1B084C6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: add (proposed)
 upstream fix for parallel installation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=36b0a3ef9c088117a32227df20226a86d1568465
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The openssl developers have proposed a fix for the parallel installation
issue worked around by commit 27ab880ebb9a (package/libopenssl do not build
in parallel).

Add the fix here so the workaround can dropped again.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...nstall-process-to-avoid-multiple-make-dep.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
new file mode 100644
index 0000000000..feb0e21ef7
--- /dev/null
+++ b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
@@ -0,0 +1,44 @@
+From 4562b002366535b3d387fae7fa1dbd8e315ae142 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@openssl.org>
+Date: Mon, 14 Apr 2025 12:23:15 -0400
+Subject: [PATCH] Serialize install process to avoid multiple make depend
+ operations
+
+If make install is run with a large -j value (make install -j N , where
+N > 1)
+
+We can run into a situation in which the install fails because multiple
+make depend operations are running in parallel, which will fail due to
+makefile rewriting.
+
+Serialize the install process to guarantee that those operations don't
+step on one another
+
+Fixes # 27074
+
+Upstream: https://github.com/openssl/openssl/pull/27388
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Configurations/unix-Makefile.tmpl | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index e85763ccf8..b671723813 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -650,7 +650,11 @@ depend: Makefile
+ # Install helper targets #############################################
+ ##@ Installation
+ 
+-install: install_sw install_ssldirs {- "install_docs" if !$disabled{docs}; -} {- $disabled{fips} ? "" : "install_fips" -} ## Install software and documentation, create OpenSSL directories
++install: Makefile ## Install software and documentation, create OpenSSL directories
++	$(MAKE) install_sw
++	$(MAKE) install_ssldirs
++	{- "\$(MAKE) install_docs" if !$disabled{docs} -}
++	{- "\$(MAKE) install_fips" if !$disabled{fips} -}
+ 
+ uninstall: {- "uninstall_docs" if !$disabled{docs}; -} uninstall_sw {- $disabled{fips} ? "" : "uninstall_fips" -} ## Uninstall software and documentation
+ 
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
