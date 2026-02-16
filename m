Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5D4E7BD8A
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 10:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDAFA40995;
	Mon, 16 Feb 2026 10:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brsQtc74gGSE; Mon, 16 Feb 2026 10:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B32FD4099B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771238227;
	bh=19hyNsd9gFNv1pRJrEzYVRhLMg+Jhpu0R1ojhvxo2wo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ZzjdNLhqj5gcv5tUU02sqqy5ZJwFmC/iILc5kD36rNTyGtzWr7VFwrNWDoWt41Htg
	 eCw+z08AB1mNHTgJfGYbygRkdjfjrfZYYS2PiyXbzSTl+FQvechwncqBsJNSq6EDd+
	 8T8EJvIo4Q1u/kR3/NFQxFoqT3r+ZTEMNkkCrULymfnH0VYU8TVCVr8NUhiuUdEz8y
	 RYQE1Tj1tirP0KWbJUC7aVquw7N9xC1aJGzqkKMFusJ74dWeMU6VIVw+arUIH3HbGI
	 FJYUPa3UUhdGpFkVrAPyZRqnIpEB1sRvb5+Y97zxDKsHNXfyiBXwGqdaUi3pmK3rEi
	 ImK7YTh4DDdYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B32FD4099B;
	Mon, 16 Feb 2026 10:37:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2467D35B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 10:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09C1C821C5
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 10:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWVurKgj41m7 for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 10:37:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAE2A82205
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAE2A82205
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAE2A82205
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 10:37:02 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 2ACBB2C84158
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:37:00 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 11:37:13 +0100
Message-ID: <20260216103714.802444-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216103714.802444-1-buildroot@bubu1.eu>
References: <20260216103714.802444-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1771238220; bh=3JdYHJOnoekTY4PAPjcFfMo+/0aG70X4hvU2qasmbgk=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=OeJz7DhY/bzGvPO93V2B3yjjSJ5mtqaXlwopGkOjZOTPYApjGDvH6wsubGYx/LsNc
 XTZCwTJVCW3c55EOgxqHv9J2LcLjik57CCUq5b+mUEDN+LZMj3cAA/BSRIBvRscg9n
 fZEltme4Kanq3lY3RPQP4DF5A/YedjnxQ6oZZQxW2lH9x6GQ38Tlhhut+uVnHODf4Z
 2M1Ox1iP2IIe4wTgMek3v3sqsfLe19T1p4A9gMFiOwdZalgLtCtsJdbEoAewbwiCHX
 aMmRrbjtOupoutyydDVFTb3ptuje8qCFNjb6vP1EAZinzpa6ltX1TX98bZhHdyYRss
 ocdB6j66Txoew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=OeJz7DhY
Subject: [Buildroot] [PATCH v2 2/2] package/network-manager: bump to 1.56.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable building of man pages, which is now a separate option from
building html docs[1].

Add conditional support for parsing the NVMe Boot Firmware Table NBFT)
depending on whether libnvme is available.

Changes [2]:

=============================================
NetworkManager-1.56
Overview of changes since NetworkManager-1.54
=============================================
* Unify the versioning to use everywhere the scheme with the -rcX or -dev
  suffixes when appropriate. This affects, for example, the URL and filename
  of the release tarball and the version reported by nmcli and the daemon.
  As an exception, the C API will continue to use the 90+ scheme for RC versions.
* nmcli now supports viewing and managing WireGuard peers.
* Support reapplying the "sriov.vfs" property as long as
  "sriov.total-vfs" is not changed.
* Support reapplying "bond-port.vlans".
* Accept hostnames longer than 64 characters from DNS lookup.
* Make that global-dns configuration overwrites DNS searches and
  options from connections, instead of merging all together.
* Add support for a new rd.net.dhcp.client-id option in
  nm-initrd-generator.
* Add gsm device-uid setting to restrict the devices the connection applies to.
* Support configuring the HSR protocol version via the
  "hsr.protocol-version" property.
* Fix a bug that makes broadband connections auto-connect getting
  blocked if the connection tries to reconnect when modem status is
  "disconnecting" / "disconnected".
* Treat modem connection not having an operator code available
  as a recoverable error.
* Add support for configuring systemd-resolved's DNSSEC option
  per-connection via the "connection.dnssec" connection property.
* Support configuring the HSR interlink port via the
  "hsr.interlink" property.
* Fix some connection properties not being applied to vpn connections
  (connection.mdns, connection.llmnr, connection.dns-over-tls,
   connection.mptcp-flags, ipv6.ip6-privacy)
* Update n-acd to always compile with eBPF enabled, as support
  for eBPF is now detected at run time.
* Add new MPTCP 'laminar' endpoint type, and set it by default alongside
  the 'subflow' one.
* For private connections (the ones that specify a user in the
  "connection.permissions" property), verify that the user can access
  the 802.1X certificates and keys set in the connection.
* Introduce a libnm function that can be used by VPN plugins to check
  user permissions on certificate and keys.

=============================================
NetworkManager-1.54
Overview of changes since NetworkManager-1.52
=============================================
* Add support for configuring per-device IPv4 forwarding via the
  "ipv4.forwarding" connection property.
* Add a new "prefix-delegation" setting containing a "subnet-id"
  property that specifies the subnet to choose on the downstream
  interface when using IPv6 prefix delegation.
* Support OCI baremetal in nm-cloud-setup
* When activating a WireGuard connection to an IPv6 endpoint, now
  NetworkManager creates firewall rules to ensure that the incoming
  packets are not dropped by kernel reverse path filtering.
* Add support for configuring the loopback interface in nmtui.
* Most of the properties of ovs-bridge and ovs-port connections can
  now be reapplied at runtime without bringing the connection down.
* Add a new "sriov.preserve-on-down" property that controls whether
  NetworkManager preserves the SR-IOV parameters set on the device
  when the connection is deactivated, or whether it resets them to
  their default value.
* Introduce a new "ovs-dpdk.lsc-interrupt" property to configure the
  Link State Change (LSC) detection mode for OVS DPDK interfaces.
* The initrd-generator now can parse the NVMe Boot Firmware Table
  (NBFT) to configure networking during early boot.
* Add systemd services to provide networking in the initrd.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/a11760ef39629fd5f850b9a495e5b155c2cb120d
[2] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/nm-1-56/NEWS

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/network-manager/network-manager.hash |  4 ++--
 package/network-manager/network-manager.mk   | 12 ++++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index a6e5113862..fe2f2ae262 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.52.2/downloads/NetworkManager-1.52.2.tar.xz.sha256sum
-sha256  3658640e788bbcb6a000c29a95f0dccc4dfebba41c6e5e9a90ad1e6daacb512c  NetworkManager-1.52.2.tar.xz
+# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.56.0/downloads/NetworkManager-1.56.0.tar.xz.sha256sum
+sha256  59a32d385cc1e7ae26e43798c6f12d07ff6198abd041ec0620b3a08cfc021ccc  NetworkManager-1.56.0.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 66549fcf0f..9ba664d862 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.52
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION_MAJOR = 1.56
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/$(NETWORK_MANAGER_VERSION)/downloads
 NETWORK_MANAGER_INSTALL_STAGING = YES
@@ -27,6 +27,7 @@ NETWORK_MANAGER_DEPENDENCIES = \
 
 NETWORK_MANAGER_CONF_OPTS = \
 	-Ddocs=false \
+	-Dman=false \
 	-Dtests=no \
 	-Dqt=false \
 	-Diptables=/usr/sbin/iptables \
@@ -167,6 +168,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dpolkit=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNVME),y)
+NETWORK_MANAGER_DEPENDENCIES += libnvme
+NETWORK_MANAGER_CONF_OPTS += -Dnbft=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Dnbft=false
+endif
+
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CLI),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
 NETWORK_MANAGER_CONF_OPTS += -Dnmcli=true
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
