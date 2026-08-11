Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62167C5CFC1
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 11:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1905281080;
	Tue, 11 Aug 2026 11:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63EftAnKJE0H; Tue, 11 Aug 2026 11:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07C658105C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786448582;
	bh=FYeZl27sG5pzIvuyuDsOxaYZlu+t1G/pGSxR3rqx+fE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=W8wsGFEKyKom2zi1GRe+H6Ldb9npSgPjvaHEO7dtdUmfTdzxKiPVL69JsPO8UDj0R
	 Kq5i2Qlhot3SWQJHIT4EPi4btgYkE6CqSDcuQazTIEgd+oJgHj0gFg69KyK7eutH3A
	 JRETpJmmETmmGtOll96yG0fIgF6kULlKqFPE7Iz9oTePOSqSBolR3GYPTg679ipy84
	 rswqiamNNokJkdmDO5lIIIruJ0dEYxKSuZ6HomqGiYeomPxubF8jQGc0o81Kd7HUc9
	 qcVajcYd5lfjgxwwSo/QSS9DaWqEIb2rxfvgpj+aEnF05LrOr5r9EGjvWoM6vesVRl
	 ZJw3yUSQnPTMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C658105C;
	Tue, 11 Aug 2026 11:43:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41ABF259
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2832E81004
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bku7b-hKANZr for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 11:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2205A80FEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2205A80FEF
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2205A80FEF
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso22212115e9.0
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 04:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786448573; x=1787053373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=rPBqW9q1tI2sZFqoZsad19MgLPQOWnQ/VNHF+yXpU4A=;
 b=kk/0QvTvhaSKGcAITrZ+MwbdRUfeq+pJR3M02/axYzp4q04Z53Lhe55OlhWNslSCfV
 u94P/9QARXZiwZn0UIyOTvlL0clm6oFD4btHbHHXYNfEE/LqzZLafRzt0fFx2Cl02IcF
 59Tn4ajXMxQtVhTslTOzHkVfRqq6dm6bcA11i8jZWSIqEBat/FQrpjInDPCG0niJnKG/
 87PCnZPAesw7BhiYOo2ZsyMicmxB9kt8KmjaROx/H0TxiVKDBcEujjZK9I5GgSIWXtrr
 xm6FxypWRNaV+Pu1yKvdXfUI0EI112iJIpdXqFsTrCZHMFrrjqLuAGIewdCUqOEKhc6L
 fwJA==
X-Gm-Message-State: AOJu0Yyr/4kGEUMWmoj4v7RdBa+fZVgGUJnZHNRMWALA+X6CGt7Bpsf5
 a9V94FG+JFrQEI2gEmeqv+7PCcoJAr9eUmUGLe0i85JvUpPbkdk1LI9mqdWTvXRdRYlGYEAxNMB
 c7U7O
X-Gm-Gg: AR+sD13H/APOgDYxJUir4tpCZW9kJ5stDr+u8qE/jbhx7GkrefZ/Qspo9KamxCGAeak
 leSIyjRiWry8Q1nM8lbLm8PpGZw8T7ykjKbc216twh8YzxidQVtXposxjgs81fI5WV6bkwvxz5Q
 XOC5KtJQOhvV7FUco43qsCjy+NCbbNaErrdqtthDcJGLmBDpObkAO6oXN3J9ETOjafAXh9MzOkE
 eift0C+IwCN1dZCW/A1s+tmZBZIYG3IcPtU9eqHiTCtd8CHShQ8K8HnlDC8riCf96umDSPJd5Q3
 HpWRGS5NVSXOH8RsU7o43t6g/A2zlhZ2TfjkntZcUwSG5o9EYiC8wpfekhByeRoa52R2MGbvxQu
 rxbgCmGGEEllRn8XjjYrNEJOYHvFsnqU9ViyxxfO0a5y6C08+OadoIcwfaMWbayCmvl+Yu4qkkT
 bvhmdoY5/vp+/TbIdylhPLj1NeFqcs8ga7k9YuRljZsEvl9/6o6DyH/w==
X-Received: by 2002:a05:600c:6088:b0:498:261:dd93 with SMTP id
 5b1f17b1804b1-4997848f95emr46848245e9.18.1786448573167; 
 Tue, 11 Aug 2026 04:42:53 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499740a6f4esm57122455e9.2.2026.08.11.04.42.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 04:42:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 13:42:50 +0200
Message-ID: <20260811114250.116254-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811114250.116254-1-thomas.perale@mind.be>
References: <20260811114250.116254-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786448573; x=1787053373; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=rPBqW9q1tI2sZFqoZsad19MgLPQOWnQ/VNHF+yXpU4A=;
 b=TapZcvj7xh63CUlV4uvQV9KVEXiRAx2u3m2KBz10qHSk4IoIdanOrHcQ1uc+JvnaHg
 9tHH/NBzUcHvby7l8pd0WGjLOsAhoxTv+FtlWnXmXnbgxYls46zJVLVnt2oPdWdcFyI+
 UTxugQ3OLOcnhnWS56KKmnBOR2zxUCTTNeplhPkKJKAgGf0jbHMEC2az9zmB1xStXDLa
 09Tmp1+10FpNTZ8SGwMH7fIsjfpoSmgNpoPUnBlYE2zPF1lNSKY6NWupE4aWu0hKkBC/
 vNMs68pgzayqSgvR/i95hLySJZKtOCH1cIZIcsRTa8xQinGNdyhgi0qQi1ZxFgdUIWq1
 iYMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TapZcvj7
Subject: [Buildroot] [PATCH 2025.02.x RESEND 5/5] package/busybox: patch
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
index d3e0678200..35dc3a52ba 100644
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
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
