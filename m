Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B38C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E2A740637;
	Mon, 15 Jul 2024 12:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Zf8CE8-CM60; Mon, 15 Jul 2024 12:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988904060B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 988904060B;
	Mon, 15 Jul 2024 12:41:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 447761BF3B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30B5381076
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44JWZnsJ9FvR for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 700548100C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 700548100C
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21C7781DB9; Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 14:31:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4574edef7fabb3c1fb5279c0fcfb5c83c3f0e057
X-Git-Newrev: 89ff62a0f4c3a97161af38518b3964e32d54341b
X-Patchwork-Hint: ignore
Message-Id: <20240715124057.21C7781DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpgme: drop
 HOST_LIBGPGME_CONFIG_SCRIPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=89ff62a0f4c3a97161af38518b3964e32d54341b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable was added in commit
6a4ad23a07236348034a54997dd09e79166f2d11 ("package/libgpgme: add host
variant"), but in fact does not make sense for a host package. Indeed,
config scripts only need to be tweaked for target packages, and in any
case, the <pkg>_CONFIG_SCRIPTS variable is only used during staging
installation (to tweak the config scripts) and during target
installation (to remove them), and neither staging nor target
installation are relevant for host packages.

Therefore, let's remove this small piece of dead code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpgme/libgpgme.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 7e224e1962..635aea4955 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -48,7 +48,6 @@ LIBGPGME_CONF_OPTS += --disable-linux-getdents
 endif
 
 HOST_LIBGPGME_DEPENDENCIES = host-libassuan host-libgpg-error
-HOST_LIBGPGME_CONFIG_SCRIPTS = gpgme-config
 
 # C++ bindings require a C++11 capable gcc, and -Wsuggest-override support
 # Let's assume the host toolchain always has C++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
