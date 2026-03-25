Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89628109C04D
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 18:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A876281BA8;
	Wed, 25 Mar 2026 18:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEl-mFkTVuVO; Wed, 25 Mar 2026 18:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2249819BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774462468;
	bh=QCMSx8LHMIajZpYeDIswIrij6zM9TsedTXfGhqN+vFo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OapwoEEIMge/kE+Dxk8otay37A0fJYuu6r58EBPDslu2qfMC8ncCQU+8b62BURFy+
	 sI+FviCim7wc4gnVfofv1H3f8nRlJY69huyZcXKIDQdhMffcnTfbrIv9BxwShLz40s
	 yr52tYQRWaOE1jPhJxARlDuJhmK8gLYyOAf8JGPKuGqCS3ClB0vDs2sBi4OLU+lx2s
	 kdYTtMUcqi39fLKit7Lkab+LjbxCISSYuBZ/ku4kn7Nz/ejyIt/gdnuoRgefCEDzuL
	 0waUywZsVClwI2Ht+YNAh93Xt5xftIpXn/OjA0HSPzfH3SplaLUid2edt3DhcwXKeA
	 k/y+EAw5cpmkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2249819BE;
	Wed, 25 Mar 2026 18:14:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B3B8F5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 18:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FFA340B03
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 18:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eik5uxUk1gTf for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 18:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D55E440AB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D55E440AB8
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D55E440AB8
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 18:14:24 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 5SkIwlECVfibd5SkIwIbtt; Wed, 25 Mar 2026 19:14:22 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 25 Mar 2026 19:10:56 +0100
Message-ID: <20260325181056.3018343-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ5IJzWNIBkraJId1N2nkaUIQ3ucSZqH2huCfK9dr9wTrrhdE7fDR37xog0a/ifrBtAdm3FjDeanU4ZQq7bAJjS1GLWmDa4Y1HfniRfdLAW3M6RPFIKv
 IeXvkthdsE61Jp66oeszng7nWzQr2eAtzhLmVnopGE7M9Ky3lwEaRPDXvlfuIcC1tA9X5H/i0M47eoLAB0sVnfnnb0/YZZvQp4CPmXoKy379a1Top3W7A2AF
 QZ6it4Ith/gMQlzDHfMbqyOpzT9ny+OdZWYyZYwkmqhmYM8XsKHKhru85Nnz8XnFQYTwPD5KhDOMRhHCAK/pKw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1774462462; bh=CBVRVH78jqsdOPKCjGjVYwIuZW6AlDVus8szhdTi18U=;
 h=From:To:Subject:Date:MIME-Version;
 b=SNTjGWrECTVyvlyXv99LhfJxFUGbAia1hUX+nTFsl0qJ+F9V2fTrQQn5ZTldJN/WV
 t8Y+oDXIGbndKSv+7j02Pz1rAG3XOXe0SBKaCsYUbu2DIToyQEYD9+vokYdxN49o3S
 wPlLwD1sOviTWUb3k9su0IUl+cdqOQwA2WCwrD2ECekswfEl4PzbfVXyHz+ByhFDnZ
 Ci8NGYwREEcV+ossl0YkIQiO56e3bc0TE2+JVbq8B9xYJwtOW0msE0TScCpP3T+NR7
 Xrwv7WoHNhtiBGMXL/EwXytgNJT4UZKqpD9ZhkE8VdzC0j9642rdG4uaAhAOJtG3S8
 u1EvHDHaYc5kw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=SNTjGWrE
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.122
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

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_122.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1a15325f1d..d2e85cb32d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_121_RTM/src/SHA256SUMS
-sha256  cb3a8f8781bea78b7b8edd3afb7a2cb58e4881bb0160d189a39b98216ba7632e  nss-3.121.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_122_RTM/src/SHA256SUMS
+sha256  2699478b843b9f09c61f85341578df514463a0069447c816bef0d59bd800d777  nss-3.122.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index dfded6999e..bf59827bdc 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.121
+LIBNSS_VERSION = 3.122
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
