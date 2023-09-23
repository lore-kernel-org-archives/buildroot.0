Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0E4CE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 20:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 264E340C08;
	Sat, 23 Sep 2023 20:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 264E340C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LlWN9iBcS94n; Sat, 23 Sep 2023 20:32:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73915409F3;
	Sat, 23 Sep 2023 20:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73915409F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 690951BF292
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 20:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4324681FEB
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 20:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4324681FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npPebC1ZdhlK for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 20:32:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87BC981FEA
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 20:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87BC981FEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 562BD87323; Sat, 23 Sep 2023 20:32:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 22:29:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 719921bebe1704f5b88b7419bac1fb1105c0c151
X-Git-Newrev: cd46e1b1439e854dc9e4c016795d6e5276e4c573
X-Patchwork-Hint: ignore
Message-Id: <20230923203237.562BD87323@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nut: package/nut: specify
 --with-user/group when building NUT
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd46e1b1439e854dc9e4c016795d6e5276e4c573
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes a problem where the NUT package couldn't be
used as a NUT server due to the fact that the default group for
nobody is "nogroup" and not "nobody" like the internal default
of NUT. Thus, when starting a NUT server daemon the daemon starts
with incorrect group permissions. This commit fixes this
shortcoming by introducing a dedicated 'nut' user and 'nut' group
to drop priviledges to it.

Signed-off-by: Jens Maus <mail@jens-maus.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nut/nut.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index fb98ba04f0..4c322aeb85 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -24,7 +24,9 @@ NUT_POST_PATCH_HOOKS += NUT_FIX_CONFIGURE
 NUT_CONF_OPTS = \
 	--with-altpidpath=/var/run/upsd \
 	--with-dev \
-	--without-doc
+	--without-doc \
+	--with-user=nut \
+	--with-group=nut
 
 NUT_CONF_ENV = \
 	ax_cv_check_cflags__Werror__Wno_unknown_warning_option=no \
@@ -34,6 +36,10 @@ NUT_CONF_ENV = \
 	ac_cv_func_strncasecmp=yes \
 	ax_cv__printf_string_null=yes
 
+define NUT_USERS
+	nut -1 nut -1 * - - - NUT user
+endef
+
 ifeq ($(call qstrip,$(BR2_PACKAGE_NUT_DRIVERS)),)
 NUT_CONF_OPTS += --with-drivers=auto
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
