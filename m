Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E842C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 06:31:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D3C610A1
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 06:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3D3C610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77234406E9;
	Tue, 19 Oct 2021 06:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQqrd77r4spv; Tue, 19 Oct 2021 06:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2453406E4;
	Tue, 19 Oct 2021 06:31:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F284A1BF2B7
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 06:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE433401C5
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 06:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=h6t.eu
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iv3-tDcJvICs for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 06:31:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.h6t.eu (mail.h6t.eu [159.69.47.87])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B80044016F
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 06:31:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 79F62E0579; Tue, 19 Oct 2021 08:23:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=h6t.eu; s=dkim;
 t=1634624626; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=qQfZ8Gsy4pV2FCAES82WI0JgFCTQBc/XwWEzqhXE8uc=;
 b=MOf5g/tozJN8hnkBiOfYEzCJcQLJMrVHT5Y6WoSu3wH4GERngXBPiLdBjfEc8vGEVLl5WZ
 uqolqS3/FpwlozNJcrOIdwbhls8H3ats4YzqfWqbO9xmr5d3zkTs2C4a1EdwDbbXJvjCtq
 z0/8+AZBI77FRHXWN+91FUhUUi76KEAQVEQTRR4zGVk0chHfX1jtM8Fl3SwzQS9sfNQZxw
 189tFN1H82FmmSvAxH4jFRxjEM7+kPVjIAUXaQPqzazegNzHqWrKmh4/FZaFH6KZrwizTm
 b+wqlYe3l7+GsqhzWBE7VSZOVGX/n1pVsqrExnHeRXGCrGsZphuDQPfC2BjOFw==
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 08:23:29 +0200
Message-Id: <20211019062329.29190-1-moritz@h6t.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/1] package/network-manager: make readline
 optional for network-manager
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
From: Moritz Bitsch via buildroot <buildroot@buildroot.org>
Reply-To: moritz@h6t.eu
Cc: Moritz Bitsch <moritz@h6t.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Moritz Bitsch <moritz@h6t.eu>

This removes the hard dependency on readline which is GPL-3.0+ licensed.
If readline is enabled the dependency is added and nmcli is built.

Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
---
 package/network-manager/Config.in          | 1 -
 package/network-manager/network-manager.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 43987451b6..2534963918 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -18,7 +18,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_WIRELESS_TOOLS
 	select BR2_PACKAGE_WIRELESS_TOOLS_LIB
-	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNDP
 	help
 	  NetworkManager is a set of co-operative tools that make
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index fbd5b1c85c..453d1fc617 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -10,7 +10,7 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
-	libgcrypt wireless_tools util-linux host-intltool readline libndp
+	libgcrypt wireless_tools util-linux host-intltool libndp
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
 NETWORK_MANAGER_CPE_ID_VENDOR = gnome
@@ -49,6 +49,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += --disable-concheck
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+NETWORK_MANAGER_DEPENDENCIES += readline
+NETWORK_MANAGER_CONF_OPTS += --with-nmcli=yes
+else
+NETWORK_MANAGER_CONF_OPTS += --with-nmcli=no
+endif
+
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
 NETWORK_MANAGER_DEPENDENCIES += newt
 NETWORK_MANAGER_CONF_OPTS += --with-nmtui=yes
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
