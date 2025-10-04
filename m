Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F49ECAC5BB
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 10:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2113880E16;
	Sat,  4 Oct 2025 10:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3oUcg_VfbDx; Sat,  4 Oct 2025 10:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21F0E82387
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F0E82387;
	Sat,  4 Oct 2025 10:07:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CBC2226
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E76F740416
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmNKfhkdjwYS for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 10:07:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFE9040442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFE9040442
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFE9040442
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:07:53 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-62fc28843ecso4623389a12.1
 for <buildroot@buildroot.org>; Sat, 04 Oct 2025 03:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759572471; x=1760177271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V/TblBlml55JHyvlGGD7Krba8txwofNy3/bW3smTSZI=;
 b=XBqIrFrqyzHQculN4LhNYYyvZ69i3wYj8g4VPKQeRUukh3HrB41g74ghJVeRKihR+Q
 emTT+RyD2wqA3d4V6nK8PBzEUVsCKZNoQgkF3kMfIupUE7PQUrrjGRy5iCP44w7gVeOj
 TTf9NnEIEfCJEIiWt4bhP013cU4RAVhmKyAp9MOpTt1ZsG/RFEMR5n9g2CQnlu0kQdx8
 LGsM7q2Q5eEpdnLRNXcRlJzED0jiU90DxetXBsmq5ef5GOXReK55pR6+DYwZYDHCO3Bl
 Z+xyZwM042nvqRBOCT8OWdSceH0CtzvLWnHKutYVGC5FhoMXPKeKzYa491uvDnTx7ASK
 dpCQ==
X-Gm-Message-State: AOJu0YxGIwEHG62WW76vvay/oesuNp+E77s26VPSlaj8ZddxBrMVuDax
 YZecwxhe83OiJ/LBjcSG3nxK3WXvBAlr0kprk+fWuLZyLqUMZ28wmnYv8gpa0Upj+xixFFEoXu7
 bRp5qpq0=
X-Gm-Gg: ASbGnctET3sviYmybmY8msrlYPo7u01RlWDtCt72atmyE7IfrkUG7ULH9ceIRW+uJXp
 v2nltxM07VUTWlaeM9/zi1ofXmxaeS8snPgCPYI6qEDXA/Lt18T0umpwsafCn6VEJXraDsbIfbh
 09vMTQdcWliPwiJeo4egx138C/RtMuDkNoBSZnT2vcHuFjDLmsZyx/1PChHQGvbuH7PriC1dzPJ
 9ObTR/213egKJwQ3j0DCDjE+A5lj5zwsAksnb0W1fGlmHQAcJCerCUXt4IHYbWttRU2raroLZGm
 XqkFOE4wSHQWpjHPN+D9oyUyrykFyOLVX0JmigQeZraz95nzzXYWvQeCU93h/goanEI2ygLo+9W
 D+K28VSMqr3vrJ2mrUI2z2JsThwqFWdGhOxjA4uIAWg43dM6CMzjnm8X7a6lQjGegzbR1o2Etad
 ZBKLihJ/8M+N570oHaMxDtacz4LEXB5v45vr8TJ7AIArCBmkARglWwSXGsJjayZVbCteFFtLxCB
 52AmZLd02L27ow=
X-Google-Smtp-Source: AGHT+IHqVb9/cE/iINKqoQplkduw+ybY6ZLhKLJYPB6qqqyo32XB1JR2/iqsDPosfRB5T3FWsvizCQ==
X-Received: by 2002:a17:907:3da7:b0:b2b:63a9:223b with SMTP id
 a640c23a62f3a-b49c3a2f929mr842428466b.31.1759572471491; 
 Sat, 04 Oct 2025 03:07:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869c4fd9esm653002066b.76.2025.10.04.03.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 03:07:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat,  4 Oct 2025 12:07:47 +0200
Message-ID: <20251004100747.1412268-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759572471; x=1760177271;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V/TblBlml55JHyvlGGD7Krba8txwofNy3/bW3smTSZI=;
 b=TGR+OXaBm5Y6p99nM7zdpmrt+IxSjG+hm7J5GV4v4QqD2JVx1IFfROE+IsIWHs0VG7
 wkk8M2rFaO6S5lFB3Q6oHoXHXgawu9wo0/iybsh0BNJi0QD3Tn3Z3cqyVdSro98aoX0t
 NqeRlI3uCmQTECHqbOfE/OeFKf3pGwx7rgwlo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=TGR+OXaB
Subject: [Buildroot] [PATCH 1/1] package/fastd: security bump to version 23
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

This bump includes the security fix for CVE-2025-24356.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-24356.

The COPYRIGHT file was renamed to LICENSE [1]. The hash file was updated
because a date was removed [2] and the libmnl version was updated [3].

Release notes:
https://fastd.readthedocs.io/en/stable/releases/v23.html

[1] https://github.com/neocturne/fastd/commit/fa88c739b9afe053905bddc7fbb9c252e290c35d
[2] https://github.com/neocturne/fastd/commit/318c944f40c90e048e370b2f75598bfcd79a1790
[3] https://github.com/neocturne/fastd/commit/c08a3d59debddf5f99e442d9529a142f04549b50
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/fastd/fastd.hash | 4 ++--
 package/fastd/fastd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fastd/fastd.hash b/package/fastd/fastd.hash
index 5f7f9665336e..a02b506c98ea 100644
--- a/package/fastd/fastd.hash
+++ b/package/fastd/fastd.hash
@@ -1,3 +1,3 @@
 # computed locally
-sha256  19750b88705d66811b7c21b672537909c19ae6b21350688cbd1a3a54d08a8951  fastd-22.tar.xz
-sha256  adf08b42f1b890b89e998360a864cb4f8441a0a57c9e95e2ce1bfdfc24c49976  COPYRIGHT
+sha256  dcab54485c79dda22ce6308a2a48764d53977a518952facd1204ba21af1c86e0  fastd-23.tar.xz
+sha256  f229ee6df84971355f7d54d60b0302ca8a3b883d2dc41176e58e9da4aa7c1b05  LICENSE
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index 6c496cf9ef1a..e697ad0ca88a 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FASTD_VERSION = 22
+FASTD_VERSION = 23
 FASTD_SITE = https://github.com/NeoRaider/fastd/releases/download/v$(FASTD_VERSION)
 FASTD_SOURCE = fastd-$(FASTD_VERSION).tar.xz
 FASTD_LICENSE = BSD-2-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
