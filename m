Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FFFC742A7
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 20:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F360B404FF;
	Wed,  8 Mar 2023 20:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F360B404FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p26VNXYgiF9S; Wed,  8 Mar 2023 20:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F7D8405AB;
	Wed,  8 Mar 2023 20:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F7D8405AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 154951BF94D
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 20:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDF7140926
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 20:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDF7140926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNh7vev7HLCL for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 20:34:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F14B340438
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 20:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F14B340438
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D708A86A5F; Wed,  8 Mar 2023 20:34:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Mar 2023 21:26:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08f5edd921dd0043e10c4b3e9667f173aea9620e
X-Git-Newrev: 63e33bf88dd2138c4caa3dbfd5e1d89518ddd398
X-Patchwork-Hint: ignore
Message-Id: <20230308203404.D708A86A5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: fix build without
 avahi-client
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

commit: https://git.buildroot.net/buildroot/commit/?id=63e33bf88dd2138c4caa3dbfd5e1d89518ddd398
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without avahi-client raised since commit
7752afbe4bb9fa1def5ba89daf21564ea58af79a (before this commit, avahi was
silently disabled):

../output-1/build/pulseaudio-16.1/meson.build:754:2: ERROR: Dependency "avahi-client" not found, tried pkgconfig and cmake

Fixes:
 - http://autobuild.buildroot.org/results/0aea014eb4ed27870af908668d7b138d150f065a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 8c4b99b6ff..89191db541 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -25,7 +25,7 @@ PULSEAUDIO_DEPENDENCIES = \
 
 PULSEAUDIO_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 PULSEAUDIO_CONF_OPTS += -Davahi=enabled
 PULSEAUDIO_DEPENDENCIES += avahi
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
