Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBF1D767FB
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 19:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64EEB60AFC;
	Thu, 31 Oct 2024 19:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-4f6NY7HMHJ; Thu, 31 Oct 2024 19:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37BA16066B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37BA16066B;
	Thu, 31 Oct 2024 19:38:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D4F85E53
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3B2980C21
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjcsONKdugq2 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 19:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C768C80C0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C768C80C0B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C768C80C0B
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:38:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D60C2A4C1A7A;
 Thu, 31 Oct 2024 20:38:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38710)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t6azh-000000005uH-0dRF;
 Thu, 31 Oct 2024 19:38:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2024 20:38:09 +0100
Message-Id: <20241031193809.711402-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730403489;
 bh=bX94bXPlgurG1C/8IH3zYwMzXIEMT/BaNa/nFQYFcao=;
 h=From:To:Cc:Subject:Date:From;
 b=qb4LXxXWDCuySxScsKE/xbQywR47pxxWN1RfrJrQOTqJ8mGQJOAyXyFQHRbpaqpCl
 dZyUQd8g8Bs+4xfSAQGuaecaSL+2k4c9v/FgQga50VVYOPOrmzNhVXjgoRwnpQaWzr
 xgbOHnhHIAAT7NiayBQ3e9ZqIndjKDpFHEQniTz81VnRwtPKZ5def04HtCwFcBFUUI
 Mslb1251frjIHU5+h2BXRR/wDvWjlNB/uKHlg4rdkwja6gGYJAcg7AxUhz6st2dK+G
 PDjSuWJ85k3WrZXJtdmrlewLKU/vwGm/CZ0RrFxrhOiDPqUA/rs87sZRVdi7sNfQFo
 vSuUW1E0hRZdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=qb4LXxXW
Subject: [Buildroot] [PATCH 1/1] package/netstat-nat: bump version to 2a
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

Debian experienced the same build error we are seeing at our
autobuilders: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1066719

In September 2024 a new maintainer took over the Debian package
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1066719#10
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1066719#15
https://tracker.debian.org/news/1567008/accepted-netstat-nat-2-1-source-into-unstable/

Switch to the new site https://sr.ht/~nabijaczleweli/netstat-nat-ng/
which not only provides:

"The git history includes imports of all historical tarballs
 (https://web.archive.org/web/20180104143740/http://www.tweegy.nl/projects/netstat-nat/),
 with the changelog distributed in the tags.
 The tags also have contributors added, if credited in the 1.4.10 README
 (they were not credited contemporaneously)."

but many other commits, some require changes to the buildroot package:

- move license file to LICENSES/GPL-2.0-or-later.txt
https://git.sr.ht/~nabijaczleweli/netstat-nat-ng/commit/3df46bf64d86d8639663f0e63f5e981d855ab2fa

- removed autotools
https://git.sr.ht/~nabijaczleweli/netstat-nat-ng/commit/480fc0794c34a7d71ccb80eb5dd149c413fbe6fd

- fix "string_search" build error
https://git.sr.ht/~nabijaczleweli/netstat-nat-ng/commit/2d90b4e3bd3a7d640218634d9c5bd6369cd52cfe

Fixes:
http://autobuild.buildroot.net/results/244/244956839ae82dff7948b34d6627cd52f430c538/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/netstat-nat/Config.in        |  4 ++--
 package/netstat-nat/netstat-nat.hash |  4 ++--
 package/netstat-nat/netstat-nat.mk   | 18 ++++++++++++++----
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/package/netstat-nat/Config.in b/package/netstat-nat/Config.in
index 6afcf89e3b..6ea7e7f6a7 100644
--- a/package/netstat-nat/Config.in
+++ b/package/netstat-nat/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_NETSTAT_NAT
 	bool "netstat-nat"
 	help
-	  Displays NAT connections
+	  List/filter ongoing connections with NAT-specific decoding
 
-	  http://tweegy.nl/projects/netstat-nat/
+	  https://sr.ht/~nabijaczleweli/netstat-nat-ng
diff --git a/package/netstat-nat/netstat-nat.hash b/package/netstat-nat/netstat-nat.hash
index 7530b8a09f..7b22f23832 100644
--- a/package/netstat-nat/netstat-nat.hash
+++ b/package/netstat-nat/netstat-nat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e945faa283a49f33af15de915a949c9273a230fc17154925364c547adab676ca  netstat-nat-1.4.10.tar.gz
-sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
+sha256  8a61b0c4df8adde2eff87b126c065ff17f2acb4dadf7da31ea478606457d9037  2a.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
index 0d16579a6a..7e954bb456 100644
--- a/package/netstat-nat/netstat-nat.mk
+++ b/package/netstat-nat/netstat-nat.mk
@@ -4,9 +4,19 @@
 #
 ################################################################################
 
-NETSTAT_NAT_VERSION = 1.4.10
-NETSTAT_NAT_SITE = http://tweegy.nl/download
+NETSTAT_NAT_VERSION = 2a
+NETSTAT_NAT_SOURCE = $(NETSTAT_NAT_VERSION).tar.gz
+NETSTAT_NAT_SITE = https://git.sr.ht/~nabijaczleweli/netstat-nat-ng/archive
 NETSTAT_NAT_LICENSE = GPL-2.0+
-NETSTAT_NAT_LICENSE_FILES = COPYING
+NETSTAT_NAT_LICENSE_FILES = LICENSES/GPL-2.0-or-later.txt
 
-$(eval $(autotools-package))
+define NETSTAT_NAT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define NETSTAT_NAT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
+		-C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
