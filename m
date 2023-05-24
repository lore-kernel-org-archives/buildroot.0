Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D5DC77B73
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 20:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A071642A23;
	Wed, 24 May 2023 20:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A071642A23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ebfTWmMieXC3; Wed, 24 May 2023 20:02:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9C3D42A1D;
	Wed, 24 May 2023 20:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9C3D42A1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E924A1BF2F9
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFB43612B1
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFB43612B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w45S4PV8XpHK for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 20:02:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6B7E611D9
 for <buildroot@buildroot.org>; Wed, 24 May 2023 20:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6B7E611D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B307E868C6; Wed, 24 May 2023 20:02:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 21:59:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a6599bc75384b4cd1052940297ba07d58346c97f
X-Git-Newrev: 7685016cdc5582985dc8fcb1eac09623467a2bc0
X-Patchwork-Hint: ignore
Message-Id: <20230524200204.B307E868C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libwebsockets:
 (re-)enable external poll loop support
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

commit: https://git.buildroot.net/buildroot/commit/?id=7685016cdc5582985dc8fcb1eac09623467a2bc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since version 3.2.0, libwebsockets does not compile its external loop
support code anymore. That code was put under LWS_WITH_EXTERNAL_POLL
compile option, which defaults to OFF.

Applications relying on that support need to turn that option on, so
let's add it to the package.

For example, when libwebsockets is enabled, mosquitto broker is built
with websocket support, but its code requires LWS_WITH_EXTERNAL_POLL
to be on, otherwise it gives compile-time warning hinting to unusable
websocket support:

https://github.com/eclipse/mosquitto/commit/1b24f625ea4ee77f3c4796ec2233d059f8c7977e

Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libwebsockets/Config.in        | 12 ++++++++++++
 package/libwebsockets/libwebsockets.mk |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index d7b529cafd..05c132641e 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -9,5 +9,17 @@ config BR2_PACKAGE_LIBWEBSOCKETS
 
 	  https://libwebsockets.org/
 
+if BR2_PACKAGE_LIBWEBSOCKETS
+
+config BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL
+	bool "enable external poll loop support"
+	default y  # legacy, was previously always enabled
+	help
+	  Enable external poll loop support code. This was
+	  unconditionally compiled in for library versions
+	  prior to 3.2.0.
+
+endif
+
 comment "libwebsockets needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index fb0ee66883..86756ca612 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -94,4 +94,8 @@ ifeq ($(BR2_SHARED_LIBS),y)
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_STATIC=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL),y)
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_EXTERNAL_POLL=ON
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
