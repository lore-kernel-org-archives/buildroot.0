Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A096C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 037BF81D5F;
	Sun, 12 Mar 2023 09:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 037BF81D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dB8dH28dLNV0; Sun, 12 Mar 2023 09:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33F0981D24;
	Sun, 12 Mar 2023 09:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33F0981D24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11241BF20D
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97B138186A
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97B138186A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3K5LIhpZdOZz for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:59:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D173581BBD
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D173581BBD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF77586E99; Sun, 12 Mar 2023 09:59:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 10:58:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f32176a7671d8842b175077a92e268226fcec78f
X-Git-Newrev: 6a8e1e220fb283d57f07d68e96312a5215afd517
X-Patchwork-Hint: ignore
Message-Id: <20230312095943.BF77586E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libwebsockets: enable
 libev and libevent support indipendently
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a8e1e220fb283d57f07d68e96312a5215afd517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libev and libevent can be enabled at the same time since version 4.1.0,
thanks to the event lib support refactoring into plugins, which is enabled by
default for unix platform builds (LWS_WITH_EVLIB_PLUGINS=ON):
https://github.com/warmcat/libwebsockets/commit/c6c7ab2b4498c62bf9461b36395d8466e023575d

In this way, libwebsockets can be compiled with both libev and libevent
support, which is then user-selectable at runtime.

This basically restores the behavior changed by previous commit 27f257e.

Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libwebsockets/libwebsockets.mk | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 79624948a5..fb0ee66883 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -57,18 +57,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBEV),y)
 LIBWEBSOCKETS_DEPENDENCIES += libev
-LIBWEBSOCKETS_CONF_OPTS += \
-	-DLWS_WITH_LIBEV=ON \
-	-DLWS_WITH_LIBEVENT=OFF
-else ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEV=ON
+else
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEV=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBWEBSOCKETS_DEPENDENCIES += libevent
-LIBWEBSOCKETS_CONF_OPTS += \
-	-DLWS_WITH_LIBEV=OFF \
-	-DLWS_WITH_LIBEVENT=ON
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEVENT=ON
 else
-LIBWEBSOCKETS_CONF_OPTS += \
-	-DLWS_WITH_LIBEV=OFF \
-	-DLWS_WITH_LIBEVENT=OFF
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEVENT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
