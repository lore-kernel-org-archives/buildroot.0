Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839D6C7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 16:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09B4840C25;
	Fri,  9 Jun 2023 16:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09B4840C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_tmNXwf1Q24; Fri,  9 Jun 2023 16:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3540D419F7;
	Fri,  9 Jun 2023 16:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3540D419F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E2CC1BF97F
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5534841A05
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5534841A05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6QZfRRlPNLf for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 16:13:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 898F840BD6
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 16:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 898F840BD6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79C0C8262B; Fri,  9 Jun 2023 16:13:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 22:01:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7685016cdc5582985dc8fcb1eac09623467a2bc0
X-Git-Newrev: 7e7c321ba0424123b0bf6f10a31af00607daaa8f
X-Patchwork-Hint: ignore
Message-Id: <20230609161307.79C0C8262B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: libwebsockets support
 needs external loop support
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e7c321ba0424123b0bf6f10a31af00607daaa8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libwebsockets is enabled, mosquitto broker is built with websocket
support, but its code requires libwebsockets being built with external
loop option - otherwise, mosquitto gives a compile-time warning hinting
to unusable websocket support:

https://github.com/eclipse/mosquitto/commit/1b24f625ea4ee77f3c4796ec2233d059f8c7977e

To fix this, select the BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL option.

Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mosquitto/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 6fa5f79c6c..8bedf2ad21 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # include <dlfcn.h>
 	depends on BR2_PACKAGE_MOSQUITTO
+	select BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL if BR2_PACKAGE_LIBWEBSOCKETS
 	help
 	  Build and install the mosquitto broker onto target.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
