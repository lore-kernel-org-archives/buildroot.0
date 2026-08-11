Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B23C5CFCF
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 11:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB3DD607C5;
	Tue, 11 Aug 2026 11:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uq_sNlNqhIZd; Tue, 11 Aug 2026 11:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F1C96063A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786448575;
	bh=wm268obN6/e3D4bH2SH2AAQff514FQI80NptjQD7XjM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=seVX1gXEH2Tq3LR7uWHPdFOi+z/zqWJOBgcURJz6q73+0EzeVTWOqPXj/zrBTkkTt
	 486kmL4k9aisG5k3zXtXpbCm0ejuFRDbOBJG2YpQRS6ZuMbuUi9lmcDSNbq96LLDmY
	 yWdGczNQjDasQ7Hlo66rTItl3dsqMSUoKdhiKaQ9m8f6f3kaA23up0UyhSar7Jrg4O
	 LZ6oHNS/tIGEZ/4voG1tDiqyrgEcIOZx2AVhQjGwOC3AXA6TZHGPGmrTMCf4kbxnfn
	 j1YtefP0mMytw0UHBBSEkeOAX8p7EtojA3XzAxpfojIVxqubJspEcfJSQ4Jzb7L1CD
	 Qtfxkg1wEfxKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F1C96063A;
	Tue, 11 Aug 2026 11:42:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32984259
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18D4B40101
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0nfXAN5I0-m for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 11:42:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E9DA40063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E9DA40063
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E9DA40063
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so28175855e9.3
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 04:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786448571; x=1787053371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=b+C6AlieufLs7zheo9JfVAlwO47Itck7awxy8jcTnYo=;
 b=REY7PtwE/LZm2Wgspf8D15x/54gpau9X6Uj5STVAHVCNMPMihYL3ZvImTiCW2ZPqQK
 TZKFUCBP6/YXVyR52bXvgNscT+kkkkgzIkzoy+MLo6MBUHmAs4xThIBOVvl54oEETYol
 soydL/3cBRbNF0IzgrtISpQPbOuQkvBQiBu6u1s99zyMZJPOTPn8/z8pD/wXUINOTw67
 dh3n89Bsyzz9mVRTyDzN2bImiuT3Jhh2mieXgK5bSAAmFd0TNmZNi9ctIBqB27z/jWkH
 QtKdge6GIw3wILS5oxHAb0OaXRpcyd/DobecBauLddamm8F5O6j0wsBB/v0I67yc1CBT
 fazg==
X-Gm-Message-State: AOJu0Yy7f5s0O0ap2kvUkEvAKYwAD4vMTp91+VpJaG9v4A3pdx6v3DWf
 GAL+Mzsxm7V6hBiNgMytmm+u/vm6TXUDUnDeb2dirmOX25+I7j76K59ALD5OfSPFWAAp6gavF+k
 Q8uVr
X-Gm-Gg: AR+sD13/ON9R3jtIeIgWTRoVZa63Nb7HHWyVwalMPT3zhEVcxPJ6CRQY8MtkmCriCQN
 1UNcjI93z/BAHdUngVsLLj8IxfykG4lQRrMQ7KfAeenP9UNBRbvyBovbcpc+vA+1mbhXQ3lk0ij
 CeZVdUKEVpPKHsCcEyLCa6GsuzB4ehMurLkO3FhmkTJ2y5dnKbtznmHPDC+DWB9SonTcHmQO2Tz
 FB2K3rzra0SxjgdP50kRlHV3KhDPl1ltrfU/Uuh6nsHeZlXzqHl7enRXiU3ot4pp+km9qIVk41N
 Q17NCmLzSsmAla8M6FxnhUdDMOsuBtIVdAY8d/37h4C45MGewkAedhMNhzguV560/7teU8fAbM/
 IynTivwqgOqbRzd+K4mWpspVBr+BLESm8FXb461jJh4a1r2aXdXxgPwDgU4C2v2KtEPXKtKwjiG
 tKvuTfaEz8f9X9kg5vC0QK0epG2mKww726UvlEN2f3SZ7sUT49LL8fNQ==
X-Received: by 2002:a05:600c:6088:b0:496:ca1f:a428 with SMTP id
 5b1f17b1804b1-49978475c11mr47994205e9.19.1786448571239; 
 Tue, 11 Aug 2026 04:42:51 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499740a6f4esm57122455e9.2.2026.08.11.04.42.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 04:42:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 13:42:46 +0200
Message-ID: <20260811114250.116254-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786448571; x=1787053371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=b+C6AlieufLs7zheo9JfVAlwO47Itck7awxy8jcTnYo=;
 b=AypaSrqmrgIVqkUj/E7JS/HBS4Vuz78kqnWBQjL+Bwn8ihQoN7NbADZKFmrnfchVLK
 D1+b2htQnCZLZJlfRdnnhLGWHfe7CKFhGzRJ6vqzzhtIepV7Aw5KNEug/D7D43D/V/4X
 IRT+mlUMHZFBa9+TC56md/gs+TyLAwp1EffYAL29yCC1/rEd1iMOW3/2HQ7mX1l+4YhY
 V7ikRRWGmHtkz9WhoLS0XJqfgM8T7ufgkp5RQIeEr6N2NDWHBBFj93TbzCfjGUTh0zw1
 fn9S6sq3KdxYFKE9R0L/OLzbpAzQSCGzjnzQx+Nww6w29B1TBW2HJ79btpXouL5S3R4n
 JXTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AypaSrqm
Subject: [Buildroot] [PATCH 2025.02.x RESEND 1/5] package/busybox:
 re-introduce IGNORE_CVES for CVE-2023-42366
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

The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
in [1]. The IGNORE_CVES entry was removed while the patch is still
present in [2].

Re-introduce this IGNORE_CVES entry.

[1] 75c594d446 package/busybox: fix pending CVEs
[2] f88537c46b package/busybox: drop stale IGNORE_CVES entries

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6c0f945e01..092fd5d1e1 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,6 +15,10 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
+# This is not stale just wrong NVD entry.
+# 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-42366
+
 # 0012-archival-libarchive-sanitize-filenames-on-output.patch
 # 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
