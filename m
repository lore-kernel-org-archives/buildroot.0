Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D807C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 09:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85BCA610FF;
	Sat, 18 Dec 2021 09:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0H6BDE506FbE; Sat, 18 Dec 2021 09:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB907610F6;
	Sat, 18 Dec 2021 09:38:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE6581BF5F5
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 09:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB861401C9
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 09:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9LCBCY4O5JF for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 09:38:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D887740162
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 09:38:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AD41A818B0; Sat, 18 Dec 2021 09:33:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 10:38:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e4050b2d0372e1b47b57cc4210e3da5cb8ec3de
X-Git-Newrev: 3ba8e88e396f216ac8486580b8817aac92ae93b2
X-Patchwork-Hint: ignore
Message-Id: <20211218093311.AD41A818B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez-alsa: add support for aptX /
 aptX HD
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ba8e88e396f216ac8486580b8817aac92ae93b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds support for aptX (HD) decoder / encoder powered by the
libopenaptx library.

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez-alsa/bluez-alsa.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index f81720f767..a1e550ab6c 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -69,4 +69,12 @@ else
 BLUEZ_ALSA_CONF_OPTS += --disable-rfcomm
 endif
 
+ifeq ($(BR2_PACKAGE_LIBOPENAPTX),y)
+BLUEZ_ALSA_DEPENDENCIES += libopenaptx
+BLUEZ_ALSA_CONF_OPTS += --with-libopenaptx --enable-aptx --enable-aptx-hd
+else
+BLUEZ_ALSA_CONF_OPTS += --without-libopenaptx --disable-aptx --disable-aptx-hd
+endif
+
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
