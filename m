Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22620C54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 20:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C8540DEA;
	Sat, 28 Jun 2025 20:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Mhy_cSle1oS; Sat, 28 Jun 2025 20:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0C0540DD4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0C0540DD4;
	Sat, 28 Jun 2025 20:29:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C070154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12FFB60803
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3acRJS-abgv for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 20:29:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D042607DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D042607DB
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:29:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 235F9820F0; Sat, 28 Jun 2025 20:29:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 17:29:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c18eb1a55dbec4b6bf4b7d0a9a4fa0337ccc5d8
X-Git-Newrev: e7ca2197c49822087fab36e3eb6af4182082d9f3
X-Patchwork-Hint: ignore
Message-Id: <20250628202921.235F9820F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: allow to drop unneeded
 capabilities
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e7ca2197c49822087fab36e3eb6af4182082d9f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

strongSwan allows to drop unneeded capabilities[1] after the IKE daemon
has been started, based on libcap, so let's allow that via a config
option.

While the "native" (capset) way of dropping capabilities is supported,
it is deprecated so its support is not added in Buildroot.

While the documentation specifically mentions the IKE daemon (charon) as
being the one impacted by this change, the ifdefery with this autotools
option exists in various libraries in the source code, hence why this is
kept independent from the charon Kconfig option status.

[1] https://docs.strongswan.org/docs/latest/install/reducedPrivileges.html#_dropping_capabilities
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/strongswan/Config.in     | 10 ++++++++++
 package/strongswan/strongswan.mk |  7 ++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 22caa2a573..feaf714213 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -73,6 +73,16 @@ config BR2_PACKAGE_STRONGSWAN_CURL
 config BR2_PACKAGE_STRONGSWAN_MD4
 	bool "Enable MD4 hash algorithm"
 
+config BR2_PACKAGE_STRONGSWAN_DROP_CAPS
+	bool "Drop unneeded capabilities after initialization"
+	select BR2_PACKAGE_LIBCAP
+	help
+	  strongSwan supports capability dropping. The IKE charon daemon
+	  is started as root and most of its privileges are dropped
+	  immediately.
+	  After the daemon has been initialized, further unneeded
+	  capabilities are dropped.
+
 config BR2_PACKAGE_STRONGSWAN_CHARON
 	bool "Enable the IKEv1/IKEv2 keying daemon charon"
 	default y
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 823b58555d..072d8681d4 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -62,6 +62,10 @@ STRONGSWAN_CONF_OPTS += \
 	--with-imcvdir=/usr/lib/ipsec/imcvs \
 	--with-dev-headers=/usr/include
 
+ifeq ($(BR2_PACKAGE_STRONGSWAN_DROP_CAPS),y)
+STRONGSWAN_CONF_OPTS += --with-capabilities=libcap
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
 endif
@@ -75,7 +79,8 @@ STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite) \
-	$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),wolfssl)
+	$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),wolfssl) \
+	$(if $(BR2_PACKAGE_STRONGSWAN_DROP_CAPS),libcap)
 
 ifeq ($(BR2_PACKAGE_STRONGSWAN_SQL),y)
 STRONGSWAN_DEPENDENCIES += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
