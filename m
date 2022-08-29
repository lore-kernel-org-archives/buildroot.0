Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7D2ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 07:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 034C460B77;
	Mon, 29 Aug 2022 07:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034C460B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LkpA6p9RD4x1; Mon, 29 Aug 2022 07:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5A5C60B1B;
	Mon, 29 Aug 2022 07:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5A5C60B1B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 141041BF32A
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 07:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F031560B1B
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 07:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F031560B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zdq7JWh4eGrC for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 07:02:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A0DD60A68
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 07:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A0DD60A68
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9B4F787F0A; Mon, 29 Aug 2022 06:47:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 09:02:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 283ebbe9e608937e3579bc05cc9584fc6085d4c6
X-Git-Newrev: 0be1c3e921036ff870b6d60c0d55ceac81367c3c
X-Patchwork-Hint: ignore
Message-Id: <20220829064722.9B4F787F0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectd: disable libupsclient
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

commit: https://git.buildroot.net/buildroot/commit/?id=0be1c3e921036ff870b6d60c0d55ceac81367c3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable libupsclient to avoid the following build failure if
libupsclient is installed on host:

src/nut.c:40:2: error: #error "Unable to determine the UPS connection type."
   40 | #error "Unable to determine the UPS connection type."
      |  ^~~~~
src/nut.c:46:3: error: unknown type name 'collectd_upsconn_t'
   46 |   collectd_upsconn_t *conn;
      |   ^~~~~~~~~~~~~~~~~~

libupsclient is an optional dependency of nut plugin since version
5.10.0 and
https://github.com/collectd/collectd/commit/bc2d94024d0250211c1e498db1b43bb4525324da

Fixes:
 - http://autobuild.buildroot.org/results/22b758097e8fb72c68e41329cbc7abc748d81ca6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/collectd/collectd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 5751757040..e0f40095aa 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -45,6 +45,7 @@ COLLECTD_CONF_OPTS += \
 	--with-nan-emulation \
 	--with-fp-layout=$(COLLECTD_FP_LAYOUT) \
 	--with-perl-bindings=no \
+	--without-libupsclient \
 	--disable-werror \
 	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
 	$(if $(BR2_PACKAGE_COLLECTD_AGGREGATION),--enable-aggregation,--disable-aggregation) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
