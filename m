Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A5DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 16:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CF1960BD3;
	Tue,  4 Jan 2022 16:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPZS9ORKXj1E; Tue,  4 Jan 2022 16:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9225560D94;
	Tue,  4 Jan 2022 16:46:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C37041BF5EA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C04D160B75
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkY0r6i1Gxf0 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1671E60B74
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8E57B82E00; Tue,  4 Jan 2022 16:40:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 17:17:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6be9913a7eeead7cdac804afc127791ba4b0e69e
X-Git-Newrev: 53ba8d3c0e1f7d4023ff37f6aea838043466c59e
X-Patchwork-Hint: ignore
Message-Id: <20220104164044.8E57B82E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectd: add ipmi support
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

commit: https://git.buildroot.net/buildroot/commit/?id=53ba8d3c0e1f7d4023ff37f6aea838043466c59e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/collectd/Config.in   | 11 +++++++++++
 package/collectd/collectd.mk |  4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 05fb577345..5e5dff6fe1 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -312,6 +312,17 @@ config BR2_PACKAGE_COLLECTD_IPC
 	  IPC counters: semaphores used, number of allocated segments
 	  in shared memory and more.
 
+config BR2_PACKAGE_COLLECTD_IPMI
+	bool "ipmi"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_PACKAGE_OPENIPMI
+	help
+	  Read hardware sensors from servers using the Intelligent
+	  Platform Management Interface (IPMI).
+
+comment "ipmi needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
 config BR2_PACKAGE_COLLECTD_IPTABLES
 	bool "iptables"
 	select BR2_PACKAGE_IPTABLES
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index d01058471d..9d6f630fe3 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -18,7 +18,7 @@ COLLECTD_SELINUX_MODULES = apache collectd
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	apple_sensors aquaero ascent barometer dpdkstat email \
-	gmond hddtemp intel_rdt ipmi java lpar \
+	gmond hddtemp intel_rdt java lpar \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
@@ -88,6 +88,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_INFINIBAND),--enable-infiniband,--disable-infiniband) \
 	$(if $(BR2_PACKAGE_COLLECTD_INTERFACE),--enable-interface,--disable-interface) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPC),--enable-ipc,--disable-ipc) \
+	$(if $(BR2_PACKAGE_COLLECTD_IPMI),--enable-ipmi,--disable-ipmi) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),--enable-iptables,--disable-iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPVS),--enable-ipvs,--disable-ipvs) \
 	$(if $(BR2_PACKAGE_COLLECTD_IRQ),--enable-irq,--disable-irq) \
@@ -174,6 +175,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_DPDK_TELEMETRY),jansson) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
 	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
+	$(if $(BR2_PACKAGE_COLLECTD_IPMI),openipmi) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_LUA),luainterpreter) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
