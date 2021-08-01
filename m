Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D93C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:26:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 855096052B
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 855096052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4386F83C37;
	Sun,  1 Aug 2021 13:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8zbWXHILrj2; Sun,  1 Aug 2021 13:26:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABA4B83BB3;
	Sun,  1 Aug 2021 13:26:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A02031BF35E
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CF6D40155
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_MFjDi6o9xN for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 13:26:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B36A400FC
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 13:26:53 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso2358257wmq.3
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/WwJsKZNtXI1SrBH2vDZ//XpOarUUvjvAUlsy0OBrGY=;
 b=sOQ2UmoCp7b5ESNGqIThBd9BPZn6VfRzMlvV6d+JW1syehWDuVyVyo1as+/WAtZjRl
 hkBWS0mIjDBWbLUiLUB2IB0GOpOg1bpBJ0sFedzgJPXwoNoG4XWKM9Rjc2pOvXq4erAr
 4cY/4qegxIDxLvgWsGG9YKQ8DTWKlcfk+HWWD69oU3bwHUyT6FtONBq2+UzirY5UJ7J6
 derzY3pGds7l5J6FHnoTyDAh5rLzjI1K02Q0LkJbVron3llmHAVFmEFaam+1WjtUaZg7
 CZKL4k50dT+Ob4V29iLMi7F/ed9tj6QXtAT+W7IGCfaBdJgd4Kfh9dYv9qxT2xmiTUL7
 8CjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/WwJsKZNtXI1SrBH2vDZ//XpOarUUvjvAUlsy0OBrGY=;
 b=dTSNUc7Z5vHGtm8TCot02p/4EpkLSNeqOkYkINO4wV+Dc4vxT9D4XHtQsj43prkeii
 mW+yFlYf7+wNAuj+wtrp+QE9s9/z/3aR3bwD71aAklgpq5Gt4gL111xYyYMfBIBrgmv1
 VlG198SaeqFDg7vGbVN2/xH8bz30KVFtbWDb6IKQwVGfgVb8xgoKmgNJuVQoDqEesSqL
 IziXY3yCO2wyh7sUjiVT7RorheW6dq51V5x8wYYaPr5meQueyGxYkCU1ZszP0ZcsE5ft
 J/t5tYu0EksRb1ZT7zcYJdrtxz1niRkqzZuEOHd563z/o4DwIJE13y8mm4zBnxHjIS5x
 CnxA==
X-Gm-Message-State: AOAM5324AizJ/8qtrlWIq1w+hjAyBo85ZeqMheD//cpH8h8H23SxwjR1
 aJRYQr8lykPdlO3dH0AtlugDr8QKwYN7RA==
X-Google-Smtp-Source: ABdhPJwLfkz5QiZC1lBji3C9zVb69+wW+P/LpR2Je5uZSfUFTIyCekKchw//Dyp9JPj2RjNwle71WQ==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr11923506wmc.95.1627824411104; 
 Sun, 01 Aug 2021 06:26:51 -0700 (PDT)
Received: from kali.home (pop.92-184-116-155.mobile.abo.orange.fr.
 [92.184.116.155])
 by smtp.gmail.com with ESMTPSA id h14sm8088839wrp.55.2021.08.01.06.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 06:26:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 15:26:45 +0200
Message-Id: <20210801132645.3623057-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 3.4.7
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix CVE-2021-22235: Crash in DNP dissector in Wireshark 3.4.0 to 3.4.6
and 3.2.0 to 3.2.14 allows denial of service via packet injection or
crafted capture file

https://www.wireshark.org/security/wnpa-sec-2021-06.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index ddb0f1954a..0876703e49 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.6.txt
-sha1  20596183210daeb0070ae43716529caf81c6187a  wireshark-3.4.6.tar.xz
-sha256  12a678208f8cb009e6b9d96026e41a6ef03c7ad086b9e1029f42053b249b4628  wireshark-3.4.6.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.7.txt
+sha1  3fa4bb774030442b9908243a9927d38479c52bf5  wireshark-3.4.7.tar.xz
+sha256  6c4cee51ef997cb9d9aaee84113525a5629157d3c743d7c4e320000de804a09d  wireshark-3.4.7.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 8b0ab4bfbe..e852083de6 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.6
+WIRESHARK_VERSION = 3.4.7
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
