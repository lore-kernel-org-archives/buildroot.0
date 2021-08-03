Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85087C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:50:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41DAF60560
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41DAF60560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ADE983B63;
	Thu,  5 Aug 2021 19:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7-xOB1pNZ_0; Thu,  5 Aug 2021 19:50:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C4C83B85;
	Thu,  5 Aug 2021 19:50:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CEAD1C1148
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAB4960A75
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_FkwngdKS3J for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFAA4605DB
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id ABEAA8BE99; Thu,  5 Aug 2021 19:49:38 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 23:13:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 76e64a175aef5cfbdf24bd457f3568b4ba159b6f
X-Git-Newrev: a484c19721f2591b41062b87356a3c7ff1c969e2
X-Patchwork-Hint: ignore
Message-Id: <20210805194938.ABEAA8BE99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openzwave: set back
 -fPIC
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

commit: https://git.buildroot.net/buildroot/commit/?id=a484c19721f2591b41062b87356a3c7ff1c969e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Set back -fPIC in CFLAGS which was wrongly removed as a side effect of
commit c5ca521e232eae31276e7a12d17f0cf9d9c0108f.

Another side-effect of that commit was to remove
-DSYSCONFDIR="\"$(PREFIX)/etc/openzwave/\"" - however, we don't need
SYSCONFDIR to be set, since /etc/openzwave is checked first anyway (see
cpp/src/Options.cpp).

Fixes:
 - http://autobuild.buildroot.org/results/161f53574697016ab8bdb91aaaf4a2be5410ebb0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openzwave/openzwave.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 9c28c0a13b..0f639635dd 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -23,7 +23,7 @@ OPENZWAVE_INSTALL_STAGING = YES
 # the correct directory otherwise openzwave will install configuration files in
 # $(PREFIX)/etc/openzwave.
 # Disable doxygen documentation.
-# Set {DEBUG,RELEASE}_CFLAGS to an empty value to remove -Werror.
+# Set {DEBUG,RELEASE}_CFLAGS to remove -Werror.
 OPENZWAVE_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	PREFIX=/usr \
@@ -31,8 +31,8 @@ OPENZWAVE_MAKE_OPTS = \
 	pkgconfigdir=/usr/lib/pkgconfig \
 	sysconfdir=/etc/openzwave \
 	DOXYGEN= \
-	DEBUG_CFLAGS= \
-	RELEASE_CFLAGS= \
+	DEBUG_CFLAGS="-fPIC" \
+	RELEASE_CFLAGS="-fPIC" \
 	USE_BI_TXML=0
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
