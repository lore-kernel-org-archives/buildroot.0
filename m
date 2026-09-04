Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25DFC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEEE640822;
	Fri,  4 Sep 2026 16:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJzUQ1zpIaKW; Fri,  4 Sep 2026 16:26:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DB41540A18
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788539188;
	b=iZ5HE+Fbbv6YbE9Zak7kJqIDQk2HJhcUqORcRiUY4+ZoG2zKVhdVJw8ZMtCcyK4pNr6I
	 wMneNUssXY2ESnUbpTiWlglMcrDoWxxcy8yXnRUrOpyHV6vl6++rZtzetqIP4nKx+DHDe
	 ky8W6AAAjprkmmEkhWbpHhbkRbfMMEEq2AjUwmR8984FWfrmWXP10IzpdHl22i28HSJRi
	 GcsCHhFeyexgsEsxdN3zESP8+G+9ku24VHWbH4ppEapQhMZQJx98fNhW7L8UMAQ6SDysl
	 WjZ6LSljszae7l5DA/OsR6i3XaKHaX0VnaXMEnU9+5DBud1iGTo3dFXZHj02UKSlruQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788539188;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ti3ZQH0LwiesNrxPEnYJyeFPJy9fjPMKChkQZJsYwAw=;
	b=ZRqO9YjMzS/nrYgKbX3qP4cYBuFjXXdRMzUEGC3jQxSJpU+BjBJF/eq5xrQi9ofL0kM+
	 N+Q3qoHKwpXycUri70c4ySEU4DfH19XnjMJvG4okbvzRMNM07mxvG6I166XnM86MHjqfq
	 Zm/oZIRNxuouNuYhEduYMvgRQITsXMv5nYL1H17P+bFmuOkMu6D64/XFBwgfHayHZVeKq
	 Stjc4dmgfdDtqz8xoOn91p2LlPyC0cbY7h8P49fBslx1gXGwQxo6EJo82Aj1p3K20dptk
	 kp3tFx9/OU0Ac8UiHthdGe5HzQlabom0zPDDWQ8R6vbjLKkw+ffOWU1K0Z81nUnwZTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788539187;
	bh=ti3ZQH0LwiesNrxPEnYJyeFPJy9fjPMKChkQZJsYwAw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GlGnlErcdNzNZSgHDY5USCNfVIuIfSPBqC8JGUxOMCJ2sJTbFmExV46Ec6mFAM7m6
	 FuNBDVc+b5brsOyHxByBf+Hrdc4OGtw87gJ3S59o93fQ1F//g9g3C46JOCJ/qS6yQ+
	 /DTXAJ5ygKVIIM2rQl250h5AHqBem9F0AN4EQChO6mdnw4ucr59HRo5nFxDi3ArflU
	 EBJekZiNr89SqWrxeXXHhq1kDVtblTqlHIR7BG27dAd9UIbKhM8NkNGrO1BWKSnOqT
	 r1n0ALgP6Ai6Si7yfOjcnZPgbWJ1g5T8Mazky9rk+rsTuhH2AvBNGWr4/dEKJ+ZrKo
	 bWoqTANK1AgFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB41540A18;
	Fri,  4 Sep 2026 16:26:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D03572FD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5AB080D5A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGPP_3iS41Qr for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:26:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ACADB80CCE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788539185;
 b=BA7PZdsr0XwrPObT999phzbR4QKiGEhGQ2CMpMYKiInqgoe+ihChxXH0rSb0isEteRxO
 OEBmyUHI9QImoYYq2GM/rlGb/6J1PqWbl54bN7du6vK57K8AP9PPNa+ENjRo/FfkBSFw+
 hAjbQ7W37WTQiZHTrF1T8q4LQJ2I1xg7j1FVZLMkEXUbi17rnHlTZGz4fN/fE5lUWyK7k
 gYcNALXCqoklBlJD5l4jrHHBosdpU+7v/j3CnzXTSGkMQcH+oejbpkayaHI8k6o2A90pd
 veGP9eQ0YNGYmUi10dznStMsYuLB6rtsw02saxzk+WSzM3M59LErO9VsvBTwa6jp+4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788539185;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=lsH0CyEZnIOAxPBPyqGy6Czqb1MYzMbATMcD33ge1kA=;
 b=qH3NhqRCka4yb2Fz39PdIpUu+F+/86JfzAMF/74PHyZUFaqSKJRlomSOpar1TBUpCdha
 Mv0nIECLAwgYfMKFMdr70E0i7P/vy46A6bDkG/5Ru65yJNYKSdDb0oZsvUYocdrU/ISdh
 pybX9bztuc58PEehIpzBFxp5VTEhmkhLfozxOk9KhUh9QeOPSBHEQLgsekMSgaQ8yh2NS
 RDdWPqbk5ollqK+9qduF56X8r2Bijb+2rl5CDLHe0R6APNUazY1M419ZlpIevBECtQ9Kc
 CsFzuDgnyzbLF3Aj57G/cXHSBfaEc4Yd51+YbEtzX01dE5bc0RL5+xIL+Kacs86uFYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="LJ2F66a/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=LJ2F66a/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACADB80CCE
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788539183;
 bh=lsH0CyEZnIOAxPBPyqGy6Czqb1MYzMbATMcD33ge1kA=;
 h=From:To:Cc:Subject:Date:From;
 b=LJ2F66a/DxFh6yP9mEzO90ftQQZRcurnmPLeOuH9reAfNHBq1gHFU/LPQwAKTntgH
 P/qQN7dhprfPnO1A6Iudeilh1fL1/NHKeCaQs0jbe26pgveFQadls0Hs44nISJXR5s
 AO+yAijsMh2keDZiuWrOPGfLZiT7FL6Gs7Zw5RBuvzS2eHgZ64vaL6f5h0B+EVfalv
 at4g80lAaTrg8yenmb94rXb9oLViq1bdvKCEzr7yMWAcuB8lb43IhRZJ3Ceg47fpc4
 OxiQ491lJEojMHfLf0C82XeRXGSgGpY3P8yz3+u46g1MERoZgl3Vzkr9xfYNsAveB/
 cIZSD/fAKPBRQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ACF48A4C2096;
 Fri,  4 Sep 2026 18:26:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43102)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2WkA-000000005E1-2n5l;
 Fri, 04 Sep 2026 16:26:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  4 Sep 2026 18:26:22 +0200
Message-ID: <20260904162622.118490-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.12.0
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

https://mesonbuild.com/Release-notes-for-1-12-0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index b2fff8974d..9c36164589 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
-# From https://github.com/mesonbuild/meson/releases/tag/1.11.1
-sha256  6788ae299979643f8d841bcaf64352558436cae45a0355148a3aeeccf7913866  meson-1.11.1.tar.gz
+# From https://github.com/mesonbuild/meson/releases/tag/1.12.0
+sha256  88afe0c20e52030218924ac37d0c81c59b4b5f3ae3752c8c6d7470c7d365886c  meson-1.12.0.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 0a61cc9c0b..cafbff4578 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.11.1
+MESON_VERSION = 1.12.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
