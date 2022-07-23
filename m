Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7F5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06D4940B1A;
	Sat, 23 Jul 2022 14:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D4940B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58LEO7AwGohI; Sat, 23 Jul 2022 14:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04D2440164;
	Sat, 23 Jul 2022 14:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04D2440164
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B19C51BF314
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AAF960759
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AAF960759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Haxd9UBfb444 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:33:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF6D360644
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF6D360644
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C97868447B; Sat, 23 Jul 2022 14:19:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:32:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a4ac1e7fa715669aa2ab2a58b564fc875c07c68
X-Git-Newrev: a2380157f6688c5c065fa19060a2c33145bab95b
X-Patchwork-Hint: ignore
Message-Id: <20220723141949.C97868447B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: enable libquadmath for PowerPC
 with VSX
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
Content-Type: multipart/mixed; boundary="===============8367198413737927414=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8367198413737927414==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a2380157f6688c5c065fa19060a2c33145bab95b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

float128 is available on PowerPC with VSX [1] but it requires
libquadmath support.

[1] https://gcc.gnu.org/onlinedocs/gcc-9.1.0/gcc/Floating-Types.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Cyril Bur <cyrilbur@gmail.com>
Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ea59ca2960..414c3eb275 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -833,9 +833,11 @@ config BR2_TOOLCHAIN_HAS_ATOMIC
 # - At least, libquadmath is available on:
 #   - i*86
 #   - x86_64
+#   - PowerPC with vector scalar (VSX) instruction set
 # - When available, libquadmath requires wchar support.
 config BR2_TOOLCHAIN_HAS_LIBQUADMATH
 	bool
 	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_POWERPC_CPU_HAS_VSX
 
 endmenu

--===============8367198413737927414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8367198413737927414==--
