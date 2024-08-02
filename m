Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D6FC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C573606D3;
	Fri,  2 Aug 2024 21:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UVPLv6ZvyEX; Fri,  2 Aug 2024 21:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4172E61301
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4172E61301;
	Fri,  2 Aug 2024 21:15:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 722971BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F85240BA3
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoHyrVuTgSVx for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:15:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63E4440B8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63E4440B8F
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:15:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5B0783BDD; Fri,  2 Aug 2024 21:15:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 23:08:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 500ff76216a58df2eff2fd254e8efcd64565ba63
X-Git-Newrev: 65f8174648a3df922892cfac1ad15279d1bffde3
X-Patchwork-Hint: ignore
Message-Id: <20240802211506.C5B0783BDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: disable libdrm usage
 when not available
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

commit: https://git.buildroot.net/buildroot/commit/?id=65f8174648a3df922892cfac1ad15279d1bffde3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass USE_LIBDRM=OFF to the wpewebkit CMake configuration step when the
libdrm package has not been selected.

WPE WebKit can be built without libdrm support, and it will still work
with backends that use other platform-specific methods to handle
graphics buffers and/or presenting content onto an output. For example
this is the case with wpebackend-rdk configured to use rpi-userland,
which uses dispmanx to produce the output instead of DRM/KMS.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/wpewebkit.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 1355b65f61..36de0213f3 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -93,6 +93,13 @@ else
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
