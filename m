Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AF0CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C1D740A02;
	Tue,  3 Sep 2024 18:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayIwOJlj952I; Tue,  3 Sep 2024 18:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5266040A45
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5266040A45;
	Tue,  3 Sep 2024 18:44:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9B6D1BF59C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 976D7607A7
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MDtGMHl12oM for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF20B606E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF20B606E3
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:44:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8F5186B05; Tue,  3 Sep 2024 18:44:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 19:59:01 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 93fa10270225f3359d36dc625218f66f10d67ae4
X-Git-Newrev: b9978410c1471a9424b33b44087131d1bf86d50c
X-Patchwork-Hint: ignore
Message-Id: <20240903184427.B8F5186B05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/wpewebkit:
 disable libdrm usage when not available
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9978410c1471a9424b33b44087131d1bf86d50c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Pass USE_LIBDRM=OFF to the wpewebkit CMake configuration step when the
libdrm package has not been selected.

WPE WebKit can be built without libdrm support, and it will still work
with backends that use other platform-specific methods to handle
graphics buffers and/or presenting content onto an output. For example
this is the case with wpebackend-rdk configured to use rpi-userland,
which uses dispmanx to produce the output instead of DRM/KMS.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 65f8174648a3df922892cfac1ad15279d1bffde3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index ecb3b3e352..9daca79fc7 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -87,6 +87,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DUSE_LIBBACKTRACE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_LIBDRM=ON
+WPEWEBKIT_DEPENDENCIES += libdrm
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_LIBDRM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WOFF2),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=ON
 WPEWEBKIT_DEPENDENCIES += woff2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
