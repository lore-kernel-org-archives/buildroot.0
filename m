Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EDBFED3C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4876B8478A;
	Fri, 24 Apr 2026 13:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLD7HHVQKqRu; Fri, 24 Apr 2026 13:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 378168475A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777037774;
	bh=0FS2AkU9FPKMuFKGCOyi9IWSOXLWXzlERFONcs7zxHA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hN4xuBY/bZ8uDlPSHtaV9hz8496eTucuuIMKAs3svYB/fnKQrD+6SWerxPQ1SFM3T
	 L6CSz5uKYvEmCaKfDcgZAj+bwMW4x8AnOfsG1HCw6pbIvMDtjla4a3RBscvu2qIBN8
	 bK9J1d+nU3QU1tS76h4BZ4IJVRg52lSaQ5IvWiR1DWivl1jQrQTsMTJ7A1PZsgii7b
	 x/A+ugWv8mowa4PuOH7p99ZlYn+BtzfTDq/Y050bqrIyJ5RfHfnE0SEC/k+DDh/NtN
	 OzdzjVGuZ6dozl4wPOuuaVxT6ZVhVpJ+ng3x+elRwxaakFLbEtW0ekfkM/RdmS5BNJ
	 thxpau+gN+GHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 378168475A;
	Fri, 24 Apr 2026 13:36:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC78237A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6D03427EC
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNKRnAYEZJra for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F524427F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F524427F6
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F524427F6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id C1D115834F4
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:23:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AC3B3EC2E;
 Fri, 24 Apr 2026 13:23:37 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:23:20 +0200
Message-Id: <20260424132326.825570-6-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Score: -100
X-GND-Cause: dmFkZTEOK750MKkVcHWK/lYm5TRZMsTOZUqF/EGLCCfdpO2S12Ik9M2ETHKxdGifB6rLaer6anlYocxITSiA6kGh2zELB+0brb9RDVM/3eQVjIn2DEGs8iI0mqnLzccA1LLjBwCkZdFSEAjBhWnq/COMkR/AVUvmOZkAaPHET7l46jF6ryyAyTFaxNWYc1RcS+nbWjxpsvRkVfzOD2x+Vc0zvFu7AQ/hxZRJunNZ18iex2AHyMbZEQXsQH3CD6OEFg/mcV+bJrVnPdFemFHm8NJzEWdvL/KTS7j1BZ8+2xVjSO32EFiA93DscM8uIcSz2QNS7PmNA/V08TAo869jAAHW0++gcv+HQ1C+s113xfOZ0Ulkbn5/Gflp+sGgXBlWopb1yfiUQJrBT9udeJiBwocDuLlllzEMDivYXXX7gbFTRdfe7j6YqsJk4qmSeneH2s0P1zNBLwEjx6Ht1bCiRqjyEsAuXjp4YGk6rtZyFNOL918k44Gmemy2rRULp5dbr6Co0Np+gBauZwS7zyoeIOclgJp/f6I3Uo4IE6Yk4kf9XUsXC+cIC56xQ6nNFUcOtd1fH8lAzZWWoKt9wokYVQkKEzgvm5sF1lw8fNMHYXZrks8K7DHnmL0GICAtRvJeb7vIMrtZgXY/NWx60nbom2fKScwTEkMBStQOZtUXvAFd9DwjWQ
X-GND-State: clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777037018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P4z0CFdfBvPngr+5fTpkz7lyEPH7/YfnZmZSeIHKYT4=;
 b=MXnQawbv6hiwiWOKYOhECa4HiplCptrLxVZ9BuD34n9UgJlCU8xUMVnipTkl3iSRlZDHFl
 ijsSe6GSJzqjg0CP3N08+03CJgfLEOxagO+/Bw9HZuEtdfymwbzK1ouz+2MHTGPzxb06zd
 9Le91AOinn14bGcgghF5UK2A7AXxmMS169o3ipO2sSM8a4jiI5HZRL89LEseWjtcrRGXPO
 r8hSoeDCJnyrHZERIJZfD6BkJ1LkdMWK3KmvCOwYvTKfTzTQZqexFwgltsR9bh00QBbCnc
 ZxEWETvgryigo8hq2qoPeZSKWAGoUT+8NaIg2XYsdWTVHR3nUJF3iaNnGSxmxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=MXnQawbv
Subject: [Buildroot] [PATCH 05/11] package/gdb: use static libgcc on m68k
 ColdFire
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On m68k ColdFire, libgcc.a exports __sync_* atomic built-in functions
as hidden symbols. GDB links against libstdc++ which references these
symbols, causing linker errors when building as a dynamically linked
executable.

Use -static-libstdc++ and -static-libgcc to avoid the hidden symbol
issue.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 package/gdb/gdb.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 1841002dc1..c6dfcf3bef 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -116,6 +116,11 @@ GDB_MAKE_ENV += \
 GDB_CONF_ENV += gdb_cv_prfpregset_t_broken=no
 GDB_MAKE_ENV += gdb_cv_prfpregset_t_broken=no
 
+ifeq ($(BR2_m68k_cf),y)
+GDB_CONF_ENV += LDFLAGS="-static-libstdc++ -static-libgcc"
+GDB_MAKE_ENV += LDFLAGS="-static-libstdc++ -static-libgcc"
+endif
+
 # We want the built-in libraries of gdb (libbfd, libopcodes) to be
 # built and linked statically, as we do not install them on the
 # target, to not clash with the ones potentially installed by
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
