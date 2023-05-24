Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D3FC77B7C
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 20:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B95342A17;
	Wed, 24 May 2023 20:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B95342A17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCvVeipKu_4Q; Wed, 24 May 2023 20:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4750A42A14;
	Wed, 24 May 2023 20:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4750A42A14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0FC1BF2F9
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84E4C42A14
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84E4C42A14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FR1yCF6l8iSM for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 20:02:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE65542A13
 for <buildroot@buildroot.org>; Wed, 24 May 2023 20:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE65542A13
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD379868C7; Wed, 24 May 2023 20:02:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 22:01:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7685016cdc5582985dc8fcb1eac09623467a2bc0
X-Git-Newrev: 7e7c321ba0424123b0bf6f10a31af00607daaa8f
X-Patchwork-Hint: ignore
Message-Id: <20230524200204.BD379868C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mosquitto:
 libwebsockets support needs external loop support
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
