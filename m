Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AD9E7D26B
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 09:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B46461471;
	Tue, 26 Sep 2023 09:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B46461471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6dB6nHDoKfb; Tue, 26 Sep 2023 09:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DCD261408;
	Tue, 26 Sep 2023 09:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DCD261408
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ACBD1BF2FA
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7114D41E50
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7114D41E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7sby65pOJUbZ for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 09:02:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B1AC41E4B
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 09:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B1AC41E4B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58DDD80DA8; Tue, 26 Sep 2023 09:02:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 10:01:09 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7da37962ced51497d9060c845b9f215fc67ec070
X-Git-Newrev: 939ff67d15b7db28d67473b1503d1870578a83ca
X-Patchwork-Hint: ignore
Message-Id: <20230926090230.58DDD80DA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/nut: package/nut:
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

commit: https://git.buildroot.net/buildroot/commit/?id=939ff67d15b7db28d67473b1503d1870578a83ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
