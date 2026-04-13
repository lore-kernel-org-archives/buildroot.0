Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C296E93804
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 00:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF71B42454;
	Mon, 13 Apr 2026 00:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXx6SZ21u_PQ; Mon, 13 Apr 2026 00:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F4EB4245E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776039159;
	bh=LlYmxQdr87BpzjHM3Euzg9pragU8du/clHEuM3uWRl0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k8AVVYAOzrm/2XZ6TnJcT38PYwVQIyvuTtzDxe2xBMQAZ9eVjpU0/gHoSW/wDtmVa
	 rQvPQErqJui+JN7fGTVwTDY8tJiWzWq5FhuGNUas309o4MbVcXv8aUsVs1XbLDfZRg
	 qD02/4Rdb9STwjUWsnB1FmcqXoWFobZySx9hdYrhjif4d673bUMdrkoXgmQsSspXNE
	 sQL4aGPfSQ9nlMnQs5mQmFkdZoGlbyCoqp5BDq4LIO/zc6m/szzgHq5NwYki3YaV9d
	 wdnFsXv7ayI3vFSFbXildl6nsfcI5T9B31hfbcZumnHwKvJhonvKi41fW2+4yrFn5N
	 NQ1szaJptKbTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F4EB4245E;
	Mon, 13 Apr 2026 00:12:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFBB8283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 00:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A967B8444E
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 00:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBwVwseZidNn for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 00:12:36 +0000 (UTC)
X-Greylist: delayed 472 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 13 Apr 2026 00:12:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EB3284339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EB3284339
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EB3284339
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 00:12:36 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 83D8BE006E3;
 Mon, 13 Apr 2026 02:04:40 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Florian Larysch <fl@n621.de>
Date: Mon, 13 Apr 2026 02:04:22 +0200
Message-ID: <20260413000423.9275-1-fl@n621.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1776038680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WMoWJ7u6PcAjQONZ4HuuQZ11/FPm6C6tt0IXvEkcgO0=;
 b=Ya0HKuMv33R/Ju490Z9dact+l0OQ79+m0xKhgVbDjLj5YUencLOjoKVdcBj1jxqNor96nf
 wiXsRO4Mdip7FEdjYWpOaUwFPFbJfid8awXsR0NlTIa/FHKCwZk+z2X3UMuHooc7w8dlfq
 jGr6dkx3U8913HPcrWDWqebJO1hVYUk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=Ya0HKuMv
Subject: [Buildroot] [PATCH 1/1] package/flashrom: fix build on big-endian
 targets
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

flashrom 1.7.0 fails to build on big-endian targets because of an errant
compile guard. Import the pending upstream patch that fixes it.

Fixes: https://autobuild.buildroot.org/results/d75/d75f5a555b7ad1a99ffe46298bf6f527f3bafbc9

Signed-off-by: Florian Larysch <fl@n621.de>
---
 ...hrom-fix-build-on-big-endian-targets.patch | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/flashrom/0001-libflashrom-fix-build-on-big-endian-targets.patch

diff --git a/package/flashrom/0001-libflashrom-fix-build-on-big-endian-targets.patch b/package/flashrom/0001-libflashrom-fix-build-on-big-endian-targets.patch
new file mode 100644
index 0000000000..f09a39d137
--- /dev/null
+++ b/package/flashrom/0001-libflashrom-fix-build-on-big-endian-targets.patch
@@ -0,0 +1,54 @@
+From 13c19fccd7946c692e587e308c916a1090d3592d Mon Sep 17 00:00:00 2001
+From: Florian Larysch <fl@n621.de>
+Date: Mon, 13 Apr 2026 01:40:52 +0200
+Subject: [PATCH] libflashrom: fix build on big-endian targets
+
+Commit f74f02e2 ("Add guard for compare_region_with_dump()") added
+little-endian-only compile guards to that function because it was only
+used on little-endian systems and caused -Wunused-function to trip on
+other targets.
+
+When b0b975d0 ("libflashrom: Add new layout_compare() function with
+test") introduced flashrom_layout_compare(), it included the new
+function within those guards too, but this isn't necessary:
+compare_region_with_dump() is not sensitive to endianess and adding that
+new dependent actually made the original reason for adding the guard
+obsolete.
+
+However, now building on big-endian architectures fails because
+cli_classic.c unconditionally refers to flashrom_layout_compare().
+
+Resolve this by simply removing the guard.
+
+Fixes: https://ticket.coreboot.org/issues/635
+
+Change-Id: If3e6828e6445e0708e1174728f91053e48a097ba
+Signed-off-by: Florian Larysch <fl@n621.de>
+Upstream: https://review.coreboot.org/c/flashrom/+/92156
+---
+ libflashrom.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/libflashrom.c b/libflashrom.c
+index 159e3924..503386fa 100644
+--- a/libflashrom.c
++++ b/libflashrom.c
+@@ -462,7 +462,6 @@ bool flashrom_flag_get(const struct flashrom_flashctx *const flashctx, const enu
+ 	}
+ }
+ 
+-#ifdef __FLASHROM_LITTLE_ENDIAN__
+ static int compare_region_with_dump(const struct romentry *const a, const struct romentry *const b)
+ {
+ 	if (a->region.start != b->region.start
+@@ -508,7 +507,6 @@ int flashrom_layout_compare(const struct flashrom_layout *layout1,
+ 
+ 	return 0;
+ }
+-#endif /* __FLASHROM_LITTLE_ENDIAN__ */
+ 
+ int flashrom_layout_read_from_ifd(struct flashrom_layout **const layout, struct flashctx *const flashctx,
+ 				  const void *const dump, const size_t len)
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
