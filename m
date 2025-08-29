Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C340CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 14:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38411842E5;
	Fri, 29 Aug 2025 14:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDU4tNh95rub; Fri, 29 Aug 2025 14:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10E48842D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10E48842D7;
	Fri, 29 Aug 2025 14:59:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 288FED2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EF78419A3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ave3jlkJdU91 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 14:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 992BD415FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 992BD415FE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 992BD415FE
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:59:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -492487695; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 14:59:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1us0ZD-00CduZ-1D;
 Fri, 29 Aug 2025 16:59:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 16:59:01 +0200
Message-Id: <20250829145902.3013340-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=CJRjIF6tIXCLh7whqBJO6qAfiCV4YJeYbVb3irM0j/HYeJpeyw5pFwXeI6eCbuAo0+Fgr+uhxAtZhkGaZ8FoM0u1vY+PDi8aTWn3VLufnJEkb0ZiCKzKd7mynn+3kec20ipbU6HTBYFARDWkOz5PuUGHKtMOXAnHxCfLY+K7AcLamLBBP/pRT170X3quGPewD/HStxBLxrIgVzLzF0CIeCB2w6mDi/83FNd/JlMU4Fm694G1reL/Kwh/GuB3KlKQd+xqtnq7IIeUGMfvKbIeQTqRiYBzhWbGue3cIDBMtzRfRj1VjcIplX7AQFKCpVHlzEx3Sr09o/f4BIF1WPIMkw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=LO2mbbwxlCnoRseEjwXL4bzrLGohV1Jia/umxp/iH8U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=CJRjIF6t
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/netstat-nat: remove package
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

Fixes http://autobuild.buildroot.net/results/bc52c072121286ddde3eee98ac28feb98f33dbbd/

The package has not been updated in 15 years (since commit 60ce1b0842de
"Bump netstat-nat to 1.4.10"), the upstream URL is gone and the package
fails to build on modern gcc versions because of missing prototypes, so drop
it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     |  7 +++++++
 package/Config.in                    |  1 -
 package/netstat-nat/Config.in        |  6 ------
 package/netstat-nat/netstat-nat.hash |  3 ---
 package/netstat-nat/netstat-nat.mk   | 12 ------------
 5 files changed, 7 insertions(+), 22 deletions(-)
 delete mode 100644 package/netstat-nat/Config.in
 delete mode 100644 package/netstat-nat/netstat-nat.hash
 delete mode 100644 package/netstat-nat/netstat-nat.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f761c9063a..19bd948e15 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_NETSTAT_NAT
+	bool "netstat-nat has been removed"
+	select BR2_LEGACY
+	help
+	  The upstream URL is gone and netstat-nat has been removed
+	  from Buildroot.
+
 config BR2_PACKAGE_THTTPD
 	bool "thttpd has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index c22978408c..f2ca1cde7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2597,7 +2597,6 @@ endif
 	source "package/nethogs/Config.in"
 	source "package/netplug/Config.in"
 	source "package/netsnmp/Config.in"
-	source "package/netstat-nat/Config.in"
 	source "package/network-manager/Config.in"
 	source "package/network-manager-openvpn/Config.in"
 	source "package/networkd-dispatcher/Config.in"
diff --git a/package/netstat-nat/Config.in b/package/netstat-nat/Config.in
deleted file mode 100644
index 6afcf89e3b..0000000000
--- a/package/netstat-nat/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_NETSTAT_NAT
-	bool "netstat-nat"
-	help
-	  Displays NAT connections
-
-	  http://tweegy.nl/projects/netstat-nat/
diff --git a/package/netstat-nat/netstat-nat.hash b/package/netstat-nat/netstat-nat.hash
deleted file mode 100644
index 7530b8a09f..0000000000
--- a/package/netstat-nat/netstat-nat.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  e945faa283a49f33af15de915a949c9273a230fc17154925364c547adab676ca  netstat-nat-1.4.10.tar.gz
-sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
deleted file mode 100644
index 0d16579a6a..0000000000
--- a/package/netstat-nat/netstat-nat.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# netstat-nat
-#
-################################################################################
-
-NETSTAT_NAT_VERSION = 1.4.10
-NETSTAT_NAT_SITE = http://tweegy.nl/download
-NETSTAT_NAT_LICENSE = GPL-2.0+
-NETSTAT_NAT_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
