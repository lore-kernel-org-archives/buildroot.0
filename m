Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF0FC04A68
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 14:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA4F261B8F;
	Tue, 26 Jul 2022 14:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA4F261B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cdiy42wHXKVh; Tue, 26 Jul 2022 14:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B5A60EFE;
	Tue, 26 Jul 2022 14:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B5A60EFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABB0F1BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8445541951
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8445541951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D01lXA7bgoJl for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 14:54:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9034E41687
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 14:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9034E41687
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9B33485EE2; Tue, 26 Jul 2022 14:40:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 16:46:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 204e04ba8958411f46b09240a9fc4b948dc7108c
X-Git-Newrev: 99d839fa6b29f5919c524e1336f24236657948f7
X-Patchwork-Hint: ignore
Message-Id: <20220726144035.9B33485EE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: add config option to
 enable bypass-lan plugin
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

commit: https://git.buildroot.net/buildroot/commit/?id=99d839fa6b29f5919c524e1336f24236657948f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case the user wants to use the bypass-lan plugin for libcharon, add
a configuration option.

Signed-off-by: Bert Schueszler <bert.schueszler@theobroma-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strongswan/Config.in     | 3 +++
 package/strongswan/strongswan.mk | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 919ce1f5bc..f2e597e016 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -195,6 +195,9 @@ config BR2_PACKAGE_STRONGSWAN_SQL
 	bool "Enable SQL database configuration backend"
 	depends on BR2_PACKAGE_SQLITE || BR2_PACKAGE_MYSQL
 
+config BR2_PACKAGE_STRONGSWAN_BYPASS_LAN
+	bool "Enable BYPASS-LAN plugin"
+
 endif
 
 config BR2_PACKAGE_STRONGSWAN_PKI
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 95079aceb3..44c20f8414 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -57,6 +57,7 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-eap-tnc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TNC),yes,no) \
 	--enable-eap-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC),yes,no) \
 	--enable-eap-radius=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_RADIUS),yes,no) \
+	--enable-bypass-lan=$(if $(BR2_PACKAGE_STRONGSWAN_BYPASS_LAN),yes,no) \
 	--with-ipseclibdir=/usr/lib \
 	--with-plugindir=/usr/lib/ipsec/plugins \
 	--with-imcvdir=/usr/lib/ipsec/imcvs \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
