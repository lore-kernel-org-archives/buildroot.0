Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB8DC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C06E483216;
	Mon, 20 Feb 2023 23:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C06E483216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dz6tQe6EYSoh; Mon, 20 Feb 2023 23:30:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBE383163;
	Mon, 20 Feb 2023 23:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBE383163
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEDA61BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D15656179B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D15656179B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXfG1FbZTm8k for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF42661385
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF42661385
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA9938648F; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 22:45:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 90a543de880010776b291193eb0d3bc8d27fe3e8
X-Git-Newrev: d77db2df74a3ccb430cbc326edef2c4a588878b0
X-Patchwork-Hint: ignore
Message-Id: <20230220205216.CA9938648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/collectd: add
 rrdcached support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d77db2df74a3ccb430cbc326edef2c4a588878b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The rrdcached plugin has status "supported":
https://collectd.org/wiki/index.php/Plugin:RRDCacheD

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in   | 9 +++++++++
 package/collectd/collectd.mk | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index fb76a105dc..a431da79f1 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -724,6 +724,15 @@ config BR2_PACKAGE_COLLECTD_RRDTOOL
 comment "rrdtool support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
+if BR2_PACKAGE_COLLECTD_RRDTOOL
+
+config BR2_PACKAGE_COLLECTD_RRDCACHED
+	bool "rrdcached"
+	help
+	  Use the RRDtool caching daemon.
+
+endif
+
 config BR2_PACKAGE_COLLECTD_RIEMANN
 	bool "riemann"
 	# riemann-c-client -> protobuf-c
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 5510c265e8..6c993827c4 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -21,7 +21,7 @@ COLLECTD_PLUGINS_DISABLE = \
 	gmond hddtemp intel_rdt java lpar \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	oracle perl pf pinba powerdns python routeros \
-	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
+	sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish vserver write_kafka \
 	write_mongodb xencpu xmms zfs_arc zone
 
@@ -134,6 +134,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_REGEX),--enable-match_regex,--disable-match-regex) \
 	$(if $(BR2_PACKAGE_COLLECTD_REPLACE),--enable-target_replace,--disable-target_replace) \
 	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),--enable-write_riemann,--disable-write_riemann) \
+	$(if $(BR2_PACKAGE_COLLECTD_RRDCACHED),--enable-rrdcached,--disable-rrdcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),--enable-rrdtool,--disable-rrdtool) \
 	$(if $(BR2_PACKAGE_COLLECTD_SCALE),--enable-target_scale,--disable-target_scale) \
 	$(if $(BR2_PACKAGE_COLLECTD_SENSORS),--enable-sensors,--disable-sensors) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
