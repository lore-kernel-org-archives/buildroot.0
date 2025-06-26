Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FD4C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 11:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F36B0407D4;
	Thu, 26 Jun 2025 11:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdqD2yPMWVin; Thu, 26 Jun 2025 11:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2481F40719
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2481F40719;
	Thu, 26 Jun 2025 11:30:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CA4710A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E344842E4
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uCaVfCrLCKh for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 11:30:34 +0000 (UTC)
X-Greylist: delayed 301 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 26 Jun 2025 11:30:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B986842D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B986842D5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=83.166.143.172;
 helo=smtp-8fac.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch
 [83.166.143.172])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B986842D5
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:30:34 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bSbp41tbpzDWk;
 Thu, 26 Jun 2025 13:20:28 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4bSbp364k6zYvy; Thu, 26 Jun 2025 13:20:27 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Thu, 26 Jun 2025 13:20:20 +0200
MIME-Version: 1.0
Message-Id: <20250626-strongswan-misc-martin-v1-3-a4c4da74ba9c@cherry.de>
References: <20250626-strongswan-misc-martin-v1-0-a4c4da74ba9c@cherry.de>
In-Reply-To: <20250626-strongswan-misc-martin-v1-0-a4c4da74ba9c@cherry.de>
To: buildroot@buildroot.org
Cc: Martin Elshuber <martin.elshuber@cherry.de>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Martin Elshuber <martin.elshuber@theobroma-systems.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 3/3] package/strongswan: add option to specify
 paths to PID and UNIX socket files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Martin Elshuber <martin.elshuber@theobroma-systems.com>

Strongswan allows to specify a path for PID and UNIX socket files at
compile time via the --with-piddir argument.

This is especially useful when Strongswan is running inside a container
where we may not want to share/mount the default path of /var/run inside
the container.

Let's add an option to configure the piddir.

Considering this is a critical path, let's add a default value to the
string option (which is currently the same as strongswan's default when
the option is missing) so that it is stable across strongswan releases
in Buildroot.

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
[rewriting of commit title and commit log]
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/strongswan/Config.in     | 10 ++++++++++
 package/strongswan/strongswan.mk |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 047b460be82e16e23d4b858ff294dfcbc18414cd..10efcc1616faab83b637421edc62c4e9eed70529 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -63,6 +63,16 @@ config BR2_PACKAGE_STRONGSWAN_WOLFSSL
 
 endchoice
 
+config BR2_PACKAGE_STRONGSWAN_PIDDIR
+	string "piddir"
+	default "/var/run"
+	help
+	  Path for PID and UNIX socket files used by strongswan.
+
+	  Use the empty string to not pass --with-piddir to strongswan
+	  configure, this then defaults to strongswan's source default
+	  which may not be stable across releases.
+
 config BR2_PACKAGE_STRONGSWAN_AF_ALG
 	bool "Enable AF_ALG crypto interface to Linux Crypto API"
 
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 0ee26df43d66acf48efc683388952cd7819b1476..971924232730c41f2bc1fb800547392adf83469c 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -66,6 +66,9 @@ ifeq ($(BR2_PACKAGE_STRONGSWAN_DROP_CAPS),y)
 STRONGSWAN_CONF_OPTS += --with-capabilities=libcap
 endif
 
+# setup piddir if BR2_PACKAGE_STRONGSWAN_PIDDIR is not empty
+STRONGSWAN_CONF_OPTS += $(if $(call qstrip,$(BR2_PACKAGE_STRONGSWAN_PIDDIR)),--with-piddir=$(BR2_PACKAGE_STRONGSWAN_PIDDIR))
+
 ifeq ($(BR2_PACKAGE_STRONGSWAN_NONROOT),y)
 STRONGSWAN_CONF_OPTS += \
 	--with-user=charon \

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
