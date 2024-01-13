Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796BAC4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 14:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36AF74109F;
	Sat, 13 Jan 2024 14:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36AF74109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SehpUJr2d-_F; Sat, 13 Jan 2024 14:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 880EA408C9;
	Sat, 13 Jan 2024 14:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880EA408C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77E0E1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 14:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 508B481321
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 14:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 508B481321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ueJFbp3sG3v for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 14:39:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8255681320
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 14:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8255681320
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B3EB85FE9; Sat, 13 Jan 2024 14:39:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 14:59:05 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 84bc0dafe2a0ad07176307b4c070fdfd5aac194b
X-Git-Newrev: 2b46bd740417facb89807d767a6904049242cdbe
X-Patchwork-Hint: ignore
Message-Id: <20240113143934.6B3EB85FE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/madplay: force
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b46bd740417facb89807d767a6904049242cdbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
