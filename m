Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A05C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 09:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ADF08109C;
	Sun,  5 Jul 2026 09:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auM-7W0X_bEA; Sun,  5 Jul 2026 09:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A106181095
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783243801;
	bh=iL5fb36POOT47P2MePsZm261Bh24JkK6rxsV/slnkIs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lu+iD5hwzTWMlhglfuw4RihEPL4Gq0N3yjFbzZti1X4jNpPzX2caHMcK9bIVXIsTm
	 h7/82+hB4m2inrjD7Zq4KbJkypqhmwsQq6Li2N77TXbcQVB1nqQgKrOJLRuFWI1nwX
	 1so1f/cxPlz7JGEdHaMyTPZv9tW298xE4ivCbe4jZYjTX3jfKvNJkbDPPgVoL8FoOS
	 GfNGVvSZLlLkUJgGoCDlsPPcaegoR5ZReuYL7IALY1Yq9Thmpiegivr3QFSZItxAOV
	 PQpFu8YIMbsHotS4NEiIYE+alUDIUcWwwZRcdK4Ng/5UKr9r95HMlWUt25QJMOtmou
	 EFb3regbScOfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A106181095;
	Sun,  5 Jul 2026 09:30:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7379B2A8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64E194088B
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRRXx4M33Auy for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 09:29:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 270CD40884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 270CD40884
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 270CD40884
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:29:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6b5.dip0.t-ipconnect.de [79.214.198.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54353A4C0ED1;
 Sun,  5 Jul 2026 11:29:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40910)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wgJAh-000000006tZ-42mB;
 Sun, 05 Jul 2026 09:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun,  5 Jul 2026 11:29:55 +0200
Message-ID: <20260705092955.182945-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783243796;
 bh=9NfI3RvjAnmaKn7UvS9lzMV1d/zwgpLC2jnispJoaDM=;
 h=From:To:Cc:Subject:Date:From;
 b=F/OElDceSUcotzu3vQ3BvvOIQVw6min8iskSBZWa6MM09oybZlX25qGvzjsGUa9V4
 W7ltbiLz9xGiIcQNOeQ2ZBb0bJXGtRKtX1iUE3UqcqLH7CVp7L7s2kl+MY9AXBhv5K
 f5QCy6DMFk0ip+uvZx/lmKCD3961GuwOX3gBsPfI/9NmWgfDCggzyGoF6ANPEHEMQ7
 vXs0DFLa7c3b6/mOWU4nBgjRfFb5nDP71jReTg2LrKuu8QgrBiFpbAb+tngwrBRZxE
 KhEaDw/mVH3rHi8fnlHoedZsZn6n7lz6nIYrBMXiDriaP+zArlsnk5NXaiXmHQGNOO
 c24PFSUXhRkSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=F/OElDce
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: security bump version to
 2.5.21
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

https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000506.html

Fixes CVE-2026-34182.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/e403405eff557c97066dbc3634d3099d3a287ae2

 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index f69b7c6eac..a53f46c67a 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  96371ec0260da5a22edbf8e4d3bf0e54b3ea5b8e  gnupg-2.5.20.tar.bz2
-sha256  6461266e99c308419a379abe6c356d54c214136c4589bd65951091138989ffc6  gnupg-2.5.20.tar.bz2
+sha1  51fae4f4d902787624eb7047f6d3e7c263ad7690  gnupg-2.5.21.tar.bz2
+sha256  e3af2c8caa46a66a9329fa7c6880af260451914d819595beabc2c26597b31352  gnupg-2.5.21.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 7756023798..05acd4811d 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.20
+GNUPG2_VERSION = 2.5.21
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
