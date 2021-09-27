Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C39C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:10:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 437516103B
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 09:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 437516103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4430405BF;
	Mon, 27 Sep 2021 09:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EuKynQP0pu1o; Mon, 27 Sep 2021 09:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 457A940644;
	Mon, 27 Sep 2021 09:10:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B743C1BF29D
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B345381751
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 09:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpQzbzs9xfa6 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 09:10:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.theobroma-systems.com (vegas.theobroma-systems.com
 [144.76.126.164])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C945C81029
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 09:10:27 +0000 (UTC)
Received: from ip092042140082.rev.nessus.at ([92.42.140.82]:36468
 helo=meitner.lan) by mail.theobroma-systems.com with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.80)
 (envelope-from <martin.elshuber@theobroma-systems.com>)
 id 1mUmeU-0006tJ-Ux; Mon, 27 Sep 2021 11:10:23 +0200
From: Martin Elshuber <martin.elshuber@theobroma-systems.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 11:09:09 +0200
Message-Id: <20210927090909.1248365-1-martin.elshuber@theobroma-systems.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/strongswan: add option to enable
 systime-fix
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
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Martin Elshuber <martin.elshuber@theobroma-systems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building embedded systems, which buildroot targets, the system
often does not know the current time. However, when verifying X509
certificates this is often required.

The system-fix plugin is a handy tool to configure the behavior when
the current time is unknown.

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
---
 package/strongswan/Config.in     | 3 +++
 package/strongswan/strongswan.mk | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 368cd1ecc0..5b601598f5 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -73,6 +73,9 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_20
 config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
 	bool "Enable dynamic TNCCS protocol discovery module"
 
+config BR2_PACKAGE_STRONGSWAN_SYSTIME_FIX
+	bool "Enable systime-fix plugin"
+
 config BR2_PACKAGE_STRONGSWAN_EAP
 	bool "Enable EAP protocols"
 	select BR2_PACKAGE_GMP
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 322abfbd7b..6c1f411ab5 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -37,6 +37,7 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-wolfssl=$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),yes,no) \
+	--enable-systime-fix=$(if $(BR2_PACKAGE_STRONGSWAN_SYSTIME_FIX),yes,no) \
 	--with-ipseclibdir=/usr/lib \
 	--with-plugindir=/usr/lib/ipsec/plugins \
 	--with-imcvdir=/usr/lib/ipsec/imcvs \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
