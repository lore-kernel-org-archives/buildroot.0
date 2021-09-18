Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A170BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 16:43:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C587A61108
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 16:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C587A61108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78BB2840F7;
	Sat, 18 Sep 2021 16:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbG6b-Ir3a0O; Sat, 18 Sep 2021 16:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3D0D84134;
	Sat, 18 Sep 2021 16:42:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E31111BF414
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 16:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D27D4605E8
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 16:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6IjzN2oD5FL for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 16:42:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8728A605C5
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 16:42:53 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id EB3C8100002;
 Sat, 18 Sep 2021 16:42:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mRdQP-0005Dk-0J; Sat, 18 Sep 2021 18:42:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 18:42:46 +0200
Message-Id: <20210918164248.20023-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/botan: add upstream security fix for
 CVE-2021-40529
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fixes the following security issue:

- CVE-2021-40529: The ElGamal implementation in Botan through 2.18.1, as
  used in Thunderbird and other products, allows plaintext recovery because,
  during interaction between two cryptographic libraries, a certain
  dangerous combination of the prime defined by the receiver's public key,
  the generator defined by the receiver's public key, and the sender's
  ephemeral exponents can lead to a cross-configuration attack against
  OpenPGP

For more details, see the upstream bug and issue writeup:
- https://github.com/randombit/botan/pull/2790
- https://ibm.github.io/system-security-research-updates/2021/07/20/insecurity-elgamal-pt1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-using-short-exponents-with-ElGamal.patch | 38 +++++++++++++++++++
 package/botan/botan.mk                        |  3 ++
 2 files changed, 41 insertions(+)
 create mode 100644 package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch

diff --git a/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch b/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch
new file mode 100644
index 0000000000..e2570cd5ff
--- /dev/null
+++ b/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch
@@ -0,0 +1,38 @@
+From 9a23e4e3bc3966340531f2ff608fa9d33b5185a2 Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Tue, 3 Aug 2021 18:20:29 -0400
+Subject: [PATCH] Avoid using short exponents with ElGamal
+
+Some off-brand PGP implementation generates keys where p - 1 is
+smooth, as a result short exponents can leak enough information about
+k to allow decryption.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: Drop tests, CVE-2021-40529]
+---
+ src/lib/pubkey/elgamal/elgamal.cpp        |  8 +++-
+ 1 file changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/src/lib/pubkey/elgamal/elgamal.cpp b/src/lib/pubkey/elgamal/elgamal.cpp
+index b3ec6df2c..0e33c2ca5 100644
+--- a/src/lib/pubkey/elgamal/elgamal.cpp
++++ b/src/lib/pubkey/elgamal/elgamal.cpp
+@@ -113,8 +113,12 @@ ElGamal_Encryption_Operation::raw_encrypt(const uint8_t msg[], size_t msg_len,
+    if(m >= m_group.get_p())
+       throw Invalid_Argument("ElGamal encryption: Input is too large");
+ 
+-   const size_t k_bits = m_group.exponent_bits();
+-   const BigInt k(rng, k_bits);
++   /*
++   Some ElGamal implementations foolishly use prime fields where p - 1 is
++   smooth, as a result it is unsafe to use short exponents.
++   */
++   const size_t k_bits = m_group.p_bits() - 1;
++   const BigInt k(rng, k_bits, false);
+ 
+    const BigInt a = m_group.power_g_p(k, k_bits);
+    const BigInt b = m_group.multiply_mod_p(m, monty_execute(*m_monty_y_p, k, k_bits));
+-
+-- 
+2.20.1
+
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index c23aba99dd..0ac528c990 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -11,6 +11,9 @@ BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
 BOTAN_CPE_ID_VENDOR = botan_project
 
+# 0001-Avoid-using-short-exponents-with-ElGamal.patch
+BOTAN_IGNORE_CVES += CVE-2021-40529
+
 BOTAN_INSTALL_STAGING = YES
 
 BOTAN_CONF_OPTS = \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
