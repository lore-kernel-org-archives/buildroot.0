Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FB5CD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 13:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75C2C61B59;
	Sun,  7 Jun 2026 13:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boefqmhx8e_g; Sun,  7 Jun 2026 13:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EF7261B5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780837355;
	bh=Kxta0HtPh+4Ut+jOHj4HjZpz9ro/Dl1/yDsIWfX41JE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eMrDye7mmUYJf1YWkePKvzwNTYJOyyff48HmhTUYnYkyZR2aHDhvQbDk4GBcEqmrK
	 7VVTllMq22VVpPGPNMTZbO8aTkhdLP4MCCsnewGUC18Zi+3rKc1AfDceqBFCqKEKPY
	 NCvoABkEBiHhtSW3q08r6b90aR1AIN78qoq6z0CgsFSteHdpIhNZGSdiBJboeTuiyS
	 gUblZ0ln4BrTPOPKesx2C9DPocoUwF7DXnWQAXsymJJr+uVYEKI5fUs+J205xKkWeW
	 y/ZhVAt8PYudaHIClfJlcVNsDGaKdDdgtG1IvRCd0Jgz6QdLZWr2fGY07JLuO81lOo
	 TGoBpua3LV6rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF7261B5A;
	Sun,  7 Jun 2026 13:02:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03EFC345
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E903F84B8A
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FH3_poMnYzih for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 13:02:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC65C84B8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC65C84B8C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC65C84B8C
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA85D3EC61;
 Sun,  7 Jun 2026 13:02:26 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Sun,  7 Jun 2026 15:02:15 +0200
Message-Id: <20260607130219.1350128-5-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: dmFkZTFly234rIL1FowqKJLDm1bhLyYeSEHZvjBu8iWZnOAsqulr2N+93caqWZwT5U2YxMmt90rOAHzLQzdWwJdz2uiyVtl7zY/kcglMH6UNmjSHWEi8E3MGKpWXkJCrCqrydmGuSLigC12G8PjWJfkYcidpPUzn4+zEJ9i+mgmB5RxrYDEKqlom81t957kXsKt+Sy/oTEXTmywmVNOAeSXMoV2ziKoLS6XnNT0TxVxAuiSqil0uuOZICWykiBWJM62mP4hVOZg2Y1fsx6sVYEAIAjohKRh15A2oiwosD/Ff5/zuZvyymGyMVRI26dSyvwrsEza7PXPW7Ubzs6BXeVdwOS6TF2P6VtXcD9czhD/srCqWmGlwV3jWjsHPa+/WcGK/SQuVhGztQJqgoZpXkKJCf40AexbBwU+2MUe5KFK1Ue6j46aV14bWriPW6FDv6xqlNWrEd5vNBRiCWwoLKx9rH9bLXtcs/s2KCeEu1TtEYMlE6It2qGHKo2GwtkXRD0lCs+AcjPoorB3aAXj9xGADmLJ9828lXXxLNqqHV0zfXfGkDO6WvhXaJ/O6Z+8cffCu9oQWYYKNnsF14FW6YHi6hhA/f7EBy4vjK6bOgOe5ReSATeIGVAFlAqCqGvbH6SZsTefRekDrcjGOjKmkzi+6Foy0xNbLUnKjahFPNnfU9lTT0A
X-GND-State: clean
X-GND-Score: -100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780837347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWNZ4QfPO/UREUAupKltPrFgp7D/VAadvuuJPVPqD/E=;
 b=Gkh3TxWgnv29WaqCifhC002m81vpSYfS5ziT9evmy1wxU1DX2Cov6t7Obxvx57YabfYPRv
 sRT7TuflviE2jghvjRcJWTnxA00q+aMNXZUyFQDbuGIe3K6r24SNh3zCo9c2V+d7OPjjPJ
 D57QXymUWO9rcgiYMSObCXCn5gb7JsAW92QkDeuz2MSWn4ISfVjW52hRqtIQ1LrX68NVJQ
 4BuU0OMeVxw9JiSwmbDZ9ESXj+lstmELEwDb0v9lwBePQDUNWMQHhGDI4HzD87+Q60BgOH
 QRvXBIfQKzYnaJeT99JjaZ1YxWQufeDBmIjJrmS/K6l6aVy1URYI9url6W/UIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=Gkh3TxWg
Subject: [Buildroot] [PATCH v2 4/8] package/Makefile.in: use 32-bit jump
 table offsets on m68k ColdFire
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On m68k ColdFire, switch statement jump tables use signed 16-bit .word
offsets by default. Large functions (for example in pcre2 and
nftables) overflow this, causing an assembler error:

  Error: Adjusted signed .word overflows: `switch'-statement too large

This affects every ColdFire core: the 16-bit jump table offset is
independent of the core ISA (verified to fail identically on the V2
5208 and the V4e MCF5441x). Add -mlong-jump-table-offsets globally for
BR2_m68k_cf, alongside the existing -fno-dwarf2-cfi-asm. The flag is
harmless when not needed and the overflow is not predictable from the
package list, so a global setting is preferable to a per-package one.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes since v1:
 - Keep only -mlong-jump-table-offsets; drop the
   -fno-schedule-insns/-fno-schedule-insns2 flags, which had no
   upstream backing and triggered the dropbear ML-KEM ICE.

 package/Makefile.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 5ebb5f9ba8..7017649c09 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -211,6 +211,8 @@ TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 ifeq ($(BR2_m68k_cf),y)
 TARGET_CFLAGS += -fno-dwarf2-cfi-asm
 TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
+TARGET_CFLAGS += -mlong-jump-table-offsets
+TARGET_CXXFLAGS += -mlong-jump-table-offsets
 endif
 
 ifeq ($(BR2_BINFMT_FLAT),y)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
