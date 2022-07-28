Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D845AC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72E84402C3;
	Thu, 28 Jul 2022 19:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72E84402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id joby0ZtdUt4M; Thu, 28 Jul 2022 19:04:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7BB94016A;
	Thu, 28 Jul 2022 19:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7BB94016A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4E31C11A0
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB7B440327
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB7B440327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tPD9AdbP5Wm9 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64D40402F3
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64D40402F3
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7027986509; Thu, 28 Jul 2022 18:50:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 21:03:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f32e668aa880c2d4a2cce6c789b7ca7ed6221ba
X-Git-Newrev: ceb261cb4281e0d76f76724a30bf7e61ef59bef1
X-Patchwork-Hint: ignore
Message-Id: <20220728185030.7027986509@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zsh: enable static regex module
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

commit: https://git.buildroot.net/buildroot/commit/?id=ceb261cb4281e0d76f76724a30bf7e61ef59bef1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the builtin string =~ regexp operator needs to load the regex
module. This operator is used very often in zsh scripts, so
link it statically to avoid the overhead of dynamic loading.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zsh/zsh.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index f03a2e6982..4897620a00 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -49,6 +49,12 @@ ZSH_CONF_OPTS += \
 	zsh_cv_sys_dynamic_strip_lib=yes
 endif
 
+# regex is commonly used by completion scripts, link it statically
+define ZSH_USE_STATIC_REGEX_MODULE
+	$(SED) 's,echo dynamic,echo static,' $(@D)/Src/Modules/regex.mdd
+endef
+ZSH_POST_PATCH_HOOKS += ZSH_USE_STATIC_REGEX_MODULE
+
 # Add /bin/zsh to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define ZSH_ADD_ZSH_TO_SHELLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
