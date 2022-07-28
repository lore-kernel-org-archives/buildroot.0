Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC15BC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66EC84037C;
	Thu, 28 Jul 2022 19:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66EC84037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFh1KFFZeLGh; Thu, 28 Jul 2022 19:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8550A401DD;
	Thu, 28 Jul 2022 19:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8550A401DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5E131BF21A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB7D84032A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB7D84032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcfEPv4twBgd for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A6854016A
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A6854016A
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 64D4B86594; Thu, 28 Jul 2022 18:50:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 21:03:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 960fc93df2f7981e13a1bb7fb76fd958e36b8611
X-Git-Newrev: 2f32e668aa880c2d4a2cce6c789b7ca7ed6221ba
X-Patchwork-Hint: ignore
Message-Id: <20220728185030.64D4B86594@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zsh: Enable dynamic modules
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f32e668aa880c2d4a2cce6c789b7ca7ed6221ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The autoconf scripts seem to assume that no dynamic loader
is available if crosscompiling.
This results in only a small set of modules being enabled
and linked statically.

For comparison, debian patches the fallback to enable
dynamic modules (unconditionally).

This commit enables modules if shared libraries are enabled.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zsh/zsh.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index c5ab7c2fae..f03a2e6982 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -36,6 +36,19 @@ else
 ZSH_CONF_OPTS += --disable-pcre
 endif
 
+ifneq ($(BR2_STATIC_LIBS),y)
+# zsh uses TRY_RUN to determine these
+ZSH_CONF_OPTS += \
+	zsh_cv_shared_environ=yes \
+	zsh_cv_shared_tgetent=yes \
+	zsh_cv_shared_tigetstr=yes \
+	zsh_cv_sys_dynamic_clash_ok=yes \
+	zsh_cv_sys_dynamic_rtld_global=yes \
+	zsh_cv_sys_dynamic_execsyms=yes \
+	zsh_cv_sys_dynamic_strip_exe=yes \
+	zsh_cv_sys_dynamic_strip_lib=yes
+endif
+
 # Add /bin/zsh to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define ZSH_ADD_ZSH_TO_SHELLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
