Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0E3C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4725B83434;
	Sat, 22 Jul 2023 21:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4725B83434
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrU-2T6tNnUK; Sat, 22 Jul 2023 21:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 240748354D;
	Sat, 22 Jul 2023 21:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 240748354D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F40B1BF869
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 383EA415E7
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 383EA415E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JrKS4AM3WQs for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:26:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05817415E3
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05817415E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E736E821EA; Sat, 22 Jul 2023 21:26:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:26:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38f00e4935ec21059c4714518d2351a36da837bc
X-Git-Newrev: b4ab45a5c1db05f84efb5f3b6909982263afb1d4
X-Patchwork-Hint: ignore
Message-Id: <20230722212649.E736E821EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: disable libtracevent
 detection
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4ab45a5c1db05f84efb5f3b6909982263afb1d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream Linux commit 6898e60f709b0047206110d3ec9f4612210e3ff7
("perf build: If libtraceevent isn't present error the build") present
in Linux 6.4 and newer, Linux will fail to build if libtraceevent is not
present. Since we do not currently have support for libtracevent in
buildroot, pass NO_LIBTRACEVENT=1 to get perf to build again.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 122c7cbbc4..ee308a85df 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -27,7 +27,8 @@ PERF_MAKE_FLAGS = \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
-	NO_LIBBIONIC=1
+	NO_LIBBIONIC=1 \
+	NO_LIBTRACEEVENT=1
 
 # We need to pass an argument to ld for setting the emulation when
 # building for MIPS architecture, otherwise the default one will always
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
