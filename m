Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED0CC433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 09:49:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3450610E7
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 09:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3450610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8813C400D4;
	Thu,  4 Nov 2021 09:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KODzIhTArVBH; Thu,  4 Nov 2021 09:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A17540105;
	Thu,  4 Nov 2021 09:49:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 837151BF2FA
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 09:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 666BC40105
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 09:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id InxTsuk2HKHK for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 09:49:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19B97400D4
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 09:49:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c4so7615640wrd.9
 for <buildroot@buildroot.org>; Thu, 04 Nov 2021 02:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mhUsj7oRotvi5Y2LpbqMKXcfN4k/wNYAAhRsZkjFiV8=;
 b=k/3Ko9FT/ZFupdzi3E4VMqSebVjSdWZaNnN67XMuRmsrhtnA6BTJQ8GkvL1QKj28cQ
 2nobcq8RU6qVHhhvmhBOW6aq/J7fXcT8Sg6W33jW5njMcL2WAcS2BQdu25uLk8f6wLr6
 NMeIEjenRh/5zHwioXV+8DfxMogKox60yZWzG2gjKBpDBvLo5mki3BbgRHA4vw+ihump
 xYmsWCF1jgHQTzbFNF39RDsqL7MzMoV++1ebpeQSOcd4xuOe8eAnLqwnVtIAcM/IhwVP
 wxUUvTikFUoEA9ypXfQz0JMGfNVzWEZnhrJ5SB7GEoHbVPCQ4VnLaVxMZtC0yhrKTrii
 WU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mhUsj7oRotvi5Y2LpbqMKXcfN4k/wNYAAhRsZkjFiV8=;
 b=NVzPZWO1ZayYlBIn3lKADi37Q01nVADfgA4IndaKRXhJIuHv+LaGOtITgeU1GN5Ner
 aU5ucpfzCMud0ugGQhUutk20XT7RzqhEWuK4QOU6dsxlFUpCAbCfxg421glKpk/WCsMp
 28McPf7Zsn6LYrneItADMhPzIiw6fuOgxLqOGslhF2JKFcN0zW4yWIhxLoyLUCJZsRg7
 p2+Qn7IFN5dVC3enl2vtno0i8QzcSzjAZJXRB52mQ7OyiFGsER3SHZPQumuI8QI/ue5K
 6Ao1orDOf/xQrC2H7Nz/Hz1Ah2IRtokE92ETRCGwon5GbYLBA0d14Mt4cv7iNuHvC/AH
 Cc3Q==
X-Gm-Message-State: AOAM532Ec4qI77imyt6HTACp4W17SooD5w8wsoLdpHlzgEl5GIuxo8PO
 7BCB3LRJLeW4nXB30eDXeAItsBTVN8k=
X-Google-Smtp-Source: ABdhPJyi+8WmTa33a30Ng6vX58K3gz4vI5luc6NJ5Z4VctTbu9vzTEMAlXlPsoIU/m6wgBSJpFBTeA==
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr59944864wrw.283.1636019342073; 
 Thu, 04 Nov 2021 02:49:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id 21sm4388586wmj.18.2021.11.04.02.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 02:49:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 10:46:52 +0100
Message-Id: <20211104094652.880270-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/botan: security bump to version
 2.18.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix a low risk OAEP decryption side channel (GH #2797)
- Drop patch (already in version)

https://github.com/randombit/botan/blob/2.18.2/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...d-using-short-exponents-with-ElGamal.patch | 38 -------------------
 package/botan/botan.hash                      |  2 +-
 package/botan/botan.mk                        |  5 +--
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch

diff --git a/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch b/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch
deleted file mode 100644
index e2570cd5ff..0000000000
--- a/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9a23e4e3bc3966340531f2ff608fa9d33b5185a2 Mon Sep 17 00:00:00 2001
-From: Jack Lloyd <jack@randombit.net>
-Date: Tue, 3 Aug 2021 18:20:29 -0400
-Subject: [PATCH] Avoid using short exponents with ElGamal
-
-Some off-brand PGP implementation generates keys where p - 1 is
-smooth, as a result short exponents can leak enough information about
-k to allow decryption.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Peter: Drop tests, CVE-2021-40529]
----
- src/lib/pubkey/elgamal/elgamal.cpp        |  8 +++-
- 1 file changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/lib/pubkey/elgamal/elgamal.cpp b/src/lib/pubkey/elgamal/elgamal.cpp
-index b3ec6df2c..0e33c2ca5 100644
---- a/src/lib/pubkey/elgamal/elgamal.cpp
-+++ b/src/lib/pubkey/elgamal/elgamal.cpp
-@@ -113,8 +113,12 @@ ElGamal_Encryption_Operation::raw_encrypt(const uint8_t msg[], size_t msg_len,
-    if(m >= m_group.get_p())
-       throw Invalid_Argument("ElGamal encryption: Input is too large");
- 
--   const size_t k_bits = m_group.exponent_bits();
--   const BigInt k(rng, k_bits);
-+   /*
-+   Some ElGamal implementations foolishly use prime fields where p - 1 is
-+   smooth, as a result it is unsafe to use short exponents.
-+   */
-+   const size_t k_bits = m_group.p_bits() - 1;
-+   const BigInt k(rng, k_bits, false);
- 
-    const BigInt a = m_group.power_g_p(k, k_bits);
-    const BigInt b = m_group.multiply_mod_p(m, monty_execute(*m_monty_y_p, k, k_bits));
--
--- 
-2.20.1
-
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index b7804ce9d7..91e1bf741a 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  f8c7b46222a857168a754a5cc329bb780504122b270018dda5304c98db28ae29  Botan-2.18.1.tar.xz
+sha256  541a3b13f1b9d30f977c6c1ae4c7bfdfda763cda6e44de807369dce79f42307e  Botan-2.18.2.tar.xz
 # Locally computed
 sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 36aca6d93e..ebff1343b1 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.18.1
+BOTAN_VERSION = 2.18.2
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
 BOTAN_CPE_ID_VENDOR = botan_project
 
-# 0001-Avoid-using-short-exponents-with-ElGamal.patch
-BOTAN_IGNORE_CVES += CVE-2021-40529
-
 BOTAN_INSTALL_STAGING = YES
 
 BOTAN_CONF_OPTS = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
