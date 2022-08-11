Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C2BC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 17:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63D4B831BD;
	Thu, 11 Aug 2022 17:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D4B831BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZX2q8016XUx; Thu, 11 Aug 2022 17:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 778A5832D8;
	Thu, 11 Aug 2022 17:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 778A5832D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 664381C11A0
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 403AA8141E
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 403AA8141E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jCQd0ekX27EW for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 17:33:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DA4B8142C
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 17:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA4B8142C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D4BEE87189; Thu, 11 Aug 2022 17:19:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 19:32:22 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 09c055ee29a46e8e74f5875aaca7294fb304e3cb
X-Git-Newrev: 0dbc290484b7995ec562210dc922d2a35fd8cd0e
X-Patchwork-Hint: ignore
Message-Id: <20220811171922.D4BEE87189@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/bind: add
 libmaxminddb optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=0dbc290484b7995ec562210dc922d2a35fd8cd0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Add libmaxminddb optional dependency (which is enabled by default), two
options must be used to enable/disable this dependency:
 [pairwise: --enable-geoip --with-maxminddb=auto, --enable-geoip --with-maxminddb=yes, --disable-geoip]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 25eea4424f12f7cb1f7da04f802478f503b0ae19)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index c84abe91a0..1646fc6237 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -61,6 +61,13 @@ else
 BIND_CONF_OPTS += --with-gssapi=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
+BIND_CONF_OPTS += --enable-geoip --with-maxminddb
+BIND_DEPENDENCIES += libmaxminddb
+else
+BIND_CONF_OPTS += --disable-geoip
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 BIND_CONF_OPTS += --with-libxml2
 BIND_DEPENDENCIES += libxml2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
