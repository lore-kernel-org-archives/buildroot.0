Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72F2ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B3D60AE7;
	Wed, 14 Sep 2022 22:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63B3D60AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDo5Lqwj0TkU; Wed, 14 Sep 2022 22:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A28260EFD;
	Wed, 14 Sep 2022 22:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A28260EFD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B9581C1148
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44DBB60E11
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44DBB60E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40r2d7D8n1YK for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EB1960E2C
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EB1960E2C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 28C7983B96; Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 00:20:26 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: bbe4a64e36c7c4fa10741c752e2172d94976b864
X-Git-Newrev: 34280e0e9ba7e2b7c0802596d298c06b0243b6ef
X-Patchwork-Hint: ignore
Message-Id: <20220914222927.28C7983B96@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/rsyslog: add
 hiredis optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=34280e0e9ba7e2b7c0802596d298c06b0243b6ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 328674465ce2f072d23e7102ae22123b1c5ab8ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index a6e32ecea1..84fd2d2e5e 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -73,6 +73,13 @@ else
 RSYSLOG_CONF_OPTS += --disable-gnutls
 endif
 
+ifeq ($(BR2_PACKAGE_HIREDIS),y)
+RSYSLOG_DEPENDENCIES += hiredis
+RSYSLOG_CONF_OPTS += --enable-omhiredis
+else
+RSYSLOG_CONF_OPTS += --disable-omhiredis
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 RSYSLOG_DEPENDENCIES += libgcrypt
 RSYSLOG_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
