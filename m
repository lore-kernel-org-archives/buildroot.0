Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC63C5DF71
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 07:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 106B340F14;
	Tue,  2 Jun 2026 07:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWsDZu4JLBXr; Tue,  2 Jun 2026 07:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA07140814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780385235;
	bh=wxJfJ9A+CJMbZpzdQDX1nOBoB3lxRYD+FB/4GWWKh2I=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=JezFijLkh+4+1usCO1qnDS1rkryNbRq/CDk3pgisxiqePsZ84d3984Sigd8rodDFO
	 jqguNa8dBZJJcfyixrzJ/QmUdUBzIijZETdtnJ7IEn2Vj/W4FDe0YAHe4s/Xc38WTW
	 PwTQCXQTH30fqIIMfpJJPbFicx0ap5srA1a8eAxNVm5qqtGeYQhu0tayMlGO1drU8g
	 kp4CBrnJx7FOcJsUcEDUaTt2BYfjTmjwWivJOUtxAlagGfBiw+x+IK5dy11sVUdRxg
	 C4ondofbgMGH2It4ljDqsf+NOfGqveukAHHpuHo+f9ERlbismjKIwIgQ1Lg+cA6dRr
	 TOcGzBG1HxbUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA07140814;
	Tue,  2 Jun 2026 07:27:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BB51223
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B77381EC9
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNEKi9LVnOO6 for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 07:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3061D81EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3061D81EC1
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3061D81EC1
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490aaeabdb4so10744585e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 00:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780385228; x=1780990028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=C9VfiKcLQfHuo1uD0gZHf82/j69fe+c4kAs622WC818=;
 b=CvzepqZ55YASI4zMf+0XGNb+0VtSmn5+ajZHZsKFAPruKVHWzI6hXe2RZgepetbYGJ
 Q9PTzDi0pQtHt6ZMtm6efmwzKKujNRDEQuzrg4zMA1aI4izaaQj9mltVNaoMBi4O2TxW
 o1xaeqsgp0q162oJxPdzlPSVZ1whNeSkxzsUPOH1dfG+BAOuLJTcIwL/Ae0KIyDASxy+
 mg17wdcD2Bk7U2XLtn8opyvMzdJFd+c3v/zcr/WeGe5nN8QGWwfJGRpmDO6ymgpX8Z2/
 VJewG5fvTg7aMElOYE7/AoOvE2DoIDFdrhkmOZLuJKL+bkwRAtdsgVZn+rQONHqKRqf+
 7LtA==
X-Gm-Message-State: AOJu0YzqWE1v89rdxzWkrooM4/9nOAIfJiaUnVD5wmI0RuhnSy2D71zF
 C4KUMi0whrkgLY4CqpDyeUdB0BLbhqCzroUr8nl8Kg+Hmw/GbCmIHpRLGnqZdjhrKviOCwoTtJ1
 qp2t2
X-Gm-Gg: Acq92OGxmWTaRfPA2bZrlTloTSSPvvWfKadZzBJi4PcFK282BJgv0wZiWm5+nh2M568
 tbD/jccxtaWk5W4kfu+7BAGQ8kcy4m32Xj9ZrGEXPZ3+OOcvrHnR7/gApYuq5YaJ3OMITjOySfz
 eBM2S1yhWqhSluOMicG9s1ihhw6jH4odQfddg/PiD+0DSSeHyJKclLU6T0wyVnwXAOtqBP3eD+1
 ceW8KsST3E9BG/Z4pHxcjpdZvGjfiWmPF0fjEZ5E7RaiVFapOpgpuEaB+QpoE76HXjfk+JW+pGs
 xDD8qEMqqXDQzWeQkbZ+Ic09VYbzdZwccHumTq0cmQ9miNzVFQOZoMZiNBC9eJVtRbtUEP1rzxA
 Esjckc4lbxA0rTvXcFqPGqMLXzmcdhbjfWfHCryUkJcPEw9KBAvTn1YHB8oe4Gvb/tYijX8cB+a
 UQXtbNDiyuQDZzgTQHYfR/mHMXi70p8Txg/bmGZJFOhyBHZPyg4NfanDOWHw==
X-Received: by 2002:a05:600c:1c14:b0:490:a646:9d74 with SMTP id
 5b1f17b1804b1-490a6469e64mr247054485e9.4.1780385228115; 
 Tue, 02 Jun 2026 00:27:08 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c09ab75sm93869395e9.6.2026.06.02.00.27.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 00:27:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 09:27:05 +0200
Message-ID: <20260602072705.43945-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602072705.43945-1-thomas.perale@mind.be>
References: <20260602072705.43945-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780385228; x=1780990028; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C9VfiKcLQfHuo1uD0gZHf82/j69fe+c4kAs622WC818=;
 b=Vzf5Akd7j6ncYC5zCT5ttifnIb/RTFNSwRtffB1N1vz2rNS407lPFb/gFqL/L/Hufm
 vwfURljKCfRknu0WSSZkT+f0nQrCMRs4vzSdXTDCLbGxlSHfkw4wK542TbtEF4oQbCcr
 jc7cDtK9ZgPJGEgJhSdFKUcNckHx2XebIUeq2QMlEg8dbQCymy6hWkCGe7xByIcgDPcs
 64sJjTMzttYYilg3v33DCO9I6SQUJS2v7P+l3+Gl4RtHdwWYZctTu0AL/s8nMT/a4JmG
 geSj9dztJqJxp6kPhlhoD+7UT8WtPwCIUtUw3G+baJzvmOlGb3w0bodGRsyRjsCmGYzM
 OgQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Vzf5Akd7
Subject: [Buildroot] [PATCH 2025.02.x 5/5] package/busybox: patch
 CVE-2026-29004
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks to the OpenEmbedded community for the patches. This fixes the
following vulnerability:

- CVE-2026-29004:
    BusyBox before commit 42202bf contains a heap buffer overflow
    vulnerability in the DHCPv6 client (udhcpc6) DNS_SERVERS option
    handler in networking/udhcp/d6_dhcpc.c that allows network-adjacent
    attackers to trigger memory corruption by sending a crafted DHCPv6
    response with a malformed D6_OPT_DNS_SERVERS option. Attackers can
    exploit incorrect heap buffer allocation calculations in the
    option_to_env() function to cause denial of service or achieve
    arbitrary code execution on embedded systems without heap hardening.
    https://www.cve.org/CVERecord?id=CVE-2026-29004

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/busybox/0019-CVE-2026-29004-01.patch | 39 +++++++++++++++++
 package/busybox/0020-CVE-2026-29004-02.patch | 45 ++++++++++++++++++++
 package/busybox/busybox.mk                   |  4 ++
 3 files changed, 88 insertions(+)
 create mode 100644 package/busybox/0019-CVE-2026-29004-01.patch
 create mode 100644 package/busybox/0020-CVE-2026-29004-02.patch

diff --git a/package/busybox/0019-CVE-2026-29004-01.patch b/package/busybox/0019-CVE-2026-29004-01.patch
new file mode 100644
index 0000000000..77ffd5f617
--- /dev/null
+++ b/package/busybox/0019-CVE-2026-29004-01.patch
@@ -0,0 +1,39 @@
+From d9a718cc17535c31d38f31fccb904a30e823166d Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 07:25:38 +0100
+Subject: [PATCH] udhcpc6: fix buffer overflow
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream: https://github.com/vda-linux/busybox_mirror/commit/42202bfb1e6ac51fa995beda8be4d7b654aeee2a
+CVE: CVE-2026-29004
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ networking/udhcp/d6_dhcpc.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index 79cef1999..d13b05829 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -351,15 +351,15 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+ 			addrs = option[3] >> 4;
+ 
+ 			/* Setup environment variable */
+-			*new_env() = dlist = xmalloc(4 + addrs * 40 - 1);
++			*new_env() = dlist = xmalloc(4 + addrs * 40 + 1);
+ 			dlist = stpcpy(dlist, "dns=");
+ 			option_offset = 0;
+ 
+-			while (addrs--) {
++			while (addrs-- != 0) {
+ 				sprint_nip6(dlist, option + 4 + option_offset);
+ 				dlist += 39;
+ 				option_offset += 16;
+-				if (addrs)
++				if (addrs != 0)
+ 					*dlist++ = ' ';
+ 			}
+ 
+-- 
+2.34.1
diff --git a/package/busybox/0020-CVE-2026-29004-02.patch b/package/busybox/0020-CVE-2026-29004-02.patch
new file mode 100644
index 0000000000..c7e28abd0f
--- /dev/null
+++ b/package/busybox/0020-CVE-2026-29004-02.patch
@@ -0,0 +1,45 @@
+From 1e14c5c577a7bd46f42315e9bc445419770041a7 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 13:23:48 +0100
+Subject: [PATCH] udhcpc6: check the size of D6_OPT_IAPREFIX option
+
+function                                             old     new   delta
+option_to_env                                        694     711     +17
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Upstream: https://github.com/vda-linux/busybox_mirror/commit/d368f3f7836d1c2484c8f839316e5c93e76d4409
+CVE: CVE-2026-29004
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ networking/udhcp/d6_dhcpc.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index d13b05829..1851cee2a 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -287,8 +287,8 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |                        valid-lifetime                         |
+  * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+  */
+-			/* Make sure payload contains an address */
+-			if (option[3] < 24)
++			/* Make sure payload exists */
++			if (option[3] < (16 + 4 + 4))
+ 				break;
+ 
+ 			sprint_nip6(ipv6str, option + 4);
+@@ -332,6 +332,9 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |               |
+  * +-+-+-+-+-+-+-+-+
+  */
++			/* Make sure payload exists */
++			if (option[3] < (4 + 4 + 1 + 16))
++				break;
+ 			move_from_unaligned32(v32, option + 4 + 4);
+ 			v32 = ntohl(v32);
+ 			*new_env() = xasprintf("ipv6prefix_lease=%u", (unsigned)v32);
+-- 
+2.34.1
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index e26a760f8f..c17c9b1984 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -36,6 +36,10 @@ BUSYBOX_IGNORE_CVES += CVE-2025-60876
 # 0018-only-strip-unsafe-components-from-hardlinks.patch
 BUSYBOX_IGNORE_CVES += CVE-2026-26157 CVE-2026-26158
 
+# 0019-CVE-2026-29004-01.patch
+# 0020-CVE-2026-29004-02.patch
+BUSYBOX_IGNORE_CVES += CVE-2026-29004
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
