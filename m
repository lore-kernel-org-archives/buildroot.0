Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B42CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 14:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83E2760FBA;
	Mon,  1 Jun 2026 14:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qD5BqWj5okn3; Mon,  1 Jun 2026 14:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9108160FA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780325411;
	bh=oEAtGfUjGdRFCAeC2g9babo9PLl4uLIBd9/zbfr17dk=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DLcCRZfk69J1RGyE3ZrtGxQOOeV0jJRsEeQc6zSHGu/MevLfLRX8QOILC/EEx9+q2
	 USx7m0WUjZoHfMSGpByrhgTxn6X+O27teP3LHfppN55sWkm+sNm3ur11H/Eoj6lQFT
	 5fP1/5dOy90ToNi5VxqspoVk6OhXL3Wg8Z0zCRUvLN9oCwUVSyCI6con93G3YwVucH
	 9leoQdleT/oYUMTieEcvxey/X+tYgLvBT04lMm+UzpXtmy9Vii/DqjB3bFcddnE+Ng
	 j4WBWGGTWJzb/Yo22wXpQzhnUQyIp0LcCLia4ZvtSUa/S8alqcrkcOh60Nn6b6quV8
	 I09YtIXAaiMsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9108160FA4;
	Mon,  1 Jun 2026 14:50:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88DE4F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 14:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A0BA42722
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 14:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DiDeuSKQ7I-Q for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 14:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3ED2442721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ED2442721
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3ED2442721
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 14:50:08 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490a7a9f81bso11953025e9.1
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 07:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780325407; x=1780930207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mrhP9se7Embh24LTIs87T7OVvVZ08g0Whh+1OM0sn7U=;
 b=Zz1z41W0oxtQQQdeiv5X8wHFKt/hMhFXeEtZ0msH9Pw33Q3bvhcqG/6PVZeU6M/1sc
 D7xmK6deDi30jQ1G8PjYovmLoVhLpCGp1gWrckNaqHEfAbm5YHt0QRgQYOputWehSy0r
 fCW+ywBu+hgbxpNbZZ1wSmvfx3EaxRjUFf3iimAM2xaDplibAo64zvScP+H74zmZHQBN
 cc9UuKhun6aSx5lft8IaTExr4c0QFoSjVsD6qaG3uRnn9sDol+g5EndupNHt2s9jcpP1
 GVTqIelJ9wA4k4AjeGIfUtJZp1KbakfB7brR41JZaqHx7BpOBzMIiHCyLhnqpfMqgMcQ
 GT5w==
X-Gm-Message-State: AOJu0YwriDIVm1L+G1lVVFhcn4d11sQNyq7Un1Z9FTfE8JQy8dcgMuV/
 yXCNmihgo4si8JKOeVKFKQvdtzQ1h3/CPEt59yHyH51CnndGzZ0QlVevq5bZTRyqVAJMAUQWkw4
 9/bms
X-Gm-Gg: Acq92OF1IMcX288ZbycjA8Fzi/Qc9IdOKPHpnpiWbD+cKvGcv06awYZVJDUP9wkUPnO
 x5QqoU4ZBkd7w/NN2O3ib2iuXxhUuktMg/4uX6tlfSkFKuVTC9vw2p7udjuF2MwUNKZsBAW7wqE
 SW61r+nLOP9GcV9SRLS1gr1RFMTbP77lonxxkfJWiJ2liYmrD/bLbKFOEAW8ZqMa81dQ9SNd/c4
 JpOrSETo/TfAMOLiUNoj1HOtky8D/63XZzE8qREZ3uDjvrxZ2C4B9WRON96UEOjRfus35CPfdzh
 AoYipN0ZKpsSCx7NU7qJrkfyCMGjRCMbs2kxfO8y5qFCg3mbpzizrgtJbkRvCPgFD7OzJG1H4wV
 Y4Exm0dHM0TS3WgOctgRP0Y04LVOvT8aOjCTwaNxMVkbU0dVkWqKxL0bc1OWJbG5hqIXouuIWPp
 yc8AKIKayj4Ip5hBpjnY7+5SGkLxP3P17Smwu6TYQfdUF9//D/cTcKgGIxYbOVOjGxHhE+CmRF4
 rBSSOa2tj+fy6YdQT7WkARG4Z9d0Ro=
X-Received: by 2002:a05:600c:5254:b0:48f:e044:927d with SMTP id
 5b1f17b1804b1-490a2a43b6cmr170866725e9.10.1780325406836; 
 Mon, 01 Jun 2026 07:50:06 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ab55d39csm16696635e9.35.2026.06.01.07.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 07:50:06 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan GULLIENT <dowan.gullient@smile.fr>
Date: Mon,  1 Jun 2026 16:49:54 +0200
Message-ID: <20260601144955.74171-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780325407; x=1780930207; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mrhP9se7Embh24LTIs87T7OVvVZ08g0Whh+1OM0sn7U=;
 b=1wFmuJr23t04S/tNXeeTDLI76fan5Wl7PJdm6EB9KFqpKzWNV4/HCLJ4Sy2UnH/HA+
 7QchjPh0G5xqHk90+Cl94lGYWbhKbyvwIjH0t29exq8PnrGW2khJANAW/9bqOuP7ezZL
 BDqvz4xbdas8ip0DYF4TlTfJe+XCup6plnMGk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=1wFmuJr2
Subject: [Buildroot] [PATCH v3 1/1] support/testing: test_podman.py : kernel
 version bump and add kernel fragment to fix iptables errors caused by this
 modification
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dowan GULLIENT <dowan.gullient@smile.fr>

This patch is a new version of the patch
https://patchwork.ozlabs.org/project/buildroot/patch/20260505100553.4100688-3-dowan.gullient@smile.fr/mbox/
that bumps the kernel version and adds a Linux kernel fragment for Podman
tests to resolve "Protocol not supported" and "Table does not exist" errors
when using iptables-based networking which appeared due to the bump of the
kernel version (5.10->6.18) Indeed, the new kernel version requires additional
configuration options due to the switch to nftables, and to support Podman's
networking features, especially when using iptables-based networking.

This fragment enables the specific networking options required by the test:

    * VETH & BRIDGE:
    Required for Podman to successfully execute `podman network create buz`
    and attach containers to virtual bridge interfaces.

    * IP_NF_IPTABLES, IP_NF_NAT, TARGET_MASQUERADE (and legacy variants):
    Fixes "Table does not exist" and "modprobe: module ip_tables not found"
    errors. These are strictly required for Netavark to set up
    SNAT/Masquerading, allowing the container to successfully `wget google.com`
    during the test. [1]

    * NFT_COMPAT & NF_TABLES:
    Fixes "Protocol not supported" errors. If the userspace `iptables` tool
    is built as an nftables wrapper, it requires this kernel compatibility
    layer to successfully register legacy rules.

    * NETFILTER_XT_MATCH_* (ADDRTYPE, CONNTRACK, COMMENT, MARK):
    Specific xtables match modules utilized by the Netavark CNI backend to
    isolate bridge traffic and manage container port forwarding.

Note: Parent dependencies (e.g., NETFILTER, NETFILTER_ADVANCED, NF_CONNTRACK)
are explicitly enabled to unlock the options listed above. Options globally
required by the Podman package (like NET_NS, USER_NS, MEMCG) are intentionally
omitted here as they are already enforced by PODMAN_LINUX_CONFIG_FIXUPS.

Some dependencies in the configuration file were verified by the check-config
script from the Moby project [2].

This configuration was tested and podman tests now pass successfully without
the previous errors.

[1] Gentoo Wiki (Podman Kernel Requirements):
https://wiki.gentoo.org/wiki/Podman#Configure_the_kernel [2] Moby/Docker
Check-config Script:
https://github.com/moby/moby/blob/master/contrib/check-config.sh

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/package/test_podman.py  |  5 +--
 .../package/test_podman/linux-podman.fragment | 32 +++++++++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 support/testing/tests/package/test_podman/linux-podman.fragment

diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
index 9d86a06129..9b4a7dedaf 100644
--- a/support/testing/tests/package/test_podman.py
+++ b/support/testing/tests/package/test_podman.py
@@ -15,10 +15,11 @@ class PodmanBase(infra.basetest.BRTest):
         BR2_SYSTEM_DHCP="eth0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="support/testing/tests/package/test_podman/linux-podman.fragment"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
         BR2_PACKAGE_PODMAN=y
         BR2_PACKAGE_UTIL_LINUX=y
         BR2_PACKAGE_UTIL_LINUX_MOUNT=y
diff --git a/support/testing/tests/package/test_podman/linux-podman.fragment b/support/testing/tests/package/test_podman/linux-podman.fragment
new file mode 100644
index 0000000000..386a3d0438
--- /dev/null
+++ b/support/testing/tests/package/test_podman/linux-podman.fragment
@@ -0,0 +1,32 @@
+# --- Core Container System Support ---
+CONFIG_VETH=y
+CONFIG_BRIDGE=y
+
+# --- Netfilter Infrastructure (Core) ---
+CONFIG_NETFILTER=y
+CONFIG_NETFILTER_NETLINK=y
+CONFIG_NETFILTER_ADVANCED=y
+CONFIG_NF_CONNTRACK=y
+CONFIG_NF_TABLES=y
+CONFIG_NF_TABLES_IPV4=y
+CONFIG_NFT_COMPAT=y
+CONFIG_NF_NAT=y
+CONFIG_NFT_NAT=y
+CONFIG_NETFILTER_XTABLES=y
+
+# --- IPv4 Support & IPTABLES Compatibility ---
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_IPTABLES_LEGACY=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_IP_NF_NAT=y
+CONFIG_IP_NF_TARGET_MASQUERADE=y
+CONFIG_IP_NF_MANGLE=y
+
+# --- Xtables Match Modules required by Podman/Netavark ---
+CONFIG_NETFILTER_XTABLES_LEGACY=y
+CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
+CONFIG_NETFILTER_XT_MATCH_COMMENT=y
+CONFIG_NETFILTER_XT_MARK=y
+CONFIG_NETFILTER_XT_NAT=y
+CONFIG_BRIDGE_NETFILTER=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
