Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A34C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 18:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C14FE61178;
	Wed,  8 Feb 2023 18:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C14FE61178
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjzFOxQGeRV2; Wed,  8 Feb 2023 18:20:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21EA761174;
	Wed,  8 Feb 2023 18:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21EA761174
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DCCF1BF5E6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58F7640C7B
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58F7640C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id znWwzKTxhCW0 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 18:19:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7176740184
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7176740184
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 18:19:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 653CC40009;
 Wed,  8 Feb 2023 18:19:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pPp2h-00GTA0-Fh; Wed, 08 Feb 2023 19:19:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 19:19:30 +0100
Message-Id: <20230208181933.3925279-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208181933.3925279-1-peter@korsgaard.com>
References: <20230208181933.3925279-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/glmark2: use external waf
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Spenser Gilliland <spenser@gillilanding.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/bbd/bbd90f11975b691f694412a6fc3446f37dd7c0aa/

The bundled waf script is too old (1.9.3) for python >= 3.11 as it uses the
'U' modifier to open (universal newlines), which have been deprecated since
python 3.3 and finally removed in 3.11.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glmark2/glmark2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index e8d6f71dad..bac9d9ff6f 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -10,6 +10,9 @@ GLMARK2_LICENSE = GPL-3.0+, SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
 GLMARK2_DEPENDENCIES = host-pkgconf jpeg libegl libpng
 
+# The bundled waf script is too old for >= python3.11
+GLMARK2_NEEDS_EXTERNAL_WAF = YES
+
 ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2),y)
 GLMARK2_DEPENDENCIES += libdrm libgbm libgles udev
 GLMARK2_FLAVORS += drm-glesv2
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
