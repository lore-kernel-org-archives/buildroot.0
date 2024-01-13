Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEE2C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 14:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C0E4090A;
	Sat, 13 Jan 2024 14:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05C0E4090A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2JN89O9WmNr; Sat, 13 Jan 2024 14:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4900741F35;
	Sat, 13 Jan 2024 14:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4900741F35
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46FC21BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 14:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F37A60E70
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 14:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F37A60E70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRU9NIenHKy0 for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 14:41:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4529F60E44
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 14:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4529F60E44
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29B9B85FEF; Sat, 13 Jan 2024 14:41:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 14:58:14 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 46f61f9e289a2de74a9e7daf5a1da4f8a22e77c9
X-Git-Newrev: be5dd7cdfef5f9015329b7c7e410fe7480a23f8c
X-Patchwork-Hint: ignore
Message-Id: <20240113144144.29B9B85FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/madplay: force
 arm mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=be5dd7cdfef5f9015329b7c7e410fe7480a23f8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following build failure raised because madplay uses mad_f_mul
which is defined in usr/include/mad.h (installed by libmad which has
been fixed by a similar workaround in commit
0aaadd525f2df02911349ffe1518814fa095bf96, unfortunately the fix works
for compiled code, not mad_f_mul define):

/tmp/cc5SGGoU.s:102: Error: selected processor does not support `smull r8,r9,r2,r4' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/0c0955d4f6726b50cad721f4d3437dabde316e70

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a9da69260691bb692d7a2f0417fc5f52bcf45b5e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/madplay/madplay.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index e1a78bd7d7..91ee44ab5f 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -15,6 +15,14 @@ MADPLAY_DEPENDENCIES = host-pkgconf libmad libid3tag $(TARGET_NLS_DEPENDENCIES)
 # Also 0003-configure-ac-use-pkg-config-to-find-id3tag.patch
 MADPLAY_AUTORECONF = YES
 
+# madplay uses libmad which has some assembly function that is not present in
+# Thumb mode:
+# Error: selected processor does not support `smull r8,r9,r2,r4' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+MADPLAY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
