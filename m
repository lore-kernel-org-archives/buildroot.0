Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D00C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 23:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 657FA605D7;
	Wed, 14 Aug 2024 23:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbugDLzyV-d2; Wed, 14 Aug 2024 23:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 704CB608BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 704CB608BB;
	Wed, 14 Aug 2024 23:53:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4623F1BF2C9
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 23:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 336C6400E5
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 23:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDDC-OXtamHW for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 23:52:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE6D0400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE6D0400AC
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE6D0400AC
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 23:52:57 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0D1863535C12; Thu, 15 Aug 2024 01:52:50 +0200 (CEST)
Date: Thu, 15 Aug 2024 01:52:49 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zr1DUNSWk+fNwdzx@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723679573; bh=M5tXyOuNllzDRQJxHy/irOjQO8WrztX2SQHhUgDqOcM=;
 h=Date:From:To:Subject:From;
 b=OyoKJCTOLXRqUbHLAKpRsRUcejRRMjXbz2+XGC0GbAxgdtmQ0jCPSB5dpQLY80vVN
 wkUIzrH/wuxda8tYYVyPQRX/eER6JvgEp/R2Sl8NvwP5Lr1JwdMRGFMWKwr6dm7/5B
 tUs5CQPaG4syxCUHJhOwBsnJz8myh0bMB5edtTZNGt7YN17/Z5j6Z11VHiZWYktmXb
 2fEVoKTpcTVWMbVn2TjkFyyRGnWzGVV4jQcoecTdqQ9626I49xIzFh6Q5EfgKpDXyz
 UkH4qxI4ySsr2EZ4c+nWu4aMIL+eSEYkJqZWNqKOgLS+/+RQGGeNIVTUUaopvR0T5i
 hoYn9Rn4hHFtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=OyoKJCTO
Subject: [Buildroot] [PATCH] package/libpcap: fix m68k-cf compile issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Compilation with -Os triggers this assembler problem.
The problematic C code contains a long switch statement, so
everything looks like GCC Bug 104028 is triggered.

Fixes:
 - http://autobuild.buildroot.net/results/db5/db58215fb3c7f30b6c0f0764a84271010346edfb

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - use GCC_BUG_XXXXXX instead of arch sepcific stuff, requested by
   Thomas Petazzoni
---
 package/libpcap/libpcap.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index a4523f2218..3d05590da3 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -57,5 +57,9 @@ ifeq ($(BR2_microblaze)$(BR2_sparc)$(BR2_sparc64),y)
 LIBPCAP_CFLAGS += -fPIC
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
+LIBPCAP_CFLAGS += -O2
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
