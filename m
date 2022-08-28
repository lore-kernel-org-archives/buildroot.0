Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9953C0502C
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 08:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5269540B94;
	Sun, 28 Aug 2022 08:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5269540B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8y1AapaCQDLy; Sun, 28 Aug 2022 08:41:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 526D640137;
	Sun, 28 Aug 2022 08:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 526D640137
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F97E1BF330
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 08:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B23240137
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 08:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B23240137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YEfKZORVlYo5 for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 08:40:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E782400E4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E782400E4
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 08:40:54 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.235.193])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8530A19F73B;
 Sun, 28 Aug 2022 10:40:48 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 10:40:33 +0200
Message-Id: <20220828084033.13660-2-ju.o@free.fr>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220828084033.13660-1-ju.o@free.fr>
References: <20220828084033.13660-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661676052;
 bh=nq/r3HLSVZtzXudvsULVPTMgcXg37XMk/GM+qJsnIfY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k4RK5A2rWoUWolzq1GGAm+i2C0XuJfGOPsLXXYk1DKtDj0RLxlQbxdz+shA4DrGF1
 BENCYXW1hvoR0uAJHcEqrxlcb40jpbzAP5MW/XmkMHTvYRetJTRNuVcZ9KyO+7uAAg
 Nxlqo8QRRwXgb08mwoEI0EGyZ2mGnH3YZ5VARZCBcJXAJ4cSRFLAM9EKZdRsrbheSq
 kr5w1TtaCCFLvXdu0hwyhDUMuTIF4NoL0npPKjCmQdny9trXEEz1HoHX2k//1B3ZTf
 +thiVCZV4TOeiZoAbjEoCmprwGHI7cEV+DEOWvaJmOZKXH4OqTrmGrxwTQmO+cKw9T
 KW6Aits7qBIpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k4RK5A2r
Subject: [Buildroot] [next 2/2] package/poco: add the new Prometheus
 component
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Poco Prometheus component was added in 1.12.0. See:
https://github.com/pocoproject/poco/blob/poco-1.12.0-release/CHANGELOG#L6

For Prometheus information, see: https://prometheus.io/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested with previous patch on BR commit 6c7061f with command:
    cat > poco.config <<EOF
    BR2_PACKAGE_POCO=y
    BR2_PACKAGE_POCO_ACTIVERECORD=y
    BR2_PACKAGE_POCO_CPP_PARSER=y
    BR2_PACKAGE_POCO_DATA_MYSQL=y
    BR2_PACKAGE_POCO_DATA_PGSQL=y
    BR2_PACKAGE_POCO_DATA_SQLITE=y
    BR2_PACKAGE_POCO_JWT=y
    BR2_PACKAGE_POCO_MONGODB=y
    BR2_PACKAGE_POCO_NETSSL_OPENSSL=y
    BR2_PACKAGE_POCO_PDF=y
    BR2_PACKAGE_POCO_PROMETHEUS=y
    BR2_PACKAGE_POCO_REDIS=y
    BR2_PACKAGE_POCO_ZIP=y
    EOF
    utils/test-pkg -a -p poco -c poco.config
    ...
    44 builds, 16 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/poco/Config.in | 4 ++++
 package/poco/poco.mk   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index cb447960f1..820e631966 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -92,6 +92,10 @@ config BR2_PACKAGE_POCO_PDF
 	select BR2_PACKAGE_POCO_UTIL
 	select BR2_PACKAGE_POCO_XML
 
+config BR2_PACKAGE_POCO_PROMETHEUS
+	bool "Prometheus"
+	select BR2_PACKAGE_POCO_NET
+
 config BR2_PACKAGE_POCO_REDIS
 	bool "Redis"
 	select BR2_PACKAGE_POCO_NET
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 3bcc42c455..e37effd690 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -33,6 +33,7 @@ POCO_OMIT = Data/ODBC PageCompiler \
 	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
 	$(if $(BR2_PACKAGE_POCO_PDF),,PDF) \
+	$(if $(BR2_PACKAGE_POCO_PROMETHEUS),,Prometheus) \
 	$(if $(BR2_PACKAGE_POCO_REDIS),,Redis) \
 	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
 	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
