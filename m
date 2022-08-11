Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10BFC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 17:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F75960AEE;
	Thu, 11 Aug 2022 17:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F75960AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDjv-v806e21; Thu, 11 Aug 2022 17:34:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7975F61122;
	Thu, 11 Aug 2022 17:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7975F61122
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FEEB1C1190
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A94640BB4
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A94640BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2MNfMMM5s98b for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 17:33:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E8AB40393
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 17:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E8AB40393
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A589287161; Thu, 11 Aug 2022 17:19:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 19:32:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c3d83ee69f59b624ed049d52ed581ac025efa42a
X-Git-Newrev: 4f021381af1841c1d018c8678371cb146e69501e
X-Patchwork-Hint: ignore
Message-Id: <20220811171916.A589287161@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bind: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f021381af1841c1d018c8678371cb146e69501e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
