Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18929CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 13:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B81E760648;
	Sat, 10 Oct 2026 13:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJIhf7DPQgoT; Sat, 10 Oct 2026 13:51:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AC6DD60649
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791640286;
	b=sn1WdfELFkphbv/oQpiBIv5RWNxzg8NMyEYcI55SuGTFHCZdIhGWCOYWd1QLfUhqrKOO
	 7EcMATAYinoIqDQJ1OZOEI4forxbIGp3rG7jiJYbs1PY4YhG4U8RYtvG8C90WGZbphUod
	 S3Z9BUv1tKJOVLken+BX8Cpg+bAte3g1kTyU/yZAybF1kdfKvZlfMn6RFdKMywSQkSkWH
	 icecy8vZGhcnCdwby76Y6sWG/ylismvDpDrsWGCRwysNThe4TNvPcGsCEPXLri1xKBJRW
	 CLNC1QZC4SRRni0wwqQ7uCXsGPEH3Hyyu86oDdWZEJEC+LVjckea46O+l7BugS4fkkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791640286;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OEvxN+5XI77T1r3UaMinIz6qrjl0hluNq59C9pJCkrY=;
	b=Lwd6eeiA2tSKwpbJFdR431Oe7Uan+ElUbhybG1eNpjzVCm+9fKwWSVE7ZFCpr5tp7MjB
	 3SqASMJWcb39+XiJRqkmWoV3Bj6EjVa1BmRAwJkilu9qk3BhjA/5JxkKP8LQINNe0Vh5y
	 BECr/+zIKhim8m1CEvwO6tY7dYF9WWPJgnSJ3NVbckVhDtFUG6BG2SsfAeYMS35uZJ1gp
	 jILiszWro9RRNNB8LTUurXGUgwitCXKE8AfpJMPIQuU0lzQ7HzUlI8SJ7i21xUZWEBAj2
	 1PfNMYU+PXg01ZG4nXvusn24lAd/8Z74PXfb+pE7648EhuNmD004dII5oVGO6lNVcZg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791640286;
	bh=OEvxN+5XI77T1r3UaMinIz6qrjl0hluNq59C9pJCkrY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U333N1wKAMfJWdL2YjeAzNWekYG+x+ut3ixitvdqYrLYnh0fBglUem2u7QkD/04dV
	 3m8rxMTDeJVgojjsvoXE5GWx3AlLepWjga7y3ME6I1G3R+Y0zu9X/hwl/VK7g+F7Dk
	 UAzhiC7neEZWrOwpiUPyLGhDijsTkDliCA9s58gVz5+tA3ymh1JN3zvbzyq2bRCyZ+
	 fNIHM8gbh8FmR/QKJPS/rXQhQ4o9Mmmm3c+xScrE6ezN1LYE6fD3CD9XSUkfniuc5W
	 URM2CGCDn+GVqkWjq3Ig6yJcSnvUhKDk9RsC0PCMEQX2E/UjqDp+cF3Ya7Tvme4Ytv
	 L40D7w/Fovvsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC6DD60649;
	Sat, 10 Oct 2026 13:51:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D58F9105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB5DD60649
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfsX6aMddqZm for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 13:51:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C647D60648
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791640284;
 b=Wgf0JnDwjqoOFeCUXuDSqYNGXCILjfmsqidBBWmMAccWB/e+Vtye+Nfy0dKA+bSnphTg
 AZorN7upgvUk8tSWmwyLC/V74MqT3v/p8HqinWym84iQfIL//szAWvfJfIzqST2WlbgJh
 WKTxJOWBaXiy3PoSuu3Layrui1oLr8I4jm5WgUGkme/sha+GO35PMRuc4rXR+wBubW/Nz
 ieijQvTbF1gJgP1g2kfKoWicxKrddz5Q/Y8Vq3SE7oYgkodi16BbdvnXonDTjZQfrUaWE
 /AxCi4qslOPjWTviNLOg9m0JOqXId41EHvCya8JgNhRzwX6FS4SElapPypMRlQUt+Og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791640284;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=C7awn4+2FjY+dnvOzlOMhXtf9EPkFknRNFEAJNebW1k=;
 b=VTflWtJGZMHcT9p/iiDyxyz96dc6UJOLKGQnhl6HubuLpzekUXlz1syPOF5oLJJoax+1
 JNn3xLJ03bPxX+w4AVqQNlGF9iW/na5oar+OlbvbjMVH2Nx7sSI3+JP5fkBwtJZtzBq0N
 O85giNS/ZFmjytKvOn/iHRkRRwsNFrpAhY50SMlQc1dPpEVf/U11hg/vvZ7KnyKqSw0hO
 ZxM1tqAWaxUrUyxdx9CkTE2SLhYLSDm8IJsaMyBNX0AeQYPRwcW4HWV1/qeFnWdn7pZdJ
 lROedJrd+YbHzGetGttvXAlpfIcqc/yJVQm2SiK2C0CFTFTb0L2Q2D4CnMUWHXAqu9w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C647D60648
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:51:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 889AA9038E; Sat, 10 Oct 2026 13:50:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 15:02:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2449daf08cc4ba7b659b314cd8adbcc4a11d291
X-Git-Newrev: 67cb61bea5876227226603e58d3f74e5032b734d
X-Patchwork-Hint: ignore
Message-Id: <20261010135006.889AA9038E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: bump version to
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67cb61bea5876227226603e58d3f74e5032b734d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
