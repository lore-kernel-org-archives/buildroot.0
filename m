Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C28CD8C9D
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 13:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5296E42268;
	Mon,  8 Jun 2026 13:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOIjeZgoYGyG; Mon,  8 Jun 2026 13:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35D8C42272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780924642;
	bh=9THEjxSjy9Wtgdbih61lRgTD3apFGNL2ZWRMQPfohXM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=i7d8oDsK/LZqgClSC4UtidGnepa6y6JzVZjVGPf7qWexs7g8MCD82vEIqnLY9lyug
	 gqOayB/uqwNmiDh0gFA59vmnVq+kx/dGRVSn4aIUZapxTPcGnkC/TlYcAxoyQ8dupx
	 krqlefEYKQIyhQXVQGpwDtdKU+9mrl34g/mBWF+CncQumnCboqSPYdrhUGgYaF7YTP
	 3MyrucG8mZyA3+8zWShMSqYDDsOhoWfpSKTtVplLKmV1C5soFU1YvqE/DdLOFA6efi
	 At5H+lSk104UZZjyCL74PlshPgnpX5CHGrY01wEJR1RcC/2qfM5Hh5ns18LdZyDYSw
	 516gTDcBMsO2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35D8C42272;
	Mon,  8 Jun 2026 13:17:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76C30187
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 13:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7172242272
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 13:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-dIflnU7Ajy for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 13:17:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64E2442268
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64E2442268
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64E2442268
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 13:17:19 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so3321406f8f.2
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 06:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780924637; x=1781529437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqcBY/YHnFJdCqLEKq6MIUNE/YL+DhV4lmKpwFMTcKM=;
 b=kunFhtYDot0iD2METRNa25Xw/N1Q3p3LWvNfoaD7sDOaTbpAsLAC1iskWghk+Nh5W/
 hquUMrcVeZ97X19jlJEFS2pkeTopotYXjwRhgnZ7ocJtwdnaLYnhKFuFrQEIN1+2hgcA
 8dfEwps62VWKMZI065ek3u3pHk0Am+8NGNxn1C15MeaD7QSOd1Gw40j4ezAiuK+Nq9P2
 J5RPCp/wtRCmeZPE8iAKdA39rOfVTz6KMpNJjnMhUuchGp5y2JiRW+DneWFEwxgd9Szc
 BSoqxnspAuSEpdEQuRpqGBH1T68I6uWS50PzJ0XVYf/ASGAyyXWig8Ub1978ETK3B6f8
 4jYQ==
X-Gm-Message-State: AOJu0Yzy3SJjmfe5j8oImYabIg8UebLQhZ2NyrPthw6/QknsbCDRY9Pq
 LgNkVcOZIv6lcjuO9tNwYyClFso0p8LhMO2W1GWh4KSzSa0Pk/Ww0fbxRjXgf//Twtney0lIfKA
 /ce/b
X-Gm-Gg: Acq92OHa0OrVdqxg2pHRE5vxNPOjnrzpPkRgRVjkhmgfI1jtpGdXCSWKmWqzKCD/KFF
 jt2UeADgnG4dMZpPuWZXFMZgQct/Kg3idIBGow8hHv/MaRlFx/cxemZ9hsXnL51HohVOo/R0cjK
 rKjUwpynUJ09po2UWL/PGSZwvNdpw3XGi6PPYAEF67ton6pniGOxct8COlwrwbA2vO1m6kRUhIa
 mkZ8xwHnoFFgPiDDvxb1WRCcIWXSPq67Ykvyz3OZgRSY04NXhoIKRQwExni3y3hHI9MF4yJtY3S
 NsP8oYcerxHwI2CEhykdXf9DuxsODH9edWHrSwf5WCySKqOjf4oLJyVnVE5PMU9cVyo3UUyXaA9
 ry2zoFCAuObZ2PmnDqkapkCTQlY9nVzjccW8S3Gzxr5Z3QGabwJuPdUuENQX5IE0/K+WgIFiAii
 nsmxCv/O9CLtyRm8NUGRPq7wiOJ8uPnjsy4Md87UKEDaIOLV/ItgGBpmaudveFFqPmvUoOvmhxP
 440wd/wd8EJ4gl0bZ8s7C5FKk+PSKM=
X-Received: by 2002:adf:e004:0:20b0:460:2eee:4e21 with SMTP id
 ffacd0b85a97d-460302f0702mr17450190f8f.17.1780924637030; 
 Mon, 08 Jun 2026 06:17:17 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm52475247f8f.0.2026.06.08.06.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 06:17:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  8 Jun 2026 15:16:51 +0200
Message-ID: <20260608131651.1413416-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780924637; x=1781529437; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bqcBY/YHnFJdCqLEKq6MIUNE/YL+DhV4lmKpwFMTcKM=;
 b=t3PLSyD2Vb6AeTtlUz/7Pw3xbyHNZsUSjkeZFlxS2tNBrlk8+6verpfsYdM+qRa2nM
 FlIbAagUeVtJQeosXNYPq2qP/jpd9JPiX6ER9g6B0mWgK0DtQGvjMw+u/ETer9FlD2oV
 lAuM3S9aUnfOgCiN+RaNJY3oRbg8nFTwQHTbc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=t3PLSyD2
Subject: [Buildroot] [PATCH v4 1/1] support/testing: test_podman: use latest
 kernel
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Cc: Dowan GULLIENT <dowan.gullient@smile.fr>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dowan GULLIENT <dowan.gullient@smile.fr>

The goal of this patch is to update the Podman test suite to use
BR2_LINUX_KERNEL_LATEST_VERSION=y to ensure that podman and its
network backends run correctly on recent upstream kernels.

Switching from the legacy 5.10 kernel to the latest kernel version
exposed multiple missing kernel configurations, causing container
networking setup to fail with the following Netavark execution errors:

  Error: netavark: code: 3, msg: modprobe: module ip_tables not found in
  modules.dep iptables v1.8.11 (legacy): can't initialize iptables table
  `nat': Table does not exist (do you need to insmod?) Perhaps iptables
  or your kernel needs to be upgraded.

Instead of fixing these errors via a localized test configuration
fragment, the missing options are integrated directly into their
respective packages as global KCONFIG_ENABLE_OPT fixups, ensuring all
Buildroot users benefit from working kernel dependencies on modern
kernels.

The following package fixups are adjusted based on the new kernel
requirements:

* iptables:
  - Adds CONFIG_NETFILTER_ADVANCED to the base fixup to unlock sub-menus.
  - Introduces a conditional IPTABLES_LINUX_CONFIG_FIXUPS_NFTABLES macro
    triggered when BR2_PACKAGE_IPTABLES_NFTABLES=y is selected. This
    forces the kernel to enable the modern nftables engine alongside
    legacy compatibility layers (CONFIG_NF_TABLES, CONFIG_NF_TABLES_IPV4,
    CONFIG_NFT_COMPAT, CONFIG_NETFILTER_XTABLES_LEGACY, and
    CONFIG_IP_NF_IPTABLES_LEGACY), resolving "Protocol not supported"
    and legacy table initialization crashes.

* netavark:
  - Enables core connection, routing, and packet mangling features
    essential for stable container NAT operations on modern kernels
    (CONFIG_NETFILTER_NETLINK, CONFIG_NF_NAT, CONFIG_NETFILTER_XT_NAT,
    and CONFIG_IP_NF_MANGLE).

Finally, the test cases utilizing the iptables backend inside
test_podman.py (TestPodmanIptables, TestPodmanTini, and
TestPodmanSlirpIptables) explicitly select
BR2_PACKAGE_IPTABLES_NFTABLES=y to cleanly trigger the newly added
compatibility fixups.

The 5 test classes of the test_podman test were tested with the latest
kernel version, and all passed successfully, confirming that the new
fixups correctly address the issues encountered with modern kernels.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 package/iptables/iptables.mk                 | 12 ++++++++++++
 package/netavark/netavark.mk                 |  4 ++++
 support/testing/tests/package/test_podman.py | 10 +++++++---
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index a9d912f6cc..09608c727f 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -49,11 +49,23 @@ else
 IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
 endif
 
+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),y)
+define IPTABLES_LINUX_CONFIG_FIXUPS_NFTABLES
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COMPAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES_LEGACY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES_LEGACY)
+endef
+endif
+
 define IPTABLES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(IPTABLES_LINUX_CONFIG_FIXUPS_NFTABLES)
 endef
 
 define IPTABLES_INSTALL_INIT_SYSV
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
index d47cee0fe1..c9959845d4 100644
--- a/package/netavark/netavark.mk
+++ b/package/netavark/netavark.mk
@@ -72,6 +72,7 @@ endif
 define NETAVARK_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_NETLINK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_COMMENT)
@@ -81,8 +82,11 @@ define NETAVARK_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_NAT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MANGLE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE_NETFILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
index 9d86a06129..bfd24a51c3 100644
--- a/support/testing/tests/package/test_podman.py
+++ b/support/testing/tests/package/test_podman.py
@@ -14,11 +14,10 @@ class PodmanBase(infra.basetest.BRTest):
         BR2_PER_PACKAGE_DIRECTORIES=y
         BR2_SYSTEM_DHCP="eth0"
         BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
+        BR2_LINUX_KERNEL_LATEST_VERSION=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
         BR2_PACKAGE_PODMAN=y
         BR2_PACKAGE_UTIL_LINUX=y
         BR2_PACKAGE_UTIL_LINUX_MOUNT=y
@@ -212,6 +211,9 @@ class PodmanBase(infra.basetest.BRTest):
 
 
 class TestPodmanIptables(PodmanBase):
+    config = PodmanBase.config + """
+    BR2_PACKAGE_IPTABLES_NFTABLES=y
+    """
     def test_run(self):
         self.do_test()
 
@@ -228,6 +230,7 @@ class TestPodmanNftables(PodmanBase):
 class TestPodmanTini(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_PODMAN_INIT_TINI=y
+    BR2_PACKAGE_IPTABLES_NFTABLES=y
     """
 
     def test_run(self):
@@ -237,6 +240,7 @@ class TestPodmanTini(PodmanBase):
 class TestPodmanSlirpIptables(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS=y
+    BR2_PACKAGE_IPTABLES_NFTABLES=y
     """
 
     def test_run(self):
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
