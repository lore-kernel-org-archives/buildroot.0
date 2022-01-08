Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EF9C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E31E40946;
	Sat,  8 Jan 2022 15:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJ8w3jvLwIIh; Sat,  8 Jan 2022 15:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B29B40979;
	Sat,  8 Jan 2022 15:15:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56C591BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44DF340979
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PoAk_OKnDDVs for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D6B14030C
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 21B6782AB6; Sat,  8 Jan 2022 15:09:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:48:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53d82096b67ac23185e7cbece9a93aff00f0986c
X-Git-Newrev: 9be2c73c59c1f4082040ab0d4fce12a867edd080
X-Patchwork-Hint: ignore
Message-Id: <20220108150928.21B6782AB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/domoticz: fix build with
 libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=9be2c73c59c1f4082040ab0d4fce12a867edd080
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failure raised since the addition of the libexecinfo package
in commit eea8ba446c10701a273432552108d80fb2224ef4

Fixes:
 - Not autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/domoticz/domoticz.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index ee5a41b8c1..f142791830 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -41,6 +41,11 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_SQLITE=OFF \
 	-DUSE_BUILTIN_MQTT=OFF
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+DOMOTICZ_DEPENDENCIES += libexecinfo
+DOMOTICZ_CONF_OPTS += -DEXECINFO_LIBRARIES=-lexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 DOMOTICZ_DEPENDENCIES += libusb
 DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
