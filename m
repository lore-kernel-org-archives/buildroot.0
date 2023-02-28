Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42649C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6ACE611A1;
	Tue, 28 Feb 2023 15:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6ACE611A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZdj8NoT7vdS; Tue, 28 Feb 2023 15:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FD6C6118D;
	Tue, 28 Feb 2023 15:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FD6C6118D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 493B51BF95D
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F4A26117C
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F4A26117C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rZoI4aVjH87 for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:35:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5803061185
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5803061185
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 467CF86CA6; Tue, 28 Feb 2023 15:35:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 16:32:29 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: aca885d9ef93a06516c59ea5d2f511145e0a1605
X-Git-Newrev: 34c193e697a45ad41d7e6e5590f4372a6ad7f92a
X-Patchwork-Hint: ignore
Message-Id: <20230228153524.467CF86CA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/wolfssl: handle
 ARM Thumb situation
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

commit: https://git.buildroot.net/buildroot/commit/?id=34c193e697a45ad41d7e6e5590f4372a6ad7f92a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

By default on ARM32, wolfssl uses assembly instructions that are not
supported on Thumb (original Thumb, not Thumb 2), causing a build
failure:

/tmp/ccgn33X7.s:299: Error: selected processor does not support `umlal r4,r5,r10,ip' in Thumb mode
/tmp/ccgn33X7.s:386: Error: instruction not supported in Thumb16 mode -- `adds r4,r4,r6'
/tmp/ccgn33X7.s:387: Error: unshifted register required -- `adc r3,r3,#0'
/tmp/ccgn33X7.s:395: Error: instruction not supported in Thumb16 mode -- `adds r4,r4,r6'

Fix that by passing --with-arm-target=thumb, which tells wolfssl to
use a different set of assembly routines.

Fixes:

  http://autobuild.buildroot.net/results/907/907a5967439c3157c426023b0be1e613092d7bfe/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f79a9c775ff0a59027f274a237d98b5f8d31c022)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index f415e11bb5..8f6cba56ec 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -43,4 +43,8 @@ else
 WOLFSSL_CONF_OPTS += --disable-armasm
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+WOLFSSL_CONF_OPTS += --with-arm-target=thumb
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
