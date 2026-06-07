Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE55CD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 13:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEBD261B74;
	Sun,  7 Jun 2026 13:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTZW4fOM6z1R; Sun,  7 Jun 2026 13:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C405761B7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780837360;
	bh=C6RSfJAaq/5Lw153dUp5sSFCexY0pOPju44TKbS5rsg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BbcWZ5VcnIQCPWJtk4MJuyav5rCvL7AzVYGSuyDl81B0G3e3BDWmf+bt2esBwvuAy
	 MAZkWCO+PzbwVOCwPdP/eO3uqp8baEBBkHDRpB/sOLjEFnafZgGAGHebEzPSUMc9P5
	 cTQqr0rnrxQTVSufPuo2qlXklYJdTdpXK/ely7hsWFCabQB+gP2beyVl/6pJixOOYZ
	 lH936wF/ZcMGfYeBLnAkeaXdRGIzmD+OL48rAnRFXEey6LKndcpDseyR8wub3r/qpq
	 p9V7C4mUBAau7lknYrR9YmWGhVnlJcA1fHaKyiyAi917Ziw89EBYCKqRT/E4Ca2+Qx
	 Ww9mtyLJgB6Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C405761B7F;
	Sun,  7 Jun 2026 13:02:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93148345
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79561429BE
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MdMrmnTuD9v for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 13:02:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93F51429D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93F51429D5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93F51429D5
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5EAC3EC58;
 Sun,  7 Jun 2026 13:02:32 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Sun,  7 Jun 2026 15:02:19 +0200
Message-Id: <20260607130219.1350128-9-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: dmFkZTGPQ6O7ncGBdU9QaWH45C0oFG0Hgb3k4OVTDqighmNR0sg3E5kucM6uTEsxjTOC1f3Z4DGPM+rrYUIiQ/SOltJ5N2vANV4LZ4wqmvcQmyNp2CvudXD4iHx26W2HjBiX8PVIcbS40AIEWPyxBzB2QuGMPPJhryHqGk7RjO0i3zFPTNAxqT2rNwxHyQgGRPJKfsRJmWADT0i2MXqR+6WErgrqSKlUk9FZGB8RVOXskf5mbIjGsor9YqJYUKN/8PMz5TBx3dMYbIZsHFldYPE1tVwnpVaQdBJeZEGaoYqW8NlYN20sZ/Qui8PWmC1lXosUtOlqAyXaTOkx9hxBuRcsGrvSj/7uKB48zNp0aHPYoeplOKL206lZSudHDtu7bJVZJ4P790jKayPcbWUSKfMXf1Dn/Vb0bpYwqQ92vcZ4vS0oqMm49Ij1aEVWEqTilF10gvJPFi/RMoWrhOfr6Ebyb7CCy4tShyrTovXZVOPNQqkoiI3KyGMHTfK0T7J0t604aYv2zBEnpIrlku//xBTXmM6xUCrZreJj8n1qCnUuuEcgtPrixckTJE+ooq/H3FHhnh/9au4sOWpgKMCrAHPfIZH1BZD1iuiY2WZucsxEgNIqAksGhbXWaD+ZDl97NOd8Dz/PeILdgGvfW12mpr/33gqOfv0E7HcV/GEME0aDZN2+LA
X-GND-State: clean
X-GND-Score: -100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780837355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7sGOPn26R/EgwU9h1bO2TvPN4BYrB8rMdhPZCW8w6s=;
 b=Olo/QvLYJjYXJmTaMrWMehWgA9PLJUTuRskHL9rpyT5na10+f++iKTcgUyRssClHnUhHfe
 JGZ4Z0fZbFAXeo3JYAD/XvGYuZaHHAwCj3HHqhugw8sSDYZZC5eC6NEDvSRmBANzZJCvIW
 /JOlhSxogx3g+YGYsSQjOrVo9hBi67R4qbfWGv3x7/h/254PuvRJpFOWvf7a3PiAn0ERgR
 wryS1QzF85HS19jLGjRrqgR2QJ6gCNfYU4q6FiHSjSQ0MvAiRk2bMZkAum7Jb44yyN6v8Q
 xdB/0IWUnz7mL4xmvWlSd++/LKQW/pxxXcMMffrZ7cdya8mXgWCKrrMUZXuKXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=Olo/QvLY
Subject: [Buildroot] [PATCH v2 8/8] package/libglib2: add m68k ColdFire
 support
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

On m68k ColdFire, two issues prevent libglib2 from building.

First, libgio's GOT exceeds the default 16-bit GOT entry limit (8192
entries: its .got holds ~12800 entries), so the 16-bit R_68K_GOT16O
relocation overflows. Add -mxgot to use 32-bit GOT offsets.

Second, glib optionally enables a C++ language (add_languages()), so
meson probes some dependencies (such as iconv) using the C++ compiler.
On ColdFire that link pulls libstdc++, which references the __sync_*
helpers that libgcc only provides as hidden symbols, so the link fails
with "hidden symbol ... referenced by DSO" and the probe (and thus the
whole configure step) fails. Link libstdc++ and libgcc statically to
keep these probes working. This is the same root cause addressed for
gmp and gdb earlier in this series.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes since v1:
 - Drop the b_staticpic hunk (moved to pkg-meson.mk) and the
   sysprof hunk (sent separately). Add -static-libstdc++ and
   -static-libgcc for glib's C++ iconv probe; keep -mxgot.

 package/libglib2/libglib2.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index cae8a85a28..77a7172392 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -55,6 +55,21 @@ endif
 # containing ${libdir} in gio-2.0.pc. Indeed, a value depending on
 # ${libdir} would be prefixed by the sysroot by pkg-config, causing a
 # bogus installation path once combined with $(DESTDIR).
+# libgio's GOT exceeds the 16-bit offset window on m68k ColdFire
+# (relocation truncated to fit: R_68K_GOT16O); use 32-bit GOT offsets.
+#
+# glib optionally enables a C++ language (add_languages()), so meson
+# probes some dependencies (such as iconv) with the C++ compiler. On
+# ColdFire that link pulls libstdc++, which references the __sync_*
+# helpers that libgcc only provides as hidden symbols, so the link
+# fails ("hidden symbol ... referenced by DSO"). Link libstdc++ and
+# libgcc statically to keep these probes (and any C++ object) working.
+# See the gmp and gdb commits for the same root cause.
+ifeq ($(BR2_m68k_cf),y)
+LIBGLIB2_CFLAGS += -mxgot
+LIBGLIB2_LDFLAGS += -static-libstdc++ -static-libgcc
+endif
+
 LIBGLIB2_CONF_OPTS = \
 	-Dglib_debug=disabled \
 	-Dlibelf=disabled \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
