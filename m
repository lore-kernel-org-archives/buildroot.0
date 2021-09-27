Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7777AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:40:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A00560FC0
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A00560FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CB24404E1;
	Mon, 27 Sep 2021 14:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OPvwbB1DOlW; Mon, 27 Sep 2021 14:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1465F404B8;
	Mon, 27 Sep 2021 14:40:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0FA1BF989
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB56240688
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wNU73Uu5R2Z3 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F143440664
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B45D38D266; Mon, 27 Sep 2021 14:35:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 16:34:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29af6acca2a163b56d8cb39bec050e80f610fc23
X-Git-Newrev: a79cc5f0748541b0f0e3cf0588e76672b592938e
X-Patchwork-Hint: ignore
Message-Id: <20210927143554.B45D38D266@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: add option to enable
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a79cc5f0748541b0f0e3cf0588e76672b592938e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
