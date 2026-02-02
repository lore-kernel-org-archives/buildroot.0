Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E72E73144
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36A644082A;
	Mon,  2 Feb 2026 08:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3LmECLFYkBA; Mon,  2 Feb 2026 08:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C30A40820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770022056;
	bh=ii9UDGR8+lugXMthko4irJMRo2ntSO2I1hpGNxwCLSY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=FDV6RnH768gWnXcTOV1t5xhzBKQ1zgTvNKJlmLu92+qUscHBFAsrg9AJK/doE8Wik
	 XLvW+e5c/fyqtyJTR9N9AUjkLY2R3cEwquZ3jjAggrJBhJEHbjqcbHDHlHfX8rO3aB
	 QWOf5NAQgPQWoQ7Sbn8biyu6mlD5JRDzM7rIDWk6uo2Rv7J4YFhcTMwRvW2rYuy8vb
	 69okjauClcvTL1Uf5h10EUKqHfgG60mo8WHcGubLivphNcPGKtFlJG3NTyJEwQQ06r
	 nDUmg8pM3Q8sKroZSW7h8a8sj/d+R7Djhs3ULHAqsav0+xhh9kDXk8uOK0fGS5n2bu
	 vJD+uWedazyQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C30A40820;
	Mon,  2 Feb 2026 08:47:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74212149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CA7740817
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_15nqMiytLM for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:47:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 533D340810
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 533D340810
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 533D340810
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:47:31 +0000 (UTC)
Received: from framework-OT (host-109-89-232-55.dynamic.voo.be [109.89.232.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 74CDA2C80134;
 Mon, 02 Feb 2026 09:47:29 +0100 (CET)
To: buildroot@buildroot.org
Cc: Boerge Struempfel <boerge.struempfel@gmail.com>
Date: Mon,  2 Feb 2026 09:46:53 +0100
Message-ID: <20260202084741.1557662-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770022049; bh=pfDFQMAckXTQiJcoL1u/48wimdtilzoe0M/15gS+AMk=;
 h=From:To:Cc:Subject:Date;
 b=LdS6TF/Ayl91I9pSur6gxBIvWKCxC3lEQI2gNhf4HnPpS2//FE/P0RCgjdqCoY7Hz
 ejxK0fARHI/2qn7wAmB5U6GSiEGScdwuetVAYPLEnx9Q3NoL2TUthVZGt5BEExN2Cs
 1YAyan11+/RWwxQutVCBnyEYGwPTbEgmNAKw/7RDOTblt+vwuWo/D+38r24/jgdoKT
 0i3RQT94o9PS0Hd4XN1Nk3+5Sm1LB6FKlJSNKotdmmh0NH+WmX4sCaVbKPP3nLlkQC
 MGbo638xeUZqPPmmeoFlQsUE9MdAYWLHlP4gszVtAbIz2y1z5qmE1jPMZnd7S5hwtR
 UW8RPvQm+2yjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=LdS6TF/A
Subject: [Buildroot] [PATCH v2] package/libgpiod2: enable gpioset
 interactive when libedit is available
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
v1 -> v2: Remove explicit option and always enable when libedit is
          selected.
---
 package/libgpiod2/libgpiod2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index c5b53f631b..ae3bcfa207 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -24,6 +24,13 @@ else
 LIBGPIOD2_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+LIBGPIOD2_DEPENDENCIES += libedit
+LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
+else
+LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
 else
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
