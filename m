Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF53C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 21:27:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEFDC61004
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 21:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEFDC61004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5769382503;
	Mon,  6 Sep 2021 21:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TnxwDRbcTlug; Mon,  6 Sep 2021 21:27:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 964DD82430;
	Mon,  6 Sep 2021 21:27:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 190F81BF407
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 21:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04A564049D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 21:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5kb8UA3CxGh for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 21:27:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44CC540477
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 21:27:49 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.172.236])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NM9Zmp5ndJzjeNM9am7FSO; Mon, 06 Sep 2021 23:27:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630963667; bh=rKlmloZ///oXK1E8Mjz/zktw448XEQfRmxnPXqTXr3A=;
 h=From:To:Subject:Date:MIME-Version;
 b=GHWupRJmCw5E15d7ZFUpa9cmSIB+g+Lp4H0yDdhhO8aGzVzFEkXqVfOYJS/NhSLtT
 PjaR+BTWlhJfz/eG46N+OVahMRNt2xPPNoOXKoD5IGPZ46Mdma7vp0VLURraCsAjKY
 xVn6K/+rd9bvpWDFEPHFqhClft4o7Z8EmM2OLiuRUa1ijvkfrvUwzLgW0yLanVAKx8
 1o3oLnonZ56JBlo0H08Anv91ZHMqLfsQaOwiF140Al/+EOnV2jPu37L3a8v4sTI7UV
 gbWygWHYV9obb6yVXkjSsVDBdCJIqkpHZFgtG46U0JiBIfvb86LgRe8CIEvcDZiGOs
 c7eLc8FvNXasA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  6 Sep 2021 23:27:45 +0200
Message-Id: <20210906212745.120679-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfH0/S0N8owBuSXP5aLGoo8eUhlJCMgq8QwLK5oJD7NR4Dl75YijFjMPBsxWJNXQHjUMPSqtfK6aD81eUmrhEQ9qa3zAU4V28tUTdbjY+Cdv7MTHhtHmj
 O+VeUr/pMdinXMy1hcrpCenlSOwXXbzTSFk2+WKBNz140/TblvbFdyLxsjkAWC/LY55Li88bklQlvQFiQelWizc8oHyks/E2iFT7iZMa8V/nnujWuA9rZhLL
 +zvofG3OeTNbK8JNijkFhWHuLDdOJPlwmf1D/S/iCl5kTTml8uIDEgmBgol/orrb
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.70
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Drop local patch that has been upstream(even if with another authorship).

Release Notes (not yet available, but should eventually land):
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.70_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...2.c-fix-SHA256-redefinition-on-ARM-b.patch | 47 -------------------
 package/libnss/libnss.hash                    |  4 +-
 package/libnss/libnss.mk                      |  2 +-
 3 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch

diff --git a/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch b/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
deleted file mode 100644
index f925f20051..0000000000
--- a/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 434d79c52db5b680accc531572319bd7094fa470 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 7 Aug 2021 23:19:01 +0200
-Subject: [PATCH] lib/freebl/sha512.c: fix SHA256 redefinition on ARM big
- endian
-
-For an unknown reason, SHA256_{Compress,Update}_Native are defined in
-lib/freebl/sha512.c if IS_LITTLE_ENDIAN is undefined since version 3.68
-and
-https://github.com/nss-dev/nss/commit/e1e00f21f2d73e0d5d27651ad5606efa5714abe4
-
-This raises the following build failure on ARM big endian:
-
-Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Compress_Native':
-sha256-armv8.c:(.text.SHA256_Compress_Native+0x0): multiple definition of `SHA256_Compress_Native'
-Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Compress_Native+0x0): first defined here
-Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Update_Native':
-sha256-armv8.c:(.text.SHA256_Update_Native+0x0): multiple definition of `SHA256_Update_Native'
-Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Update_Native+0x0): first defined here
-
-Revert this change as it seems completely unrelated to the commit title
-"Bug 1655493 - Support SHA2 HW acceleration using Intel SHA Extension"
-
-Fixes:
- - http://autobuild.buildroot.org/results/237aba0c16a34fec1b0fe50fe08cace438eda1bf
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- nss/lib/freebl/sha512.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nss/lib/freebl/sha512.c b/nss/lib/freebl/sha512.c
-index 946ab9f7f..3ec414b52 100644
---- a/nss/lib/freebl/sha512.c
-+++ b/nss/lib/freebl/sha512.c
-@@ -164,7 +164,7 @@ static void SHA256_Compress_Generic(SHA256Context *ctx);
- static void SHA256_Update_Generic(SHA256Context *ctx, const unsigned char *input,
-                                   unsigned int inputLen);
- 
--#if !defined(USE_HW_SHA2) || !defined(IS_LITTLE_ENDIAN)
-+#if !defined(USE_HW_SHA2)
- void
- SHA256_Compress_Native(SHA256Context *ctx)
- {
--- 
-2.30.2
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 8073913e7c..afb6d5602e 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_69_1_RTM/src/SHA256SUMS
-sha256  bbdbd248c25e2faf498edbdd2ffd5896b54cfa35bd2e450813b491f805c754e0  nss-3.69.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_70_RTM/src/SHA256SUMS
+sha256  2b89abb8601ee405be8ac5b5703d71f1fb38a51c3a64a3d834387f78b325511b  nss-3.70.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 83954cc124..3f8f0e1789 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.69.1
+LIBNSS_VERSION = 3.70
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
