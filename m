Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D6AFED3C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3915D84717;
	Fri, 24 Apr 2026 13:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5RtrMLO4bSoJ; Fri, 24 Apr 2026 13:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E284D846C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777037770;
	bh=7mv/cBc0n6WkvaaZj8B6+VB0v2jzCbvjNeNRtT5tD3I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e60+8+9qaQ6/C6Xp6YdTtNR4bnc2jtbROES/xaiNuXpKH0+Jwqryv53PXsS07Hsle
	 ufaJz8A1WRJ0yrhky0JEt905qM8VAuy3Z6mVhDZRsArFCfWsbgR7PjutZDEUqzMWKi
	 3ulQiDC6WQoltpXRWWLig+VwsV6EX3JpzKFo0EDZTgEQN6UToLWZjBHt4lWTelaQzo
	 1pTeZXyu9Oz5zykvyOX/Q107z9V7FeroHS3E0XbTU4N2STFUhyPCHHNTFjTZBr+8hK
	 d74E6KvLHpH/3x22q80yvbPODIBf+vLKkaXYSILFAMZLXwS2lp4huOo5g/kaVILRfD
	 Sovkt1izYn2wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E284D846C6;
	Fri, 24 Apr 2026 13:36:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4D3324D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98D1E61AFA
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EJwKRYe3yYE for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:36:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3041561AFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3041561AFC
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3041561AFC
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 9272D5834F2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:23:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13F953EBD2;
 Fri, 24 Apr 2026 13:23:35 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:23:19 +0200
Message-Id: <20260424132326.825570-5-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Score: -100
X-GND-Cause: dmFkZTEOK750MKkVcHWK/lYm5TRZMsTOZUqF/EGLCCfdpO2S12Ik9M2ETHKxdGifB6rLaer6anlYocxITSiA6kGh2zELB+0brb9RDVM/3eQVjIn2DEGs8iI0mqnLzccA1LLjBwCkZdFSEAjBhWnq/COMkR/AVUvmOZkAaPHET7l46jF6ryyAyTFaxNWYc1RcS+nbWjxpsvRkVfzOD2x+Vc0zvFu7AQ/hxZRJunNZ18iex2AHyMbZEQXsQH3CD6OEFg/mcV+bJrVnPdFemFHm8NJzEWdvL/KTS7j1BZ8+2xVjSO32EFiA93DscM8uIcSz2QNS7PmNA/V08TAo869jAAHW0++gsK6hyxTs6ad89NGjBD1Vqb8XAFdQJrDDjkLAnf76vju3ZGm8NQsyQlCRrmSUJZ0IjISjczQsFdr0oP/tZkdAgzvHSf+jt9xaNL1cGa5S6qTY6phd7fJhKjgmmmac/OI50s2F/F+HiOf5B+kn78ovMhmDlP5APopam3XxPy+QjxWQvycEEmPwf4oq/egZwEzPxMkZmPPt4FEey9UkIc5NNFHBzm62tZwuK+pNhDONfbziK/u2sJ5l8LGjBuaDmTIklOVbgSM2PhSfGZPB1IUw153m5RTqHlw4SW0dTeiPkzHFqDUc090pQQgoNx//acE9VgVHZnI8CcIKN7EYN4pCfw
X-GND-State: clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777037017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0guQTh2WQjwKdSG9Ui2EAirKru3fKMfDYZKKK3gYLIE=;
 b=mnvyppfU40aaWH7KBR3SwyIOiypLLZUAd/egeZiKUAFhJYTWpAxe0kpdbdy9eSHJwdR7Fl
 2M33bCQe62bSpaSOzXZ2gV1LQjQnVzNmGEq5gm83H1po736grkIyMQyUmJxVgaHautJ04b
 BFerj67rJ0mEBIGTzjFjme/HhS+9dQtSCaUuZKGxmslhwfDH2fJYoT2GgxmC9kd1MfP9l6
 0u+MFDHAV3kxcRwwkF9xsWj3y5B3mGTrT2LeXoxwOD81YUuW/ys4qNxVLtzSPqoXzJ9vU1
 ZlTm5CK7We2iflZ0DHUbYKW+/qyRoC9aHDlsP3aqb8dxTuZk+VlRX4h5n/qAtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=mnvyppfU
Subject: [Buildroot] [PATCH 04/11] package/gmp: disable C++ bindings on m68k
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
as hidden symbols. When GMP's C++ bindings are enabled, libgmpxx.so
links against libstdc++ which references these hidden symbols, causing
a linker error:

  hidden symbol '__sync_val_compare_and_swap_4' in libgcc.a is
  referenced by DSO

Disable C++ bindings on m68k ColdFire. The C library (libgmp.so) is
unaffected.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 package/gmp/gmp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 07aa4aefdf..8dd60fd2a0 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -31,7 +31,9 @@ ifeq ($(BR2_riscv):$(BR2_RISCV_ISA_RVM),y:)
 GMP_CONF_OPTS += --disable-assembly
 endif
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_m68k_cf),y)
+GMP_CONF_OPTS += --disable-cxx
+else ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GMP_CONF_OPTS += --enable-cxx
 else
 GMP_CONF_OPTS += --disable-cxx
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
