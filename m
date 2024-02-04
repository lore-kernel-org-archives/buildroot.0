Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A23C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42D4D402F2;
	Sun,  4 Feb 2024 21:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42D4D402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCic0pVYOi-s; Sun,  4 Feb 2024 21:37:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3330740420;
	Sun,  4 Feb 2024 21:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3330740420
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB661BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9B6740420
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9B6740420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dh0Ew98ELbFx for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:37:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 082B5402F2
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 082B5402F2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E67AD86940; Sun,  4 Feb 2024 21:37:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 22:35:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 393f5494187072533a1c69b82a26cf1f6d203a26
X-Git-Newrev: d26991f76b0f6b57282c71a045e5f5fecb8f0374
X-Patchwork-Hint: ignore
Message-Id: <20240204213721.E67AD86940@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/axel: fix openssl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d26991f76b0f6b57282c71a045e5f5fecb8f0374
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace --with-ssl by --with-ssl=openssl to avoid the following build
failure raised since bump to version 2.17.12 in commit
50ba0b0a40187b695740a2fce2d2f3ed7cbf58c5 and
https://github.com/axel-download-accelerator/axel/commit/21ccacd0c3bb415c550d590cd64aaa9bf08997a8:

configure: error: Invalid argument: --with-ssl=yes

While at it, also add wolfssl support available since
https://github.com/axel-download-accelerator/axel/commit/0759374239acaeac4105f4851cfabc28433f3bcd

Fixes:
 - http://autobuild.buildroot.org/results/a8c00442bc296353c75e393896abe9883b093a57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/axel/axel.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index b3896e86e3..d3a2f4d42c 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -19,8 +19,11 @@ AXEL_CONF_OPTS = \
 	CFLAGS="$(TARGET_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-AXEL_CONF_OPTS += --with-ssl
+AXEL_CONF_OPTS += --with-ssl=openssl
 AXEL_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
+AXEL_CONF_OPTS += --with-ssl=wolfssl
+AXEL_DEPENDENCIES += wolfssl
 else
 AXEL_CONF_OPTS += --without-ssl
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
