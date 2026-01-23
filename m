Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D5FD74ED8
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 14:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73A5A40586;
	Fri, 23 Jan 2026 14:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6X4rDQxx9_G; Fri, 23 Jan 2026 14:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 906B040595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769178275;
	bh=mHABp7f8A+tZZGtYfluzfFZahkp4EnScURw7VnDgVc0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hDr2XFbNxiLGcB+I7NIgvaFswDHxyudrPxIIchL2ncw4Y5Qiq5ExHa9M8rNVbMJvB
	 mC/TLjUDIs/tqT6oNJ17gcbNfriyDI0vXPC6CFyIs6/LLxaXq0Go5W76t77yjsQ2xI
	 3unNfBxFAKvpRt/DSk7dVA4DbCRnPh6QTl8tVynV0P1JIyu82BB+ZZuqJ57eizh3P+
	 0sRp/O0Rmk/ABjLIYpmSkxL/XrieSWp05TbBnQJxlpDoet/ED8JfNL5AgMWm6Qso/U
	 7c8m6oRj/iaFfVQ6QcAWqOmdGmTi4lMxgL7QtPodR3dwS496t73LQfdtdZ4wgpiZ47
	 WUG+MxOM+xj2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 906B040595;
	Fri, 23 Jan 2026 14:24:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5059358
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9545640595
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRxL1bG3YoLZ for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 14:24:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 78F0D40586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78F0D40586
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78F0D40586
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:24:33 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4F35431E0BA7; Fri, 23 Jan 2026 15:24:31 +0100 (CET)
Date: Fri, 23 Jan 2026 15:24:31 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aXOEn7q16Jh2oEax@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1769178271; bh=ZC3BAxk92zEpYQpSahzEcTevo87oMosu1Ljmi4J026E=;
 h=Date:From:To:Subject:From;
 b=pXaiHVZGbs1x58Pf1JKZqhM2iX/kbU2/LIm910h0aoc/a1kOy1Ql9skM2KQAtFiY1
 5YmkZsrceTtfqIDhpgM7tMOEpOzOn8Cddxmm553vBX/XnRAY+mrkpnoks/nt6if1/e
 BEbXoI3Qq5X/Z35P32BJOXhZHgwfKm3HCGDmem3//fQ5EgvoQgdHS2G0d2d6r9DmBJ
 vYxcE14+05cFc32PbE2DT56c8m/nR9OsbuRnmA2q5AMeI5Jly6PgRYzZSNSCfFwn0Q
 5I8g9JjSNg5Jfhv4uhcGLzBpQuGIOzEh7nezZCZSHqVg0Iv7QbvHwiPiHMgDxVqhqC
 6o4JJydn38EJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=pXaiHVZG
Subject: [Buildroot] [PATCH 2/2 v3] package/strongswan: update to 6.0.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for Changes:
https://github.com/strongswan/strongswan/releases/tag/6.0.4

Enable minimal required kernel config options.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
  - remove patch 0001 and CVE ignore
v2->v3:
  - fixup incomplete patch
---
 ...001-eap_mschapv2_failure_request_len.patch | 46 -------------------
 package/strongswan/strongswan.hash            |  6 +--
 package/strongswan/strongswan.mk              | 14 +++++-
 3 files changed, 15 insertions(+), 51 deletions(-)
 delete mode 100644 package/strongswan/0001-eap_mschapv2_failure_request_len.patch

diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
deleted file mode 100644
index 8442cc7816..0000000000
--- a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From dda24815d148b91209ebf2d27e3a7acefe9b6435 Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Thu, 9 Oct 2025 11:33:45 +0200
-Subject: [PATCH] eap-mschapv2: Fix length check for Failure Request packets on
- the client
-
-For message lengths between 6 and 8, subtracting HEADER_LEN (9) causes
-`message_len` to become negative, which is then used in calls to malloc()
-and memcpy() that both take size_t arguments, causing an integer
-underflow.
-
-For 6 and 7, the huge size requested from malloc() will fail (it exceeds
-PTRDIFF_MAX) and the returned NULL pointer will cause a segmentation
-fault in memcpy().
-
-However, for 8, the allocation is 0, which succeeds.  But then the -1
-passed to memcpy() causes a heap-based buffer overflow (and possibly a
-segmentation fault when attempting to read/write that much data).
-Fortunately, if compiled with -D_FORTIFY_SOURCE=3 (the default on e.g.
-Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
-overflow and causes the daemon to get aborted immediately instead.
-
-Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
-Fixes: CVE-2025-62291
-Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
-index 21cc95a6a360..35faad2e0bb5 100644
---- a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
-+++ b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
-@@ -974,7 +974,7 @@ static status_t process_peer_failure(private_eap_mschapv2_t *this,
- 	data = in->get_data(in);
- 	eap = (eap_mschapv2_header_t*)data.ptr;
- 
--	if (data.len < 3) /* we want at least an error code: E=e */
-+	if (data.len < HEADER_LEN + 3) /* we want at least an error code: E=e */
- 	{
- 		DBG1(DBG_IKE, "received invalid EAP-MS-CHAPv2 message: too short");
- 		return FAILED;
--- 
-2.43.0
-
diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index f6b16fc8a2..7a6939b979 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.14.tar.bz2.md5
-md5  21ca3fc7c18456405d03b77266ba630a  strongswan-5.9.14.tar.bz2
+# From http://download.strongswan.org/strongswan-6.0.4.tar.bz2.md5
+md5  f6b78a99e95179b6a65df218d75da7ca  strongswan-6.0.4.tar.bz2
 # Calculated based on the hash above
-sha256  728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678  strongswan-5.9.14.tar.bz2
+sha256  79576bb61b9a406cea9eb73d0c565cc6254a6b6d2e7198f44758d2d7c61a7aec  strongswan-6.0.4.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index c0147c00df..ef5a3fc42f 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.14
+STRONGSWAN_VERSION = 6.0.4
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
@@ -12,7 +12,6 @@ STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_CPE_ID_VENDOR = strongswan
 STRONGSWAN_DEPENDENCIES = host-pkgconf
 STRONGSWAN_INSTALL_STAGING = YES
-STRONGSWAN_IGNORE_CVES += CVE-2025-62291
 STRONGSWAN_CONF_OPTS += \
 	--without-lib-prefix \
 	--enable-led \
@@ -113,4 +112,15 @@ STRONGSWAN_CONF_OPTS += \
 	--disable-connmark \
 	--disable-forecast
 
+define STRONGSWAN_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETLINK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_AH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_ESP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_USER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_INTERFACE)
+endef
+
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
