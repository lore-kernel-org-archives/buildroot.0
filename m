Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62144C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10683826C0;
	Wed, 14 Sep 2022 22:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10683826C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZD97-aTFSJj; Wed, 14 Sep 2022 22:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 270FB80C06;
	Wed, 14 Sep 2022 22:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 270FB80C06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F9DB1BF38C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A59318198A
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A59318198A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6mQvESYizDM for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:29:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43B498199D
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43B498199D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2CB7F83B20; Wed, 14 Sep 2022 22:29:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 00:20:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5a69737e5ddc3d44392a27a97e70ffa2c6edf349
X-Git-Newrev: 916e3e98979905d1eb1be51adc8d7c056704c054
X-Patchwork-Hint: ignore
Message-Id: <20220914222919.2CB7F83B20@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rsyslog: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=916e3e98979905d1eb1be51adc8d7c056704c054
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
