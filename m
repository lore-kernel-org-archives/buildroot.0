Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D07C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71BB6408D7;
	Fri,  7 Jan 2022 18:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KbdtHYtSyXr0; Fri,  7 Jan 2022 18:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C2842986;
	Fri,  7 Jan 2022 18:28:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42AEC1C116E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32516408D7
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQbXb4ajeU9l for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:27:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79148405AE
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:27:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EC8C483493; Fri,  7 Jan 2022 18:21:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:23:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: beac3aef6cf5ce9d09e5ace631faa3a3a9e41900
X-Git-Newrev: 981e7b245aba835919300bb089013d3efe7e65d4
X-Patchwork-Hint: ignore
Message-Id: <20220107182140.EC8C483493@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectd: add virt support
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

commit: https://git.buildroot.net/buildroot/commit/?id=981e7b245aba835919300bb089013d3efe7e65d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in   | 18 ++++++++++++++++++
 package/collectd/collectd.mk |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 5e5dff6fe1..697dc51f7e 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -591,6 +591,24 @@ config BR2_PACKAGE_COLLECTD_USERS
 	help
 	  Counts the number of users currently logged in.
 
+config BR2_PACKAGE_COLLECTD_VIRT
+	bool "virt"
+	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS # libvirt
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libvirt
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64 # libvirt
+	depends on BR2_PACKAGE_HAS_UDEV # libvirt
+	depends on BR2_USE_WCHAR # libvirt
+	select BR2_PACKAGE_LIBVIRT
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Gather statistics about virtualized guests on a system.
+
+comment "virt needs udev /dev management, a toolchain w/ wchar, kernel headers >= 3.12 (4.11 for AArch64)"
+	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_USE_WCHAR || \
+		!(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 && \
+			(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))
+
 config BR2_PACKAGE_COLLECTD_VMEM
 	bool "vmem"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 9d6f630fe3..5751757040 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -22,7 +22,7 @@ COLLECTD_PLUGINS_DISABLE = \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
-	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
+	tokyotyrant turbostat uuid varnish vserver write_kafka \
 	write_mongodb xencpu xmms zfs_arc zone
 
 COLLECTD_CONF_ENV += LIBS="-lm"
@@ -149,6 +149,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_UPTIME),--enable-uptime,--disable-uptime) \
 	$(if $(BR2_PACKAGE_COLLECTD_USERS),--enable-users,--disable-users) \
 	$(if $(BR2_PACKAGE_COLLECTD_VALUE),--enable-match_value,--disable-match_value) \
+	$(if $(BR2_PACKAGE_COLLECTD_VIRT),--enable-virt,--disable-virt) \
 	$(if $(BR2_PACKAGE_COLLECTD_VMEM),--enable-vmem,--disable-vmem) \
 	$(if $(BR2_PACKAGE_COLLECTD_WIRELESS),--enable-wireless,--disable-wireless) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),--enable-write_http,--disable-write_http) \
@@ -197,6 +198,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_SENSORS),lm-sensors) \
 	$(if $(BR2_PACKAGE_COLLECTD_SMART),libatasmart) \
 	$(if $(BR2_PACKAGE_COLLECTD_SNMP),netsnmp) \
+	$(if $(BR2_PACKAGE_COLLECTD_VIRT),libvirt libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS),libmicrohttpd protobuf-c) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEREDIS),hiredis)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
