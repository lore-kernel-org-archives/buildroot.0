Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D489C4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 22:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 104128191E;
	Fri, 11 Nov 2022 22:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 104128191E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CR0I1JTBpjYP; Fri, 11 Nov 2022 22:49:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4809281842;
	Fri, 11 Nov 2022 22:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4809281842
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AFC01BF290
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FF7F60B42
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FF7F60B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30CxCTbrcy4O for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 22:49:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 814F060AAE
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 22:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 814F060AAE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DA1682DF5; Fri, 11 Nov 2022 22:49:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 23:48:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a85f5f2a412db894fdf548e10d12e7c56eda9107
X-Git-Newrev: 4028ee71743a25af172809e098e4c8eb61bf55f4
X-Patchwork-Hint: ignore
Message-Id: <20221111224937.6DA1682DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/socat: disable openssl
 for static build
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
