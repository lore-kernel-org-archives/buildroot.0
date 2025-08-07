Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0759FC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE69A40588;
	Thu,  7 Aug 2025 17:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6NFoGlc5o44; Thu,  7 Aug 2025 17:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07A8340599
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A8340599;
	Thu,  7 Aug 2025 17:19:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 026AB4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07BD740499
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apbk3-Oww7Aw for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2584C404AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2584C404AB
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17C5886FE5; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:11:37 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 586f3b27605c07cc648f347706ccd4ff5253213c
X-Git-Newrev: 9049b5ff85e2a6359d80961a03a1a63d3dbd7d08
X-Patchwork-Hint: ignore
Message-Id: <20250807171917.17C5886FE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/sudo: Enable
 libxcrypt with glibc, allowing hashed passwords without PAM
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9049b5ff85e2a6359d80961a03a1a63d3dbd7d08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Per https://gitlab.com/buildroot.org/buildroot/-/issues/27 , on glibc
builds without PAM, sudo will "fail" all password prompts.

It was found that it's simply checking the entered string against the
raw hash, because 'libcryp' isn't available. On glibc, we need libxcrypt,
so enable it and ensure sudo is built with it.

musl and uclibc do have crypt() functions, so this is not needed.

Relevant code from sudo:
 https://github.com/sudo-project/sudo/blob/v1.9.17p1/plugins/sudoers/auth/passwd.c#L139

Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6044cc5f26f8f076ead9a3d22dd84681c7c9e23f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sudo/Config.in | 1 +
 package/sudo/sudo.mk   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index ee5ea542ab..85bc4859b8 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SUDO
 	bool "sudo"
 	# uses fork()
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Sudo is a program designed to allow a sysadmin to give
 	  limited root privileges to users and log root activity. The
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index f57a86805a..0aacd8207d 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -37,6 +37,10 @@ else
 SUDO_CONF_OPTS += --without-pam
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+SUDO_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 SUDO_CONF_OPTS += --enable-zlib
 SUDO_DEPENDENCIES += zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
