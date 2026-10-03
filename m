Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC52DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A47748148C;
	Sat,  3 Oct 2026 14:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRgxpt6YgaHl; Sat,  3 Oct 2026 14:24:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9EBC881339
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791037487;
	b=otQa2tpZEc5kD0Wy/DB5F4ZflkdCOvnrmg1VeqlCX7G6R+Cn8Aar0LAejIsMc3wy+XVF
	 hrvhDK7yZ6MUEUCcK4rbnyIUm+Yg/gyVg1lcxVxfBBM/C/+4Uq3/gxMOI7OzKWGr2TMHo
	 bl8BodW0vwb6iCIJtGuzN6F1mpGYygeeolOv0LzS4lrzbAS1q3QlGjpUbB0Eum2jM9fc0
	 AgCN6G7zbt+COEVJ662a1xNuiaLMy7CzKZyDGfvCVWSlNYDnTeh2BN8VEzccrs7qy3z1g
	 /r57OsGSuHef5dkK4w4hdneU8zdcAbCU7BnMm3lejOv64SuWRkho/cQKAQiChmiUcKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791037487;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=z8NJgVLF9pThcGGDUa/ByUKqQ6cE0PJOavR2cum+wQQ=;
	b=rXG3O1g9M0waaK2PKh2/JDo4Yho68VD+bOxx+k//gvavDTt07KRYnf86Rf/gh9LzycqB
	 V4fRlX1lABFFjzn8WL3hPFG6qSBAiRiBWIm/sANAHAQJCXo2kXmoF70heh5WABVXH2XdG
	 zqiSMtRDlJj6P1OjU0YNJKCsrX8AoLu+rxAPw55QYhYFF8oxpBoI1kIg9d8hjd1u4tHoV
	 S2Iusfc6fVMU7a5JFprd1XiOTyef+Dc12WeHADg7YNaaC3PS9BrM7eDB1zfGr7G/T9lKm
	 IZN+MOBf/oaIvoBmjnAebTPRU+Lm/DhfuWLBXoRRAFD4O4vsFZUwfXc1MRBuuRkKwdw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791037487;
	bh=z8NJgVLF9pThcGGDUa/ByUKqQ6cE0PJOavR2cum+wQQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=XS3rgFionlA4/969jfNrdBmCo/PpiHHqrbCWV4MDxL7luklOOMq/Ek/tgSqjqRgjb
	 /V0ekltEh+ZoXY7DCyJOg6HArO8vrD1hYokPdOBW+87JiYRtMq/i0bm4uIjTioif3M
	 bt40Veu3rMyhQwhBfIyW+Vqo4cu0VchoCfuK2+J7+DmXpLsctdK6KROCRhNDCqoKpz
	 ntdGJHe2vGahjqSs2JWf/FpDzKZJyxhN8LXpCkVKAYCKa1DQ98U/lZj/KZF4WAGp/F
	 xSf8lNd/W3zHkN5RqK3ETJ94OCyjqj49pOLpPv2wLaG0NvRsrMYezj/b+FW7VdKd9u
	 QPeqde4aEKd6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EBC881339;
	Sat,  3 Oct 2026 14:24:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4690C1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3821260692
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hS4QZZutJAJ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:24:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 92EBC6068D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791037485;
 b=n5KnfXIFaiETCr6INWKC8VtSTOMzeC3EcJXuxOu/ymFX0WCGVjWN1ccJcQRW8YrQXrmG
 Y0WVFW3iIkU1xKbzncVBFzQVbzDQBvjdAV9pXM+H9Z3qxcNS5Cp7tuU4S0npNMXgMSVXA
 cjpkcvmR8hiOaqt9uBoDLL9SYp/XG8nshH2GhV8/B7aNtc2x6CaW4MRMJW1LX5lZLrrf9
 PO+qnkPNxuUAvDPcUbJYhPg1xD+RcJkr8g+cMCrSyibV0rvKPJ0b53lUXzHJtWWh2O0Zh
 sF3di824TeAfJvJ9hxNa68ryZrwQ7Sr7pPD5bF9gKE0OH7tmsoX8cbrmImrX2kOEUAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791037485;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=mpiYFJKQkYIjI0BXHD3WhnHtY9CT7Aa6hV0a/pnQ/Ec=;
 b=XjAfyWUYaCNAdj48EpPRGiP639TvSesFgkVYLbMVtjldvPNkHQxeR/bY4GcRUlvYZrK+
 /551y++V+yIvgrbWf+exEJNEfeB2VlXOeyX0uwc2+1Phq1C082zgcQJU/AUu8f7NsSG8y
 9f1ji2A6XQ5oeHDUDPAavCg4g3K5gUOQMAMqGAAeWHqMUxP2WV4Nr+ZqyoyF+o41zD9Ro
 RbZzvxR3TWwDWw4xwS44qtlFC5HzrINubd6Knnqw5AdfB83ab95ZLLcEvw+qyuh1tGZwo
 mQaMEp6YTy+lu+7kUNXnV74sfAfcMpia1YFi2/dBRz2Ex6te/vR7N2v4/C0WX+G681A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=bANeODvK; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92EBC6068D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:24:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSt8Q-1x8B7P3Hoc-00VJC8; Sat, 03
 Oct 2026 16:24:41 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sat,  3 Oct 2026 16:24:26 +0200
Message-ID: <20261003142426.3532277-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:gDi789rsHEnsf2U4O713zv4F7euKq3QdNjDPnzKYxQmEIbK6xDW
 0CXgQYxG84qAbiOPg9ZzK7rAeSyeTeeBYPqjP4/fIFv5jMZneUd/UgeotK0tU6w0S2Q2mnw
 A3taLsyIt2l4yqWlnM9WegapniMUnZHKkSW4kBqnDZG343+NlMzLV6CL2WqGIEBNu/cScSh
 aBgt/S3TyKAI+LKE7txBw==
UI-OutboundReport: notjunk:1;M01:P0:nqb+yBf0QXY=;fsF3sBhPQtOUQEP7QuDeunZ8s16
 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
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump version to
 1.58.1
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream changelog:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.58.1/NEWS?ref_type=tags

Changes relevant for Buildroot build:

* Support for dhclient has been removed, drop the conditional block
  for BR2_PACKAGE_DHCP_CLIENT=y.

* NetworkManager now installs a systemd generator to manage its initrd
  units, disable it if building without systemd or for systemd without
  initrd support by setting the target system generator directory to
  "no" [1]. Note that the current upstream main branch adds a build
  option for initrd support, likely to be released with 1.60.x, which
  should supersede removing the initrd units and disabling the
  generator when building with systemd.

* Contrary to what the NEWS file states, the new "clat" build option
  is enabled by default. Disable it, (optionally) enabling would
  require libbpf and a suitable BPF compiler.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.58.1/meson.build?ref_type=tags#L416-417

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/network-manager/network-manager.hash |  4 ++--
 package/network-manager/network-manager.mk   | 13 ++++++-------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index fe2f2ae262..ff2748ff72 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.56.0/downloads/NetworkManager-1.56.0.tar.xz.sha256sum
-sha256  59a32d385cc1e7ae26e43798c6f12d07ff6198abd041ec0620b3a08cfc021ccc  NetworkManager-1.56.0.tar.xz
+# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.58.1/downloads/NetworkManager-1.58.1.tar.xz.sha256sum
+sha256  262864cfd198123d3e5dbe91937441b97ee9059d6d712e1a5bfbb1c54668d14d  NetworkManager-1.58.1.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index c96f613831..5071546c27 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.56
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
+NETWORK_MANAGER_VERSION_MAJOR = 1.58
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).1
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/$(NETWORK_MANAGER_VERSION)/downloads
 NETWORK_MANAGER_INSTALL_STAGING = YES
@@ -34,7 +34,8 @@ NETWORK_MANAGER_CONF_OPTS = \
 	-Dmodprobe=/sbin/modprobe \
 	-Difupdown=false \
 	-Dnm_cloud_setup=false \
-	-Dsession_tracking_consolekit=false
+	-Dsession_tracking_consolekit=false \
+	-Dclat=false
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 NETWORK_MANAGER_DEPENDENCIES += audit
@@ -43,10 +44,6 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=no
 endif
 
-ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
-NETWORK_MANAGER_CONF_OPTS += -Ddhclient=/sbin/dhclient
-endif
-
 ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
 endif
@@ -153,6 +150,7 @@ NETWORK_MANAGER_CONF_OPTS += \
 	-Dsession_tracking=systemd \
 	-Dsuspend_resume=systemd
 ifneq ($(BR2_PACKAGE_SYSTEMD_INITRD),y)
+NETWORK_MANAGER_CONF_OPTS += -Dsystemdsystemgeneratordir=no
 define NETWORK_MANAGER_CLEAN_INITRD
 	rm -f $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-*initrd.service
 endef
@@ -164,6 +162,7 @@ NETWORK_MANAGER_CONF_OPTS += \
 	-Dconfig_logging_backend_default=syslog \
 	-Dsession_tracking=no \
 	-Dsuspend_resume=consolekit \
+	-Dsystemdsystemgeneratordir=no \
 	-Dsystemdsystemunitdir=no
 endif
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
