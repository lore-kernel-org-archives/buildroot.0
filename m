Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA4BD262AF
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 01:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15D1540D94;
	Wed, 21 Jan 2026 01:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KURFYmjoztK2; Wed, 21 Jan 2026 01:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05EA040D83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768958075;
	bh=V94/93YYhI57esUNv+uuVIX+fTNPp+wFbC7GGnvcxxg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G08zRMdd/WqkpFJUa8r+Z3PAeoXDosyPtq04htXgWsj1XcmcQTSL9vWFO//MXyzeE
	 OfFZdyyUmwfpAo3HkFPBvKDjI4Qy5EgztnyJNNSjVIo2IjjXU+iCpP9SXL1Z0B3Hfn
	 /4X8MexEtpx019kdHH3QFYfMB1jhq6tkkLoSSdYC+1zRFvr1VniUFq+R6wh93Jkw6k
	 XkflipCAt6s3oUpm4FE+wqVWkOqA3l/tCWSTxvVL/eQdnlZMWOhOgxBiDTwfGGkKkf
	 l2VnblkBRRQyLu9heYnLUbJ0cHjTxdKEqYAu77Q8wtrnFLOrv5x9XeiIINHq4cdkNN
	 j7lBEUWBLkspQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05EA040D83;
	Wed, 21 Jan 2026 01:14:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F4CD160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 01:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D8BE40D83
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 01:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_pZ3Nr1mvF1 for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 01:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 434D940D82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 434D940D82
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 434D940D82
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 01:14:33 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-45c733ccc32so3574909b6e.0
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 17:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768958072; x=1769562872;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DBSWilzPEGqUh/LJAlLq72UFrT1Vtp9Sv8I4HBQjevg=;
 b=o+Ywl1rXa2GpoDMtTRsDxvu83VTeOiYb/F7BikaOJEFbnSSs1jxOwnyorAJV0eJaNg
 pXjOTLGKO3RbO4wPvIrVX5y6kRurTRxndWIOSKJllF48Ak+vXRQDGEfCkMjP4/ztSHQm
 GATbB2ltd5b4R6OMnwTis/hPa+U2EotXYK/BYl1HgsipVSa9wtsHwjceWekVMEU50TIm
 /AD0gDQvQCufkXSuT9fN0lsPOUfu4OfZIWpjY6jxG/VtuuvEEsvshGHyF+RlP628H9kb
 kMIJ/SyNZKIKiTnyof4V/zgNYgB5KaEjxerLHk/CkjhQkNX6w/+SPSu1mUTQInvwR1oo
 HMnw==
X-Gm-Message-State: AOJu0Yy4wgU61bQ7yZ/mKeyA+DJtR+tqtgfuasjJVEyBrrywx2M4O7oA
 9kiPte1ECWEIOY2gFXR+hg2RFi+oujQ9b2qWbSyn4plOtygLd7kD3qs3Uu3PeHi9
X-Gm-Gg: AY/fxX5TEMdShhqJAjCupS8saHBaIkZhlzFgDdH8dBge9fY437truMfcPe0f36oLwW/
 6LNmu75bW+P22sPqCIBYWDUdiN/CqvDpSI5hfFMoXLI/1MjFhqSycz0TCo7eqA53bmKvjvVOF2u
 WnY9e8juTBIiD6HwSXReaFCSVODCImfZKiTYZIHokUwEnpq7mQgOt0140wILw6yfUd8rrx2pk5z
 tkGzBeO4MOTx+bDHiYetvV3CkOvI94gwI5BkvgGNkuSl0rV4KCdZYiOWb67raXjLFXu1xHp/i2y
 oujQdgyKsSPeGvt+XXL7Ooyv3y63vkZGe8K0HfJGghKq2RzPggsZqpsH68vo9GA7OZhUsuBDEvU
 WvPZEBbJ0NIpn7d4ArywT+w44Rag1VGxq+sUTYCQZX4a54Yzs2W2zwHBlci9dxEw21vFcfldkWB
 crjWP39SMk2FpunnjligNfdaC0bR1RzMApgtEqCwT36jvGwEELGUC01aynmTX610bFSA9dI7La2
 KWQrfwQlvteB1/E11LKpBI21S2nSoA3PeVubZRqPx1eL6GTMHSlnAOHpJ1Gir8k
X-Received: by 2002:a05:6808:1506:b0:451:4be5:a90f with SMTP id
 5614622812f47-45e8a8f798cmr1656480b6e.2.1768958071915; 
 Tue, 20 Jan 2026 17:14:31 -0800 (PST)
Received: from james-x399.localdomain (97-118-158-110.hlrn.qwest.net.
 [97.118.158.110]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-45c9dff95d8sm7662163b6e.14.2026.01.20.17.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 17:14:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 20 Jan 2026 18:14:29 -0700
Message-ID: <20260121011429.1442015-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768958072; x=1769562872; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DBSWilzPEGqUh/LJAlLq72UFrT1Vtp9Sv8I4HBQjevg=;
 b=jNyT74vHe/faE5MlrEI31pG0SDV/FFhgfQaJVwk1BBtu9UhqfWGyGXTzzLCklZ2Odb
 SLwfjSDn9tOnzqkXQE9XazUFddoTQFRG7klQV3tHwR3nzrRnPOSKuUDzYHk1vIvMJtRF
 1G/PobRXKUm+m349db4mAlNqmpVLDqx8FUnWtv7vB9JyPe3kvF5ybJkVq2PU/crobnVW
 TzYlJUIDJifeCS36u73cmilT+yOkCA+qIkalL8/S1+eCFTs68lnLZdo0r/2awdjKwPeb
 2GArv6Tuq6JE/okGhX8dhhsdWP1L/soA8/UV//EjiHpcQxm0UOvTL5D0G0d2S5Ptai/b
 NziQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jNyT74vH
Subject: [Buildroot] [PATCH 1/1] package/swupdate: bump to version 2025.12
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index bc911d1820..b3f43648f8 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  678b47fd2419727c4d0abf5c9f3bc0dc4b67e95951132bd1c8f5603e88947779  swupdate-2025.05.tar.gz
+sha256  8517f3730eeb66e20e651b881dd4b9c10ca9ae05e3883db59b5df18ab1eaa533  swupdate-2025.12.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 05329d13b8..864c876e40 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2025.05
+SWUPDATE_VERSION = 2025.12
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
