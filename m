Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD82C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:44:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4DDF61381
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4DDF61381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B714140175;
	Tue, 28 Sep 2021 20:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ox1vI4iAwcHW; Tue, 28 Sep 2021 20:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E01E401C7;
	Tue, 28 Sep 2021 20:44:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C85941BF5E6
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C07C7405E9
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0dbjNbockI7 for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 20:44:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9008A401C7
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 20:44:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 637338D46C; Tue, 28 Sep 2021 20:42:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 22:43:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8b17f74392bda34e55ad2202ebabc2cac06278d
X-Git-Newrev: 89f20c1c3f9d667ec0a40bcfe17db94ff098e6c0
X-Patchwork-Hint: ignore
Message-Id: <20210928204214.637338D46C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: add options to select
 EAP plugins
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

commit: https://git.buildroot.net/buildroot/commit/?id=89f20c1c3f9d667ec0a40bcfe17db94ff098e6c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add options to chose individual EAP plugins.

All the new plugins are enabled by default if the old single option was
enabled, for a seamless update from an older Buildroot config, but for
new configurations, they are not enabled by default.

BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2 is the only plugin requiring
libgmp; the selection of BR2_PACKAGE_GMP is moved down accordingly.

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
[yann.morin.1998@free.fr:
  - move BR2_PACKAGE_STRONGSWAN_EAP to legacy
  - extend commit log accordingly
  - fix check-package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                 |  6 +++
 package/strongswan/Config.in     | 92 +++++++++++++++++++++++++++++-----------
 package/strongswan/strongswan.mk | 40 ++++++++---------
 3 files changed, 91 insertions(+), 47 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7eebe85298..9f1f7687fb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.11"
 
+config BR2_PACKAGE_STRONGSWAN_EAP
+	bool "strongswan EAP plugins now individually selectable"
+	select BR2_LEGACY
+	help
+	  The various EAP plugins are now individually selectable.
+
 config BR2_PACKAGE_GNURADIO_PAGER
 	bool "gnuradio gr-flex support removed"
 	select BR2_LEGACY
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 5b601598f5..f6e78db22e 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -76,37 +76,79 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
 config BR2_PACKAGE_STRONGSWAN_SYSTIME_FIX
 	bool "Enable systime-fix plugin"
 
-config BR2_PACKAGE_STRONGSWAN_EAP
-	bool "Enable EAP protocols"
-	select BR2_PACKAGE_GMP
-	help
-	  Enable various EAP protocols:
-	    - mschapv2
-	    - tls
-	    - ttls
-	    - peap
-	    - sim
-	    - sim-file
-	    - aka
-	    - aka-3gpp2
-	    - simaka-sql
-	    - simaka-pseudonym
-	    - simaka-reauth
-	    - identity
-	    - md5
-	    - gtc
-	    - tnc
-	    - dynamic
-	    - radius
-
-if BR2_PACKAGE_STRONGSWAN_EAP
+config BR2_PACKAGE_STRONGSWAN_EAP_SIM
+	bool "Enable EAP-SIM"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE
+	bool "Enable EAP-SIM file backend"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
 
 config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
 	bool "Enable EAP-SIM smart card backend"
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 
-endif
+config BR2_PACKAGE_STRONGSWAN_EAP_AKA
+	bool "Enable EAP-AKA"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2
+	bool "Enable EAP-AKA 3GPP2 algorithms"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_GMP
+
+config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL
+	bool "Enable EAP-SIM/AKA backend based on a triplet/quintuplet SQL database"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM
+	bool "Enable EAP-SIM/AKA pseudonym storage"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_REAUTH
+	bool "Enable EAP-SIM/AKA reauthentication data storage"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_IDENTITY
+	bool "Enable EAP-Identity"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_MD5
+	bool "Enable EAP-MD5"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_GTC
+	bool "Enable EAP-GDC"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2
+	bool "Enable EAP-MSCHAPv2"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_PEAP
+	bool "Enable EAP-PEAP"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_RADIUS
+	bool "Enable EAP-RADIUS"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_TLS
+	bool "Enable EAP-TLS"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_TTLS
+	bool "Enable EAP-TTLS"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC
+	bool "Enable EAP-DYNAMIC"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+
+config BR2_PACKAGE_STRONGSWAN_EAP_TNC
+	bool "Enable EAP-TNC"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
 
 config BR2_PACKAGE_STRONGSWAN_UNITY
 	bool "Enables Cisco Unity extension plugin"
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 6c1f411ab5..a23ac8af22 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -38,6 +38,23 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-wolfssl=$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),yes,no) \
 	--enable-systime-fix=$(if $(BR2_PACKAGE_STRONGSWAN_SYSTIME_FIX),yes,no) \
+	--enable-eap-sim=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM),yes,no) \
+	--enable-eap-sim-file=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE),yes,no) \
+	--enable-eap-aka=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA),yes,no) \
+	--enable-eap-aka-3gpp2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),yes,no) \
+	--enable-eap-simaka-sql=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL),yes,no) \
+	--enable-eap-simaka-pseudonym=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM),yes,no) \
+	--enable-eap-simaka-reauth=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_REAUTH),yes,no) \
+	--enable-eap-identity=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_IDENTITY),yes,no) \
+	--enable-eap-md5=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_MD5),yes,no) \
+	--enable-eap-gtc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_GTC),yes,no) \
+	--enable-eap-mschapv2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2),yes,no) \
+	--enable-eap-tls=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TLS),yes,no) \
+	--enable-eap-ttls=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TTLS),yes,no) \
+	--enable-eap-peap=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_PEAP),yes,no) \
+	--enable-eap-tnc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_TNC),yes,no) \
+	--enable-eap-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC),yes,no) \
+	--enable-eap-radius=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_RADIUS),yes,no) \
 	--with-ipseclibdir=/usr/lib \
 	--with-plugindir=/usr/lib/ipsec/plugins \
 	--with-imcvdir=/usr/lib/ipsec/imcvs \
@@ -47,32 +64,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
 endif
 
-ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
-STRONGSWAN_CONF_OPTS += \
-	--enable-eap-sim \
-	--enable-eap-sim-file \
-	--enable-eap-aka \
-	--enable-eap-aka-3gpp2 \
-	--enable-eap-simaka-sql \
-	--enable-eap-simaka-pseudonym \
-	--enable-eap-simaka-reauth \
-	--enable-eap-identity \
-	--enable-eap-md5 \
-	--enable-eap-gtc \
-	--enable-eap-mschapv2 \
-	--enable-eap-tls \
-	--enable-eap-ttls \
-	--enable-eap-peap \
-	--enable-eap-tnc \
-	--enable-eap-dynamic \
-	--enable-eap-radius
-STRONGSWAN_DEPENDENCIES += gmp
-endif
-
 STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp) \
+	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),gmp) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
