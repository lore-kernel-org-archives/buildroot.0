Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF83C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6FB64041C;
	Sat,  5 Nov 2022 22:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6FB64041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-CnnsmyAMV1; Sat,  5 Nov 2022 22:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42534404F7;
	Sat,  5 Nov 2022 22:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42534404F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58E471BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 409D240153
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 409D240153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OuRzB-d8PHe9 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:48:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86765400D9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86765400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7572987FA4; Sat,  5 Nov 2022 22:48:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:47:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ca100c2d2478cb8ef615edd1ad3cc2e1d90047b
X-Git-Newrev: 934ec83e9d005fb21e5813f4480ebd624ee28c6c
X-Patchwork-Hint: ignore
Message-Id: <20221105224837.7572987FA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/socat: disable openssl for static
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=934ec83e9d005fb21e5813f4480ebd624ee28c6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

socat's configure script does not take the zlib dependency into
account when linking with libssl, and therefore fails at detecting
libssl in BR2_STATIC_LIBS=y configurations.

Since there is no easy way to add the zlib dependency, just disable
openssl support for static builds.

This is not fixing a build failure: libssl was not detected in
BR2_STATIC_LIBS=y configurations, so what this commit does is make it
explicit.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/socat/socat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index c1bf4d260f..bfccd02031 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -39,7 +39,7 @@ SOCAT_DEPENDENCIES = host-autoconf
 # incompatibile license (GPL-3.0+)
 SOCAT_CONF_OPTS = --disable-readline
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_STATIC_LIBS),y:)
 SOCAT_DEPENDENCIES += openssl
 else
 SOCAT_CONF_OPTS += --disable-openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
