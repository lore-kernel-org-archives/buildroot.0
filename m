Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4877C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A7EF8124B;
	Mon,  5 Dec 2022 11:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A7EF8124B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vit8vibPZbGZ; Mon,  5 Dec 2022 11:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D101881413;
	Mon,  5 Dec 2022 11:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D101881413
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56D001BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C25BF41695
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C25BF41695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTAnbq8Kc-3d for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DC5A41679
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DC5A41679
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFAFB85BBE; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 23:48:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a85f5f2a412db894fdf548e10d12e7c56eda9107
X-Git-Newrev: 4028ee71743a25af172809e098e4c8eb61bf55f4
X-Patchwork-Hint: ignore
Message-Id: <20221205112608.EFAFB85BBE@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=4028ee71743a25af172809e098e4c8eb61bf55f4
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
index 0414c8adc8..28ea72e5a7 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -31,7 +31,7 @@ SOCAT_DEPENDENCIES = host-autoconf
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
