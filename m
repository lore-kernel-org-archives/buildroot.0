Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB79C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C4B760B6B;
	Thu, 30 Dec 2021 17:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nzq70kUl1x81; Thu, 30 Dec 2021 17:10:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03A28607F0;
	Thu, 30 Dec 2021 17:10:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCFF41BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B513C825B9
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AVvUEKoNW3IA for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:10:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 185D581CDC
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:10:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CC01A82DA1; Thu, 30 Dec 2021 17:05:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 18:10:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b1a0864b21735db64e7c076e362e1cd7e902755
X-Git-Newrev: 30ac432b419599a8744238fdea65cf08c0765b63
X-Patchwork-Hint: ignore
Message-Id: <20211230170504.CC01A82DA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtasn1: remove programs from the
 target
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

commit: https://git.buildroot.net/buildroot/commit/?id=30ac432b419599a8744238fdea65cf08c0765b63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No included package depends on those programs.

Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtasn1/libtasn1.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 5cc33d505e..ecca00e79e 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -20,4 +20,12 @@ LIBTASN1_CONF_ENV = MAKEINFO="true"
 
 LIBTASN1_CONF_OPTS = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
+LIBTANS1_PROGS = asn1Coding asn1Decoding asn1Parser
+
+# We only need the library
+define LIBTASN1_REMOVE_PROGS
+	$(RM) $(addprefix $(TARGET_DIR)/usr/bin/,$(LIBTANS1_PROGS))
+endef
+LIBTASN1_POST_INSTALL_TARGET_HOOKS += LIBTASN1_REMOVE_PROGS
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
