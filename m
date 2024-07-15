Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B715C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0322740609;
	Mon, 15 Jul 2024 12:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id da0XKVJQy8ly; Mon, 15 Jul 2024 12:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C7F54067A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C7F54067A;
	Mon, 15 Jul 2024 12:41:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63C811BF3B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D171403F8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aE15fZSjCjYF for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F0384047E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F0384047E
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AA08869DA; Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 14:31:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89ff62a0f4c3a97161af38518b3964e32d54341b
X-Git-Newrev: fc8355c7f56e775b6aa801270a0c679d3f78198d
X-Patchwork-Hint: ignore
Message-Id: <20240715124057.3AA08869DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libassuan: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc8355c7f56e775b6aa801270a0c679d3f78198d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable was added in commit
62c7857dfa5036e26d5b921c199e66621a4bc508 ("package/libassuan: add host
variant"), but in fact does not make sense for a host
package. Indeed, config scripts only need to be tweaked for target
packages, and in any case, the <pkg>_CONFIG_SCRIPTS variable is only
used during staging installation (to tweak the config scripts) and
during target installation (to remove them), and neither staging nor
target installation are relevant for host packages.

Therefore, let's remove this small piece of dead code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libassuan/libassuan.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 8e827bdb80..9cdc34bda2 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -16,7 +16,6 @@ LIBASSUAN_CONF_OPTS = \
 LIBASSUAN_CONFIG_SCRIPTS = libassuan-config
 
 HOST_LIBASSUAN_DEPENDENCIES = host-libgpg-error
-HOST_LIBASSUAN_CONFIG_SCRIPTS = libassuan-config
 HOST_LIBASSUAN_CONF_OPTS = --with-gpg-error-prefix=$(HOST_DIR)
 
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
