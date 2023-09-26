Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E321E7D24D
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 08:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05C62811FF;
	Tue, 26 Sep 2023 08:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C62811FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pH_KrYgTtaXB; Tue, 26 Sep 2023 08:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ED8880EA3;
	Tue, 26 Sep 2023 08:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ED8880EA3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 126BD1BF969
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 08:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF18441E57
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 08:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF18441E57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7hMKbWYt8kL for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 08:04:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E218B41E49
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 08:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E218B41E49
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE0BA87822; Tue, 26 Sep 2023 08:04:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 10:01:15 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: abedb15b530a188ae1f5f514dde7dc98ffd3e76c
X-Git-Newrev: c99a559d986a72891f3abe5fb5bba9899e12d0c4
X-Patchwork-Hint: ignore
Message-Id: <20230926080416.CE0BA87822@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/nut: package/nut:
 specify --with-user/group when building NUT
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

commit: https://git.buildroot.net/buildroot/commit/?id=c99a559d986a72891f3abe5fb5bba9899e12d0c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

This commit fixes a problem where the NUT package couldn't be
used as a NUT server due to the fact that the default group for
nobody is "nogroup" and not "nobody" like the internal default
of NUT. Thus, when starting a NUT server daemon the daemon starts
with incorrect group permissions. This commit fixes this
shortcoming by introducing a dedicated 'nut' user and 'nut' group
to drop priviledges to it.

Signed-off-by: Jens Maus <mail@jens-maus.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cd46e1b1439e854dc9e4c016795d6e5276e4c573)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
