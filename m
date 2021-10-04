Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79203C433FE
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:44:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 033CF61264
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 033CF61264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86B1684B95;
	Mon,  4 Oct 2021 12:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id puwk9CGBBFt1; Mon,  4 Oct 2021 12:44:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DBEC84B80;
	Mon,  4 Oct 2021 12:44:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 311B71BF330
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 212A884B6B
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vaBXFOPPnaV1 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 12:43:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFAA784B6D
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 12:43:55 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPA id B458B24001A;
 Mon,  4 Oct 2021 12:43:53 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 14:43:16 +0200
Message-Id: <20211004124316.355770-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004124316.355770-1-herve.codina@bootlin.com>
References: <20211004124316.355770-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/collectd: add dbi support
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
Cc: Herve Codina <herve.codina@bootlin.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DBI plugin uses libdbi, a database abstraction library,
to execute SQL statements on a database and read back the
result.

https://collectd.org/wiki/index.php/Plugin:DBI

Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 package/collectd/Config.in   | 7 +++++++
 package/collectd/collectd.mk | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 82c24fdbc3..d44d4e4913 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -212,6 +212,13 @@ config BR2_PACKAGE_COLLECTD_CURL_XML
 	help
 	  Reads files using libcurl and parses it as XML.
 
+config BR2_PACKAGE_COLLECTD_DBI
+	bool "dbi"
+	select BR2_PACKAGE_LIBDBI
+	help
+	  Executes SQL statements on various databases and
+	  interprets the returned data.
+
 config BR2_PACKAGE_COLLECTD_DF
 	bool "df"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 9bfbc784ab..d01058471d 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -17,7 +17,7 @@ COLLECTD_SELINUX_MODULES = apache collectd
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
-	apple_sensors aquaero ascent barometer dbi dpdkstat email \
+	apple_sensors aquaero ascent barometer dpdkstat email \
 	gmond hddtemp intel_rdt ipmi java lpar \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	oracle perl pf pinba powerdns python routeros \
@@ -67,6 +67,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL),--enable-curl,--disable-curl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),--enable-curl_json,--disable-curl_json) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),--enable-curl_xml,--disable-curl_xml) \
+	$(if $(BR2_PACKAGE_COLLECTD_DBI),--enable-dbi,--disable-dbi) \
 	$(if $(BR2_PACKAGE_COLLECTD_DF),--enable-df,--disable-df) \
 	$(if $(BR2_PACKAGE_COLLECTD_DISK),--enable-disk,--disable-disk) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),--enable-dns,--disable-dns) \
@@ -168,6 +169,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),libcurl yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
+	$(if $(BR2_PACKAGE_COLLECTD_DBI),libdbi) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
 	$(if $(BR2_PACKAGE_COLLECTD_DPDK_TELEMETRY),jansson) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
