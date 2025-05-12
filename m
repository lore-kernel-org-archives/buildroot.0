Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F5CC3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 16:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A497408D6;
	Mon, 12 May 2025 16:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FWnseSVZjrn; Mon, 12 May 2025 16:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78A69405FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78A69405FD;
	Mon, 12 May 2025 16:33:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62210154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 16:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53865812B1
 for <buildroot@buildroot.org>; Mon, 12 May 2025 16:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQVgT9uzruGe for <buildroot@buildroot.org>;
 Mon, 12 May 2025 16:32:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F434812A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F434812A1
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F434812A1
 for <buildroot@buildroot.org>; Mon, 12 May 2025 16:32:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-441c99459e9so31350925e9.3
 for <buildroot@buildroot.org>; Mon, 12 May 2025 09:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747067577; x=1747672377;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ID0SVeKTDin22BAE5asHe+fLE6O5JojbhOTRCaAJ2T8=;
 b=gx9WjsfnkzaTlU4nqvPXv8HSuKvPJ7tr5M7eo+JwavAWwJ0mYaYNb4gIyLz+XMtgGR
 KuEtMEyTJfSXpiXRjpuvMwjix7GRFwD5H25daBBx71HfbGQN3xRTZx1UovtYD8Rg7llE
 NSqsts5Ft9DuX5wSQePMhUAwnFYgHboY2jqNi+E2DFNcewpj2A2ojjBfm7HLc+IONtXp
 OW1S//Ko2/6O2dYa3h00bk4fb3sUJAEXaovmHExMVdIImzlRBQi362ZfwZOdrtb26wce
 VAijBs09kasRwzNXbkjOaPbd3Tm3PGR3HGMuqAS72LoFVkqGDw30+Nv0Wmc/IeTJTSLK
 CsRA==
X-Gm-Message-State: AOJu0YzHwbBkuGO20n0STYdovu4OjWY7/IqpZWbHmRnZHzBERdL+Ybyb
 7VOsTBVdKLQO64N7elg4fDib6QPtha3br8+buZPI7BCjiv2B9YKiqDN7oIFi6IvuvsPzT7mWxvX
 6/U8=
X-Gm-Gg: ASbGncuiCtwb9T1ncc0ajOIfjFqH1a2TQNbaR8FoQZ5Fu7BR2CE9ktJ6ZXmJ5BoJvj/
 et8+e1MbKD+l+yng/oVI9YFOG4AhUJs2BEgeShGsGW4oNDq6FoJUjqZzefP/E++MNSd7UxAGYlA
 /VauTVj9Hsxm7gHKUoFvgw3evnMKaHQ+gTnAS0wVZlHCj3GYSlQoFiGrTXz2tgUpLwpLeJrQpnF
 /f5JTE421KVsaBKBq4Gx15XHv0apwAzIYr7f5VIWBwB4PuSRJLwVmhW0qCM15vzE6boeWEA1Oiq
 aV9F1OqjEUUWVeYYQ2nR/i20lGLS/jf0xTzdUehWBcNTZZXMfthISbcp5UI7qQY1IKNeEwlb+js
 fKXbTsDC4A3Nckvwmg3DzOPdydEUKmBKxfZ9eZVXQqPousxEnASFE2VT3hQ==
X-Google-Smtp-Source: AGHT+IH0mH/qsVEIkJEPztZX/axLNO/kq/8bQJHBhV5/RxeZM6Zc5w3ITUUqyzI+NO+wUa5bZza7fA==
X-Received: by 2002:a05:600c:8211:b0:43b:c0fa:f9dd with SMTP id
 5b1f17b1804b1-442d6dd22edmr99141955e9.25.1747067577002; 
 Mon, 12 May 2025 09:32:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 (p5b26784b.dip0.t-ipconnect.de. [91.38.120.75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ea367102sm8041055e9.3.2025.05.12.09.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 09:32:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 12 May 2025 18:32:52 +0200
Message-ID: <20250512163253.1521000-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747067577; x=1747672377;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ID0SVeKTDin22BAE5asHe+fLE6O5JojbhOTRCaAJ2T8=;
 b=on/sZv2YQylW2aoygD8OqHKABnIZ7OJTaqgD4dpd4jrN9HNe4oUhjwL3kWoHoQkKdA
 eVi3xiq13GDp9gs4N5SjSgZmRLU5L/oGRuqYbtdrWI3DV6KeurkQJNOupne17nh3l1wq
 zIANgwR2l6JcGdf13Qy3di2cbEftX6lNPOIPo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=on/sZv2Y
Subject: [Buildroot] [PATCH 1/2] package/connman: bump to version 1.44
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

Release notes:

- ver 1.44:
  * Fix issue with handling oFono context integration.
  * Fix issue with handling web context for online detection.
  * Fix issue with handling flags used when deleting routes.
  * Fix issue with handling PAC proxy integration.

- ver 1.43:
  * Fix issue with device creation when using LTE.
  * Fix issue with regulatory domain when powering up.
  * Fix issue with resolving ISO3166 code from timezone data.
  * Fix issue with handling DNS proxy zero termination of buffers.
  * Fix issue with handling DHCP packet length in L3 mode.
  * Fix issue with handling DHCP upper length checks.
  * Fix issue with handling IPv6 and URL parsing.
  * Fix issue with handling online check updates.
  * Fix issue with handling proxy method and WISPr.
  * Fix issue with handling default gateway setup.
  * Add support for low-priority default routes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index ea87f1ea17da..38af1847aef6 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256  a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c20283ac0ca81423c2aa  connman-1.42.tar.xz
+sha256  2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff  connman-1.44.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 142a6583ad3c..2c5be8252c6e 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.42
+CONNMAN_VERSION = 1.44
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
