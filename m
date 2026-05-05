Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476C7CD3436
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 10:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF3260822;
	Tue,  5 May 2026 10:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcYzQuCqLi_L; Tue,  5 May 2026 10:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 835BD60817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777975572;
	bh=RjGkeALzi20PfGOEtGWTSA3Sq5opGXJoiNgf+pATQQ4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FiDjLzWIO3ZquG7ZEFNa5vqUJV0L5wuX23frFMIG8hrJxBOcX99tEoSb5uv9JfWwD
	 r8p+RHY7sqfX4XtkS9q8e/2fvkcdt6BzsjgRQPyYn7BIGc4MKqv1F29Omv3PYf/jKQ
	 BSgOtmv2sM0d8dx69l7dAevvSdKmn2rYrMMM9vtSFAQD0ibyi22ngXI7YJxm+BiV8L
	 pmZ6nme/3yCg2o5rIUNh2J3XQrhDinC2NeDM1ynqO+028DXdA4c0DgLoozvv/OFTWD
	 mUJRHPwKb1TrNHotghg4zgwu975jhBq49cUyaTHL1kRY2FMODjHsE+Eq5b5XKPwuPG
	 O2HAeVoLIr2pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 835BD60817;
	Tue,  5 May 2026 10:06:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB202A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F19DF60817
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNlgG1oLd7nn for <buildroot@buildroot.org>;
 Tue,  5 May 2026 10:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE5AF60816
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE5AF60816
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE5AF60816
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:06:09 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488b150559bso34592315e9.1
 for <buildroot@buildroot.org>; Tue, 05 May 2026 03:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777975568; x=1778580368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rpvNrOEmXQRWjQVLyk/I3VR5t4AbNiYJQuBIO/8lMoA=;
 b=CvYvIETPR5MSmhf/33wR+B+2hG6I0ImBsl1TMgiR5doRj1iyBkDwN4mb5gAKW2VBU2
 2C5K4joIpH28im4tMjKU+t1HFvb2SwB040+Rm7tHutVmECsDeK1hF2Hk5R1tJ37RPtHD
 eN776aV2kheYHmyad4q/3tEouY+WJBxlR3kMoUyH+2Ou+zA13ekxzeT2jvaJ0NIejNEz
 DZ3IWkrCcQLknhVF5Bme5qfPO/iQhfBlwKp1bGkRZrLsmSHOgtGBk3VxWP46ASw/pCiu
 x1Y3JK61RBIC6whxyP3adcYlmbQ38gs1NA2/4nBCWsi7wyIiB7grkItk2/bQqou0cfJE
 hYZA==
X-Gm-Message-State: AOJu0YwMBGNAuZY79Pg/t7Pj+7ohbL4DgX40qILNzg3Fd16iNZ9eftgv
 m7Cqz/XxCCKjvoIL/MYvh3NQxhgw923zkjceL52oFLJ1CEXyveUuKhaOWChDbuqerE7g0zKAhqC
 IonaP3/c=
X-Gm-Gg: AeBDiesmvrLPLIOtmEp4ckrWmB3bIXFRHRWOYFb1WVnXQo7VEKK1rAolDexz2c/iNUM
 EPh1eQyRdWRpRCgyoT5PVXsp53OnErVqC8qfj+J5Q6xu/IR/+yM1fqnPURzOXfDGb5kxf1iF/iD
 9+heKZ3VM/MxZ8+KCKIzLDdMpScbrSM7s3Bjsw4S4lOZRwDn+ML8iqtl75dRnkPS7Rui6nxuE4r
 dBVdN/UbhiNo99yUtUt99WI8oJrcEawqkW6hjr1KOhsrf8RrUea/x4qTvanW+6Bnb13lA34cV49
 aoc8/TB5+lW5CxJt3w7eFvF5LsgvEOGCqTkF8Nh0px5bJuVoi5c3nkP/YW8jfwMz4eVcmRSZwdy
 ty0b4oTuTz9TuJ64FnL5DF2E81uBhUIOOyOQsjiL8wyYMQpqQIwv6oijpc2Kj+7+59qSfEjePS/
 kLuJEB7dkTAUtTbOhxWaDoxiMd6SFtjpGm7vhYKsVJXZwTyZ1SXYCeOhcPYsnGvkLBG5N8jRua4
 QKMxjaMyoOBOcmb0HJ6F+/MPvAoM04=
X-Received: by 2002:a05:600c:45d4:b0:489:1c5f:3a9e with SMTP id
 5b1f17b1804b1-48a9865e17dmr209058215e9.13.1777975567884; 
 Tue, 05 May 2026 03:06:07 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4505285e765sm3259221f8f.10.2026.05.05.03.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 03:06:07 -0700 (PDT)
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Dowan Gullient <dowan.gullient@smile.fr>
Date: Tue,  5 May 2026 12:05:53 +0200
Message-ID: <20260505100553.4100688-3-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505100553.4100688-1-dowan.gullient@smile.fr>
References: <20260505100553.4100688-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1777975568; x=1778580368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rpvNrOEmXQRWjQVLyk/I3VR5t4AbNiYJQuBIO/8lMoA=;
 b=kVEXrIu/doZt6sm9DHwTo5ezNraofng+9sbi3qH7JhukVL47B+lVH4Mw0O4tHgBBy1
 mmqe6DxBBq5sDoddXkC3ltR8TSZO0wzh0N2o2POICOESbN0iwy0aBiNEsmLQuaACzc3y
 3VP5ZIq2QQbtt81UDBgp2yOfxY6asPYisxPKY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=kVEXrIu/
Subject: [Buildroot] [PATCH v2 2/2] support/testing: test_podman.py : add
 kernel fragment to fix iptables errors
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

This patch bumps the kernel version and adds a Linux kernel fragment for Podman tests to resolve
"Protocol not supported" and "Table does not exist" errors when using iptables-based
networking which appeared due to the bump of the kernel version (5.10->6.18)
Indeed, the new kernel version requires additional configuration options due to the switch to
nftables, and to support Podman's networking features, especially when using iptables-based networking.

Justifications:

    NFT_COMPAT & XTABLES_LEGACY: On modern kernels (6.x+), iptables often defaults
    to the nft binary. CONFIG_NFT_COMPAT is strictly required for the iptables userspace
    tool to communicate with the nf_tables kernel subsystem. [1]
    Without CONFIG_IP_NF_IPTABLES_LEGACY, legacy calls from Netavark/CNI plugins fail.

    NET_NS & NAMESPACES: Podman relies on Network Namespaces for container isolation.
    Without CONFIG_NET_NS, the kernel cannot create the private network stacks required for containers.

    NAT & MASQUERADE: Containers require Source NAT (Masquerade) to access external networks.
    CONFIG_IP_NF_NAT and CONFIG_IP_NF_TARGET_MASQUERADE provide the necessary target modules
    for these iptables rules. [1]

    XT_MATCH Modules: Netavark (Podman's default network stack) uses specific matches like
    addrtype, conntrack, and comment to manage bridge traffic and port forwarding.

Some dependencies in the configuration file were verified by the check-config script from the Moby project [2].

This configuration was tested and podman tests now pass successfully without the previous errors.

[1] Gentoo Wiki (Podman Kernel Requirements): https://wiki.gentoo.org/wiki/Podman#Configure_the_kernel
[2] Moby/Docker Check-config Script: https://github.com/moby/moby/blob/master/contrib/check-config.sh

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
---
 support/testing/tests/package/test_podman.py  |  5 +--
 .../package/test_podman/linux-podman.fragment | 36 +++++++++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)
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
index 0000000000..ae201a31a8
--- /dev/null
+++ b/support/testing/tests/package/test_podman/linux-podman.fragment
@@ -0,0 +1,36 @@
+# --- Core Container System Support ---
+CONFIG_MEMCG=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_NAMESPACES=y
+CONFIG_NET_NS=y
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
