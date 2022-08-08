Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5958CC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CC7E60586;
	Mon,  8 Aug 2022 21:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC7E60586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d2bP0QLI-aF5; Mon,  8 Aug 2022 21:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45A7060ACC;
	Mon,  8 Aug 2022 21:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45A7060ACC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 024371BF3BF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF71B401DF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF71B401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-29UscFizfE for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:07:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11E2040189
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11E2040189
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C28D0868BB; Mon,  8 Aug 2022 20:53:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 23:07:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b291f1bace77b0f462d663b16fab719187dab88
X-Git-Newrev: 328674465ce2f072d23e7102ae22123b1c5ab8ec
X-Patchwork-Hint: ignore
Message-Id: <20220808205319.C28D0868BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsyslog: add hiredis optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=328674465ce2f072d23e7102ae22123b1c5ab8ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
