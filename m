Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDD5CD8C88
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 13:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E775429D0;
	Sun,  7 Jun 2026 13:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mK05-NEKF96; Sun,  7 Jun 2026 13:02:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99365429C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780837356;
	bh=gOeUW9yqXQPZwy5m1ebl0ISezk2ZCSFncmhNGkUM8B0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=llKsODQzjQxAsZMSKbPb1KtK5fAxSve2UElVUJd3O73+0XnfO4st3iz3MLXm22h23
	 8bA8BVqSwWCSNMDTnpWbAm0nZlECZTeK3TkBcNMtB8i6lTJS6bN2BiAcftH4eVJ5Lc
	 EMtVSPNEpkeA/5FT2pmkgrlq7GJkrcHiUn9DassDVummFtW0XJBa0yUmdD5e+Gf6j0
	 NQrf5pd82jNq6rsHrhgxfiHEV/CHvKIaslX1M8hOdYQ3d2ZigW9UlbKtx4jbf4Fync
	 Nd1Vsg9voh6YciVQXthZ9V3XJw3CMgM3qBvXfKPu4JccyIvJhgrvezZtSo8TvXOTzN
	 olr0DMw1yqvBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99365429C0;
	Sun,  7 Jun 2026 13:02:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C67A345
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EAE840566
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MfNva3l4DvZ for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 13:02:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68F0141E96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68F0141E96
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68F0141E96
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 746C83EC35;
 Sun,  7 Jun 2026 13:02:29 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Sun,  7 Jun 2026 15:02:17 +0200
Message-Id: <20260607130219.1350128-7-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTF6ZuMkpEt+Alv83M7SSgieYFOUd0bcSr+5BSYrpGi2zjRvGX7AG3gWEt4kA9GLoIQohjRMdIZrK5kIRe2Fq9BFWs2+vt/Hsl3qhiwoGlmrH1WhyKdBTu/tCo2Xk5HFlbhoKCJlY5TqQd10v6lk5/7a+aAyxh0+AWG8yhXSQXxA7kwg5f1fsBdy54QEUzX5Wwow43SbqFbDlXehp91TjqJe6uvaPq+reh0eE+GP4YYBAMByZVVxKNtQne8A3H3XfRwt/Om5SGG2rvEdPMg6aG7pxPnNMS/JJvGm2HxfVtJMk34w9z4/rjGplfP5z+KhZQm4rG4TZ/IoFWF4mVtgOnHdllkh60VLZSvq2eTxLG9iSiH/LoRrfRkJ3Lzn35usb9BlvL+NtqW7/xNri5IqkkOQqcSLtUzMs8YCWUTskQOYfa+AXZzICdfJQnU4jgoF/ahVxj3AIeYofHvnrqTKj6fhlRF+zZ6v9Q7wsnwKUHnCu6Pnf3TgySjLloh778Qr+MW/oeaivkNkwEEptvcWPRbz+uczJv4AePJ3rY8kflwpDBoKkbdgX+E+Ve7oq2W+zU3Z8JaCn6T5DQQtCs6CietR8g4dPH/7nQfgzWVkS8zHtHT2h02DjFCBC3qyMjDjVLWAuOCVdSiNsFs1GGdoMQz7aFAobhU8kNbOKu1WIxdY9A
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780837350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7Be2qV4SWTDpiQ4dt9DbWNe6nDDcYtenUFLr5q9Qak=;
 b=GP1ntifDhNb8JAnRmo9Jj/xERayyAjUpesxFGMvp+hlD5UW2R0p6E5fwzMp0IDiln6yIfA
 HWdV86M5rS7puZeC4DDeinCkoa5k+OSBURZASvAgVJveZd4Fm3geK2ukX0DidpPPCvPpvb
 RIXygN0ffoLTU2vftflKojK/LN0NY+dqHEsCI9f0I0ond1fnUz7UdIOzDof5ntZByQvCO4
 07dM4ENPGFJ2ZBb+Rt53XZE8+EB+YaX6ETHJFwOjvRQbysbxkOOxGpKrC8UfD+sebL79Af
 344GsYb2U6IcCeHbKhtuPtsog/tWi/xb9cR2fge7hiiFM+Jcf+P6iyIkgndDgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=GP1ntifD
Subject: [Buildroot] [PATCH v2 6/8] package/gdb: link libstdc++ and libgcc
 statically on m68k ColdFire
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

ColdFire has no hardware atomic instructions, so libstdc++ references
the libgcc __sync_* helpers, which are exported with hidden ELF
visibility. Linking gdb (a C++ program) dynamically against libstdc++
fails because those hidden symbols cannot satisfy the cross-DSO
references. The same root cause is addressed for gmp in a separate
patch.

Link libstdc++ and libgcc statically to avoid the hidden-symbol
references. The flags are appended to TARGET_LDFLAGS rather than
overwriting LDFLAGS.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes since v1:
 - Reword the commit message; fold the flags into GDB_LDFLAGS
   (appended to TARGET_LDFLAGS) instead of overwriting LDFLAGS.

 package/gdb/gdb.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 2a2fdb260d..271ab9d942 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -121,6 +121,13 @@ GDB_LDFLAGS = $(TARGET_LDFLAGS)
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GDB_LDFLAGS += -latomic
 endif
+# On m68k ColdFire (no hardware atomics), libstdc++ references the
+# hidden libgcc __sync_* helpers, so linking gdb dynamically against
+# libstdc++ fails. Link libstdc++ and libgcc statically instead; see
+# also the gmp package.
+ifeq ($(BR2_m68k_cf),y)
+GDB_LDFLAGS += -static-libstdc++ -static-libgcc
+endif
 GDB_CONF_ENV += \
 	LDFLAGS="$(GDB_LDFLAGS)"
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
