Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1803E77180
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 07:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6720D81551;
	Mon, 16 Dec 2024 07:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mv8QUuKHP4ud; Mon, 16 Dec 2024 07:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AD2181568
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AD2181568;
	Mon, 16 Dec 2024 07:45:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22A9FCE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 07:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1072C6083F
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 07:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMsvITbD6p53 for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 07:45:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 23B606082B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23B606082B
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23B606082B
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 07:45:25 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3862d161947so1666334f8f.3
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 23:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734335123; x=1734939923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bNpRY+x50xsby75IMHFUpNBT25nQDui7YRfXoCIWIc4=;
 b=kgG/ivs3Nv4mU2RwXPNzKKKIAKZUwG67lJI8kMGfAiVdudQDApJuUZ/PnFtaBrfCIe
 Z/4OFNxDC+qcNBqRrArAQf4ISofUilf+BEdkIg3Z7xQbOsO3CceOdXfkwxIPrex36EVQ
 ygzAz61jzohh96GKfYUHYWtJbt32nExvayFiXmyCIwA5vP+xUXGdgXRkjFts2H7hH2OE
 xvXOY8OqECidIsWDUwpkMt30QO3sVNLELKlCcTAjAqAT8shhXic+SYuuU02fMgaG8lqi
 PvxC9c2zWaqjN/jUYSTbuzwbv1NPdA5ye7SExp1RTClsQa11IkaIC2w8+smXrWqoM5b3
 aUjA==
X-Gm-Message-State: AOJu0Yy/bsEqGNNYCsKv5YFr9nQgx1UH0dijSfK3tCBNdSwRte33JE8Z
 wI74cco+iVi8vR7IBXbeq2Bh662H6EgWFsAeso4VC7z3T1VJm4NiNueURQ==
X-Gm-Gg: ASbGnculzlxhaolBAmtekeGTWUp6RSXknYZ9hXi4hlPh/UJnebDz9Vja7/8HymUq02N
 n0uJXgN3wSQpd5lcr+EQbNBRkgKoCmFdQ8zo98uCauRJ0tqF2hXA/c9qw2EVmt3eNgTJLmIpwo7
 yxCDTWdhAuAKPlk3SnixLF4GJKhvDEYwM+khG+v46voice0/d/B3uEHmqV8QUN36clpJRPBlli8
 PrgHtjOI/zmPGVYFdPr8An1h9P+wvdesrTpLo7nzeXCJkfTVbhMEkv3POvQho6kV1GEhG22kw==
X-Google-Smtp-Source: AGHT+IEtKoHKnl0D5KHcuLMK/OkiCaniyKyj03qaEHFbIDipEYn7A2SSLNsHfhnAJwlxS1K+KrbI6Q==
X-Received: by 2002:a05:6000:1ac8:b0:386:3e48:f732 with SMTP id
 ffacd0b85a97d-38880acd52fmr8619798f8f.16.1734335123188; 
 Sun, 15 Dec 2024 23:45:23 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801208csm7459904f8f.1.2024.12.15.23.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 23:45:22 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Kulhavy <brain@jikos.cz>,
	Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 16 Dec 2024 08:45:20 +0100
Message-Id: <20241216074520.361061-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734335123; x=1734939923; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bNpRY+x50xsby75IMHFUpNBT25nQDui7YRfXoCIWIc4=;
 b=ROgs6SbYbO6TL+zfc8Ja1RYrImN07ztaNuwz73cDfhLdOZ2c35xz9TgutOiKqov8Lc
 D/lgItINrsi4eYVnQba5iYuRyBZODNMAgN++fzMvo51MhA62zSgwj/2mmT9aT/DohFkW
 30PCIQhKyFq22WDjW6CUaiy1bmqOWQU4lvkluZRQuHh3tr4779wCFWxUNsdKa1QuQBFx
 RLWGSbOgRCbwFeu7Kff6JaUBHzO6sFRyJUMt7XLvBCfZ8qJrpX20Ly7xP80XAf2F4oe4
 mRb177ZIwEzoRgKJYQB4rAN9kW2hqiqndjq6xUNESgJhSKzwxkk9nt/gWNnXdRoo250t
 x+Nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ROgs6SbY
Subject: [Buildroot] [PATCH] package/linuxptp: bump version to 4.4
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

The released package is no longer available under sourceforge. So we
switch to github.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/linuxptp/linuxptp.hash | 2 +-
 package/linuxptp/linuxptp.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index 1d5c590ea7..1aae52abb1 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  70e38e5d2764e0217443da6f14e8846fe401a472293ac138d8419c07a665447a  linuxptp-4.2.tgz
+sha256  61757bc0a58d789b8fcbdddf56c88a0230597184a70dcb2ac05b4c6b619f7d5c  linuxptp-4.4.tar.gz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index eea41f0baf..ff2eb45785 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 4.2
-LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
-LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
+LINUXPTP_VERSION = 4.4
+LINUXPTP_SITE = $(call github,richardcochran,linuxptp,v$(LINUXPTP_VERSION))
 LINUXPTP_LICENSE = GPL-2.0+
 LINUXPTP_LICENSE_FILES = COPYING
 LINUXPTP_CPE_ID_VALID = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
