Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B182ECD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D4B084255;
	Fri, 29 May 2026 16:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4B40rMW9KtZ; Fri, 29 May 2026 16:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A44884238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071518;
	bh=7elddamygv9ItWIUAJaRUHQk7ngFb6nfpkp3htDhewY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=qcFaMl86tkBURnAEDZzblvY8ugit/v+oD1XmewEuEi1U8EKfHvyQgja7N+4XaBd3e
	 NTs7XwR3MoGhfajLoTAT5UTuy9aGxZW8QEB8eRKW5u1uosrFWX4GWJOg11BE3ZkR1/
	 SgZ1nu9WZksK78F9xMGM5AxXJoMcoHssR+Y0Q7R2c0eSXLphvkVAHGeyJMR2ydyq3o
	 mux2CGpt8u1Gw79VQghavdV+zca/vmmerc17+ktcEg21hFaXLcs4SLYelNyuJdvvHc
	 yfbhIsfRLDTxnDGBS3CPBJ7Y8tKHt466Z+JMoifareAcwakcf23gaWJnV+/38AF7kG
	 lbq6DmYrz9dGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A44884238;
	Fri, 29 May 2026 16:18:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59777372
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 455C041E6A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4g8GtftmKqr for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:18:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14AD5403DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14AD5403DF
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14AD5403DF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-45ef41adbc1so417220f8f.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780071510; x=1780676310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+CZM7oSp4Chi4LyabtHTRuGXxzSdPxRtFykVP/iPu7A=;
 b=hcGnplUNMdL89I6cXDQznQhDzUzfVIhtd7i7wL2ZbAoFk7okabzdgjMUnuumGuWRp3
 YNOsmmG5RjMGuahS/tyqrViMv8Pd5LkD4OxtrKoKx0ahEFMbH8w/orci7uLU7IeuXDjJ
 JSlIO+mYJay7nJvtMy4zVdLQgm6jiEQfngWjuJo0mokkfvF3HtlGj2liHLTG0DGoU9p6
 rGxvIxLjCBS1SizfUrkhzVYRXptyTYswlHt2G22Cp8in+6cgjuMgpgqy5tkZS3HmvQbq
 zHlCBxwK7UzDgRhGCajwjpAkioZAf3pUh0D8ao6PST0dnmG7/6HrecRwUesEUs7dNHj2
 kmQQ==
X-Gm-Message-State: AOJu0YzSXs//+f9XUf+oSHzf70Tqnbov+cvEjydPOxTREFa7ravc7Bfr
 zUT0YCWPYwO696AH83Ed2VDM4cwFctikqxLw5EQxBcSPDvYEFVFxK/ujcsKyKrFn6GJTsfLOzJK
 Pp657
X-Gm-Gg: Acq92OHCc/guvNlBYeQS8L86IDjwd9LlUUoNz+3fplgm6iE5zMyuBFABxA/5Br0pMBF
 +P4AfetlvU21HtfAb3Jou9vQHiNGFMuC5DWpbMKBrpik78mZ/RkUA0H6caCcfZrxX6rgzmCM7HH
 6kfC6L8Rxhc5kXD1RXJXxLqiQx1jr9dUNxHVifeJtYV3PhBrj7iqKUH5v3UPJUm7o0GRJ+O26QU
 V4vgip/89aQXU8tmT/eN3Ynq5B5ZLvwXymOlFmaEOUuFiMQCG5Is6fY+tuiU8m9up4Wxf714c52
 P7P02gx7053nZ9uCIiJA2MHzXscivZXysVCJ0E+Ca9Y9Oo92eAjscwb2lgQ0smBdy0YjhaJF0gN
 /uzdrn9y5+Mdu0rtqelPU9fJy5Nu+SVqKg/fzRa57jk9I1fVCo83XS1FJYvGED+7JebTZoTAp6I
 hc4AB8b+vZjXBVLTvuRJPmB4mCLazv71vxhIp929uXyc0bCcDJ66fH1KUP/Q==
X-Received: by 2002:adf:fc0c:0:b0:43d:77f4:7145 with SMTP id
 ffacd0b85a97d-45ef6b56b0amr672646f8f.19.1780071509702; 
 Fri, 29 May 2026 09:18:29 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef32fabcasm4810103f8f.0.2026.05.29.09.18.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 09:18:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:18:26 +0200
Message-ID: <20260529161826.517403-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529161826.517403-1-thomas.perale@mind.be>
References: <20260529161826.517403-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780071510; x=1780676310; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+CZM7oSp4Chi4LyabtHTRuGXxzSdPxRtFykVP/iPu7A=;
 b=V8XN3yO0NIUrCNyYNc2Z+KioGQkadWzzSsy0mWa4GdmV8QpaqRTF/uKJgJo1mfZD3Y
 ZcqZE4Bw6nWyNIiu1Judmf1fuaMnKZGuUae23CfueL4ke7gKdJ01Ksm+VmQgs58CaXD2
 ZxbSCk5Mi2nQcww+kJoFWu0eI1J9PUtinoB3hTJm+vF+PvVttOAsTdXH5Di2XrwaOtBf
 ZFI3QL3/9O5aUvhl+oNSu+E+tThp2OG2ljBSdfwNP3TTc0KL+ZBbnIZZWEH+wkuzOS+E
 Sx2gIv7gh+qAl8h9HIAtkFuKxmpLsWJLT2eflvg728uwLz1e9xDaChGgbDpNheMJZ/aW
 OTNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=V8XN3yO0
Subject: [Buildroot] [PATCH 5/5] package/busybox: patch CVE-2026-29004
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
index b88d526cd2..ae4d7e4a14 100644
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
