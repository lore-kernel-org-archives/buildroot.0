Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8C1C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 13:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA63880A4F;
	Wed, 14 Aug 2024 13:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsuLJpy6FuSU; Wed, 14 Aug 2024 13:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E84EC81BE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E84EC81BE3;
	Wed, 14 Aug 2024 13:09:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9383C1BF32E
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 13:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BED481BC2
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 13:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yu804ZdwezlR for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 13:09:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11F3781010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11F3781010
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11F3781010
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 13:09:25 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9CD0035206C6; Wed, 14 Aug 2024 15:09:20 +0200 (CEST)
Date: Wed, 14 Aug 2024 15:09:20 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrysgCNIRtUzTjbG@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723640960; bh=OozY6KeQZKWKy64jSQkxFNKRwaYWgX1d45KX4Udtkjs=;
 h=Date:From:To:Subject:From;
 b=FDI6CN8r7Vn9H2dr108NDg9SUEjRF5nLhjd22pbo9A8rrIBTen3Ng/gUBrcuFWXS7
 /JhV3jaL2tXXJ/RMCPepLhURY0iMB17J0gcbri9hvcVHLBYzwl8PsfecEh4OyFFNYc
 aNzYn2pF+7rQy7FSKF3KBVjGCnu2XsADpKtQ2kGcuHphzdJHDwuNW2jOmN8r74asdJ
 /GL0BB42nVKX6s5HyFIMg8hEVQ/EaYdTe67fBD8QoiE/fYPEnhiRNLajKSOFgspoSj
 Y1XjBgyVO6qlZ1nbh+ngkC82BEenNZvQ2iRgfgS0ueleiPR7DBIlyGyWattW8f9uQi
 wSH7GbOfszFjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=FDI6CN8r
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

Fixes:
 - http://autobuild.buildroot.net/results/db5/db58215fb3c7f30b6c0f0764a84271010346edfb

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libpcap/libpcap.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index a4523f2218..257ec77e08 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -57,5 +57,11 @@ ifeq ($(BR2_microblaze)$(BR2_sparc)$(BR2_sparc64),y)
 LIBPCAP_CFLAGS += -fPIC
 endif
 
+# Enable default optimizations to not run into "Error: value -602 out of range"
+# assembler issues. -Os triggers the issue.
+ifeq ($(BR2_m68k_cf),y)
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
