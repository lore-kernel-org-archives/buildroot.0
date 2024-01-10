Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17097C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 10:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3DBF613FC;
	Wed, 10 Jan 2024 10:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3DBF613FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5VFt2IFNvn0; Wed, 10 Jan 2024 10:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D1B61414;
	Wed, 10 Jan 2024 10:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27D1B61414
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A2F61BF354
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13B564151C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B564151C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KICMoNYkOJWo for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 10:36:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B789404DF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 10:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B789404DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 283448555E; Wed, 10 Jan 2024 10:36:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 11:35:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e12b7dd49d1c64a5195f226e9e4da21e84f5d0c
X-Git-Newrev: a9da69260691bb692d7a2f0417fc5f52bcf45b5e
X-Patchwork-Hint: ignore
Message-Id: <20240110103634.283448555E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/madplay: force arm mode instead of
 Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9da69260691bb692d7a2f0417fc5f52bcf45b5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
