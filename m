Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5BFE7B615
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 13:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 560AB60B0B;
	Wed,  4 Oct 2023 13:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 560AB60B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yNiP5LUccQJ; Wed,  4 Oct 2023 13:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7A7E6137C;
	Wed,  4 Oct 2023 13:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7A7E6137C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F8011BF2BC
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 763986137C
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 763986137C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLay_LuWggBY for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 13:32:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46B5060B0B
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 13:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46B5060B0B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D2831C0013;
 Wed,  4 Oct 2023 13:32:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qo1zS-00282L-VM; Wed, 04 Oct 2023 15:32:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 15:32:33 +0200
Message-Id: <20231004133233.507482-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/nano: really disable nanorc for
 !BR2_PACKAGE_FILE
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 3c4fa30f7abf (package/nano: fix tiny build) tried to explicitly
disable libmagic/coloring/nanorc, but accidently passed 2x
--disable-libmagic instead of --disable-nanorc.  Fix that.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 8a2003b92a..8b93527bec 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -34,7 +34,7 @@ ifeq ($(BR2_PACKAGE_FILE),y)
 NANO_DEPENDENCIES += file
 NANO_CONF_OPTS += --enable-libmagic --enable-color --enable-nanorc
 else
-NANO_CONF_OPTS += --disable-libmagic --disable-libmagic --disable-color
+NANO_CONF_OPTS += --disable-libmagic --disable-color --disable-nanorc
 endif # BR2_PACKAGE_FILE
 endif # BR2_PACKAGE_NANO_TINY
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
