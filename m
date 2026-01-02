Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16B8FA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 935644061D;
	Fri,  2 Jan 2026 22:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDec13cnGwRL; Fri,  2 Jan 2026 22:29:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD6D44066A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767392967;
	bh=eIuFGFZ8HXHMdatEnmpVpOXylCdlhWjinBfwr7fEqSU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=meDQntCmLYF+NOJQeyJHJhNYrq1kBG51+UkQJGHOMddZyk421JEncbjMMzh+kBoCH
	 rXrgLM1EYRy0H/ZTTOVos7j1/vw6fkepizGeLiXWEDuFriL8S6j1L7wGeKT048Utj0
	 cZBmn/qhy9R5Y4L8Ls7S7Jm+cSRk3FKvWkHsWrdRs1AGpMKVaJuuxcqcYSdeSLi4T/
	 qejAOWeRJ2lUDJKwYDGTQp0vrunEGXwOPFoUcdzxyNVywI6Fkn7R5s4z04NjeZKwnQ
	 tUfMPyhcPQbPHr4yxaB4zUAsIqq0xJLcYRhDGO4lHsoSCP3+qNcdw/3aA+X7hsZWaJ
	 lTW6OvziWA0ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD6D44066A;
	Fri,  2 Jan 2026 22:29:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE4D6249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEECF608D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xlj03XqE15If for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:29:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8460600CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8460600CD
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8460600CD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:29:25 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7c6e9538945so212187a34.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 14:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767392964; x=1767997764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XemUpSNpO7H9mr3wcdup3LIZaxb2bFNhvuLdtYx8RfM=;
 b=gPkPNWU99oLoljKrKoqee6U967GlaHgSJg2GAJWOVuAXMfWCYZPYNoha4o0xGynTIE
 YVXuaidbtmF/ZieMY/1m1s6isi7ZolXRSdwEH5Iih6t5jAYFSHJmg9MzfR9C0y8x6eFC
 dwvKN4u0dBsWbB6SYjvVvzaEhbn7F+3Z53TKAmyQVfXcwYYhZq5P72/qn38EyQ4dLSOn
 qNCasendcrRcCd5kGs6xEKZ5DTW+jwrUAbgM1JT5hhuzLnRCxV7UuXzQNIAC5yxkXYbq
 dPGLIcISpVw41e1i1XJZlF6MdyWu42f/yvBciE+3HXVgjxB7zT44OX02GCe0yUR2Ld/u
 7oWA==
X-Gm-Message-State: AOJu0YzcupG+mUGvyJEq3V1zJ1QKD5xXcie4lcmI6syzBJ3so/Z88LhX
 9y1pa86ht1i9mWU9FOWgl0Nyz6jgxQIT9Zf24UmJ2cGOa8HLyD5OBQ5hOmfgjMpkh4M=
X-Gm-Gg: AY/fxX7s+IZ9RXkVnDuaSNPUJ+It8NlCXlbomPQYldZPyExgm/NKAIm44JZ4Nd06KQJ
 VMnzeSrL3YD33Niyo/Ywl1/culqrk4MXac8LbgfFjzqhX7HPed5oLltESZcbXSxSl3h8AINNrGQ
 NiKZDGBmdic/DdnrVPbLSv44B0Lx0SHftrRDEtgRlteG95I4C009atDyHq58ihhUf+UE+WdWXkb
 ht5v9J1EXoFO3Hug6WR0tZ8x8pT7/W3xiXeQ442VZPJqzIRhxPAiSbuyjlprWlnDWU4ErVjc8Ul
 xgl82M7J0jzGI1PmjKEOAIuRS7t1mEfS3MPCPCWOetwwjtEz49ftsJjB5hkt8PgKxiKK2f6hyM+
 EpScf6lSi+hgMfWdB85vY0PgbbEJkNfqsIubtImITLJBQTMUS87sTc3x82acJ7Mts4ArTR6b1kV
 EdSlVc2vbcKM4RyjzTmSEwlgAjdP23Bcn/97L1y30RcOhjz/rscGR4OczSf/d13a7MIQZuecYGu
 jYMMihtTS1KLeYF1J4oQYdUtv65g36mfgFrFqJudtq9eFcBKd/mizf5FqXDjmbBgQ==
X-Google-Smtp-Source: AGHT+IFz8yTiaIcKnYWeaL/QHXwx/08M5LD/tknkcyw6ud0fScXy+irS3aX8Fa+HibEvDwbKFcl5Kg==
X-Received: by 2002:a05:6808:238c:b0:44d:b847:ee7e with SMTP id
 5614622812f47-45a26c69e1cmr455828b6e.1.1767392964444; 
 Fri, 02 Jan 2026 14:29:24 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaab65763sm26090698fac.13.2026.01.02.14.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 14:29:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:29:20 -0700
Message-ID: <20260102222920.470122-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767392964; x=1767997764; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XemUpSNpO7H9mr3wcdup3LIZaxb2bFNhvuLdtYx8RfM=;
 b=DzdhcR0R0eAeEvacNRgYpBv+c+1uBFuy4cMt4wZw1MIDxPkgXSYpmY+JRkarM2D+xa
 YXY8EndT9B/j+cxnzYG64LAlDODcH+1+lKQWfk95xoUsKeaqUsULXDmw3gWpRPHEGRkP
 m/nSda7xWYQvMC0c4d/xMrPfY5q6ZKziQ1Hy4OmlFC+Pa2x8UsbTZHTIgLtEO1lc+sQ4
 35hRXCOX/c32QHdkNUFEFcJZBOF50P4YKNggNiRTCJLfv4g468r7o1OTx1Q3MX+5KAVw
 TKn5w47JIhHtVFqBgsOvPpzuyAwtoos53Vf5DXu95No9Me8y+h7qIgdfij23GmCHH5G1
 aL/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DzdhcR0R
Subject: [Buildroot] [PATCH 1/1] package/python-keyring: bump to version
 25.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/keyring/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/keyring/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-keyring/python-keyring.hash | 6 +++---
 package/python-keyring/python-keyring.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index dd0714d55e..0f8ad595f4 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  afe7f534c80dc29927f5211fcb925ed4  keyring-25.6.0.tar.gz
-sha256  0b39998aa941431eb3d9b0d4b2460bc773b9df6fed7621c2dfb291a7e0187a66  keyring-25.6.0.tar.gz
+md5  57c23d340e4d08ac4896f142ee423eca  keyring-25.7.0.tar.gz
+sha256  fe01bd85eb3f8fb3dd0405defdeac9a5b4f6f0439edbb3149577f244a2e8245b  keyring-25.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index eb2b62d96c..df397bea57 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 25.6.0
+PYTHON_KEYRING_VERSION = 25.7.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/70/09/d904a6e96f76ff214be59e7aa6ef7190008f52a0ab6689760a98de0bf37d
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/43/4b/674af6ef2f97d56f0ab5153bf0bfa28ccb6c3ed4d1babf4305449668807b
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
 PYTHON_KEYRING_CPE_ID_VENDOR = python
 PYTHON_KEYRING_CPE_ID_PRODUCT = keyring
-PYTHON_KEYRING_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_KEYRING_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
