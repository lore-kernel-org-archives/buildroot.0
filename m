Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99ACAC43216
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 19:49:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AB3E60FE6
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 19:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AB3E60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE2C940707;
	Fri, 27 Aug 2021 19:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCGz-WjaG0x0; Fri, 27 Aug 2021 19:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A30740717;
	Fri, 27 Aug 2021 19:49:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD921BF5A0
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 19:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B2476069E
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 19:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q3SkofqZ54YE for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 19:49:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD1E660673
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 19:49:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 105378E739; Fri, 27 Aug 2021 19:48:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 21:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa1a4bbf09e8650cc73773fe2cf08d0b5216d6c1
X-Git-Newrev: eaece8645b6fb6cbaef6ae8ac6aeacaaa7ced20c
X-Patchwork-Hint: ignore
Message-Id: <20210827194825.105378E739@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/acmesystems/{aria,
 arietta}-g25: fix genimage.cfg
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=eaece8645b6fb6cbaef6ae8ac6aeacaaa7ced20c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On the Aria and the Arietta AT91Bootstrap builds, the file name of the
bootloader embeds its version number, and the genimage configuration
needs this filename in order to build the boot filesystem image. Commit
0614f435a09e99c33f418a646eaa7647944c2f4c bumped the AT91Bootstrap
version of all acmesystems' boards but failed to update genimage.cfg
accordingly, which broke the builds. The Acqua board is not affected
by this issue.

Update the affected genimage.cfg with the correct filenames.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521690
https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521691
https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521692
https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521694

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/acmesystems/aria-g25/genimage.cfg    | 2 +-
 board/acmesystems/arietta-g25/genimage.cfg | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/acmesystems/aria-g25/genimage.cfg b/board/acmesystems/aria-g25/genimage.cfg
index b40ad9edf3..fd7b9557c6 100644
--- a/board/acmesystems/aria-g25/genimage.cfg
+++ b/board/acmesystems/aria-g25/genimage.cfg
@@ -11,7 +11,7 @@ image boot.vfat {
 		}
 
 		file boot.bin {
-			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.13.bin"
+			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.10.3.bin"
 		}
 	}
 	size = 16M
diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
index 7c3112dd56..9ab8a6aff5 100644
--- a/board/acmesystems/arietta-g25/genimage.cfg
+++ b/board/acmesystems/arietta-g25/genimage.cfg
@@ -11,7 +11,7 @@ image boot.vfat {
 		}
 		
 		file boot.bin {
-			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.13.bin"
+			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.10.3.bin"
 		} 
 	}
 	size = 16M
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
